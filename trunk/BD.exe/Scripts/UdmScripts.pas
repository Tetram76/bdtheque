unit UdmScripts;

interface

uses
  SysUtils, Classes, uPSComponent, uPSComponent_StdCtrls,
  uPSComponent_Controls, uPSComponent_Forms, uPSComponent_DB,
  uPSComponent_COM, uPSComponent_Default;

type
  TdmScripts = class(TDataModule)
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmScripts: TdmScripts;

implementation

{$R *.dfm}

end.
