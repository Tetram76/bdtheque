unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tdebugoutput = class(TForm)
    Output: TMemo;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  debugoutput: Tdebugoutput;

implementation

{$R *.dfm}

end.
