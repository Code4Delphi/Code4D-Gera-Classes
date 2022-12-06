unit Model.IniFile.Components.Interfaces;

interface

uses
  System.SysUtils,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  IModelIniFileComponents = interface
    ['{72DF636E-55DE-4A4A-9261-4232418EA418}']
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
  end;

implementation

end.
