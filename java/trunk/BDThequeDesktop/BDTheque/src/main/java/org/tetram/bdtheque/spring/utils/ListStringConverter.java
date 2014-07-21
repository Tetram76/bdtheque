package org.tetram.bdtheque.spring.utils;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.util.StringConverter;

/**
 * Created by Thierry on 21/07/2014.
 */
public class ListStringConverter extends StringConverter<ObservableList<String>> {
    @Override
    public String toString(ObservableList<String> object) {
        return object == null ? "" : String.join("\n", object);
    }

    @Override
    public ObservableList<String> fromString(String string) {
        return string == null ? FXCollections.observableArrayList() : FXCollections.observableArrayList(string.split("\n"));
    }
}
