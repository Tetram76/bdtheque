package org.tetram.bdtheque.data.dao.mappers;

import org.apache.ibatis.annotations.Param;
import org.tetram.bdtheque.data.bean.*;
import org.tetram.bdtheque.gui.utils.InitialeEntity;
import org.tetram.bdtheque.utils.FileLink;

import java.util.List;
import java.util.UUID;

/**
 * Created by Thierry on 30/05/2014.
 */
@FileLink("/org/tetram/bdtheque/data/dao/mappers/Auteur.xml")
public interface AuteurMapper extends BaseMapperInterface {
    PersonneLite getPersonneLiteById(UUID id);

    List<AuteurAlbumLite> getListAuteurLiteByAlbumId(UUID id);

    List<AuteurSerieLite> getListAuteurLiteBySerieId(UUID id);

    List<AuteurParaBDLite> getListAuteurLiteByParaBDId(UUID id);

    Personne getPersonneById(UUID id);

    int cleanAuteursAlbum(@Param("id") UUID idAlbum);

    int addAuteurAlbum(@Param("idAlbum") UUID idAlbum, @Param("auteur") AuteurAlbumLite auteur);

    int cleanAuteursSerie(@Param("id") UUID idSerie);

    int addAuteurSerie(@Param("idSerie") UUID idSerie, @Param("auteur") AuteurSerieLite auteur);

    int cleanAuteursParaBD(@Param("id") UUID idParaBD);

    int addAuteurParaBD(@Param("idParaBD") UUID idParaBD, @Param("auteur") AuteurParaBDLite auteur);

    List<InitialeEntity<Character>> getInitiales(@Param("filtre") String filtre);

    List<PersonneLite> getPersonneLiteByInitiale(@Param("initiale") Character initiale, @Param("filtre") String filtre);
}