package org.tetram.bdtheque.data.dao;

import org.tetram.bdtheque.data.bean.CollectionLite;

import java.util.UUID;

/**
 * Created by Thierry on 17/07/2014.
 */
public interface CollectionLiteDao extends DaoRO<CollectionLite, UUID>, RepertoireLiteDao<CollectionLite, Character> {
}