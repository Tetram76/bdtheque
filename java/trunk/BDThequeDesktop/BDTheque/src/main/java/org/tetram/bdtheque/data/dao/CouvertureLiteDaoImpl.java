package org.tetram.bdtheque.data.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.tetram.bdtheque.data.bean.CouvertureLite;

import java.util.UUID;

/**
 * Created by Thierry on 13/06/2014.
 */
@Repository
@Lazy
@Transactional
@SuppressWarnings("UnusedDeclaration")
public class CouvertureLiteDaoImpl extends ImageLiteDaoImpl<CouvertureLite, UUID> implements CouvertureLiteDao {

    public CouvertureLiteDaoImpl() {
        super(
                "couvertures",
                "id_couverture",
                "id_edition",
                "fichiercouverture",
                "stockagecouverture",
                "imagecouverture"
        );
    }

}