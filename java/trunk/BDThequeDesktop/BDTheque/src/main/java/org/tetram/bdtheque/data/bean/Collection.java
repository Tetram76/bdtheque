package org.tetram.bdtheque.data.bean;

/**
 * Created by Thierry on 24/05/2014.
 */
public class Collection extends AbstractDBEntity {
    private String nomCollection;
    private EditeurLite editeur;

    public String getNomCollection() {
        return nomCollection.trim();
    }

    public void setNomCollection(String nomCollection) {
        this.nomCollection = nomCollection.trim();
    }

    public EditeurLite getEditeur() {
        return editeur;
    }

    public void setEditeur(EditeurLite editeur) {
        this.editeur = editeur;
    }
}