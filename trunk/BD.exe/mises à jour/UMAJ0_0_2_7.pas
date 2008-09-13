unit UMAJ0_0_2_7;

interface

implementation

uses UIB, Updates;

procedure MAJ0_0_2_7(Query: TUIBScript);
begin
  with Query do begin
    Script.Clear;
    Script.Add('ALTER TABLE EDITIONS DROP NOTES, ADD NOTES BLOB SUB_TYPE 1;');

    ExecuteScript;
  end;
end;

initialization
  RegisterFBUpdate('0.0.2.7', @MAJ0_0_2_7);

end.
