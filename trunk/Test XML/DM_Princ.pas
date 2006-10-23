unit DM_Princ;

interface

uses
  SysUtils, Classes, jvuib;

type
  TDMPrinc = class(TDataModule)
    UIBDatabase: TJvUIBDataBase;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DMPrinc: TDMPrinc;

implementation

{$R *.dfm}

procedure TDMPrinc.DataModuleCreate(Sender: TObject);
begin
      UIBDataBase.Connected := False;
      UIBDataBase.DatabaseName := DatabasePath;
      UIBDataBase.UserName := DatabaseUserName;
      UIBDataBase.PassWord := DatabasePassword;
      UIBDataBase.LibraryName := DataBaseLibraryName;
      UIBDataBase.Params.Values['sql_role_name'] := DatabaseRole;
end;

end.
