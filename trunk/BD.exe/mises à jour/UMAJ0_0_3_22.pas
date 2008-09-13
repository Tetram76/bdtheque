unit UMAJ0_0_3_22;

interface

implementation

uses UIB, Updates;

procedure MAJ0_0_3_22(Query: TUIBScript);
begin
  with Query do begin
    Script.Clear;

    Script.Add('ALTER TABLE ALBUMS ADD NBEDITIONS INTEGER DEFAULT 0, ADD COMPLET COMPUTED BY (case when NBEDITIONS > 0 then 1 else 0 end);');

    Script.Add('ALTER TRIGGER EDITIONS_AD0 ACTIVE AFTER DELETE POSITION 0');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  delete from couvertures where refalbum is null and refedition = old.refedition;');
    Script.Add('  update couvertures set refedition = null where refedition = old.refedition;');
    Script.Add('');
    Script.Add('  update albums set nbeditions = nbeditions - 1 where refalbum = old.refalbum;');
    Script.Add('end;');

    Script.Add('ALTER TRIGGER EDITIONS_AU0 ACTIVE AFTER UPDATE POSITION 0');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  if (new.refedition <> old.refedition) then begin');
    Script.Add('    update couvertures set refedition = new.refedition where refedition = old.refedition;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (new.refalbum <> old.refalbum) then begin');
    Script.Add('    update albums set nbeditions = nbeditions - 1 where refalbum = old.refalbum;');
    Script.Add('    update albums set nbeditions = nbeditions + 1 where refalbum = new.refalbum;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('CREATE TRIGGER EDITIONS_AI0 FOR EDITIONS ACTIVE AFTER INSERT POSITION 0');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  update albums set nbeditions = nbeditions + 1 where refalbum = new.refalbum;');
    Script.Add('end;');

    Script.Add('update albums set NBEDITIONS = 0;');
    Script.Add('update albums a set a.NBEDITIONS = (select count(refedition) from editions e where e.refalbum = a.refalbum);');

    Script.Add('DROP VIEW VW_INITIALES_ALBUMS;');

    Script.Add('CREATE PROCEDURE INITIALES_ALBUMS (');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    INITIALETITREALBUM CHAR(1),');
    Script.Add('    COUNTINITIALE INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('begin');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''WHERE '' || filtre;');
    Script.Add('  for execute statement');
    Script.Add('      ''select initialetitrealbum,');
    Script.Add('               Count(REFALBUM)');
    Script.Add('      from ALBUMS '' || SWHERE ||');
    Script.Add('      '' group by initialetitrealbum''');
    Script.Add('      into :INITIALETITREALBUM,');
    Script.Add('           :COUNTINITIALE');
    Script.Add('  do');
    Script.Add('    suspend;');
    Script.Add('end;');       

    Script.Add('ALTER PROCEDURE ALBUMS_BY_INITIALE (');
    Script.Add('    INITIALE CHAR(1),');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150))');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(133);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('     ''SELECT a.REFALBUM,');
    Script.Add('             a.TITREALBUM,');
    Script.Add('             a.TOME,');
    Script.Add('             a.TOMEDEBUT,');
    Script.Add('             a.TOMEFIN,');
    Script.Add('             a.HORSSERIE,');
    Script.Add('             a.INTEGRALE,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE');
    Script.Add('      FROM ALBUMS a INNER JOIN SERIES s ON s.refserie = a.refserie');
    Script.Add('      WHERE a.initialetitrealbum = '''''' || :INITIALE || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('END;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_AUTEUR(');
    Script.Add('    REFAUTEUR INTEGER)');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    METIER SMALLINT)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ANNEES_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    ANNEEPARUTION INTEGER,');
    Script.Add('    COUNTANNEE INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE COLLECTIONS_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    NOMCOLLECTION VARCHAR(50),');
    Script.Add('    COUNTCOLLECTION INTEGER,');
    Script.Add('    REFCOLLECTION INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE EDITEURS_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    COUNTEDITEUR INTEGER,');
    Script.Add('    REFEDITEUR INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE GENRES_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    GENRE VARCHAR(30),');
    Script.Add('    COUNTGENRE INTEGER,');
    Script.Add('    REFGENRE INTEGER)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  EXIT;');
    Script.Add('end;');

    Script.Add('DROP VIEW VW_LISTE_GENRES_ALBUMS;');
    Script.Add('DROP VIEW VW_LISTE_EDITEURS_ALBUMS;');
    Script.Add('DROP VIEW VW_LISTE_COLLECTIONS_ALBUMS;');
    Script.Add('DROP VIEW VW_LISTE_ALBUMS;');

    Script.Add('CREATE VIEW VW_LISTE_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    UPPERTITRESERIE,');
    Script.Add('    ACHAT)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       s.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       s.UPPERTITRESERIE,');
    Script.Add('       a.ACHAT');
    Script.Add('FROM ALBUMS a INNER JOIN SERIES s ON s.refserie = a.refserie');
    Script.Add(';');

    Script.Add('CREATE VIEW VW_LISTE_COLLECTIONS_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFCOLLECTION,');
    Script.Add('    NOMCOLLECTION,');
    Script.Add('    UPPERNOMCOLLECTION)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       c.REFCOLLECTION,');
    Script.Add('       c.NOMCOLLECTION,');
    Script.Add('       c.UPPERNOMCOLLECTION');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN EDITIONS e ON e.refalbum = a.refalbum');
    Script.Add('                       LEFT JOIN COLLECTIONS c ON e.refcollection = c.refcollection');
    Script.Add(';');

    Script.Add('CREATE VIEW VW_LISTE_EDITEURS_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFEDITEUR,');
    Script.Add('    NOMEDITEUR,');
    Script.Add('    UPPERNOMEDITEUR)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       e.REFEDITEUR,');
    Script.Add('       e.NOMEDITEUR,');
    Script.Add('       e.UPPERNOMEDITEUR');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN EDITIONS ed ON ed.refalbum = a.refalbum');
    Script.Add('                       LEFT JOIN EDITEURS e ON e.refediteur = ed.refediteur');
    Script.Add(';');

    Script.Add('CREATE VIEW VW_LISTE_GENRES_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFGENRE,');
    Script.Add('    GENRE,');
    Script.Add('    UPPERGENRE)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       g.REFGENRE,');
    Script.Add('       g.GENRE,');
    Script.Add('       g.UPPERGENRE');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN GENRESERIES gs ON gs.refserie = a.refserie');
    Script.Add('                       LEFT JOIN GENRES g ON gs.refgenre = g.refgenre');
    Script.Add(';');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_AUTEUR(');
    Script.Add('    REFAUTEUR INTEGER)');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    METIER SMALLINT)');
    Script.Add('AS');
    Script.Add('BEGIN');
    Script.Add('  for SELECT A.REFALBUM,');
    Script.Add('             A.TITREALBUM,');
    Script.Add('             A.TOME,');
    Script.Add('             A.TOMEDEBUT,');
    Script.Add('             A.TOMEFIN,');
    Script.Add('             A.HORSSERIE,');
    Script.Add('             A.INTEGRALE,');
    Script.Add('             A.ANNEEPARUTION,');
    Script.Add('             A.REFSERIE,');
    Script.Add('             A.TITRESERIE,');
    Script.Add('             AU.metier');
    Script.Add('        FROM vw_liste_albums A INNER JOIN auteurs au on a.refalbum = au.refalbum');
    Script.Add('        WHERE au.refpersonne = :RefAuteur');
    Script.Add('        ORDER BY UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, ANNEEPARUTION NULLS FIRST, UPPERTITREALBUM, METIER');
    Script.Add('        INTO :REFALBUM,');
    Script.Add('             :TITREALBUM,');
    Script.Add('             :TOME,');
    Script.Add('             :TOMEDEBUT,');
    Script.Add('             :TOMEFIN,');
    Script.Add('             :HORSSERIE,');
    Script.Add('             :INTEGRALE,');
    Script.Add('             :ANNEEPARUTION,');
    Script.Add('             :REFSERIE,');
    Script.Add('             :TITRESERIE,');
    Script.Add('             :METIER');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ANNEES_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    ANNEEPARUTION INTEGER,');
    Script.Add('    COUNTANNEE INTEGER)');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  for select');
    Script.Add('    -1,');
    Script.Add('    Count(REFALBUM)');
    Script.Add('  from vw_liste_albums');
    Script.Add('  where AnneeParution is null');
    Script.Add('  group by AnneeParution');
    Script.Add('  into :AnneeParution,');
    Script.Add('       :countannee');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for select');
    Script.Add('    AnneeParution,');
    Script.Add('    Count(REFALBUM)');
    Script.Add('  from vw_liste_albums');
    Script.Add('  where AnneeParution is not null');
    Script.Add('  group by AnneeParution');
    Script.Add('  into :AnneeParution,');
    Script.Add('       :countannee');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE COLLECTIONS_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    NOMCOLLECTION VARCHAR(50),');
    Script.Add('    COUNTCOLLECTION INTEGER,');
    Script.Add('    REFCOLLECTION INTEGER)');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  for select');
    Script.Add('    CAST(''-1'' AS VARCHAR(50)),');
    Script.Add('    Count(REFALBUM),');
    Script.Add('    -1');
    Script.Add('  from vw_liste_collections_albums');
    Script.Add('  where REFCOLLECTION is null');
    Script.Add('  group by uppernomcollection, nomCOLLECTION, refCOLLECTION');
    Script.Add('  into :nomCOLLECTION,');
    Script.Add('       :countCOLLECTION,');
    Script.Add('       :RefCOLLECTION');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for select');
    Script.Add('    nomCOLLECTION,');
    Script.Add('    Count(REFALBUM),');
    Script.Add('    RefCOLLECTION');
    Script.Add('  from vw_liste_collections_albums');
    Script.Add('  where REFCOLLECTION is not null');
    Script.Add('  group by uppernomcollection, nomCOLLECTION, refCOLLECTION');
    Script.Add('  into :nomCOLLECTION,');
    Script.Add('       :countCOLLECTION,');
    Script.Add('       :RefCOLLECTION');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE EDITEURS_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    COUNTEDITEUR INTEGER,');
    Script.Add('    REFEDITEUR INTEGER)');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  for select');
    Script.Add('    CAST(''-1'' AS VARCHAR(50)),');
    Script.Add('    Count(REFALBUM),');
    Script.Add('    RefEditeur');
    Script.Add('  from vw_liste_editeurs_albums');
    Script.Add('  where REFEDITEUR is null');
    Script.Add('  group by uppernomediteur, nomediteur, refediteur');
    Script.Add('  into :nomediteur,');
    Script.Add('       :countediteur,');
    Script.Add('       :RefEditeur');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for select');
    Script.Add('    nomediteur,');
    Script.Add('    Count(REFALBUM),');
    Script.Add('    RefEditeur');
    Script.Add('  from vw_liste_editeurs_albums');
    Script.Add('  where REFEDITEUR is not null');
    Script.Add('  group by uppernomediteur, nomediteur, refediteur');
    Script.Add('  into :nomediteur,');
    Script.Add('       :countediteur,');
    Script.Add('       :RefEditeur');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE GENRES_ALBUMS');
    Script.Add('RETURNS (');
    Script.Add('    GENRE VARCHAR(30),');
    Script.Add('    COUNTGENRE INTEGER,');
    Script.Add('    REFGENRE INTEGER)');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  for select');
    Script.Add('    CAST(''-1'' AS VARCHAR(30)),');
    Script.Add('    Count(REFALBUM),');
    Script.Add('    -1');
    Script.Add('  from vw_liste_genres_albums');
    Script.Add('  where REFGENRE is null');
    Script.Add('  group by uppergenre, Genre, refgenre');
    Script.Add('  into :genre,');
    Script.Add('       :countgenre,');
    Script.Add('       :refgenre');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  for select');
    Script.Add('    Genre,');
    Script.Add('    Count(REFALBUM),');
    Script.Add('    refgenre');
    Script.Add('  from vw_liste_genres_albums');
    Script.Add('  where REFGENRE is not null');
    Script.Add('  group by uppergenre, Genre, refgenre');
    Script.Add('  into :genre,');
    Script.Add('       :countgenre,');
    Script.Add('       :refgenre');
    Script.Add('  do begin');
    Script.Add('    suspend;');
    Script.Add('  end');
    Script.Add('end;');

    ExecuteScript;
  end;
end;

initialization
  RegisterFBUpdate('0.0.3.22', @MAJ0_0_3_22);

end.
