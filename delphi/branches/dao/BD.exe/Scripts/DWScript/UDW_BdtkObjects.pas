unit UDW_BdtkObjects;

interface

uses
  System.SysUtils, System.Classes, UDWUnit, dwsComp, dwsExprs, dialogs, UScriptEngineIntf;

type
  TDW_BdtkObjectsUnit = class(TDW_Unit)
  private
    procedure Register_TObjectList;
    procedure Register_TUnivers;
    procedure Register_TObjectListOfUnivers;
    procedure Register_TAuteur;
    procedure Register_TObjectListOfAuteur;
    procedure Register_TEditeurComplet;
    procedure Register_TSerieComplete;
    procedure Register_TEditionComplete;
    procedure Register_TAlbumComplet;

    procedure Register_TScriptChoix;
    procedure Register_Classes;

    procedure TAlbumCompletDefaultSearch_R(info: TProgramInfo; ExtObject: TObject);
    procedure TAlbumCompletEdition_R(info: TProgramInfo; ExtObject: TObject);

    procedure TAuteurNomAuteur(info: TProgramInfo; ExtObject: TObject);

    procedure TEditionCompleteCollection(info: TProgramInfo; ExtObject: TObject);

    procedure TScriptChoixTitre(info: TProgramInfo; ExtObject: TObject);

    procedure TSerieCompleteCollection(info: TProgramInfo; ExtObject: TObject);

    procedure TObjectListOfObjectCount_R(info: TProgramInfo; ExtObject: TObject);

    procedure MakeAuteurEval(info: TProgramInfo);
    procedure MakeUniversEval(info: TProgramInfo);
  public
    constructor Create(const MasterEngine: IMasterEngine); override;
  published
    procedure OnTAlbumComplet_ImportEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTAlbumComplet_ClearEval(info: TProgramInfo; ExtObject: TObject);

    procedure OnTUnivers_CreateEval(info: TProgramInfo; var ExtObject: TObject);

    procedure OnTAuteur_CreateEval(info: TProgramInfo; var ExtObject: TObject);

    procedure OnTEditionComplete_AddImageFromURLEval(info: TProgramInfo; ExtObject: TObject);

    procedure OnTScriptChoix_CreateEval(info: TProgramInfo; var ExtObject: TObject);
    procedure OnTScriptChoix_DestroyEval(ExtObject: TObject);
    procedure OnTScriptChoix_ResetListEval(ExtObject: TObject);
    procedure OnTScriptChoix_AjoutChoixWithThumbEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTScriptChoix_AjoutChoixEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTScriptChoix_ChoixCountEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTScriptChoix_CategorieCountEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTScriptChoix_CategorieChoixCountEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTScriptChoix_ShowEval(info: TProgramInfo; ExtObject: TObject);

    procedure OnTObjectList_DeleteEval(info: TProgramInfo; ExtObject: TObject);

    procedure OnTObjectListOfAuteur_ItemsEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTObjectListOfAuteur_AddEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTObjectListOfAuteur_InsertEval(info: TProgramInfo; ExtObject: TObject);

    procedure OnTObjectListOfUnivers_ItemsEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTObjectListOfUnivers_AddEval(info: TProgramInfo; ExtObject: TObject);
    procedure OnTObjectListOfUnivers_InsertEval(info: TProgramInfo; ExtObject: TObject);
  end;

implementation

uses
  dwsSymbols, EntitiesFull, UMetadata, Procedures, AnsiStrings, Divers, Generics.Collections,
  UScriptsFonctions, EntitiesLite, LoadCompletImport, Commun;

{ TDW_BdtkObjects }

constructor TDW_BdtkObjectsUnit.Create(const MasterEngine: IMasterEngine);
begin
  inherited;
  UnitName := 'BdtkObjects';
  Dependencies.Add('Classes');
  Register_Classes;
end;

procedure TDW_BdtkObjectsUnit.MakeAuteurEval(info: TProgramInfo);
begin
  info.ResultAsVariant := GetScriptObjFromExternal(info, MakeAuteur(info.ParamAsString[0], TMetierAuteur(info.ParamAsInteger[1])));
end;

procedure TDW_BdtkObjectsUnit.MakeUniversEval(info: TProgramInfo);
begin
  info.ResultAsVariant := GetScriptObjFromExternal(info, MakeUnivers(info.ParamAsString[0]));
