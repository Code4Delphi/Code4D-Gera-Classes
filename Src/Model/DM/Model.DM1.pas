unit Model.DM1;

interface

uses
  System.Classes,
  System.SysUtils,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDMetaInfoQueryTabelas: TFDMetaInfoQuery;
    FDMetaInfoQueryTabelasRECNO: TIntegerField;
    FDMetaInfoQueryTabelasCATALOG_NAME: TWideStringField;
    FDMetaInfoQueryTabelasSCHEMA_NAME: TWideStringField;
    FDMetaInfoQueryTabelasTABLE_NAME: TWideStringField;
    FDMetaInfoQueryTabelasTABLE_TYPE: TIntegerField;
    FDMetaInfoQueryTabelasTABLE_SCOPE: TIntegerField;
    FDMemTableTabelas: TFDMemTable;
    DS_FDMemTableTabelas: TDataSource;
    FDMemTableTabelasnome_tabela: TStringField;
    FDMemTableTabelasrec_no: TIntegerField;
    FDMemTableTabelasmarcado: TStringField;
    FDMetaInfoQueryFIelds: TFDMetaInfoQuery;
    FDMetaInfoQueryFIeldsRECNO: TIntegerField;
    FDMetaInfoQueryFIeldsCATALOG_NAME: TWideStringField;
    FDMetaInfoQueryFIeldsSCHEMA_NAME: TWideStringField;
    FDMetaInfoQueryFIeldsTABLE_NAME: TWideStringField;
    FDMetaInfoQueryFIeldsCOLUMN_NAME: TWideStringField;
    FDMetaInfoQueryFIeldsCOLUMN_POSITION: TIntegerField;
    FDMetaInfoQueryFIeldsCOLUMN_DATATYPE: TIntegerField;
    FDMetaInfoQueryFIeldsCOLUMN_TYPENAME: TWideStringField;
    FDMetaInfoQueryFIeldsCOLUMN_ATTRIBUTES: TLongWordField;
    FDMetaInfoQueryFIeldsCOLUMN_PRECISION: TIntegerField;
    FDMetaInfoQueryFIeldsCOLUMN_SCALE: TIntegerField;
    FDMetaInfoQueryFIeldsCOLUMN_LENGTH: TIntegerField;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   FDConnection1.Connected := False;
end;

end.
