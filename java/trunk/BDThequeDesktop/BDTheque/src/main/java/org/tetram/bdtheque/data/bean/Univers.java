package org.tetram.bdtheque.data.bean;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import org.tetram.bdtheque.data.BeanUtils;
import org.tetram.bdtheque.data.bean.abstractentities.BaseUnivers;

import java.util.UUID;

/**
 * Created by Thierry on 24/05/2014.
 */
@SuppressWarnings("UnusedDeclaration")
public class Univers extends BaseUnivers {

    private final StringProperty description = new SimpleStringProperty(null);
    private final ObjectProperty<UniversLite> universParent = new SimpleObjectProperty<>(null);

    public String getDescription() {
        return BeanUtils.trimOrNull(description.get());
    }

    public void setDescription(String description) {
        this.description.set(BeanUtils.trimOrNull(description));
    }

    public StringProperty descriptionProperty() {
        return description;
    }

    public UniversLite getUniversParent() {
        return universParent.get();
    }

    public void setUniversParent(UniversLite universParent) {
        this.universParent.set(universParent);
    }

    public ObjectProperty<UniversLite> universParentProperty() {
        return universParent;
    }

    public UUID getIdUniversParent() {
        return getUniversParent() == null ? null : getUniversParent().getId();
    }

}
