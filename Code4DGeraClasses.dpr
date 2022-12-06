program Code4DGeraClasses;

uses
  Vcl.Forms,
  View.Main in 'Src\View\View.Main.pas' {ViewMain},
  Model.DM1 in 'Src\Model\DM\Model.DM1.pas' {DM: TDataModule},
  Utils in 'Src\Utils\Utils.pas',
  Types in 'Src\Types\Types.pas',
  Consts in 'Src\Consts\Consts.pas',
  Model.IniFile.Components in 'Src\Model\IniFile\Model.IniFile.Components.pas',
  Model.IniFile.Components.Interfaces in 'Src\Model\IniFile\Model.IniFile.Components.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
