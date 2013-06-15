package org.tetram.bdtheque.data.factories;

import android.content.Context;
import android.database.Cursor;
import org.tetram.bdtheque.data.bean.AuteurLiteBean;
import org.tetram.bdtheque.database.DDLConstants;

import static org.tetram.bdtheque.data.utils.DaoUtils.getFieldString;
import static org.tetram.bdtheque.data.utils.DaoUtils.getFieldUUID;

public class AuteurLiteFactory implements BeanFactory<AuteurLiteBean> {

    @Override
    public AuteurLiteBean loadFromCursor(Context context, Cursor cursor, boolean mustExists) {
        AuteurLiteBean a = new AuteurLiteBean();
        a.setId(getFieldUUID(cursor, DDLConstants.AUTEURS_ID));
        if (mustExists && a.getId() == null) return null;
        a.setNom(getFieldString(cursor, DDLConstants.AUTEURS_NOM));
        return a;
    }

}
