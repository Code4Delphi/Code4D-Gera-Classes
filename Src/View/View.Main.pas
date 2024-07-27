unit View.Main;

interface

uses
  System.StrUtils,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Winapi.Windows,
  VCL.Clipbrd,
  VCL.Graphics,
  VCL.Controls,
  VCL.Forms,
  VCL.Dialogs,
  VCL.StdCtrls,
  VCL.Imaging.pngimage,
  VCL.ExtCtrls,
  VCL.ComCtrls,
  VCL.Grids,
  VCL.DBGrids,
  Winapi.ShellAPI,
  Data.DB,
  Types,
  Consts,
  VCL.Buttons;

type
  TViewMain = class(TForm)
    pnRodape: TPanel;
    imgLogo: TImage;
    Label1: TLabel;
    PageControl1: TPageControl;
    tabConexao: TTabSheet;
    tabGerador: TTabSheet;
    pnConexao: TPanel;
    cBoxDriver: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtDatabase: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnConectarOnOFF: TButton;
    edtHost: TEdit;
    edtPorta: TEdit;
    pnGerador: TPanel;
    pnGeradorEsquerda: TPanel;
    Panel6: TPanel;
    btnListarTabelasDoBanco: TButton;
    Panel8: TPanel;
    btnTabelasDoBancoMarcarTodas: TButton;
    btnTabelasDoBancoDesmarcarTodas: TButton;
    Panel11: TPanel;
    DBGridTabelasBanco: TDBGrid;
    pnGeradorDireita: TPanel;
    mmLog: TMemo;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label8: TLabel;
    edtPastaDestino: TEdit;
    btnBuscaPastaDestino: TButton;
    ckGravarArquivosPasta: TCheckBox;
    ckAbrirPastaAposGravar: TCheckBox;
    GroupBox1: TGroupBox;
    edtNomeEntities: TEdit;
    Label9: TLabel;
    btnPreencherComDadosMySQL: TButton;
    btnPreencherComDadosFirebird: TButton;
    Panel9: TPanel;
    btnLogLimpar: TButton;
    btnLogSalvar: TButton;
    btnLogCopiar: TButton;
    ckConectarAutoAoAcessar: TCheckBox;
    GroupBox2: TGroupBox;
    ckAddComentarioNomeTabela: TCheckBox;
    ckAddComentarioNomeField: TCheckBox;
    ckExibirMsgSeTipoDesconhecido: TCheckBox;
    ckUpperCamelCaseInFields: TCheckBox;
    ckUpperCamelCaseInTables: TCheckBox;
    ckAddCabecalho: TCheckBox;
    ckLimparMemoACadaUnit: TCheckBox;
    Panel2: TPanel;
    btnGerarClassEntitiesSelecionados: TButton;
    btnBuscarArquivoBanco: TButton;
    ckSalvarSenhaBancoProxAcesso: TCheckBox;
    rdGroupFormaAcessoEntities: TRadioGroup;
    rdGroupORM: TRadioGroup;
    gBoxSimpleORM: TGroupBox;
    cBoxSimpleORMAtributoCampo: TComboBox;
    ckAddAtributoPK: TCheckBox;
    ckAddAtributoAutoInc: TCheckBox;
    edtAddAtributoPKCampo: TEdit;
    edtAddAtributoAutoIncCampo: TEdit;
    edtLocalizarNomeTabela: TEdit;
    Label10: TLabel;
    btnVerSenha: TSpeedButton;
    btnPreencherComDadosSQLite: TButton;
    btnPreencherComDadosPostgres: TButton;
    ckGerarsaídadedadosinterface: TCheckBox;
    procedure btnConectarOnOFFClick(Sender: TObject);
    procedure btnListarTabelasDoBancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTabelasDoBancoMarcarTodasClick(Sender: TObject);
    procedure btnTabelasDoBancoDesmarcarTodasClick(Sender: TObject);
    procedure DBGridTabelasBancoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridTabelasBancoCellClick(Column: TColumn);
    procedure btnBuscaPastaDestinoClick(Sender: TObject);
    procedure btnGerarClassEntitiesSelecionadosClick(Sender: TObject);
    procedure btnPreencherComDadosMySQLClick(Sender: TObject);
    procedure btnPreencherComDadosFirebirdClick(Sender: TObject);
    procedure btnLogLimparClick(Sender: TObject);
    procedure btnLogSalvarClick(Sender: TObject);
    procedure btnLogCopiarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure rdGroupORMClick(Sender: TObject);
    procedure btnBuscarArquivoBancoClick(Sender: TObject);
    procedure cBoxDriverChange(Sender: TObject);
    procedure ckAddAtributoPKClick(Sender: TObject);
    procedure ckAddAtributoAutoIncClick(Sender: TObject);
    procedure edtLocalizarNomeTabelaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnVerSenhaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnVerSenhaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPreencherComDadosSQLiteClick(Sender: TObject);
    procedure btnPreencherComDadosPostgresClick(Sender: TObject);
    procedure rdGroupFormaAcessoEntitiesClick(Sender: TObject);
  private
    FStrGeral: TStrings;
    FStrMetodosPrivate: TStrings;
    FStrFields: TStrings;
    FStrAcessoDeclaracoes: TStrings;
    FStrAcessoImpl: TStrings;
    FDirSalvar: string;
    FTabelaName: string;
    FClasseNome: string;
    FUnitNome: string;
    FTabelaLB: string;
    FInterfaceGerada : Boolean;
    FFormaAcesso: TFormaAcesso;
    FORM: TORM;
    procedure ConfSGBD;
    procedure ConectarBanco;
    procedure MarcaDesmarcaTabelas(AValue: Boolean);
    procedure GerarClassesTabela(AtableName: string);
    procedure ProcessaDirSalvar;
    procedure GeraTopo;
    procedure GeraPrivate;
    procedure GeraPublic;
    procedure GeraConstructor;
    procedure ProcessaFuncoesAcesso;
    procedure LacoEmFields;
    procedure ProcessaProperty(AFieldName: string; AFieldNameLB: string; AFieldTipo: string);
    procedure ProcessaGetSet(AFieldNameLB, AFieldTipo: string);
    procedure ProcessaFluentInterface(AFieldNameLB: string; AFieldTipo: string);
    procedure GravarConfiguracoes;
    procedure LerConfiguracoes;
    procedure ProcessaConexaoNoShow;
    procedure ConfFormSimpleORM;
    procedure ProcessaGetSetImplementacao(AFieldNameLB, AFieldTipo: string);
    procedure FiltraTabela;
    procedure GerarInterface(AtableName: string);
    procedure GeraTopoInterface;
    procedure ProcessarContratoInterface(AFieldNameLB: string; AFieldTipo: string);
    procedure GerarImplementacaodaClasseInterface(AtableName: string);
    procedure GeraTopoClasseInterface;
    procedure ProcessaOrientacaoInterface(AFieldNameLB, AFieldTipo: string);
    procedure GeraDestructor;
    procedure InstanciaFactoryMethod;
  public

  end;

