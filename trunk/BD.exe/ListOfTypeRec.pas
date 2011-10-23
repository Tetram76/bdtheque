unit ListOfTypeRec;

interface

uses
  Generics.Collections, Generics.Defaults;

type
  TMyObjectList<T: class> = class(TObjectList<T>)
  private
    // 28/08/2011: avec DelphiXE, il ne faut surtout pas d�clarer de variables
    // sinon elles partageront l'espace m�moire des classes descendant de TMyObjectList<>
  public
    constructor Create(AOwnsObjects: Boolean = True);
    // 21/11/2009: n'est plus utile avec D2010 ?
    // procedure Move(oldIndex, newIndex: Integer);
  end;

implementation

{ TMyObjectList<T> }

constructor TMyObjectList<T>.Create(AOwnsObjects: Boolean);
begin
  inherited Create(TComparer<T>.Construct(
      function(const Left, Right: T): Integer
      begin
        if Left = Right then
          Result := 0
        else
          Result := -1;
      end
    ), AOwnsObjects);
end;

//procedure TMyObjectList<T>.Move(oldIndex, newIndex: Integer);
//var
//  savOwnsObject: Boolean;
//  A: T;
//begin
//  savOwnsObject := OwnsObjects;
//  try
//    OwnsObjects := False; // sinon l'affectation des nouvelles places d�truira les objets remplac�s
//
//    A := Items[oldIndex];
//    Items[oldIndex] := Items[newIndex];
//    Items[newIndex] := A;
//  finally
//    OwnsObjects := savOwnsObject;
//  end;
//end;

end.
