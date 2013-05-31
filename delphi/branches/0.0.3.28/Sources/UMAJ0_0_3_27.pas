unit UMAJ0_0_3_27;

interface

implementation

uses JvUIB, Updates;

procedure MAJ0_0_3_27(Query: TJvUIBScript);
begin
  with Query do begin
    Script.Clear;

    Script.Add('ALTER TABLE ALBUMS ADD MOISPARUTION SMALLINT, ALTER MOISPARUTION POSITION 4;');

    Script.Add('ALTER PROCEDURE PREVISIONS_SORTIES (');
    Script.Add('    WITHACHAT SMALLINT,');
    Script.Add('    IN_REFSERIE INTEGER)');
    Script.Add('RETURNS (');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    UPPERTITRESERIE VARCHAR(150),');
    Script.Add('    TOME INTEGER,');
    Script.Add('    ANNEEPARUTION INTEGER,');
    Script.Add('    MOISPARUTION INTEGER,');
    Script.Add('    REFEDITEUR INTEGER,');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    REFCOLLECTION INTEGER,');
    Script.Add('    NOMCOLLECTION VARCHAR(50))');
    Script.Add('AS');
    Script.Add('begin');
    Script.Add('  suspend;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE CALCUL_ANNEE_SORTIE (');
    Script.Add('    WITHACHAT SMALLINT,');
    Script.Add('    IN_REFSERIE INTEGER,');
    Script.Add('    SOMMEPONDEREE INTEGER,');
    Script.Add('    COMPTEALBUM INTEGER,');
    Script.Add('    MAXTOME INTEGER,');
    Script.Add('    MAXANNEE INTEGER,');
    Script.Add('    MAXMOIS INTEGER)');
    Script.Add('RETURNS (');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    UPPERTITRESERIE VARCHAR(150),');
    Script.Add('    TOME INTEGER,');
    Script.Add('    ANNEEPARUTION INTEGER,');
    Script.Add('    MOISPARUTION INTEGER,');
    Script.Add('    REFEDITEUR INTEGER,');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    REFCOLLECTION INTEGER,');
    Script.Add('    NOMCOLLECTION VARCHAR(50))');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE MAXTOME2 INTEGER;');
    Script.Add('begin');
    Script.Add('  tome = maxtome + 1;');
    Script.Add('');
    Script.Add('  select max(tomefin) + 1 from albums');
    Script.Add('  where horsserie = 0 and integrale = 1 and refserie = :in_refserie and (:withachat = 1 or achat = 0)');
    Script.Add('  into');
    Script.Add('    :MAXTOME2;');
    Script.Add('');
    Script.Add('  if (maxtome2 > tome) then tome = maxtome2;');
    Script.Add('');
    Script.Add('  select s.RefSerie, s.TitreSerie, s.UpperTitreSerie, e.RefEditeur, e.NomEditeur, c.RefCollection, c.NomCollection from');
    Script.Add('    series s left join editeurs e on e.refediteur = s.refediteur');
    Script.Add('             left join collections c on c.refcollection = s.refcollection');
    Script.Add('  where s.RefSerie = :in_refserie');
    Script.Add('  into');
    Script.Add('    :REFSERIE,');
    Script.Add('    :TITRESERIE,');
    Script.Add('    :UPPERTITRESERIE,');
    Script.Add('    :REFEDITEUR,');
    Script.Add('    :NOMEDITEUR,');
    Script.Add('    :REFCOLLECTION,');
    Script.Add('    :NOMCOLLECTION;');
    Script.Add('');
    Script.Add('  if (maxmois is null) then begin');
    Script.Add('    ANNEEPARUTION = maxannee + ((tome - maxtome) * ((sommeponderee / 12) / comptealbum));');
    Script.Add('    MOISPARUTION = null;');
    Script.Add('  end else begin');
    Script.Add('    MOISPARUTION = maxmois + ((tome - maxtome) * (sommeponderee / comptealbum));');
    Script.Add('    ANNEEPARUTION = maxannee;');
    Script.Add('    while (MOISPARUTION > 12) do begin');
    Script.Add('      MOISPARUTION = MOISPARUTION - 12;');
    Script.Add('      ANNEEPARUTION = ANNEEPARUTION + 1;');
    Script.Add('    end');
    Script.Add('  end');
    Script.Add('  suspend;');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE PREVISIONS_SORTIES (');
    Script.Add('    WITHACHAT SMALLINT,');
    Script.Add('    IN_REFSERIE INTEGER)');
    Script.Add('RETURNS (');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    UPPERTITRESERIE VARCHAR(150),');
    Script.Add('    TOME INTEGER,');
    Script.Add('    ANNEEPARUTION INTEGER,');
    Script.Add('    MOISPARUTION INTEGER,');
    Script.Add('    REFEDITEUR INTEGER,');
    Script.Add('    NOMEDITEUR VARCHAR(50),');
    Script.Add('    REFCOLLECTION INTEGER,');
    Script.Add('    NOMCOLLECTION VARCHAR(50))');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE CURRENTREFSERIE INTEGER;');
    Script.Add('DECLARE VARIABLE OLDREFSERIE INTEGER;');
    Script.Add('DECLARE VARIABLE CURRENTTOME INTEGER;');
    Script.Add('DECLARE VARIABLE SOMMEPONDEREE INTEGER;');
    Script.Add('DECLARE VARIABLE COMPTEALBUM INTEGER;');
    Script.Add('DECLARE VARIABLE CURRENTANNEE INTEGER;');
    Script.Add('DECLARE VARIABLE CURRENTMOIS INTEGER;');
    Script.Add('DECLARE VARIABLE TOMEPRECEDENT INTEGER;');
    Script.Add('DECLARE VARIABLE ANNEEPRECEDENTE INTEGER;');
    Script.Add('DECLARE VARIABLE MOISPRECEDENT INTEGER;');
    Script.Add('begin');
    Script.Add('  if (withachat is Null) then withachat = 1;');
    Script.Add('  oldrefserie = -1;');
    Script.Add('  tomeprecedent = -1;');
    Script.Add('  anneeprecedente = -1;');
    Script.Add('  moisprecedent = null;');
    Script.Add('  for select TOME, ANNEEPARUTION, MOISPARUTION, s.RefSerie');
    Script.Add('      from albums a inner join series s on s.refserie = a.refserie');
    Script.Add('      where (s.terminee is null or s.terminee <> 1)');
    Script.Add('            and a.horsserie = 0 and a.integrale = 0 and a.anneeparution is not null');
    Script.Add('            and (:in_refserie is null or s.refserie = :in_refserie)');
    Script.Add('            and (:withachat = 1 or achat = 0)');
    Script.Add('      order by s.refserie, TOME');
    Script.Add('      into :CURRENTTOME, :CURRENTANNEE, :CURRENTMOIS, :CURRENTREFSERIE');
    Script.Add('  do begin');
    Script.Add('    if (currentrefserie <> oldrefserie) then begin');
    Script.Add('');
    Script.Add('      if (oldrefserie <> -1 and comptealbum > 0) then begin');
    Script.Add('        select REFSERIE, TITRESERIE, UPPERTITRESERIE,');
    Script.Add('               TOME, ANNEEPARUTION, MOISPARUTION,');
    Script.Add('               REFEDITEUR, NOMEDITEUR,');
    Script.Add('               REFCOLLECTION, NOMCOLLECTION');
    Script.Add('        from CALCUL_ANNEE_SORTIE(:withachat, :oldrefserie, :sommeponderee, :comptealbum, :tomeprecedent, :anneeprecedente, :moisprecedent)');
    Script.Add('        into :REFSERIE, :TITRESERIE, :UPPERTITRESERIE,');
    Script.Add('             :TOME, :ANNEEPARUTION, :MOISPARUTION,');
    Script.Add('             :REFEDITEUR, :NOMEDITEUR,');
    Script.Add('             :REFCOLLECTION, :NOMCOLLECTION;');
    Script.Add('        suspend;');
    Script.Add('      end');
    Script.Add('');
    Script.Add('      oldrefserie = currentrefserie;');
    Script.Add('      sommeponderee = 0;');
    Script.Add('      comptealbum = 0;');
    Script.Add('      tomeprecedent = -1;');
    Script.Add('      anneeprecedente = -1;');
    Script.Add('      moisprecedent = -1;');
    Script.Add('    end');
    Script.Add('    if (tomeprecedent <> -1) then begin');
    Script.Add('      /* non pond�r�: sommeponderee = sommeponderee + (((CURRENTANNEE - ANNEEPRECEDENTE) * 12 + (COALESCE(CURRENTMOIS, 1) - COALESCE(MOISPRECEDENT, 1))) / (CURRENTTOME - TOMEPRECEDENT)); */');
    Script.Add('      sommeponderee = sommeponderee + (((CURRENTANNEE - ANNEEPRECEDENTE) * 12 + (COALESCE(CURRENTMOIS, 1) - COALESCE(MOISPRECEDENT, 1))) / (CURRENTTOME - TOMEPRECEDENT)) * CURRENTTOME;');
    Script.Add('      /* non pond�r�: comptealbum = comptealbum + 1;*/');
    Script.Add('      comptealbum = comptealbum + CURRENTTOME;');
    Script.Add('    end');
    Script.Add('    tomeprecedent = CURRENTTOME;');
    Script.Add('    anneeprecedente = CURRENTANNEE;');
    Script.Add('    moisprecedent = CURRENTMOIS;');
    Script.Add('  end');
    Script.Add('');
    Script.Add('  if (oldrefserie <> -1 and comptealbum > 0) then begin');
    Script.Add('    select REFSERIE, TITRESERIE, UPPERTITRESERIE,');
    Script.Add('           TOME, ANNEEPARUTION, MOISPARUTION,');
    Script.Add('           REFEDITEUR, NOMEDITEUR,');
    Script.Add('           REFCOLLECTION, NOMCOLLECTION');
    Script.Add('    from CALCUL_ANNEE_SORTIE(:withachat, :oldrefserie, :sommeponderee, :comptealbum, :tomeprecedent, :anneeprecedente, :moisprecedent)');
    Script.Add('    into :REFSERIE, :TITRESERIE, :UPPERTITRESERIE,');
    Script.Add('         :TOME, :ANNEEPARUTION, :MOISPARUTION,');
    Script.Add('         :REFEDITEUR, :NOMEDITEUR,');
    Script.Add('         :REFCOLLECTION, :NOMCOLLECTION;');
    Script.Add('    suspend;');
    Script.Add('  end');
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
    Script.Add('    MOISPARUTION,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    UPPERTITRESERIE,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.MOISPARUTION,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       s.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       s.UPPERTITRESERIE,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM ALBUMS a INNER JOIN SERIES s ON s.refserie = a.refserie;');

    Script.Add('CREATE VIEW VW_LISTE_COLLECTIONS_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    MOISPARUTION,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFCOLLECTION,');
    Script.Add('    NOMCOLLECTION,');
    Script.Add('    UPPERNOMCOLLECTION,');
    Script.Add('    UPPERTITRESERIE,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.MOISPARUTION,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       c.REFCOLLECTION,');
    Script.Add('       c.NOMCOLLECTION,');
    Script.Add('       c.UPPERNOMCOLLECTION,');
    Script.Add('       a.UPPERTITRESERIE,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN EDITIONS e ON e.refalbum = a.refalbum');
    Script.Add('                       LEFT JOIN COLLECTIONS c ON e.refcollection = c.refcollection;');

    Script.Add('CREATE VIEW VW_LISTE_EDITEURS_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    MOISPARUTION,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFEDITEUR,');
    Script.Add('    NOMEDITEUR,');
    Script.Add('    UPPERNOMEDITEUR,');
    Script.Add('    UPPERTITRESERIE,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.MOISPARUTION,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       e.REFEDITEUR,');
    Script.Add('       e.NOMEDITEUR,');
    Script.Add('       e.UPPERNOMEDITEUR,');
    Script.Add('       a.UPPERTITRESERIE,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN EDITIONS ed ON ed.refalbum = a.refalbum');
    Script.Add('                       LEFT JOIN EDITEURS e ON e.refediteur = ed.refediteur;');

    Script.Add('CREATE VIEW VW_LISTE_GENRES_ALBUMS(');
    Script.Add('    REFALBUM,');
    Script.Add('    TITREALBUM,');
    Script.Add('    TOME,');
    Script.Add('    TOMEDEBUT,');
    Script.Add('    TOMEFIN,');
    Script.Add('    HORSSERIE,');
    Script.Add('    INTEGRALE,');
    Script.Add('    MOISPARUTION,');
    Script.Add('    ANNEEPARUTION,');
    Script.Add('    REFSERIE,');
    Script.Add('    TITRESERIE,');
    Script.Add('    UPPERTITREALBUM,');
    Script.Add('    REFGENRE,');
    Script.Add('    GENRE,');
    Script.Add('    UPPERGENRE,');
    Script.Add('    UPPERTITRESERIE,');
    Script.Add('    ACHAT,');
    Script.Add('    COMPLET)');
    Script.Add('AS');
    Script.Add('select a.REFALBUM,');
    Script.Add('       a.TITREALBUM,');
    Script.Add('       a.TOME,');
    Script.Add('       a.TOMEDEBUT,');
    Script.Add('       a.TOMEFIN,');
    Script.Add('       a.HORSSERIE,');
    Script.Add('       a.INTEGRALE,');
    Script.Add('       a.MOISPARUTION,');
    Script.Add('       a.ANNEEPARUTION,');
    Script.Add('       a.REFSERIE,');
    Script.Add('       a.TITRESERIE,');
    Script.Add('       a.UPPERTITREALBUM,');
    Script.Add('       g.REFGENRE,');
    Script.Add('       g.GENRE,');
    Script.Add('       g.UPPERGENRE,');
    Script.Add('       a.UPPERTITRESERIE,');
    Script.Add('       a.ACHAT,');
    Script.Add('       a.COMPLET');
    Script.Add('FROM VW_LISTE_ALBUMS a LEFT JOIN GENRESERIES gs ON gs.refserie = a.refserie');
    Script.Add('                       LEFT JOIN GENRES g ON gs.refgenre = g.refgenre;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_ANNEE (');
    Script.Add('    ANNEE INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  if (:Annee = -1) then sWhere = ''ANNEEPARUTION is null '';');
    Script.Add('                   else sWhere = ''ANNEEPARUTION = '' || :ANNEE || '' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('      ''SELECT REFALBUM,');
    Script.Add('             TITREALBUM,');
    Script.Add('             TOME,');
    Script.Add('             TOMEDEBUT,');
    Script.Add('             TOMEFIN,');
    Script.Add('             HORSSERIE,');
    Script.Add('             INTEGRALE,');
    Script.Add('             MOISPARUTION,');
    Script.Add('             ANNEEPARUTION,');
    Script.Add('             REFSERIE,');
    Script.Add('             TITRESERIE,');
    Script.Add('             ACHAT,');
    Script.Add('             COMPLET');
    Script.Add('        FROM vw_liste_albums');
    Script.Add('        WHERE '' || :sWHERE ||');
    Script.Add('        ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
    Script.Add('        INTO :REFALBUM,');
    Script.Add('             :TITREALBUM,');
    Script.Add('             :TOME,');
    Script.Add('             :TOMEDEBUT,');
    Script.Add('             :TOMEFIN,');
    Script.Add('             :HORSSERIE,');
    Script.Add('             :INTEGRALE,');
    Script.Add('             :MOISPARUTION,');
    Script.Add('             :ANNEEPARUTION,');
    Script.Add('             :REFSERIE,');
    Script.Add('             :TITRESERIE,');
    Script.Add('             :ACHAT,');
    Script.Add('             :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER procedure ALBUMS_BY_AUTEUR (');
    Script.Add('    REFAUTEUR INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    METIER SMALLINT,');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('     ''SELECT A.REFALBUM,');
    Script.Add('             A.TITREALBUM,');
    Script.Add('             A.TOME,');
    Script.Add('             A.TOMEDEBUT,');
    Script.Add('             A.TOMEFIN,');
    Script.Add('             A.HORSSERIE,');
    Script.Add('             A.INTEGRALE,');
    Script.Add('             A.MOISPARUTION,');
    Script.Add('             A.ANNEEPARUTION,');
    Script.Add('             A.REFSERIE,');
    Script.Add('             A.TITRESERIE,');
    Script.Add('             AU.metier,');
    Script.Add('             A.ACHAT,');
    Script.Add('             A.COMPLET');
    Script.Add('      FROM vw_liste_albums A INNER JOIN auteurs au on a.refalbum = au.refalbum');
    Script.Add('      WHERE au.refpersonne = '''''' || :RefAuteur || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST, UPPERTITREALBUM, METIER''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :MOISPARUTION,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :METIER,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER procedure ALBUMS_BY_COLLECTION (');
    Script.Add('    REFCOLLECTION INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  if (:refCOLLECTION = -1) then sWhere = ''e.refCOLLECTION is null '';');
    Script.Add('                           else sWhere = ''e.refCOLLECTION = '' || :refCOLLECTION || '' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('      ''SELECT a.REFALBUM,');
    Script.Add('             a.TITREALBUM,');
    Script.Add('             a.TOME,');
    Script.Add('             a.TOMEDEBUT,');
    Script.Add('             a.TOMEFIN,');
    Script.Add('             a.HORSSERIE,');
    Script.Add('             a.INTEGRALE,');
    Script.Add('             a.MOISPARUTION,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE,');
    Script.Add('             a.ACHAT,');
    Script.Add('             a.COMPLET');
    Script.Add('      from albums a left join editions e on a.refalbum = e.refalbum');
    Script.Add('                    left join series s on a.refserie = s.refserie');
    Script.Add('      WHERE '' || :sWHERE ||');
    Script.Add('     ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :MOISPARUTION,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
    Script.Add('end;');

    Script.Add('ALTER procedure ALBUMS_BY_EDITEUR (');
    Script.Add('    REFEDITEUR INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
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
    Script.Add('             a.MOISPARUTION,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE,');
    Script.Add('             a.ACHAT,');
    Script.Add('             a.COMPLET');
    Script.Add('      from albums a LEFT join editions e on a.refalbum = e.refalbum');
    Script.Add('                    LEFT join series s on a.refserie = s.refserie');
    Script.Add('      WHERE coalesce(e.refediteur, -1) = '''''' || :refediteur || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :MOISPARUTION,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_GENRE (');
    Script.Add('    REFGENRE INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(200);');
    Script.Add('BEGIN');
    Script.Add('  if (:RefGenre = -1) then sWhere = ''RefGenre is null '';');
    Script.Add('                      else sWhere = ''refgenre = '' || :refgenre || '' '';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = swhere || ''and '' || filtre || '' '';');
    Script.Add('  for execute statement');
    Script.Add('      ''SELECT REFALBUM,');
    Script.Add('             TITREALBUM,');
    Script.Add('             TOME,');
    Script.Add('             TOMEDEBUT,');
    Script.Add('             TOMEFIN,');
    Script.Add('             HORSSERIE,');
    Script.Add('             INTEGRALE,');
    Script.Add('             MOISPARUTION,');
    Script.Add('             ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             TITRESERIE,');
    Script.Add('             ACHAT,');
    Script.Add('             COMPLET');
    Script.Add('       FROM VW_LISTE_ALBUMS a LEFT JOIN GENRESERIES gs ON gs.refserie = a.refserie');
    Script.Add('                              LEFT JOIN GENRES g ON gs.refgenre = g.refgenre');
    Script.Add('       WHERE '' || :sWHERE ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
    Script.Add('       INTO :REFALBUM,');
    Script.Add('            :TITREALBUM,');
    Script.Add('            :TOME,');
    Script.Add('            :TOMEDEBUT,');
    Script.Add('            :TOMEFIN,');
    Script.Add('            :HORSSERIE,');
    Script.Add('            :INTEGRALE,');
    Script.Add('            :MOISPARUTION,');
    Script.Add('            :ANNEEPARUTION,');
    Script.Add('            :REFSERIE,');
    Script.Add('            :TITRESERIE,');
    Script.Add('            :ACHAT,');
    Script.Add('            :COMPLET');
    Script.Add('      DO');
    Script.Add('      BEGIN');
    Script.Add('        SUSPEND;');
    Script.Add('      END');
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
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
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
    Script.Add('             a.MOISPARUTION,');
    Script.Add('             a.ANNEEPARUTION,');
    Script.Add('             a.REFSERIE,');
    Script.Add('             s.TITRESERIE,');
    Script.Add('             a.ACHAT,');
    Script.Add('             a.COMPLET');
    Script.Add('      FROM ALBUMS a INNER JOIN SERIES s ON s.refserie = a.refserie');
    Script.Add('      WHERE a.initialetitrealbum = '''''' || :INITIALE || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY UPPERTITREALBUM, UPPERTITRESERIE, HORSSERIE NULLS FIRST, INTEGRALE NULLS FIRST, TOME NULLS FIRST, TOMEDEBUT NULLS FIRST, TOMEFIN NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :MOISPARUTION,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('end;');

    Script.Add('ALTER PROCEDURE ALBUMS_BY_SERIE (');
    Script.Add('    SERIE INTEGER,');
    Script.Add('    FILTRE VARCHAR(125))');
    Script.Add('RETURNS (');
    Script.Add('    REFALBUM INTEGER,');
    Script.Add('    TITREALBUM VARCHAR(150),');
    Script.Add('    TOME SMALLINT,');
    Script.Add('    TOMEDEBUT SMALLINT,');
    Script.Add('    TOMEFIN SMALLINT,');
    Script.Add('    HORSSERIE SMALLINT,');
    Script.Add('    INTEGRALE SMALLINT,');
    Script.Add('    MOISPARUTION SMALLINT,');
    Script.Add('    ANNEEPARUTION SMALLINT,');
    Script.Add('    REFSERIE INTEGER,');
    Script.Add('    TITRESERIE VARCHAR(150),');
    Script.Add('    ACHAT SMALLINT,');
    Script.Add('    COMPLET INTEGER)');
    Script.Add('AS');
    Script.Add('DECLARE VARIABLE SWHERE VARCHAR(130);');
    Script.Add('BEGIN');
    Script.Add('  swhere = '''';');
    Script.Add('  if (filtre is not null and filtre <> '''') then swhere = ''and '' || filtre || '' '';');
    Script.Add('  FOR execute statement');
    Script.Add('      ''SELECT REFALBUM,');
    Script.Add('             TITREALBUM,');
    Script.Add('             TOME,');
    Script.Add('             TOMEDEBUT,');
    Script.Add('             TOMEFIN,');
    Script.Add('             HORSSERIE,');
    Script.Add('             INTEGRALE,');
    Script.Add('             MOISPARUTION,');
    Script.Add('             ANNEEPARUTION,');
    Script.Add('             REFSERIE,');
    Script.Add('             TITRESERIE,');
    Script.Add('             ACHAT,');
    Script.Add('             COMPLET');
    Script.Add('      FROM vw_liste_albums');
    Script.Add('      WHERE refserie = '''''' || :serie || '''''' '' || swhere ||');
    Script.Add('      ''ORDER BY HORSSERIE NULLS FIRST, INTEGRALE NULLS First, TOME NULLS FIRST, ANNEEPARUTION NULLS FIRST, MOISPARUTION NULLS FIRST, UPPERTITREALBUM''');
    Script.Add('      INTO :REFALBUM,');
    Script.Add('           :TITREALBUM,');
    Script.Add('           :TOME,');
    Script.Add('           :TOMEDEBUT,');
    Script.Add('           :TOMEFIN,');
    Script.Add('           :HORSSERIE,');
    Script.Add('           :INTEGRALE,');
    Script.Add('           :MOISPARUTION,');
    Script.Add('           :ANNEEPARUTION,');
    Script.Add('           :REFSERIE,');
    Script.Add('           :TITRESERIE,');
    Script.Add('           :ACHAT,');
    Script.Add('           :COMPLET');
    Script.Add('  DO');
    Script.Add('  BEGIN');
    Script.Add('    SUSPEND;');
    Script.Add('  END');
    Script.Add('end;');

    ExecuteScript;
  end;
end;

initialization
  RegisterUpdate('0.0.3.27', @MAJ0_0_3_27);

end.
