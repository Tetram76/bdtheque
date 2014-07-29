/*
 * Copyright (c) 2014, tetram.org. All Rights Reserved.
 * AlbumLiteDao.java
 * Last modified by Tetram, on 2014-07-29T11:09:14CEST
 */

package org.tetram.bdtheque.data.dao;

import org.tetram.bdtheque.data.bean.AlbumLite;

import java.util.UUID;

/**
 * Created by Thierry on 23/06/2014.
 */
public interface AlbumLiteDao extends DaoRO<AlbumLite, UUID>, RepertoireLiteDao<AlbumLite, Character> {

}