end;

procedure TDW_BdtkObjectsUnit.OnTAlbumComplet_ClearEval(info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as TAlbumComplet).Clear;
end;

procedure TDW_BdtkObjectsUnit.OnTAlbumComplet_ImportEval(info: TProgramInfo; ExtObject: TObject);
begin
  Import(ExtObject as TAlbumComplet);
end;

procedure TDW_BdtkObjectsUnit.OnTAuteur_CreateEval(info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TAuteurLite.Create;
end;

procedure TDW_BdtkObjectsUnit.OnTEditionComplete_AddImageFromURLEval(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsInteger := AddImageFromURL((ExtObject as TEditionComplete), info.ParamAsString[0], info.ParamAsInteger[1]);
end;

procedure TDW_BdtkObjectsUnit.OnTObjectListOfAuteur_AddEval(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsInteger := (ExtObject as TObjectList<TAuteurLite>).Add(info.ParamAsObject[0] as TAuteurLite);
end;

procedure TDW_BdtkObjectsUnit.OnTObjectListOfAuteur_InsertEval(info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as TObjectList<TAuteurLite>).Insert(info.ParamAsInteger[0], info.ParamAsObject[1] as TAuteurLite);
end;

procedure TDW_BdtkObjectsUnit.OnTObjectListOfAuteur_ItemsEval(info: TProgramInfo; ExtObject: TObject);
begin
  case TMethodSymbol(info.FuncSym).Kind of
    fkFunction:
      info.ResultAsVariant := GetScriptObjFromExternal(info, (ExtObject as TObjectList<TAuteurLite>).Items[info.ParamAsInteger[0]]);
    // info.ResultAsVariant := info.RegisterExternalObject((ExtObject as TObjectList<TAuteur>).Items[info.ParamAsInteger[0]]);
  end;
end;

procedure TDW_BdtkObjectsUnit.OnTObjectListOfUnivers_AddEval(info: TProgramInfo;
  ExtObject: TObject);
begin
  info.ResultAsInteger := (ExtObject as TObjectList<TUniversLite>).Add(info.ParamAsObject[0] as TUniversLite);
end;

procedure TDW_BdtkObjectsUnit.OnTObjectListOfUnivers_InsertEval(info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as TObjectList<TUniversLite>).Insert(info.ParamAsInteger[0], info.ParamAsObject[1] as TUniversLite);
end;

procedure TDW_BdtkObjectsUnit.OnTObjectListOfUnivers_ItemsEval(info: TProgramInfo; ExtObject: TObject);
begin
  case TMethodSymbol(info.FuncSym).Kind of
    fkFunction:
      info.ResultAsVariant := GetScriptObjFromExternal(info, (ExtObject as TObjectList<TUniversLite>).Items[info.ParamAsInteger[0]]);
    // info.ResultAsVariant := info.RegisterExternalObject((ExtObject as TObjectList<TUnivers>).Items[info.ParamAsInteger[0]]);
  end;
end;

procedure TDW_BdtkObjectsUnit.OnTObjectList_DeleteEval(info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as TObjectList<TObject>).Delete(info.ParamAsInteger[0]);
end;

procedure TDW_BdtkObjectsUnit.TAlbumCompletDefaultSearch_R(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsString := (ExtObject as TAlbumComplet).DefaultSearch;
end;

procedure TDW_BdtkObjectsUnit.TAlbumCompletEdition_R(info: TProgramInfo; ExtObject: TObject);
var
  Album: TAlbumComplet;
begin
  Album := (ExtObject as TAlbumComplet);
  if Album.Editions.Editions.Count = 0 then
  begin
    Album.Editions.Editions.Add(TEditionComplete.Create(GUID_NULL));
    Album.Editions.Editions[0].New;
  end;
  info.ResultAsVariant := GetScriptObjFromExternal(info, Album.Editions.Editions[0]);
end;

procedure TDW_BdtkObjectsUnit.TAuteurNomAuteur(info: TProgramInfo; ExtObject: TObject);
begin
  case info.FuncSym.Kind of
    fkFunction:
      info.ResultAsString := (ExtObject as TAuteurLite).Personne.Nom;
    fkProcedure:
      (ExtObject as TAuteurLite).Personne.Nom := info.ParamAsString[0];
end;
end;

procedure TDW_BdtkObjectsUnit.TObjectListOfObjectCount_R(info: TProgramInfo; ExtObject: TObject);
begin
  // le "as" d�clenche une erreur de cast, mais le typage forc� fonctionne.... les joies des generic made in Delphi
  // info.ResultAsInteger := (ExtObject as TObjectList<TObject>).Count;
  info.ResultAsInteger := TObjectList<TObject>(ExtObject).Count;
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_AjoutChoixEval(info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as TScriptChoix).AjoutChoix(info.ParamAsString[0], info.ParamAsString[1], info.ParamAsString[2], info.ParamAsString[3]);
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_AjoutChoixWithThumbEval(info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as TScriptChoix).AjoutChoixWithThumb(info.ParamAsString[0], info.ParamAsString[1], info.ParamAsString[2], info.ParamAsString[3],
    info.ParamAsString[4]);
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_CategorieChoixCountEval(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsInteger := (ExtObject as TScriptChoix).CategorieChoixCount(info.ParamAsString[0]);
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_CategorieCountEval(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsInteger := (ExtObject as TScriptChoix).CategorieCount;
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_ChoixCountEval(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsInteger := (ExtObject as TScriptChoix).ChoixCount;
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_CreateEval(info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptChoix.Create;
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_DestroyEval(ExtObject: TObject);
begin
  ExtObject.Free;
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_ResetListEval(ExtObject: TObject);
begin
  (ExtObject as TScriptChoix).ResetList;
end;

procedure TDW_BdtkObjectsUnit.OnTScriptChoix_ShowEval(info: TProgramInfo; ExtObject: TObject);
begin
  info.ResultAsString := (ExtObject as TScriptChoix).Show;
end;

procedure TDW_BdtkObjectsUnit.OnTUnivers_CreateEval(info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TUniversLite.Create;
end;

procedure TDW_BdtkObjectsUnit.TScriptChoixTitre(info: TProgramInfo; ExtObject: TObject);
begin
  case TMethodSymbol(info.FuncSym).Kind of
    fkFunction:
      info.ResultAsString := (ExtObject as TScriptChoix).Titre;
    fkProcedure:
      (ExtObject as TScriptChoix).Titre := info.ParamAsString[0];
end;
end;

procedure TDW_BdtkObjectsUnit.TSerieCompleteCollection(info: TProgramInfo; ExtObject: TObject);
begin
  case TMethodSymbol(info.FuncSym).Kind of
    fkFunction:
      info.ResultAsString := (ExtObject as TSerieComplete).Collection.NomCollection;
    fkProcedure:
      (ExtObject as TSerieComplete).Collection.NomCollection := info.ParamAsString[0];
end;
end;

procedure TDW_BdtkObjectsUnit.TEditionCompleteCollection(info: TProgramInfo; ExtObject: TObject);
begin
  case TMethodSymbol(info.FuncSym).Kind of
    fkFunction:
      info.ResultAsString := (ExtObject as TEditionComplete).Collection.NomCollection;
    fkProcedure:
      (ExtObject as TEditionComplete).Collection.NomCollection := info.ParamAsString[0];
end;
end;

procedure TDW_BdtkObjectsUnit.Register_Classes;
begin
  RegisterType('Currency', 'Float');
  RegisterType('LongString', 'string');

  Register_TObjectList;

  Register_TUnivers;
  Register_TObjectListOfUnivers;
  Register_TAuteur;
  Register_TObjectListOfAuteur;
  Register_TEditeurComplet;
  Register_TSerieComplete;
  Register_TEditionComplete;
  Register_TAlbumComplet;

  Register_TScriptChoix;
end;

procedure TDW_BdtkObjectsUnit.Register_TAlbumComplet;
var
  c: TdwsClass;
begin
  c := RegisterClass('TAlbumComplet');

  RegisterProperty(c, 'DefaultSearch', 'string', TAlbumCompletDefaultSearch_R);

  RegisterProperty(c, 'Titre', 'string', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Serie', 'TSerieComplete', HandleDynamicProperty);
  RegisterProperty(c, 'MoisParution', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'AnneeParution', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Tome', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'TomeDebut', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'TomeFin', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'HorsSerie', 'Boolean', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Integrale', 'Boolean', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Scenaristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , HandleDynamicProperty);
  RegisterProperty(c, 'Dessinateurs', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , HandleDynamicProperty);
  RegisterProperty(c, 'Coloristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , HandleDynamicProperty);
  RegisterProperty(c, 'Sujet', 'LongString', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Notes', 'LongString', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Edition', 'TEditionComplete', TAlbumCompletEdition_R);
  RegisterProperty(c, 'Univers', 'TObjectListOfUnivers' { TObjectList<TUnivers> } , HandleDynamicProperty);

  RegisterMethod(c, 'Clear', []);
  RegisterMethod(c, 'Import', []);
end;

procedure TDW_BdtkObjectsUnit.Register_TAuteur;
var
  c: TdwsClass;
begin
  with Enumerations.Add do
  begin
    Name := 'TMetierAuteur';
    with Elements.Add do
    begin
      Name := 'maScenariste';
      UserDefValue := Ord(maScenariste);
    end;
    with Elements.Add do
    begin
      Name := 'maDessinateur';
      UserDefValue := Ord(maDessinateur);
    end;
    with Elements.Add do
    begin
      Name := 'maColoriste';
      UserDefValue := Ord(maColoriste);
    end;
  end;

  c := RegisterClass('TAuteur');

  RegisterConstructor(c, []);
  RegisterProperty(c, 'NomAuteur', 'string', TAuteurNomAuteur, TAuteurNomAuteur);
  RegisterProperty(c, 'Metier', 'TMetierAuteur', HandleDynamicProperty, HandleDynamicProperty);

  RegisterFunction('MakeAuteur', 'TAuteur', ['Nom', 'string', 'Metier', 'TMetierAuteur'], MakeAuteurEval);
end;

procedure TDW_BdtkObjectsUnit.Register_TEditeurComplet;
var
  c: TdwsClass;
begin
  c := RegisterClass('TEditeurComplet');

  RegisterProperty(c, 'NomEditeur', 'string', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'SiteWeb', 'string', HandleDynamicProperty, HandleDynamicProperty);
end;

procedure TDW_BdtkObjectsUnit.Register_TEditionComplete;
var
  c: TdwsClass;
  i: Integer;
  FListTypesImages: TStringList;
begin
  FListTypesImages := TStringList.Create;
  try
    LoadStrings(6, FListTypesImages);
    for i := 0 to Pred(FListTypesImages.Count) do
      with Constants.Add do
      begin
        Name := 'cti' + StringReplace(SansAccents(FListTypesImages.ValueFromIndex[i]), ' ', '_', [rfReplaceAll]);
        DataType := 'Integer';
        Value := StrToInt(FListTypesImages.Names[i]);
      end;
  finally
    FListTypesImages.Free;
  end;

  c := RegisterClass('TEditionComplete');

  RegisterProperty(c, 'Editeur', 'TEditeurComplet', HandleDynamicProperty);
  RegisterProperty(c, 'Collection', 'string', TEditionCompleteCollection, TEditionCompleteCollection);
  RegisterProperty(c, 'TypeEdition', 'Integer' { ROption } , HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'AnneeEdition', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Etat', 'Integer' { ROption } , HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Reliure', 'Integer' { ROption } , HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'NombreDePages', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'FormatEdition', 'Integer' { ROption } , HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Orientation', 'Integer' { ROption } , HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'AnneeCote', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'SensLecture', 'Integer' { ROption } , HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Prix', 'Currency', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'PrixCote', 'Currency', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Couleur', 'Boolean', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'VO', 'Boolean', HandleDynamicProperty, HandleDynamicProperty);
  // RegisterProperty(c, 'Dedicace', 'Boolean', True);
  // RegisterProperty(c, 'Stock', 'Boolean', True);
  // RegisterProperty(c, 'Prete', 'Boolean', True);
  // RegisterProperty(c, 'Offert', 'Boolean', True);
  RegisterProperty(c, 'Gratuit', 'Boolean', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'ISBN', 'string', HandleDynamicProperty, HandleDynamicProperty);
  // RegisterProperty(c, 'DateAchat', 'TDateTime', True);
  // RegisterProperty(c, 'Notes', 'LongString', HandleDynamicProperty, HandleDynamicProperty);
  // RegisterProperty(c, 'NumeroPerso', 'string', True);
  // RegisterProperty(c, 'Couvertures', 'TMyObjectList<TCouverture>', False);

  RegisterMethod(c, 'AddImageFromURL', 'Integer', ['URL', 'string', 'TypeImage', 'Integer']);
end;

procedure TDW_BdtkObjectsUnit.Register_TObjectList;
var
  c: TdwsClass;
begin
  c := RegisterClass('TObjectList', 'TObject');

  RegisterProperty(c, 'Count', 'Integer', TObjectListOfObjectCount_R);
  RegisterMethod(c, 'Delete', ['Index', 'Integer']);
end;

procedure TDW_BdtkObjectsUnit.Register_TObjectListOfAuteur;
var
  c: TdwsClass;
begin
  c := RegisterClass('TObjectListOfAuteur', 'TObjectList');

  RegisterProperty(c, 'Items', 'TAuteur', ['Index', 'Integer'], OnTObjectListOfAuteur_ItemsEval).IsDefault := True;
  RegisterMethod(c, 'Add', 'Integer', ['AObject', 'TAuteur']);
  RegisterMethod(c, 'Insert', ['Index', 'Integer', 'AObject', 'TAuteur']);
end;

procedure TDW_BdtkObjectsUnit.Register_TObjectListOfUnivers;
var
  c: TdwsClass;
begin
  c := RegisterClass('TObjectListOfUnivers', 'TObjectList');

  RegisterProperty(c, 'Items', 'TUnivers', ['Index', 'Integer'], OnTObjectListOfUnivers_ItemsEval).IsDefault := True;
  RegisterMethod(c, 'Add', 'Integer', ['AObject', 'TUnivers']);
  RegisterMethod(c, 'Insert', ['Index', 'Integer', 'AObject', 'TUnivers']);
end;

procedure TDW_BdtkObjectsUnit.Register_TScriptChoix;
var
  c: TdwsClass;
begin
  c := RegisterClass('TScriptChoix');

  RegisterConstructor(c, []);

  RegisterMethod(c, 'Show', 'string', []);
  RegisterMethod(c, 'ResetList', []);
  RegisterMethod(c, 'AjoutChoix', ['Categorie', 'string', 'Libelle', 'string', 'Commentaire', 'string', 'Data', 'string']);
  RegisterMethod(c, 'AjoutChoixWithThumb', ['Categorie', 'string', 'Libelle', 'string', 'Commentaire', 'string', 'Data', 'string', 'URL', 'string']);
  RegisterMethod(c, 'CategorieCount', 'Integer', []);
  RegisterMethod(c, 'ChoixCount', 'Integer', []);
  RegisterMethod(c, 'CategorieChoixCount', 'Integer', ['Name', 'string']);
  RegisterProperty(c, 'Titre', 'string', TScriptChoixTitre, TScriptChoixTitre);
end;

procedure TDW_BdtkObjectsUnit.Register_TSerieComplete;
var
  c: TdwsClass;
begin
  c := RegisterClass('TSerieComplete');

  RegisterProperty(c, 'Titre', 'string', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Terminee', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Genres', 'TStringList', HandleDynamicProperty);
  RegisterProperty(c, 'Sujet', 'LongString', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Notes', 'LongString', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Editeur', 'TEditeurComplet', HandleDynamicProperty);
  RegisterProperty(c, 'Collection', 'string', TSerieCompleteCollection, TSerieCompleteCollection);
  RegisterProperty(c, 'SiteWeb', 'string', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'NbAlbums', 'Integer', HandleDynamicProperty, HandleDynamicProperty);
  RegisterProperty(c, 'Scenaristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , HandleDynamicProperty);
  RegisterProperty(c, 'Dessinateurs', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , HandleDynamicProperty);
  RegisterProperty(c, 'Coloristes', 'TObjectListOfAuteur' { TObjectList<TAuteur> } , HandleDynamicProperty);
  RegisterProperty(c, 'Univers', 'TObjectListOfUnivers' { TObjectList<TUnivers> } , HandleDynamicProperty);
end;

procedure TDW_BdtkObjectsUnit.Register_TUnivers;
var
  c: TdwsClass;
begin
  c := RegisterClass('TUnivers');

  RegisterProperty(c, 'NomUnivers', 'string', HandleDynamicProperty, HandleDynamicProperty);

  RegisterFunction('MakeUnivers', 'TUnivers', ['Nom', 'string'], MakeUniversEval);
end;

end.
