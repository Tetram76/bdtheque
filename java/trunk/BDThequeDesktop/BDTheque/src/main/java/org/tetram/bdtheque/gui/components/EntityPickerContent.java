/*
 * Copyright (c) 2014, tetram.org. All Rights Reserved.
 * EntityPickerContent.java
 * Last modified by Tetram, on 2014-09-03T16:40:59CEST
 */

package org.tetram.bdtheque.gui.components;

import javafx.beans.property.StringProperty;
import javafx.scene.Node;
import javafx.scene.layout.Region;
import org.tetram.bdtheque.data.bean.abstractentities.AbstractDBEntity;
import org.tetram.bdtheque.gui.controllers.includes.TreeViewController;
import org.tetram.bdtheque.spring.SpringFxmlLoader;
import org.tetram.bdtheque.utils.ClassLink;
import org.tetram.bdtheque.utils.ClassLinks;

/**
 * Created by Thierry on 10/08/2014.
 */
@ClassLinks({
        @ClassLink(com.sun.javafx.scene.control.skin.ColorPalette.class),
        @ClassLink(com.sun.javafx.scene.control.skin.DatePickerContent.class)
})
public class EntityPickerContent extends Region {

    private final TreeViewController treeviewController;

    public EntityPickerContent(EntityPicker entityPicker) {
        treeviewController = SpringFxmlLoader.load("components/treeview.fxml");
        treeviewController.setClickToShow(false);
        treeviewController.setOnClickItem(event -> {
            if (event.getClickCount() == 2) {
                event.consume();
                entityPicker.setValue((AbstractDBEntity) treeviewController.getSelectedEntity());
                entityPicker.hide();
            }
        });

        treeviewController.filtreProperty().bindBidirectional(entityPicker.filtreProperty());
        treeviewController.modeProperty().bindBidirectional(entityPicker.modeProperty());

        treeviewController.getTreeView().minWidthProperty().bind(this.minWidthProperty());
        treeviewController.getTreeView().prefWidthProperty().bind(this.prefWidthProperty());
        treeviewController.getTreeView().maxWidthProperty().bind(this.maxWidthProperty());
        treeviewController.getTreeView().minHeightProperty().bind(this.minHeightProperty());
        treeviewController.getTreeView().prefHeightProperty().bind(this.prefHeightProperty());
        treeviewController.getTreeView().maxHeightProperty().bind(this.maxHeightProperty());

        treeviewController.registerSearchableField(entityPicker.getEditor());

        getChildren().add(treeviewController.getView());
    }

    public Node getView() {
        return treeviewController.getView();
    }

    public String getFiltre() {
        return treeviewController.getFiltre();
    }

    public void setFiltre(String filtre) {
        treeviewController.setFiltre(filtre);
    }

    public StringProperty filtreProperty() {
        return treeviewController.filtreProperty();
    }
}