var
  ViewMain: TViewMain;

implementation

uses
  Model.DM1,
  Utils,
  Model.IniFile.Components;

{$R *.dfm}

procedure TViewMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FStrGeral := TStringList.Create;
  FStrMetodosPrivate := TStringList.Create;
  FStrFields := TStringList.Create;
  FStrAcessoDeclaracoes := TStringList.Create;
  FStrAcessoImpl := TStringList.Create;
  Self.LerConfiguracoes;
  Self.ConfSGBD;
  Self.ConfFormSimpleORM;
  tabConexao.Show;
  pnGerador.Enabled := False;
end;

procedure TViewMain.FormShow(Sender: TObject);
begin
  Self.ProcessaConexaoNoShow;
end;

procedure TViewMain.ProcessaConexaoNoShow;
begin
  if(not ckConectarAutoAoAcessar.Checked)then
    Exit;
  btnConectarOnOFF.Click;
  if(dm.FDConnection1.Connected)then
    btnListarTabelasDoBanco.Click;
end;

procedure TViewMain.FormDestroy(Sender: TObject);
begin
  FStrAcessoImpl.Free;
  FStrAcessoDeclaracoes.Free;
  FStrFields.Free;
  FStrMetodosPrivate.Free;
  FStrGeral.Free;
  Self.GravarConfiguracoes;
end;

procedure TViewMain.GravarConfiguracoes;
begin
  TModelIniFileComponents
    .New(SECTION_INI_GERADOR)
    //ACESSO SGBD
    .Write(ckConectarAutoAoAcessar)
    .Write(cBoxDriver)
    .Write(edtDatabase)
    .Write(edtUsuario)
    .Write(edtHost)
    .Write(edtPorta)
    .Write(ckSalvarSenhaBancoProxAcesso)
    .Write(edtSenha, IfThen(ckSalvarSenhaBancoProxAcesso.Checked, TUtils.Criptografar(edtSenha.Text), ''))
    //GERADOR
    .Write(edtPastaDestino)
    .Write(ckGravarArquivosPasta)
    .Write(ckAbrirPastaAposGravar)
    .Write(ckAddCabecalho)
    .Write(ckLimparMemoACadaUnit)
    .Write(edtNomeEntities)
    .Write(rdGroupFormaAcessoEntities)
    .Write(ckAddComentarioNomeTabela)
    .Write(ckAddComentarioNomeField)
    .Write(ckExibirMsgSeTipoDesconhecido)
    .Write(edtLocalizarNomeTabela)
    .Write(ckUpperCamelCaseInTables)
    .Write(ckUpperCamelCaseInFields)
    .Write(rdGroupORM)
    .Write(cBoxSimpleORMAtributoCampo)
    .Write(ckAddAtributoPK)
    .Write(edtAddAtributoPKCampo)
    .Write(ckAddAtributoAutoInc)
    .Write(edtAddAtributoAutoIncCampo);
end;

procedure TViewMain.imgLogoClick(Sender: TObject);
begin
  TUtils.OpenLink(URL_GITHUB);
end;

procedure TViewMain.LerConfiguracoes;
begin
  TModelIniFileComponents
    .New(SECTION_INI_GERADOR)
    //ACESSO SGBD
    .Read(ckConectarAutoAoAcessar)
    .Read(cBoxDriver)
    .Read(edtDatabase)
    .Read(edtUsuario)
    .Read(edtHost)
    .Read(edtPorta)
    .Read(edtSenha)
    .Read(ckSalvarSenhaBancoProxAcesso)
    //GERADOR
    .Read(edtPastaDestino)
    .Read(ckGravarArquivosPasta)
    .Read(ckAbrirPastaAposGravar)
    .Read(ckAddCabecalho)
    .Read(ckLimparMemoACadaUnit)
    .Read(edtNomeEntities)
    .Read(rdGroupFormaAcessoEntities)
    .Read(ckAddComentarioNomeTabela)
    .Read(ckAddComentarioNomeField)
    .Read(ckExibirMsgSeTipoDesconhecido)
    .Read(edtLocalizarNomeTabela)
    .Read(ckUpperCamelCaseInTables)
    .Read(ckUpperCamelCaseInFields)
    .Read(rdGroupORM)
    .Read(cBoxSimpleORMAtributoCampo)
    .Read(ckAddAtributoPK)
    .Read(edtAddAtributoPKCampo)
    .Read(ckAddAtributoAutoInc)
    .Read(edtAddAtributoAutoIncCampo);

  edtSenha.Text := '';
  if(ckSalvarSenhaBancoProxAcesso.Checked)then
    edtSenha.Text := TUtils.Descriptografar(edtSenha.Text);
