package org.tetram.bdtheque.gui;

import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Labeled;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import org.jetbrains.annotations.NotNull;

import java.awt.*;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;

/**
 * Created by Thierry on 08/07/2014.
 */
public class EntityWebHyperlink extends Hyperlink {

    public EntityWebHyperlink(@NotNull URL url) {
        super();
        setText(null);
        final Image image = new Image(getClass().getResourceAsStream("/org/tetram/bdtheque/graphics/png/16x16/network.png"));
        setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
        setGraphic(new ImageView(image));
        setOnAction(event -> {
            try {
                Desktop.getDesktop().browse(url.toURI());
            } catch (IOException | URISyntaxException e) {
                e.printStackTrace();
            }
        });
    }


    public static void addToLabeled(Labeled node, URL url, ContentDisplay contentDisplay) {
        if (url == null)
            node.setGraphic(null);
        else
            node.setGraphic(new EntityWebHyperlink(url));
        node.setContentDisplay(contentDisplay);
    }

    public static void addToLabeled(Labeled node, URL url) {
        addToLabeled(node, url, ContentDisplay.RIGHT);
    }

}
