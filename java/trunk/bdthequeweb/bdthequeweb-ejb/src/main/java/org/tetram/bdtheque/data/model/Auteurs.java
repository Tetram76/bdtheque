package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Auteurs generated by hbm2java
 */
@Entity
@Table(name = "AUTEURS", uniqueConstraints = @UniqueConstraint(columnNames = "ID_AUTEUR"))
public class Auteurs implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AuteursId id;
	private Personnes personnes;
	private Albums albums;
	private String idAuteur;
	private Date dcAuteurs;
	private Date dmAuteurs;

	public Auteurs() {
	}

	public Auteurs(AuteursId id, Personnes personnes, Albums albums,
			String idAuteur, Date dcAuteurs, Date dmAuteurs) {
		this.id = id;
		this.personnes = personnes;
		this.albums = albums;
		this.idAuteur = idAuteur;
		this.dcAuteurs = dcAuteurs;
		this.dmAuteurs = dmAuteurs;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "idAlbum", column = @Column(name = "ID_ALBUM", nullable = false, length = 38)),
			@AttributeOverride(name = "idPersonne", column = @Column(name = "ID_PERSONNE", nullable = false, length = 38)),
			@AttributeOverride(name = "metier", column = @Column(name = "METIER", nullable = false)) })
	public AuteursId getId() {
		return this.id;
	}

	public void setId(AuteursId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_PERSONNE", nullable = false, insertable = false, updatable = false)
	public Personnes getPersonnes() {
		return this.personnes;
	}

	public void setPersonnes(Personnes personnes) {
		this.personnes = personnes;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_ALBUM", nullable = false, insertable = false, updatable = false)
	public Albums getAlbums() {
		return this.albums;
	}

	public void setAlbums(Albums albums) {
		this.albums = albums;
	}

	@Column(name = "ID_AUTEUR", unique = true, nullable = false, length = 38)
	public String getIdAuteur() {
		return this.idAuteur;
	}

	public void setIdAuteur(String idAuteur) {
		this.idAuteur = idAuteur;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DC_AUTEURS", nullable = false, length = 19)
	public Date getDcAuteurs() {
		return this.dcAuteurs;
	}

	public void setDcAuteurs(Date dcAuteurs) {
		this.dcAuteurs = dcAuteurs;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DM_AUTEURS", nullable = false, length = 19)
	public Date getDmAuteurs() {
		return this.dmAuteurs;
	}

	public void setDmAuteurs(Date dmAuteurs) {
		this.dmAuteurs = dmAuteurs;
	}

}