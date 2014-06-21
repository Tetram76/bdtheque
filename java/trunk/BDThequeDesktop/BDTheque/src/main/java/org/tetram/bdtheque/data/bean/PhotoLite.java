package org.tetram.bdtheque.data.bean;

import org.tetram.bdtheque.SpringContext;
import org.tetram.bdtheque.data.dao.ValeurListeDao;

/**
 * Created by Thierry on 24/05/2014.
 */
public class PhotoLite extends ImageLite {

    public PhotoLite() {
        ValeurListeDao valeurListeDao = SpringContext.getInstance().getContext().getBean(ValeurListeDao.class);
        setCategorie(valeurListeDao.getDefaultTypePhoto());
    }

}
