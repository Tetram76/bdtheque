package org.tetram.bdtheque.data.bean.lite;

import org.tetram.bdtheque.utils.StringUtils;

import java.util.UUID;

/**
 * Created by Thierry on 24/05/2014.
 */
public class ParaBDLite extends DBEntityLite {
    private String titre;
    private UUID idSerie;
    private String serie;
    private String sCategorie;
    private boolean achat;
    private boolean complet = true;

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public UUID getIdSerie() {
        return idSerie;
    }

    public void setIdSerie(UUID idSerie) {
        this.idSerie = idSerie;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getsCategorie() {
        return sCategorie;
    }

    public void setsCategorie(String sCategorie) {
        this.sCategorie = sCategorie;
    }

    public boolean isAchat() {
        return achat;
    }

    public void setAchat(boolean achat) {
        this.achat = achat;
    }

    public boolean isComplet() {
        return complet;
    }

    public void setComplet(boolean complet) {
        this.complet = complet;
    }

    @Override
    public String buildLabel() {
        return buildLabel(true);
    }

    public String buildLabel(boolean avecSerie) {
        return buildLabel(false, true);
    }

    private String buildLabel(boolean simple, boolean avecSerie) {
        String lb = titre;
        if (!simple)
            lb = StringUtils.formatTitre(lb);
        String s = "";
        if (avecSerie)
            if ("".equals(lb))
                lb = StringUtils.formatTitre(serie);
            else
                s = StringUtils.ajoutString(s, StringUtils.formatTitre(serie), " - ");
        s = StringUtils.ajoutString(s, sCategorie, " - ");
        if ("".equals(lb))
            return s;
        else
            return StringUtils.ajoutString(lb, s, " ", "(", ")");

    }
}
