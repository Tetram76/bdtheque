package org.tetram.bdtheque.data.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.tetram.bdtheque.data.bean.CollectionLite;
import org.tetram.bdtheque.data.bean.InitialeEntity;

import java.util.List;
import java.util.UUID;

/**
 * Created by Thierry on 17/07/2014.
 */
@Repository
@Lazy
@Transactional

public class CollectionLiteDaoImpl extends DaoROImpl<CollectionLite, UUID> implements CollectionLiteDao {

    @Override
    public List<InitialeEntity<Character>> getListInitiales(String filtre) {
        // TODO
        return null;
    }

    @Override
    public List<CollectionLite> getListEntitiesByInitiale(InitialeEntity<Character> initiale, String filtre) {
        // TODO
        return null;
    }
}