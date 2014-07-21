package org.tetram.bdtheque.data.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.tetram.bdtheque.data.bean.InitialeEntity;
import org.tetram.bdtheque.data.bean.SerieLite;
import org.tetram.bdtheque.data.bean.ValeurListe;
import org.tetram.bdtheque.data.dao.mappers.SerieMapper;

import java.util.List;
import java.util.UUID;

/**
 * Created by Thierry on 23/06/2014.
 */
@Repository
@Lazy
@Transactional

public class SerieLiteDaoImpl extends DaoROImpl<SerieLite, UUID> implements SerieLiteDao, EvaluatedEntityDao<SerieLite> {

    @Autowired
    private SerieMapper serieMapper;

    @Override
    public List<InitialeEntity<Character>> getListInitiales(String filtre) {
        return serieMapper.getInitiales(filtre);
    }

    @Override
    public List<SerieLite> getListEntitiesByInitiale(InitialeEntity<Character> initiale, String filtre) {
        return serieMapper.getSerieLiteByInitiale(initiale.getValue(), filtre);
    }

    @Override
    public void changeNotation(SerieLite entity, ValeurListe notation) {
        serieMapper.changeNotation(entity.getId(), notation);
    }
}
