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
    class function GetPathIni: String;
    class procedure OpenLink(ALink: String);
    class function ProcessaMaiusculas(AValue: String): string;
    class function GerarCabecalhoArquivo: String;
    class function FormataNome(AValue: String): String;
    class function SoNumerosELetras(AValue: String): String;
    class function SubstituiAcentos( AValue : String) : string;
    class function GetFieldType(ATypeName: String; AExibirMsgSeTipoDesconhecido: Boolean): String;
    class function RemovePontos(AValue: String): string;
    class function CompE(AString: String; ACount: Integer; ACompletador: WideChar = ' '): String;
    class function CompD(AString: String; ACount: Integer; ACompletador: WideChar = ' '): String;
    class function Criptografar(const AValue: String): String;
    class function Descriptografar(const AValue: String): String;
  end;

implementation

class function TUtils.GetPathIni: String;
begin
   Result := ChangeFileExt(ParamStr(0), '.ini');
end;

class procedure TUtils.OpenLink(ALink: String);
begin
   ShellExecute(Application.Handle, nil, PWideChar(ALink), '', nil, SW_SHOWNORMAL);
end;

class function TUtils.FormataNome(AValue: String): String;
begin
   Result := AValue.ToLower;
   Result := SubstituiAcentos(Result);
   Result := ProcessaMaiusculas(Result);
   Result := SoNumerosELetras(Result);
end;

class function TUtils.ProcessaMaiusculas(AValue: String): string;
var
 i: Integer;
 LAux: String;
 LDeixarMaiuscula: Boolean;
 LLetraAtual: String;
begin
   Result := '';
   LAux   := AValue;
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

class function TUtils.RemovePontos(AValue: String): string;
begin
   Result := AValue.Replace('.', '');
end;

class function TUtils.SoNumerosELetras(AValue: String): String;
var
 i: Integer;
 LAux: String;
begin
   Result := '';
   LAux   := SubstituiAcentos(AValue);
   for i := 1 to length(LAux) do
   begin
      //if(LAux[i] in ['0'..'9', 'a'..'z', 'A'..'Z', ' '])then
      if(CharInSet(LAux[i], ['0'..'9', 'a'..'z', 'A'..'Z', ' ']))then
        Result := Result + LAux[i];
   end;
end;

class function TUtils.SubstituiAcentos(AValue: String): string;
const
 C_COM_ACENTOS = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
 C_SEM_ACENTOS = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
 i: Integer;
begin
   for i := 1 to Length(AValue) do
     if(Pos(AValue[i], C_COM_ACENTOS) <> 0)then
       AValue[i] := C_SEM_ACENTOS[Pos(AValue[i], C_COM_ACENTOS)];

   Result := AValue;
end;

class function TUtils.CompE(AString: String; ACount: Integer; ACompletador: WideChar = ' '): String;
begin
  Result := StringOfChar(ACompletador, ACount - AString.Length) + AString;
end;

class function TUtils.CompD(AString: String; ACount: Integer; ACompletador: WideChar = ' '): String;
begin
   Result := AString + StringOfChar(ACompletador, ACount - AString.Length);
end;

class function TUtils.Criptografar(const AValue: String): String;
const
 C_KEY = '159753';
var
 I: Integer;
 C: Byte;
begin
   Result := '';
   for I := 1 to Length(AValue) do
   begin
      if Length(C_KEY) > 0 then
        C := Byte(C_KEY[1 + ((I - 1) mod Length(C_KEY))]) xor Byte(AValue[I])
      else
        C := Byte(AValue[I]);
      Result := Result + AnsiLowerCase(IntToHex(C, 2));
   end;
end;

class function TUtils.Descriptografar(const AValue: String): String;
const
 C_KEY = '159753';
var
 I: Integer;
 C: Char;
begin
   Result := '';
   for I := 0 to Length(AValue) div 2 - 1 do
   begin
      C := Chr(StrToIntDef('$' + Copy(AValue, (I * 2) + 1, 2), Ord(' ')));
      if Length(C_KEY) > 0 then
        C := Chr(Byte(C_KEY[1 + (I mod Length(C_KEY))]) xor Byte(C));
      Result := Result + C;
   end;
end;

class function TUtils.GerarCabecalhoArquivo: String;
begin
   Result := '{'+ StringOfChar('*', 78) + '}'                                                                  + sLineBreak +
             '{'+ CompD('Code4D - Gerador de classes: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), 78) +'}' + sLineBreak +
             '{'+ StringOfChar('*', 78) + '}'                                                                  + sLineBreak;

   {Result := '//'+ StringOfChar('*', 78)                                                    + sLineBreak +
             '//'+ CompD('Code4D: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), 77) + '*' + sLineBreak +
             '//'+ StringOfChar('*', 78)                                                    + sLineBreak;}
end;

class function TUtils.GetFieldType(ATypeName: String; AExibirMsgSeTipoDesconhecido: Boolean): String;
const
 C_STRING   = 'String';
 C_INTEGER  = 'Integer';
 C_INT64    = 'Int64';
 C_DOUBLE   = 'Double';
 C_DATE     = 'TDate';
 C_TIME     = 'TTime';
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
      Application.MessageBox(PChar('Tipo de dado n„o conhecido: ' + ATypeName + ' (tipo String ser· utilizado)'), 'Tipo desconhecido', MB_OK + MB_ICONEXCLAMATION);
      Result := C_STRING+ '   {'+ ATypeName +'}';
   end;
end;

end.
