package org.tetram.bdtheque.gui.activities.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import org.tetram.bdtheque.R;

@SuppressWarnings("UnusedDeclaration")
public class FicheAuteurFragment extends FicheFragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fiche_auteur_fragment, container);
    }
}