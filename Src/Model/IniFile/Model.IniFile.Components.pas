unit Model.IniFile.Components;

interface

uses
  System.IniFiles,
  System.SysUtils,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Model.IniFile.Components.Interfaces;

type
  TModelIniFileComponents = class(TInterfacedObject, IModelIniFileComponents)
  private
    FIniFile: TIniFile;
    FSection: String;
    function GetIniFile: TIniFile;
  protected
    function Write(AComponent: TCheckBox): IModelIniFileComponents; overload;
    function Write(AComponent: TCheckBox; AValue: Boolean): IModelIniFileComponents; overload;
    function Write(AComponent: TRadioGroup): IModelIniFileComponents; overload;
    function Write(AComponent: TRadioGroup; AValue: Integer): IModelIniFileComponents; overload;
    function Write(AComponent: TEdit): IModelIniFileComponents; overload;
    function Write(AComponent: TEdit; AValue: String): IModelIniFileComponents; overload;
    function Write(AComponent: TComboBox): IModelIniFileComponents; overload;
    function Write(AComponent: TComboBox; AValue: Integer): IModelIniFileComponents; overload;

    function Read(var AComponent: TCheckBox): IModelIniFileComponents; overload;
    function Read(var AComponent: TCheckBox; AValueDefault: Boolean): IModelIniFileComponents; overload;
    function Read(var AComponent: TRadioGroup): IModelIniFileComponents; overload;
    function Read(var AComponent: TRadioGroup; AValueDefault: Integer): IModelIniFileComponents; overload;
    function Read(var AComponent: TEdit): IModelIniFileComponents; overload;
    function Read(var AComponent: TEdit; AValueDefault: String): IModelIniFileComponents; overload;
    function Read(var AComponent: TComboBox): IModelIniFileComponents; overload;
    function Read(var AComponent: TComboBox; AValueDefault: Integer): IModelIniFileComponents; overload;
  public
    class function New(ASectionName: String): IModelIniFileComponents;
    constructor Create(ASectionName: String);
    destructor Destroy; override;
  end;

implementation

uses
  Utils;

class function TModelIniFileComponents.New(ASectionName: String): IModelIniFileComponents;
begin
   Result := Self.Create(ASectionName);
end;

constructor TModelIniFileComponents.Create(ASectionName: String);
begin
   FIniFile := Self.GetIniFile;
   FSection := ASectionName;
end;

destructor TModelIniFileComponents.Destroy;
begin
   FIniFile.Free;
   inherited;
end;

function TModelIniFileComponents.GetIniFile: TIniFile;
begin
   Result := TIniFile.Create(TUtils.GetPathIni);
end;

function TModelIniFileComponents.Write(AComponent: TCheckBox): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteBool(FSection, AComponent.Name, TCheckBox(AComponent).Checked);
end;

function TModelIniFileComponents.Write(AComponent: TCheckBox; AValue: Boolean): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteBool(FSection, AComponent.Name, AValue);
end;

function TModelIniFileComponents.Write(AComponent: TRadioGroup): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteInteger(FSection, AComponent.Name, TRadioGroup(AComponent).ItemIndex);
end;

function TModelIniFileComponents.Write(AComponent: TRadioGroup; AValue: Integer): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteInteger(FSection, AComponent.Name, AValue);
end;

function TModelIniFileComponents.Write(AComponent: TEdit): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteString(FSection, AComponent.Name, TEdit(AComponent).Text);
end;

function TModelIniFileComponents.Write(AComponent: TEdit; AValue: String): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteString(FSection, AComponent.Name, AValue);
end;

function TModelIniFileComponents.Write(AComponent: TComboBox): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteInteger(FSection, AComponent.Name, TComboBox(AComponent).ItemIndex);
end;

function TModelIniFileComponents.Write(AComponent: TComboBox; AValue: Integer): IModelIniFileComponents;
begin
   Result := Self;
   FIniFile.WriteInteger(FSection, AComponent.Name, AValue);
end;

function TModelIniFileComponents.Read(var AComponent: TCheckBox): IModelIniFileComponents;
begin
   Result := Self;
   Self.Read(AComponent, TCheckBox(AComponent).Checked);
end;

function TModelIniFileComponents.Read(var AComponent: TCheckBox; AValueDefault: Boolean): IModelIniFileComponents;
begin
   Result := Self;
   TCheckBox(AComponent).Checked := FIniFile.ReadBool(FSection, AComponent.Name, AValueDefault);
end;

function TModelIniFileComponents.Read(var AComponent: TRadioGroup): IModelIniFileComponents;
begin
   Result := Self;
   Self.Read(AComponent, TRadioGroup(AComponent).ItemIndex);
end;

function TModelIniFileComponents.Read(var AComponent: TRadioGroup; AValueDefault: Integer): IModelIniFileComponents;
begin
   Result := Self;
   TRadioGroup(AComponent).ItemIndex := FIniFile.ReadInteger(FSection, AComponent.Name, AValueDefault);
end;

function TModelIniFileComponents.Read(var AComponent: TEdit): IModelIniFileComponents;
begin
   Result := Self;
   Self.Read(AComponent, TEdit(AComponent).Text);
end;

function TModelIniFileComponents.Read(var AComponent: TEdit; AValueDefault: String): IModelIniFileComponents;
begin
   Result := Self;
   TEdit(AComponent).Text := FIniFile.ReadString(FSection, AComponent.Name, AValueDefault);
end;

function TModelIniFileComponents.Read(var AComponent: TComboBox): IModelIniFileComponents;
begin
   Result := Self;
   Self.Read(AComponent, TComboBox(AComponent).ItemIndex);
end;

function TModelIniFileComponents.Read(var AComponent: TComboBox; AValueDefault: Integer): IModelIniFileComponents;
begin
   Result := Self;
   TComboBox(AComponent).ItemIndex := FIniFile.ReadInteger(FSection, AComponent.Name, AValueDefault);
end;

end.
