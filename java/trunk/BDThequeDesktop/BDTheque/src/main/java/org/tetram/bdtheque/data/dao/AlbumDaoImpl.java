package org.tetram.bdtheque.data.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.tetram.bdtheque.data.bean.Album;

import java.util.UUID;

/**
 * Created by Thierry on 03/06/2014.
 */
@Repository
@Lazy
@Transactional
public class AlbumDaoImpl extends DaoImpl<Album, UUID> implements AlbumDao {
}
