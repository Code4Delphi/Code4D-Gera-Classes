unit Utils;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.ShellAPI,
  Vcl.Forms;

type
  TUtils = class
  public
    class function GetPathIni: string;
    class procedure OpenLink(ALink: string);
    class function ProcessaMaiusculas(AValue: string): string;
    class function GerarCabecalhoArquivo: string;
    class function FormataNome(AValue: string): string;
    class function SoNumerosELetras(AValue: string): string;
    class function SubstituiAcentos(AValue: string): string;
    class function GetFieldType(ATypeName: string; AExibirMsgSeTipoDesconhecido: Boolean): string;
    class function RemovePontos(AValue: string): string;
    class function CompE(AString: string; ACount: Integer; ACompletador: WideChar = ' '): string;
    class function CompD(AString: string; ACount: Integer; ACompletador: WideChar = ' '): string;
    class function Criptografar(const AValue: string): string;
    class function Descriptografar(const AValue: string): string;
  end;

implementation

class function TUtils.GetPathIni: string;
begin
  Result := ChangeFileExt(ParamStr(0), '.ini');
end;

class procedure TUtils.OpenLink(ALink: string);
begin
  ShellExecute(Application.Handle, nil, PWideChar(ALink), '', nil, SW_SHOWNORMAL);
end;

class function TUtils.FormataNome(AValue: string): string;
begin
  Result := AValue.ToLower;
  Result := SubstituiAcentos(Result);
  Result := ProcessaMaiusculas(Result);
  Result := SoNumerosELetras(Result);
end;

class function TUtils.ProcessaMaiusculas(AValue: string): string;
var
  i: Integer;
  LAux: string;
  LDeixarMaiuscula: Boolean;
  LLetraAtual: string;
begin
  Result := '';
  LAux := AValue;
  LDeixarMaiuscula := True;
  for i := 1 to length(LAux) do
  begin
    LLetraAtual := LAux[i];
    if(LDeixarMaiuscula)then
      LLetraAtual := UpperCase(LLetraAtual);

    Result := Result + LLetraAtual;
    LDeixarMaiuscula := (CharInSet(LAux[i], ['_']));
  end;
end;

class function TUtils.RemovePontos(AValue: string): string;
begin
  Result := AValue.Replace('.', '');
end;

class function TUtils.SoNumerosELetras(AValue: string): string;
var
  i: Integer;
  LAux: string;
begin
  Result := '';
  LAux := SubstituiAcentos(AValue);
  for i := 1 to LAux.Length do
    if(CharInSet(LAux[i], ['0'..'9', 'a'..'z', 'A'..'Z', ' ']))then
      Result := Result + LAux[i];
end;

class function TUtils.SubstituiAcentos(AValue: string): string;
const
  C_COM_ACENTOS = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  C_SEM_ACENTOS = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  i: Integer;
begin
  for i := 1 to AValue.Length do
    if(Pos(AValue[i], C_COM_ACENTOS) <> 0)then
      AValue[i] := C_SEM_ACENTOS[Pos(AValue[i], C_COM_ACENTOS)];

  Result := AValue;
end;

class function TUtils.CompE(AString: string; ACount: Integer; ACompletador: WideChar = ' '): string;
begin
  Result := StringOfChar(ACompletador, ACount - AString.length) + AString;
end;

class function TUtils.CompD(AString: string; ACount: Integer; ACompletador: WideChar = ' '): string;
begin
  Result := AString + StringOfChar(ACompletador, ACount - AString.length);
end;

class function TUtils.Criptografar(const AValue: string): string;
const
  C_KEY = '159753';
var
  i: Integer;
  C: Byte;
begin
  Result := '';
  for i := 1 to AValue.Length do
  begin
    if length(C_KEY) > 0 then
      C := Byte(C_KEY[1 + ((i - 1) mod length(C_KEY))]) xor Byte(AValue[i])
    else
      C := Byte(AValue[i]);
    Result := Result + AnsiLowerCase(IntToHex(C, 2));
  end;
end;

class function TUtils.Descriptografar(const AValue: string): string;
const
  C_KEY = '159753';
var
  i: Integer;
  C: Char;
begin
  Result := '';
  for i := 0 to length(AValue) div 2 - 1 do
  begin
    C := Chr(StrToIntDef('$' + Copy(AValue, (i * 2) + 1, 2), Ord(' ')));
    if length(C_KEY) > 0 then
      C := Chr(Byte(C_KEY[1 + (i mod length(C_KEY))]) xor Byte(C));
    Result := Result + C;
  end;
end;

class function TUtils.GerarCabecalhoArquivo: string;
begin
  Result := '{'+ StringOfChar('*', 78) + '}' + sLineBreak +
    '{'+ CompD('Code4D - Gerador de classes: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), 78) +'}' + sLineBreak +
    '{'+ StringOfChar('*', 78) + '}' + sLineBreak;

  {Result := '//'+ StringOfChar('*', 78)                                                    + sLineBreak +
   '//'+ CompD('Code4D: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), 77) + '*' + sLineBreak +
   '//'+ StringOfChar('*', 78)                                                    + sLineBreak;}
end;

class function TUtils.GetFieldType(ATypeName: string; AExibirMsgSeTipoDesconhecido: Boolean): string;
const
  C_STRING = 'string';
  C_INTEGER = 'Integer';
  C_INT64 = 'Int64';
  C_DOUBLE = 'Double';
  C_DATE = 'TDate';
  C_TIME = 'TTime';
  C_DATETIME = 'TDateTime';
begin
  if(ATypeName = 'VARCHAR')or(ATypeName = 'CHAR')or(ATypeName = 'BLOB')or(ATypeName = 'TEXT')or(ATypeName = 'LONGTEXT')
    or(ATypeName = 'ENUM')
  then
    Result := C_STRING
  else if(ATypeName = 'INT')or(ATypeName = 'INTEGER')or(ATypeName = 'TINYINT')or(ATypeName = 'SMALLINT') then
    Result := C_INTEGER
  else if(ATypeName = 'BIGINT')then
    Result := C_INT64
  else if(ATypeName = 'DATE')then
    Result := C_DATE
  else if(ATypeName = 'TIME')then
    Result := C_TIME
  else if(ATypeName = 'TIMESTAMP')or(ATypeName = 'DATETIME')then
    Result := C_DATETIME
  else if(ATypeName = 'DOUBLE')or(ATypeName = 'FLOAT')or(ATypeName = 'DECIMAL')or(ATypeName = 'NUMERIC')then
    Result := C_DOUBLE
  else
  begin
    Application.MessageBox(PChar('Tipo de dado n„o conhecido: ' + ATypeName + ' (tipo string ser· utilizado)'), 'Tipo desconhecido', MB_OK + MB_ICONEXCLAMATION);
    Result := C_STRING+ '   {'+ ATypeName +'}';
  end;
end;

end.
