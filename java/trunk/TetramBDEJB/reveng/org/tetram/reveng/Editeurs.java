package org.tetram.reveng;

// Generated 1 mai 2012 09:51:32 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Editeurs generated by hbm2java
 */
@Entity
@Table(name = "EDITEURS")
public class Editeurs implements java.io.Serializable {

	private String idEditeur;
	private char initialenomediteur;
	private String siteweb;
	private Date dcEditeurs;
	private Date dmEditeurs;
	private String nomediteur;
	private Set editionses = new HashSet(0);
	private Set editionses_1 = new HashSet(0);
	private Set collectionses = new HashSet(0);
	private Set collectionses_1 = new HashSet(0);
	private Set serieses = new HashSet(0);

	public Editeurs() {
	}

	public Editeurs(String idEditeur, char initialenomediteur, Date dcEditeurs,
			Date dmEditeurs) {
		this.idEditeur = idEditeur;
		this.initialenomediteur = initialenomediteur;
		this.dcEditeurs = dcEditeurs;
		this.dmEditeurs = dmEditeurs;
	}

	public Editeurs(String idEditeur, char initialenomediteur, String siteweb,
			Date dcEditeurs, Date dmEditeurs, String nomediteur,
			Set editionses, Set editionses_1, Set collectionses,
			Set collectionses_1, Set serieses) {
		this.idEditeur = idEditeur;
		this.initialenomediteur = initialenomediteur;
		this.siteweb = siteweb;
		this.dcEditeurs = dcEditeurs;
		this.dmEditeurs = dmEditeurs;
		this.nomediteur = nomediteur;
		this.editionses = editionses;
		this.editionses_1 = editionses_1;
		this.collectionses = collectionses;
		this.collectionses_1 = collectionses_1;
		this.serieses = serieses;
	}

	@Id
	@Column(name = "ID_EDITEUR", unique = true, nullable = false, length = 38)
	public String getIdEditeur() {
		return this.idEditeur;
	}

	public void setIdEditeur(String idEditeur) {
		this.idEditeur = idEditeur;
	}

	@Column(name = "INITIALENOMEDITEUR", nullable = false, length = 1)
	public char getInitialenomediteur() {
		return this.initialenomediteur;
	}

	public void setInitialenomediteur(char initialenomediteur) {
		this.initialenomediteur = initialenomediteur;
	}

	@Column(name = "SITEWEB")
	public String getSiteweb() {
		return this.siteweb;
	}

	public void setSiteweb(String siteweb) {
		this.siteweb = siteweb;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DC_EDITEURS", nullable = false, length = 19)
	public Date getDcEditeurs() {
		return this.dcEditeurs;
	}

	public void setDcEditeurs(Date dcEditeurs) {
		this.dcEditeurs = dcEditeurs;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DM_EDITEURS", nullable = false, length = 19)
	public Date getDmEditeurs() {
		return this.dmEditeurs;
	}

	public void setDmEditeurs(Date dmEditeurs) {
		this.dmEditeurs = dmEditeurs;
	}

	@Column(name = "NOMEDITEUR", length = 50)
	public String getNomediteur() {
		return this.nomediteur;
	}

	public void setNomediteur(String nomediteur) {
		this.nomediteur = nomediteur;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "editeurs")
	public Set getEditionses() {
		return this.editionses;
	}

	public void setEditionses(Set editionses) {
		this.editionses = editionses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "editeurs")
	public Set getEditionses_1() {
		return this.editionses_1;
	}

	public void setEditionses_1(Set editionses_1) {
		this.editionses_1 = editionses_1;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "editeurs")
	public Set getCollectionses() {
		return this.collectionses;
	}

	public void setCollectionses(Set collectionses) {
		this.collectionses = collectionses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "editeurs")
	public Set getCollectionses_1() {
		return this.collectionses_1;
	}

	public void setCollectionses_1(Set collectionses_1) {
		this.collectionses_1 = collectionses_1;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "editeurs")
	public Set getSerieses() {
		return this.serieses;
	}

	public void setSerieses(Set serieses) {
		this.serieses = serieses;
	}

}