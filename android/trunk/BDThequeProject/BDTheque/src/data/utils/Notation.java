package org.tetram.bdtheque.data.utils;

import android.content.Context;

import org.tetram.bdtheque.R;
import org.tetram.bdtheque.gui.adapters.MenuEntry;

@SuppressWarnings("UnusedDeclaration")
public enum Notation {
    PAS_NOTE(0, R.drawable.notation_0, R.string.notation_0),
    TRES_MAUVAIS(1, R.drawable.notation_1, R.string.notation_1),
    MAUVAIS(2, R.drawable.notation_2, R.string.notation_2),
    MOYEN(3, R.drawable.notation_3, R.string.notation_3),
    BIEN(4, R.drawable.notation_4, R.string.notation_4),
    TRES_BIEN(5, R.drawable.notation_5, R.string.notation_5);

    private final int value;
    private final int resDrawable;
    private final int resLabel;

    Notation(int value, int resDrawable, int resLabel) {
        this.value = value;
        this.resDrawable = resDrawable;
        this.resLabel = resLabel;
    }

    public static Notation fromValue(Integer note) {
        if (note == null) return PAS_NOTE;
        for (Notation notation : Notation.values())
            if (note.equals(notation.getValue()))
                return notation;
        return PAS_NOTE;
    }

    public MenuEntry getMenuEntry(final Context context) {
        return new MenuEntry(context.getString(getResLabel()), this.ordinal());
    }

    public int getValue() {
        return this.value;
    }

    public int getResDrawable() {
        return this.resDrawable;
    }

    public int getResLabel() {
        return this.resLabel;
    }

}