end;

procedure TViewMain.btnPreencherComDadosMySQLClick(Sender: TObject);
begin
  if(dm.FDConnection1.Connected)then
    btnConectarOnOFF.Click;
  cBoxDriver.ItemIndex := 0;
  edtUsuario.Text := 'root';
  edtHost.Text := 'localhost';
  edtPorta.Text := '3306';
  edtUsuario.Enabled := True;
  edtSenha.Enabled := True;
  edtPorta.Enabled := True;
  Self.ConfSGBD;
end;

procedure TViewMain.btnPreencherComDadosPostgresClick(Sender: TObject);
begin
   if(dm.FDConnection1.Connected)then
    btnConectarOnOFF.Click;
  cBoxDriver.ItemIndex := 3;
  edtUsuario.Text := 'postgres';
  edtSenha.Text := 'postgres';
  edtHost.Text := 'localhost';
  edtUsuario.Enabled := True;
  edtSenha.Enabled := True;
  edtPorta.Enabled := True;
  edtPorta.Text := '5432';
  Self.ConfSGBD;
end;

procedure TViewMain.btnPreencherComDadosFirebirdClick(Sender: TObject);
begin
  if(dm.FDConnection1.Connected)then
    btnConectarOnOFF.Click;
  cBoxDriver.ItemIndex := 1;
  edtUsuario.Text := 'sysdba';
  edtSenha.Text := 'masterkey';
  edtHost.Text := 'localhost';
  edtUsuario.Enabled := True;
  edtSenha.Enabled := True;
  edtPorta.Enabled := True;
  edtPorta.Text := '';
  Self.ConfSGBD;
end;

procedure TViewMain.btnPreencherComDadosSQLiteClick(Sender: TObject);
begin
  if(dm.FDConnection1.Connected)then
    btnConectarOnOFF.Click;
  cBoxDriver.ItemIndex := 2;
  edtUsuario.Text := '';
  edtPorta.Text := '';
  edtSenha.Text := '';
  edtUsuario.Enabled := False;
  edtSenha.Enabled := False;
  edtPorta.Enabled := False;
  Self.ConfSGBD;
end;

procedure TViewMain.btnConectarOnOFFClick(Sender: TObject);
begin
   try
      if(not dm.FDConnection1.Connected)then
      begin
        Self.ConectarBanco;
        dm.FDMemTableTabelas.Open;
        tabGerador.Show;
      end
      else
      begin
        dm.FDMemTableTabelas.Close;
        dm.FDConnection1.Connected := False;
      end;
      btnConectarOnOFF.Caption := IfThen(dm.FDConnection1.Connected, 'Desconectar', 'Conectar');
      pnGerador.Enabled := dm.FDConnection1.Connected;
   Except  on ex:exception do
      begin
        if  AnsiContainsstr(ex.Message, 'password authentication failed') then
        begin
           showMessage('Erro de Autenticação para o usuário ' + edtUsuario.Text);
        end;
      end;
   end;
end;

procedure TViewMain.ConectarBanco;
begin
  try
    dm.FDConnection1.Connected := False;
    dm.FDConnection1.Params.Clear;
    case(cBoxDriver.ItemIndex)of
      0: dm.FDConnection1.Params.DriverID := 'MySQL';
      1: dm.FDConnection1.Params.DriverID := 'FB';
      2: dm.FDConnection1.Params.DriverID := 'SQLite';
      3: dm.FDConnection1.Params.DriverID := 'PG';
    end;
    dm.FDConnection1.Params.Database := edtDatabase.Text;
    dm.FDConnection1.Params.UserName := edtUsuario.Text;
    dm.FDConnection1.Params.Password := edtSenha.Text;
    dm.FDConnection1.Params.Add('Server=' + edtHost.Text);
    dm.FDConnection1.Params.Add('Port=' + edtPorta.Text);
    dm.FDConnection1.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Não foi possível realizar a conexão: ' + E.Message);
  end;
end;

procedure TViewMain.DBGridTabelasBancoCellClick(Column: TColumn);
begin
  if(Column.FieldName <> 'marcado')then
    Exit;

  dm.FDMemTableTabelas.Edit;
  dm.FDMemTableTabelasmarcado.AsString := IfThen(dm.FDMemTableTabelasmarcado.AsString = 'N', 'S', 'N');
  dm.FDMemTableTabelas.Post;
end;

procedure TViewMain.DBGridTabelasBancoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  LCheck: Integer;
  LRect: TRect;
