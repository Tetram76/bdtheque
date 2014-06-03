package org.tetram.bdtheque.data.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.tetram.bdtheque.data.bean.Serie;
import org.tetram.bdtheque.utils.StringUtils;

import java.util.UUID;

/**
 * Created by Thierry on 30/05/2014.
 */
@Repository
@Lazy
public class SerieDao extends AbstractDao<Serie, UUID> {

    @Override
    public Serie get(UUID id) {
        if (id == null || id.equals(StringUtils.GUID_NULL))
            return new Serie();
        else
            return super.get(id);
    }

}
