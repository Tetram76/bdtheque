package org.tetram.bdtheque.gui.controllers;

import javafx.application.Platform;
import javafx.beans.binding.Bindings;
import javafx.beans.property.*;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableNumberValue;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.stage.DirectoryChooser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.tetram.bdtheque.data.dao.mappers.FileLink;
import org.tetram.bdtheque.data.services.FormatTitreAlbum;
import org.tetram.bdtheque.data.services.UserPreferences;
import org.tetram.bdtheque.gui.utils.FileStringConverter;
import org.tetram.bdtheque.utils.FileUtils;

import java.io.File;
import java.util.HashMap;

/**
 * Created by Thierry on 24/06/2014.
 */
@Controller
@FileLink("/org/tetram/bdtheque/gui/preferences.fxml")
public class PreferencesController extends DialogController {

    @Autowired
    private UserPreferences userPreferences;
    @FXML
    private Button btnOk;
    @FXML
    private Button btnCancel;
    @FXML
    private ToggleButton btnOptionsDiverses;
    @FXML
    private ToggleButton btnSiteWeb;
    @FXML
    private ToggleButton btnMonnaies;
    @FXML
    private ScrollPane tabOptionsDiverses;
    @FXML
    private ChoiceBox<FormatTitreAlbum> formatTitreAlbum;
    @FXML
    private CheckBox afficheNotesListes;
    @FXML
    private CheckBox serieObligatoireAlbums;
    @FXML
    private CheckBox serieObligatoireParaBD;
    @FXML
    private CheckBox antiAliasing;
    @FXML
    private CheckBox imagesStockees;
    @FXML
    private Label repImages;
    @FXML
    private BorderPane content;
    @FXML
    private ToggleGroup btnTabGroup;
    private ObjectProperty<File> repImagesProperty;

    @FXML
    void initialize() {
        attachClickListener(btnOk, okBtnClickListener);
        attachClickListener(btnCancel, cancelBtnClickListener);

        HashMap<ToggleButton, Node> buttonNodeHashMap = new HashMap<>();
        buttonNodeHashMap.put(btnOptionsDiverses, tabOptionsDiverses);
        buttonNodeHashMap.put(btnMonnaies, null);
        buttonNodeHashMap.put(btnSiteWeb, null);

        ObservableNumberValue tabWidth = null;
        for (ToggleButton toggleButton : buttonNodeHashMap.keySet())
            tabWidth = tabWidth == null ? toggleButton.widthProperty() : Bindings.max(toggleButton.widthProperty(), tabWidth);

        for (ToggleButton toggleButton : buttonNodeHashMap.keySet()) {
            toggleButton.minWidthProperty().bind(tabWidth);
            toggleButton.setUserData(buttonNodeHashMap.get(toggleButton));
            toggleButton.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    content.setCenter(buttonNodeHashMap.get(toggleButton));
                }
            });
        }

        btnTabGroup.selectedToggleProperty().addListener(new ChangeListener<Toggle>() {
            @Override
            public void changed(ObservableValue<? extends Toggle> observable, Toggle oldButton, Toggle newButton) {
                if (newButton == null)
                    oldButton.setSelected(true);
            }
        });

        // on ne peut pas utiliser le bind des propriétés: ça pourrait avoir une influence directe (et non contrôlée) sur l'appli

        formatTitreAlbum.getItems().addAll(FormatTitreAlbum.values());
        formatTitreAlbum.setValue(userPreferences.getFormatTitreAlbum());

        serieObligatoireAlbums.setSelected(userPreferences.isSerieObligatoireAlbums());
        serieObligatoireParaBD.setSelected(userPreferences.isSerieObligatoireParaBD());
        antiAliasing.setSelected(userPreferences.isAntiAliasing());
        imagesStockees.setSelected(userPreferences.isImagesStockees());
        afficheNotesListes.setSelected(userPreferences.isAfficheNoteListes());
        repImagesProperty = new SimpleObjectProperty<>(userPreferences.getRepImages());
        Bindings.bindBidirectional(repImages.textProperty(), repImagesProperty, new FileStringConverter());

        content.setCenter(null);
        Platform.runLater(new Runnable() {
            @Override
            public void run() {
                btnOptionsDiverses.fire();
            }
        });
    }

    @FXML
    public void btnQuitClick(ActionEvent actionEvent) {
        if (getResult() == DialogResult.OK) {
            userPreferences.setFormatTitreAlbum(formatTitreAlbum.getValue());
            userPreferences.setSerieObligatoireAlbums(serieObligatoireAlbums.isSelected());
            userPreferences.setSerieObligatoireParaBD(serieObligatoireParaBD.isSelected());
            userPreferences.setAntiAliasing(antiAliasing.isSelected());
            userPreferences.setImagesStockees(imagesStockees.isSelected());
            userPreferences.setAfficheNoteListes(afficheNotesListes.isSelected());
            userPreferences.setRepImages(repImagesProperty.get());
            userPreferences.save();
        }

        getDialog().close();
    }

    @FXML
    void btnChooseFolderClick(ActionEvent event) {
        final DirectoryChooser directoryChooser = new DirectoryChooser();
        if (FileUtils.isNotNullAndExists(repImagesProperty.get()))
            directoryChooser.setInitialDirectory(repImagesProperty.get());
        else
            directoryChooser.setInitialDirectory(null);
        final File newDirectory = directoryChooser.showDialog(getDialog());
        if (newDirectory != null)
            repImagesProperty.set(newDirectory);
    }

}
