package org.tetram.bdtheque.gui.controllers;

import impl.org.controlsfx.i18n.Localization;
import javafx.beans.property.ReadOnlyStringPropertyBase;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import org.jetbrains.annotations.NonNls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;
import org.springframework.stereotype.Controller;
import org.tetram.bdtheque.SpringContext;
import org.tetram.bdtheque.SpringFxmlLoader;
import org.tetram.bdtheque.data.bean.Serie;
import org.tetram.bdtheque.data.dao.SerieDao;
import org.tetram.bdtheque.data.services.UserPreferences;
import org.tetram.bdtheque.gui.utils.Dialogs;
import org.tetram.bdtheque.utils.I18nSupport;
import org.tetram.bdtheque.utils.StringUtils;

import java.io.IOException;
import java.net.URL;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.UUID;

@Controller
public class MainController extends WindowController {

    @NonNls
    public static final UUID ID_SERIE_SILLAGE = StringUtils.GUIDStringToUUID("{69302EDB-6ED6-4DA3-A2E1-65B7B12BCB51}");
    @Autowired
    private UserPreferences userPreferences;
    @Autowired
    private SerieDao serieDao;

    @FXML
    private ResourceBundle resources;
    @FXML
    private URL location;

    @FXML
    private MenuBar menuBar;

    @FXML
    private ToolBar toolBar;

    @FXML
    private Button buttonTest;

    @FXML
    private AnchorPane detailPane;

    @FXML
    private Menu mnuLanguage;

    @FXML
    private MenuItem mnuDBFile;

    @NonNls
    @Autowired
    private SingleConnectionDataSource dataSource;

    @FXML
    void initialize() throws IOException {
        mnuDBFile.textProperty().bind(new ReadOnlyStringPropertyBase() {
            @Override
            public String get() {
                return dataSource.getUrl().substring("jdbc:firebirdsql:".length());
            }

            @Override
            public Object getBean() {
                return this;
            }

            @NonNls
            @Override
            public String getName() {
                return "dataSource";
            }
        });

        ModeConsultationController modeConsultationController = SpringFxmlLoader.load("modeConsultation.fxml");
        detailPane.getChildren().add(modeConsultationController.getView());
        AnchorPane.setBottomAnchor(modeConsultationController.getView(), 0.0);
        AnchorPane.setTopAnchor(modeConsultationController.getView(), 0.0);
        AnchorPane.setLeftAnchor(modeConsultationController.getView(), 0.0);
        AnchorPane.setRightAnchor(modeConsultationController.getView(), 0.0);
    }

    public void menuQuitClick(@SuppressWarnings("UnusedParameters") ActionEvent actionEvent) {
        dialog.close();
    }

    public void buttonTestClick(ActionEvent actionEvent) {
        Serie serie = serieDao.get(ID_SERIE_SILLAGE);
        buttonTest.setText(serie.getTitreSerie());
    }

    @FXML
    public void changeLanguage(ActionEvent event) {
        // certaines traductions sont récupérées à l'initialisation des classes, on n'a pas d'autres choix que de recharger l'appli
        final Locale locale = Localization.getLocale();
        try {
            final Locale newLocale = Locale.forLanguageTag(((MenuItem) event.getSource()).getId().substring(4));
            Localization.setLocale(newLocale);
            org.controlsfx.dialog.Dialogs.create()
                    .title(I18nSupport.message(newLocale, "nouvelle.langue"))
                            //.masthead(I18nSupport.message(newLocale, "redemarrage.necessaire"))
                    .message(I18nSupport.message(newLocale, "le.changement.de.langue.sera.effectif.au.prochain.demarrage.de.l.application"))
                    .showInformation();
            userPreferences.setLocale(newLocale);
            userPreferences.save();
        } finally {
            Localization.setLocale(locale);
        }
    }

    public void showPreferences(@SuppressWarnings("UnusedParameters") ActionEvent actionEvent) throws IOException {
        PreferencesController preferencesController = Dialogs.showPreferences(this.getDialog());
        if (preferencesController.getResult() == DialogController.DialogResult.OK)
            SpringContext.CONTEXT.getBean(RepertoireController.class).refresh();
    }

}