begin
  if(dm.FDMemTableTabelas.IsEmpty) then
    Exit;

  if(State = [])then
  begin
    if(Odd(DBGridTabelasBanco.DataSource.DataSet.RecNo))then
      DBGridTabelasBanco.Canvas.Brush.Color := clwhite
    else
      DBGridTabelasBanco.Canvas.Brush.Color := $00E6ECEC;
  end
  else if(gdSelected in State)then
  begin
    DBGridTabelasBanco.Canvas.Font.Color := clBlack;
    DBGridTabelasBanco.Canvas.Brush.Color := $00FFD199;
  end;
  DBGridTabelasBanco.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if(Column.FieldName = 'marcado') then
  begin
    DBGridTabelasBanco.Canvas.FillRect(Rect);
    LCheck := 0;
    if(dm.FDMemTableTabelasmarcado.AsString = 'S')then
      LCheck := DFCS_CHECKED;
    LRect := Rect;
    InflateRect(LRect, 1, 1);
    DrawFrameControl(DBGridTabelasBanco.Canvas.Handle, LRect, DFC_BUTTON, DFCS_BUTTONCHECK or LCheck);
  end;
end;

procedure TViewMain.edtLocalizarNomeTabelaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if(Key = VK_Return)then
    Self.FiltraTabela;
end;

