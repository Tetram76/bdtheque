package org.tetram.bdtheque.data.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.tetram.bdtheque.data.bean.AlbumLite;
import org.tetram.bdtheque.data.bean.InitialeEntity;
import org.tetram.bdtheque.data.bean.InitialeWithEntity;
import org.tetram.bdtheque.data.bean.ValeurListe;
import org.tetram.bdtheque.data.dao.mappers.AlbumMapper;

import java.util.List;
import java.util.UUID;

/**
 * Created by Thierry on 23/06/2014.
 */
@Repository
@Lazy
@Transactional

public class AlbumLiteDaoImpl extends DaoROImpl<AlbumLite, UUID> implements AlbumLiteDao, EvaluatedEntityDao<AlbumLite> {

    @Autowired
    private AlbumMapper albumMapper;

    @Override
    public List<InitialeEntity<Character>> getListInitiales(String filtre) {
        return albumMapper.getInitiales(filtre);
    }

    @Override
    public List<AlbumLite> getListEntitiesByInitiale(InitialeEntity<Character> initiale, String filtre) {
        return albumMapper.getAlbumLiteByInitiale(initiale.getValue(), filtre);
    }

    @Override
    public List<InitialeWithEntity<Character, AlbumLite>> searchList(@Param("value") String value, @Param("filtre") String filtre) {
        // TODO
        return null;
    }

    @Override
    public void changeNotation(AlbumLite entity, ValeurListe notation) {
        albumMapper.changeNotation(entity.getId(), notation);
    }
}
