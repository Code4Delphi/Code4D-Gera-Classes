unit Model.DM1;

interface

uses
  Data.DB,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.Intf,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,

  System.Classes,
  System.SysUtils, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

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
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
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
  FDPhysPgDriverLink1.VendorHome := '.\';
  FDConnection1.Connected := False;
end;

end.