procedure TViewMain.FiltraTabela;
begin
  dm.FDMemTableTabelas.Locate('nome_tabela', edtLocalizarNomeTabela.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TViewMain.btnListarTabelasDoBancoClick(Sender: TObject);
begin
  dm.FDMemTableTabelas.EmptyDataSet;
  dm.FDMetaInfoQueryTabelas.Open;
  dm.FDMetaInfoQueryTabelas.First;
  while(not dm.FDMetaInfoQueryTabelas.Eof)do
  begin
    dm.FDMemTableTabelas.Append;
    dm.FDMemTableTabelasrec_no.AsInteger := dm.FDMetaInfoQueryTabelasRECNO.AsInteger;
    dm.FDMemTableTabelasmarcado.AsString := 'N';
    dm.FDMemTableTabelasnome_tabela.AsString := dm.FDMetaInfoQueryTabelasTABLE_NAME.AsString;
    dm.FDMemTableTabelas.Post;
    dm.FDMetaInfoQueryTabelas.Next;
  end;
  dm.FDMemTableTabelas.First;
  if(not Trim(edtLocalizarNomeTabela.Text).IsEmpty)then
    Self.FiltraTabela;
end;

procedure TViewMain.btnLogCopiarClick(Sender: TObject);
begin
  Clipboard.AsText := mmLog.Lines.Text;
end;

procedure TViewMain.btnLogLimparClick(Sender: TObject);
begin
  mmLog.Lines.Clear;
end;

procedure TViewMain.btnLogSalvarClick(Sender: TObject);
var
  LSaveDialog: TSaveDialog;
begin
  LSaveDialog := TSaveDialog.Create(nil);
  try
    LSaveDialog.Title := 'Code4Delphi - Salvar log em arquivo';
    LSaveDialog.DefaulText := '*.txt';
    LSaveDialog.Filter := 'Arquivos TXT (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*';
    LSaveDialog.FileName := 'Log-'+ FormatDateTime('yyyy-MM-dd_hhnnss', Now) +'.txt';
    LSaveDialog.InitialDir := '';
    if(not LSaveDialog.Execute)then
      Exit;

    if(FileExists(LSaveDialog.FileName))then
    begin
      if(Application.MessageBox('Já há um arquivo com o mesmo nome neste local. Deseja substituí-lo?', 'Mensagem do sistema', MB_YESNO + MB_ICONQUESTION) <> IDYES)then
        Exit;
    end;
    mmLog.Lines.SaveToFile(LSaveDialog.FileName);
  finally
    LSaveDialog.Free;
  end;
end;

procedure TViewMain.btnTabelasDoBancoDesmarcarTodasClick(Sender: TObject);
begin
  Self.MarcaDesmarcaTabelas(False);
end;

procedure TViewMain.btnTabelasDoBancoMarcarTodasClick(Sender: TObject);
begin
  Self.MarcaDesmarcaTabelas(True);
end;

procedure TViewMain.cBoxDriverChange(Sender: TObject);
begin
  Self.ConfSGBD;
end;

procedure TViewMain.MarcaDesmarcaTabelas(AValue: Boolean);
begin
  dm.FDMemTableTabelas.First;
  while(not dm.FDMemTableTabelas.Eof)do
  begin
    dm.FDMemTableTabelas.Edit;
    dm.FDMemTableTabelasmarcado.AsString := IfThen(AValue, 'S', 'N');
    dm.FDMemTableTabelas.Post;
    dm.FDMemTableTabelas.Next;
  end;
end;

procedure TViewMain.btnBuscarArquivoBancoClick(Sender: TObject);
var
  LOpenDialog: TOpenDialog;
begin
  LOpenDialog := TOpenDialog.Create(nil);
  try
    LOpenDialog.Title := 'Selecione o arquivo desejado';
    LOpenDialog.DefaulText := '*.FDB';
    LOpenDialog.Filter := 'Arquivos FDB (*.FDB)|*.FDB|Arquivos GDB (*.GDB)|*.GDB|Arquivos DB (*.DB)|*.DB|Todos os Arquivos (*.*)|*.*';
    LOpenDialog.InitialDir := ExtractFileDir(LOpenDialog.FileName);
    if(not LOpenDialog.Execute)then
      Exit;

    edtDatabase.Text := LOpenDialog.FileName;
  finally
    LOpenDialog.Free;
  end;
end;

procedure TViewMain.btnBuscaPastaDestinoClick(Sender: TObject);
var
  LFileOpenDialog: TFileOpenDialog;
begin
  LFileOpenDialog := TFileOpenDialog.Create(nil);
  try
    LFileOpenDialog.Title := 'Selecione uma pasta';
    LFileOpenDialog.Options := [fdoPickFolders];
    if(not LFileOpenDialog.Execute)then
      Exit;
    edtPastaDestino.Text := LFileOpenDialog.FileName;
  finally
    LFileOpenDialog.Free;
  end;
end;

procedure TViewMain.ProcessaDirSalvar;
begin
  FDirSalvar := '';
  if(ckGravarArquivosPasta.Checked)then
  begin
    FDirSalvar := edtPastaDestino.Text + '\Model\Entities\';
    ForceDirectories(FDirSalvar);
  end;
end;

procedure TViewMain.rdGroupFormaAcessoEntitiesClick(Sender: TObject);
begin
  ckGerarsaídadedadosinterface.Visible := rdGroupFormaAcessoEntities.ItemIndex = 4;
end;

procedure TViewMain.rdGroupORMClick(Sender: TObject);
begin
  if(rdGroupORM.ItemIndex = 1)then
    rdGroupFormaAcessoEntities.ItemIndex := 0;
  Self.ConfFormSimpleORM
end;

procedure TViewMain.ckAddAtributoPKClick(Sender: TObject);
begin
  Self.ConfFormSimpleORM;
end;

procedure TViewMain.ckAddAtributoAutoIncClick(Sender: TObject);
begin
  Self.ConfFormSimpleORM
end;

procedure TViewMain.ConfFormSimpleORM;
begin
  gBoxSimpleORM.Visible := rdGroupORM.ItemIndex = 1;
  edtAddAtributoPKCampo.Enabled := ckAddAtributoPK.Checked;
  edtAddAtributoAutoIncCampo.Enabled := ckAddAtributoAutoInc.Checked;
end;

procedure TViewMain.ConfSGBD;
begin
 case cBoxDriver.ItemIndex of
  1:  btnBuscarArquivoBanco.Enabled := True;
  2:  btnBuscarArquivoBanco.Enabled := True;
 end;
end;

procedure TViewMain.btnGerarClassEntitiesSelecionadosClick(Sender: TObject);
var
  LRecNoAtual: Integer;
begin
  mmLog.Lines.Clear;
  Self.ProcessaDirSalvar;
  FFormaAcesso := TFormaAcesso(rdGroupFormaAcessoEntities.ItemIndex);
  FORM := TORM(rdGroupORM.ItemIndex);
  LRecNoAtual := dm.FDMemTableTabelasrec_no.AsInteger;
  dm.FDMemTableTabelas.DisableControls;
  try
    dm.FDMemTableTabelas.First;
    while(not dm.FDMemTableTabelas.Eof)do
    begin
      if(dm.FDMemTableTabelasmarcado.AsString = 'S')then
      begin
        if rdGroupFormaAcessoEntities.ItemIndex = 4 then
          Self.GerarInterface(dm.FDMemTableTabelasnome_tabela.AsString)
         else
          Self.GerarClassesTabela(dm.FDMemTableTabelasnome_tabela.AsString);
      end;
      dm.FDMemTableTabelas.Next;
    end;
  finally
    dm.FDMemTableTabelas.Locate('rec_no', LRecNoAtual, []);
    dm.FDMemTableTabelas.EnableControls;
    Screen.Cursor := crDefault;
  end;

  if(ckGravarArquivosPasta.Checked)and(ckAbrirPastaAposGravar.Checked)then
    ShellExecute(Application.Handle, 'open', PChar(ExtractFilePath(FDirSalvar)), nil, nil, SW_SHOWNORMAL);
end;

procedure TViewMain.GerarInterface(AtableName: string);
begin
  FTabelaName := AtableName;
  FStrGeral.Clear;
  if(ckLimparMemoACadaUnit.Checked)then
    mmLog.Lines.Clear;
  dm.FDMetaInfoQueryFIelds.Close;
  dm.FDMetaInfoQueryFIelds.ObjectName := AtableName;
  dm.FDMetaInfoQueryFIelds.Open;

  FTabelaLB := AtableName;
  if(ckUpperCamelCaseInTables.Checked)then
    FTabelaLB := TUtils.FormataNome(FTabelaLB);

  FUnitNome := StringReplace(edtNomeEntities.Text, '<NomeTabela>', FTabelaLB, [rfReplaceAll, rfIgnoreCase]);
  FClasseNome := TUtils.RemovePontos(FUnitNome);

  Self.GeraTopoInterface;
  Self.LacoEmFields;
  FInterfaceGerada := True;
  Self.GeraPublic;
  FStrGeral.Add('implementation');
  FStrGeral.Add('end.');
  mmLog.Lines.Add(FStrGeral.Text.TrimRight);

  if(ckGravarArquivosPasta.Checked)then
    FStrGeral.SaveToFile(FDirSalvar + 'i' + FUnitNome + '_.pas');

  Self.GerarImplementacaodaClasseInterface(AtableName);

end;

procedure TViewMain.GerarImplementacaodaClasseInterface(AtableName: string);
begin
  FTabelaName := AtableName;
  FStrGeral.Clear;
  if(ckLimparMemoACadaUnit.Checked) and not (rdGroupFormaAcessoEntities.ItemIndex = 4 ) then
    mmLog.Lines.Clear;
  dm.FDMetaInfoQueryFIelds.Close;
  dm.FDMetaInfoQueryFIelds.ObjectName := AtableName;
  dm.FDMetaInfoQueryFIelds.Open;

  FTabelaLB := AtableName;
  if(ckUpperCamelCaseInTables.Checked)then
    FTabelaLB := TUtils.FormataNome(FTabelaLB);
  FUnitNome := StringReplace(edtNomeEntities.Text, '<NomeTabela>', FTabelaLB, [rfReplaceAll, rfIgnoreCase]);
  FClasseNome := 'T' + TUtils.RemovePontos(FUnitNome);

  Self.GeraTopoClasseInterface;
  Self.LacoEmFields;
  Self.GeraPrivate;
  FInterfaceGerada := False;
  Self.GeraPublic;
  FStrGeral.Add('implementation');
  Self.InstanciaFactoryMethod;
  Self.GeraConstructor;
  Self.GeraDestructor;
  Self.ProcessaFuncoesAcesso;
  FStrGeral.Add('end.');
  mmLog.Lines.Add(FStrGeral.Text.TrimRight);

  if(ckGravarArquivosPasta.Checked)then
    FStrGeral.SaveToFile(FDirSalvar + FUnitNome + '.pas');

end;

procedure TViewMain.GeraTopoClasseInterface;
begin
  if(ckAddCabecalho.Checked)then
    FStrGeral.Add(TUtils.GerarCabecalhoArquivo);

  FStrGeral.Add('unit ' + FUnitNome + ';');
  FStrGeral.Add('');
  FStrGeral.Add('interface');
  FStrGeral.Add('');
  FStrGeral.Add('Uses');
  FStrGeral.Add('i'+ FUnitNome +'_;');
  FStrGeral.Add('');
  FStrGeral.Add('');
  FStrGeral.Add('type');
  FStrGeral.Add('  '+ FClasseNome +' = class ( TInterfacedObject, i' + FUnitNome + ' )');
end;

procedure TViewMain.GerarClassesTabela(AtableName: string);
begin
  FTabelaName := AtableName;
  FStrGeral.Clear;
  if(ckLimparMemoACadaUnit.Checked)then
    mmLog.Lines.Clear;
  dm.FDMetaInfoQueryFIelds.Close;
  dm.FDMetaInfoQueryFIelds.ObjectName := AtableName;
  dm.FDMetaInfoQueryFIelds.Open;

  FTabelaLB := AtableName;
  if(ckUpperCamelCaseInTables.Checked)then
    FTabelaLB := TUtils.FormataNome(FTabelaLB);
  FUnitNome := StringReplace(edtNomeEntities.Text, '<NomeTabela>', FTabelaLB, [rfReplaceAll, rfIgnoreCase]);
  FClasseNome := 'T' + TUtils.RemovePontos(FUnitNome);

  Self.GeraTopo;
  Self.LacoEmFields;
  Self.GeraPrivate;
  Self.GeraPublic;
  FStrGeral.Add('implementation');
  Self.GeraConstructor;
  Self.ProcessaFuncoesAcesso;
  FStrGeral.Add('end.');
  mmLog.Lines.Add(FStrGeral.Text.TrimRight);

  if(ckGravarArquivosPasta.Checked)then
    FStrGeral.SaveToFile(FDirSalvar + FUnitNome + '.pas');
end;

procedure TViewMain.GeraTopo;
begin
  if(ckAddCabecalho.Checked)then
    FStrGeral.Add(TUtils.GerarCabecalhoArquivo);
  FStrGeral.Add('unit ' + FUnitNome + ';');
  FStrGeral.Add('');
  FStrGeral.Add('interface');
  FStrGeral.Add('');
  case(FORM)of
    TORM.SimpleORM:
    begin
      FStrGeral.Add('uses');
      FStrGeral.Add('  SimpleAttributes;');
      FStrGeral.Add('');
    end;
  end;
  FStrGeral.Add('type');
  if(ckAddComentarioNomeTabela.Checked)then
    FStrGeral.Add('  //TABLE: '+ FTabelaName);
  case(FORM)of
    TORM.SimpleORM:
    FStrGeral.Add('  [Tabela('+ QuotedStr(FTabelaName) +')]');
  end;

  FStrGeral.Add('  '+ FClasseNome +' = class');
end;

procedure TViewMain.GeraTopoInterface;
begin
  if(ckAddCabecalho.Checked)then
    FStrGeral.Add(TUtils.GerarCabecalhoArquivo);

  FStrGeral.Add('unit i' + FUnitNome + '_;');
  FStrGeral.Add('');
  FStrGeral.Add('interface');
  FStrGeral.Add('');
  FStrGeral.Add('type');
  FStrGeral.Add(' i'+ FClasseNome +' = interface ' );
  FstrGeral.Add('['''+GUIDToString(TGuid.NewGuid)+''']');
end;

procedure TViewMain.LacoEmFields;
var
  LFieldName: string;
  LFieldNameLB: string;
  LFieldTipo: string;
begin
  FStrMetodosPrivate.Clear;
  FStrFields.Clear;
  FStrAcessoDeclaracoes.Clear;
  FStrAcessoImpl.Clear;

  dm.FDMetaInfoQueryFIelds.First;
  while(not dm.FDMetaInfoQueryFIelds.Eof)do
  begin
    LFieldName := dm.FDMetaInfoQueryFIeldsCOLUMN_NAME.AsString;
    LFieldNameLB := LFieldName;
    if(ckUpperCamelCaseInFields.Checked)then
      LFieldNameLB := TUtils.FormataNome(LFieldNameLB);
    LFieldTipo := TUtils.GetFieldType(dm.FDMetaInfoQueryFIeldsCOLUMN_TYPENAME.AsString, ckExibirMsgSeTipoDesconhecido.Checked);

    //FIELDS
    if(ckAddComentarioNomeField.Checked)then
      FStrFields.Add('    //' + LFieldName);
    FStrFields.Add('    F' + LFieldNameLB + ': ' + LFieldTipo + ';');

    //METODO ACESSO
    case(FFormaAcesso)of
      TFormaAcesso.PropertyDireto,
      TFormaAcesso.PropertyGetSet:
        Self.ProcessaProperty(LFieldName, LFieldNameLB, LFieldTipo);
      TFormaAcesso.GetSet:
        Self.ProcessaGetSet(LFieldNameLB, LFieldTipo);
      TFormaAcesso.FluentInterface:
        Self.ProcessaFluentInterface(LFieldNameLB, LFieldTipo);
      TFormaAcesso.OrientadoInterface:
      begin
         if not FInterfaceGerada then
         Self.ProcessarContratoInterface( LFieldNameLB, LFieldTipo);
        if FInterfaceGerada then
          Self.ProcessaOrientacaoInterface(LFieldNameLB, LFieldTipo);
      end;
    end;
    dm.FDMetaInfoQueryFIelds.Next;
  end;
end;

procedure TViewMain.ProcessaProperty(AFieldName: string; AFieldNameLB: string; AFieldTipo: string);
var
  LColumnAtt: Integer;
  LPkAutoInc: string;
  LFieldNameUpper: string;
begin
  case(FORM)of
    TORM.SimpleORM:
    begin
      LFieldNameUpper := AFieldName.ToUpper;
      LPkAutoInc := '';
      if(ckAddAtributoPK.Checked)and(UpperCase(edtAddAtributoPKCampo.Text) = LFieldNameUpper)then
        LPkAutoInc := ', Pk';

      if(ckAddAtributoAutoInc.Checked)and(UpperCase(edtAddAtributoAutoIncCampo.Text) = LFieldNameUpper)then
        LPkAutoInc := LPkAutoInc + ', AutoInc';

      if(LPkAutoInc.IsEmpty)and(cBoxDriver.ItemIndex = 0)then
      begin
        LColumnAtt := StrToIntDef(dm.FDMetaInfoQueryFIeldsCOLUMN_ATTRIBUTES.AsString, 0);
        case(LColumnAtt)of
          16385:
          LPkAutoInc := ', Pk';
          16419:
          LPkAutoInc := ', Pk, AutoInc';
        end;
      end;

      if(LFieldNameUpper <> AFieldNameLB.ToUpper)or(not LPkAutoInc.IsEmpty)or(cBoxSimpleORMAtributoCampo.ItemIndex = 1)then
        FStrAcessoDeclaracoes.Add('    [Campo('+ QuotedStr(AFieldName) +')'+ LPkAutoInc +']');
    end;
  end;

  case(FFormaAcesso)of
    TFormaAcesso.PropertyDireto:
    FStrAcessoDeclaracoes.Add('    property '+ AFieldNameLB +': '+ AFieldTipo +' read F'+ AFieldNameLB +' write F'+ AFieldNameLB +';');
    TFormaAcesso.PropertyGetSet:
    begin
      FStrMetodosPrivate.Add('    function Get'+ AFieldNameLB +': '+ AFieldTipo +';');
      FStrMetodosPrivate.Add('    procedure Set'+ AFieldNameLB +'(Value: '+ AFieldTipo +');');
      FStrAcessoDeclaracoes.Add('    property '+ AFieldNameLB +': '+ AFieldTipo +' read Get'+ AFieldNameLB +' write Set'+ AFieldNameLB +';');
      Self.ProcessaGetSetImplementacao(AFieldNameLB, AFieldTipo);
    end;
  end;
end;

procedure TViewMain.ProcessaGetSet(AFieldNameLB: string; AFieldTipo: string);
begin
  FStrAcessoDeclaracoes.Add('    function Get'+ AFieldNameLB +': '+ AFieldTipo +';');
  FStrAcessoDeclaracoes.Add('    procedure Set'+ AFieldNameLB +'(Value: '+ AFieldTipo +');');
  Self.ProcessaGetSetImplementacao(AFieldNameLB, AFieldTipo);
end;

procedure TViewMain.ProcessaGetSetImplementacao(AFieldNameLB: string; AFieldTipo: string);
begin
  FStrAcessoImpl.Add('function '+ FClasseNome + '.Get'+ AFieldNameLB +': '+ AFieldTipo +';');
  FStrAcessoImpl.Add('begin');
  FStrAcessoImpl.Add('   Result := F'+ AFieldNameLB +';');
  FStrAcessoImpl.Add('end;');
  FStrAcessoImpl.Add('');
  FStrAcessoImpl.Add('procedure '+ FClasseNome +'.Set'+ AFieldNameLB +'(Value: '+ AFieldTipo +');');
  FStrAcessoImpl.Add('begin');
  FStrAcessoImpl.Add('   F'+ AFieldNameLB +' := Value;');
  FStrAcessoImpl.Add('end;');
  FStrAcessoImpl.Add('');
end;

procedure TViewMain.ProcessarContratoInterface(AFieldNameLB: string; AFieldTipo: string);
begin
  if ckGerarsaídadedadosinterface.Checked then
  begin
    FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB + ':' + AFieldTipo + '; overload;');
    FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +'(Value: '+ AFieldTipo +'): i' + FUnitNome  +'; overload;');
  end
  else
  begin
    FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +'(Value: '+ AFieldTipo +'): i' + FUnitNome  +';');
  end;
end;

procedure TViewMain.ProcessaFluentInterface(AFieldNameLB: string; AFieldTipo: string);
begin
  FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +': '+ AFieldTipo +'; overload;');
  FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +'(Value: '+ AFieldTipo +'): ' + FClasseNome +'; overload;');

  FStrAcessoImpl.Add('function '+ FClasseNome + '.' + AFieldNameLB +': '+ AFieldTipo +';');
  FStrAcessoImpl.Add('begin');
  FStrAcessoImpl.Add('   Result := F'+ AFieldNameLB +';');
  FStrAcessoImpl.Add('end;');
  FStrAcessoImpl.Add('');
  FStrAcessoImpl.Add('function '+ FClasseNome +'.'+ AFieldNameLB +'(Value: '+ AFieldTipo +'): '+ FClasseNome +';');
  FStrAcessoImpl.Add('begin');
  FStrAcessoImpl.Add('   Result := Self;');
  FStrAcessoImpl.Add('   F'+ AFieldNameLB +' := Value;');
  FStrAcessoImpl.Add('end;');
  FStrAcessoImpl.Add('');
end;

procedure TViewMain.ProcessaOrientacaoInterface(AFieldNameLB: string; AFieldTipo: string);
begin
  if ckGerarsaídadedadosinterface.Checked then
  begin
    FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +': '+ AFieldTipo +'; overload;');
    FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +'(Value: '+ AFieldTipo +'): i' + FUnitNome +'; overload;');

    FStrAcessoImpl.Add('function '+ FClasseNome + '.' + AFieldNameLB +': '+ AFieldTipo +';');
    FStrAcessoImpl.Add('begin');
    FStrAcessoImpl.Add('   Result := F'+ AFieldNameLB +';');
    FStrAcessoImpl.Add('end;');
    FStrAcessoImpl.Add('');
    FStrAcessoImpl.Add('function '+ FClasseNome +'.'+ AFieldNameLB +'(Value: '+ AFieldTipo +'): i'+ FUnitNome +';');
    FStrAcessoImpl.Add('begin');
    FStrAcessoImpl.Add('   Result := Self;');
    FStrAcessoImpl.Add('   F'+ AFieldNameLB +' := Value;');
    FStrAcessoImpl.Add('end;');
    FStrAcessoImpl.Add('');
  end
  else
  begin
    FStrAcessoDeclaracoes.Add('    function '+ AFieldNameLB +'(Value: '+ AFieldTipo +'): i' + FUnitNome +';');

    FStrAcessoImpl.Add('function '+ FClasseNome +'.'+ AFieldNameLB +'(Value: '+ AFieldTipo +'): i'+ FUnitNome +';');
    FStrAcessoImpl.Add('begin');
    FStrAcessoImpl.Add('   Result := Self;');
    FStrAcessoImpl.Add('   F'+ AFieldNameLB +' := Value;');
    FStrAcessoImpl.Add('end;');
    FStrAcessoImpl.Add('');
  end;
end;

procedure TViewMain.GeraPrivate;
begin
  FStrGeral.Add('  private');
  FStrGeral.Add(FStrFields.Text.TrimRight);
  if(not FStrMetodosPrivate.Text.Trim.IsEmpty)then
    FStrGeral.Add(FStrMetodosPrivate.Text.TrimRight);
end;

procedure TViewMain.GeraPublic;
begin
  if rdGroupFormaAcessoEntities.ItemIndex = 4 then
  begin
    if not FInterfaceGerada then
    begin
      FStrGeral.Add('  public');
      FStrGeral.Add('    constructor Create;');
      FStrGeral.Add('    destructor destroy ; Override;');
      FStrGeral.Add('    class function new: i' + FUnitNome + ';' );
    end;

    FStrGeral.Add(FStrAcessoDeclaracoes.Text.TrimRight);
    FStrGeral.Add('  end;');
    FStrGeral.Add('');
  end
  else
  begin
    FStrGeral.Add(FStrAcessoDeclaracoes.Text.TrimRight);
    FStrGeral.Add('  end;');
    FStrGeral.Add('');
  end;
end;

procedure TViewMain.InstanciaFactoryMethod;
begin
  FStrGeral.Add('');
  FStrGeral.Add('class function '+ FClasseNome + '.new: i' + FUnitNome + ';');
  FStrGeral.Add('begin');
  FStrGeral.Add('   Result := ' + FClasseNome + '.Create;');
  FStrGeral.Add('end;');
  FStrGeral.Add('');
end;

procedure TViewMain.GeraConstructor;
begin
  FStrGeral.Add('');
  FStrGeral.Add('constructor '+ FClasseNome + '.Create;');
  FStrGeral.Add('begin');
  FStrGeral.Add('   //');
  FStrGeral.Add('end;');
  FStrGeral.Add('');
end;

procedure TViewMain.GeraDestructor;
begin
  FStrGeral.Add('');
  FStrGeral.Add('Destructor '+ FClasseNome + '.Destroy;');
  FStrGeral.Add('begin');
  FStrGeral.Add('   inherited;');
  FStrGeral.Add('end;');
  FStrGeral.Add('');
end;

procedure TViewMain.ProcessaFuncoesAcesso;
begin
  case(FFormaAcesso)of
    TFormaAcesso.PropertyGetSet,
    TFormaAcesso.GetSet,
    TFormaAcesso.FluentInterface:
    begin
      FStrGeral.Add(FStrAcessoImpl.Text.TrimRight);
      FStrGeral.Add('');
    end;
    TFormaAcesso.OrientadoInterface:
    begin
      FStrGeral.Add(FStrAcessoImpl.Text.TrimRight);
      FStrGeral.Add('');
    end;
  end;
end;

procedure TViewMain.btnVerSenhaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtSenha.PasswordChar := #0;
end;

procedure TViewMain.btnVerSenhaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtSenha.PasswordChar := '*';
end;

end.
