package org.tetram.bdtheque.gui.controllers;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;


/**
 * Created by Thierry on 25/06/2014.
 */
public class DialogController extends WindowController {

    public EventHandler<ActionEvent> okBtnClickListener = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            setResult(DialogResult.OK);
        }
    };
    public EventHandler<ActionEvent> cancelBtnClickListener = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            setResult(DialogResult.CANCEL);
        }
    };
    private ObjectProperty<DialogResult> result = new SimpleObjectProperty<>(this, "result", DialogResult.NONE);

    public DialogResult getResult() {
        return result.get();
    }

    public void setResult(DialogResult result) {
        this.result.set(result);
    }

    public ObjectProperty<DialogResult> resultProperty() {
        return result;
    }

    protected void attachClickListener(Button button, EventHandler<ActionEvent> clickListener) {
        button.addEventHandler(ActionEvent.ACTION, clickListener);
    }

    enum DialogResult {
        NONE, OK, CANCEL
    }

}