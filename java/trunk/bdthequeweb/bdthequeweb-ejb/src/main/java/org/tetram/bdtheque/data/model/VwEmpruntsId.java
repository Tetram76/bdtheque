package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * VwEmpruntsId generated by hbm2java
 */
@Embeddable
public class VwEmpruntsId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idStatut;
	private String idEdition;
	private String idAlbum;
	private String titrealbum;
	private String idSerie;
	private Short tome;
	private Short integrale;
	private Short tomedebut;
	private Short tomefin;
	private Short horsserie;
	private Short notation;
	private String titreserie;
	private String idEditeur;
	private String nomediteur;
	private String idCollection;
	private String nomcollection;
	private Short prete;
	private Short anneeedition;
	private String isbn;
	private String idEmprunteur;
	private String nomemprunteur;
	private Short pretemprunt;
	private Date dateemprunt;

	public VwEmpruntsId() {
	}

	public VwEmpruntsId(String idStatut, String idEdition, String idAlbum,
			String idEditeur, String idCollection, String idEmprunteur) {
		this.idStatut = idStatut;
		this.idEdition = idEdition;
		this.idAlbum = idAlbum;
		this.idEditeur = idEditeur;
		this.idCollection = idCollection;
		this.idEmprunteur = idEmprunteur;
	}

	public VwEmpruntsId(String idStatut, String idEdition, String idAlbum,
			String titrealbum, String idSerie, Short tome, Short integrale,
			Short tomedebut, Short tomefin, Short horsserie, Short notation,
			String titreserie, String idEditeur, String nomediteur,
			String idCollection, String nomcollection, Short prete,
			Short anneeedition, String isbn, String idEmprunteur,
			String nomemprunteur, Short pretemprunt, Date dateemprunt) {
		this.idStatut = idStatut;
		this.idEdition = idEdition;
		this.idAlbum = idAlbum;
		this.titrealbum = titrealbum;
		this.idSerie = idSerie;
		this.tome = tome;
		this.integrale = integrale;
		this.tomedebut = tomedebut;
		this.tomefin = tomefin;
		this.horsserie = horsserie;
		this.notation = notation;
		this.titreserie = titreserie;
		this.idEditeur = idEditeur;
		this.nomediteur = nomediteur;
		this.idCollection = idCollection;
		this.nomcollection = nomcollection;
		this.prete = prete;
		this.anneeedition = anneeedition;
		this.isbn = isbn;
		this.idEmprunteur = idEmprunteur;
		this.nomemprunteur = nomemprunteur;
		this.pretemprunt = pretemprunt;
		this.dateemprunt = dateemprunt;
	}

	@Column(name = "ID_STATUT", nullable = false, length = 38)
	public String getIdStatut() {
		return this.idStatut;
	}

	public void setIdStatut(String idStatut) {
		this.idStatut = idStatut;
	}

	@Column(name = "ID_EDITION", nullable = false, length = 38)
	public String getIdEdition() {
		return this.idEdition;
	}

	public void setIdEdition(String idEdition) {
		this.idEdition = idEdition;
	}

	@Column(name = "ID_ALBUM", nullable = false, length = 38)
	public String getIdAlbum() {
		return this.idAlbum;
	}

	public void setIdAlbum(String idAlbum) {
		this.idAlbum = idAlbum;
	}

	@Column(name = "TITREALBUM", length = 150)
	public String getTitrealbum() {
		return this.titrealbum;
	}

	public void setTitrealbum(String titrealbum) {
		this.titrealbum = titrealbum;
	}

	@Column(name = "ID_SERIE", length = 38)
	public String getIdSerie() {
		return this.idSerie;
	}

	public void setIdSerie(String idSerie) {
		this.idSerie = idSerie;
	}

	@Column(name = "TOME")
	public Short getTome() {
		return this.tome;
	}

	public void setTome(Short tome) {
		this.tome = tome;
	}

	@Column(name = "INTEGRALE")
	public Short getIntegrale() {
		return this.integrale;
	}

	public void setIntegrale(Short integrale) {
		this.integrale = integrale;
	}

	@Column(name = "TOMEDEBUT")
	public Short getTomedebut() {
		return this.tomedebut;
	}

	public void setTomedebut(Short tomedebut) {
		this.tomedebut = tomedebut;
	}

	@Column(name = "TOMEFIN")
	public Short getTomefin() {
		return this.tomefin;
	}

	public void setTomefin(Short tomefin) {
		this.tomefin = tomefin;
	}

	@Column(name = "HORSSERIE")
	public Short getHorsserie() {
		return this.horsserie;
	}

	public void setHorsserie(Short horsserie) {
		this.horsserie = horsserie;
	}

	@Column(name = "NOTATION")
	public Short getNotation() {
		return this.notation;
	}

	public void setNotation(Short notation) {
		this.notation = notation;
	}

	@Column(name = "TITRESERIE", length = 150)
	public String getTitreserie() {
		return this.titreserie;
	}

	public void setTitreserie(String titreserie) {
		this.titreserie = titreserie;
	}

	@Column(name = "ID_EDITEUR", nullable = false, length = 38)
	public String getIdEditeur() {
		return this.idEditeur;
	}

	public void setIdEditeur(String idEditeur) {
		this.idEditeur = idEditeur;
	}

	@Column(name = "NOMEDITEUR", length = 50)
	public String getNomediteur() {
		return this.nomediteur;
	}

	public void setNomediteur(String nomediteur) {
		this.nomediteur = nomediteur;
	}

	@Column(name = "ID_COLLECTION", nullable = false, length = 38)
	public String getIdCollection() {
		return this.idCollection;
	}

	public void setIdCollection(String idCollection) {
		this.idCollection = idCollection;
	}

	@Column(name = "NOMCOLLECTION", length = 50)
	public String getNomcollection() {
		return this.nomcollection;
	}

	public void setNomcollection(String nomcollection) {
		this.nomcollection = nomcollection;
	}

	@Column(name = "PRETE")
	public Short getPrete() {
		return this.prete;
	}

	public void setPrete(Short prete) {
		this.prete = prete;
	}

	@Column(name = "ANNEEEDITION")
	public Short getAnneeedition() {
		return this.anneeedition;
	}

	public void setAnneeedition(Short anneeedition) {
		this.anneeedition = anneeedition;
	}

	@Column(name = "ISBN", length = 13)
	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	@Column(name = "ID_EMPRUNTEUR", nullable = false, length = 38)
	public String getIdEmprunteur() {
		return this.idEmprunteur;
	}

	public void setIdEmprunteur(String idEmprunteur) {
		this.idEmprunteur = idEmprunteur;
	}

	@Column(name = "NOMEMPRUNTEUR", length = 150)
	public String getNomemprunteur() {
		return this.nomemprunteur;
	}

	public void setNomemprunteur(String nomemprunteur) {
		this.nomemprunteur = nomemprunteur;
	}

	@Column(name = "PRETEMPRUNT")
	public Short getPretemprunt() {
		return this.pretemprunt;
	}

	public void setPretemprunt(Short pretemprunt) {
		this.pretemprunt = pretemprunt;
	}

	@Column(name = "DATEEMPRUNT", length = 19)
	public Date getDateemprunt() {
		return this.dateemprunt;
	}

	public void setDateemprunt(Date dateemprunt) {
		this.dateemprunt = dateemprunt;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VwEmpruntsId))
			return false;
		VwEmpruntsId castOther = (VwEmpruntsId) other;

		return ((this.getIdStatut() == castOther.getIdStatut()) || (this
				.getIdStatut() != null && castOther.getIdStatut() != null && this
				.getIdStatut().equals(castOther.getIdStatut())))
				&& ((this.getIdEdition() == castOther.getIdEdition()) || (this
						.getIdEdition() != null
						&& castOther.getIdEdition() != null && this
						.getIdEdition().equals(castOther.getIdEdition())))
				&& ((this.getIdAlbum() == castOther.getIdAlbum()) || (this
						.getIdAlbum() != null && castOther.getIdAlbum() != null && this
						.getIdAlbum().equals(castOther.getIdAlbum())))
				&& ((this.getTitrealbum() == castOther.getTitrealbum()) || (this
						.getTitrealbum() != null
						&& castOther.getTitrealbum() != null && this
						.getTitrealbum().equals(castOther.getTitrealbum())))
				&& ((this.getIdSerie() == castOther.getIdSerie()) || (this
						.getIdSerie() != null && castOther.getIdSerie() != null && this
						.getIdSerie().equals(castOther.getIdSerie())))
				&& ((this.getTome() == castOther.getTome()) || (this.getTome() != null
						&& castOther.getTome() != null && this.getTome()
						.equals(castOther.getTome())))
				&& ((this.getIntegrale() == castOther.getIntegrale()) || (this
						.getIntegrale() != null
						&& castOther.getIntegrale() != null && this
						.getIntegrale().equals(castOther.getIntegrale())))
				&& ((this.getTomedebut() == castOther.getTomedebut()) || (this
						.getTomedebut() != null
						&& castOther.getTomedebut() != null && this
						.getTomedebut().equals(castOther.getTomedebut())))
				&& ((this.getTomefin() == castOther.getTomefin()) || (this
						.getTomefin() != null && castOther.getTomefin() != null && this
						.getTomefin().equals(castOther.getTomefin())))
				&& ((this.getHorsserie() == castOther.getHorsserie()) || (this
						.getHorsserie() != null
						&& castOther.getHorsserie() != null && this
						.getHorsserie().equals(castOther.getHorsserie())))
				&& ((this.getNotation() == castOther.getNotation()) || (this
						.getNotation() != null
						&& castOther.getNotation() != null && this
						.getNotation().equals(castOther.getNotation())))
				&& ((this.getTitreserie() == castOther.getTitreserie()) || (this
						.getTitreserie() != null
						&& castOther.getTitreserie() != null && this
						.getTitreserie().equals(castOther.getTitreserie())))
				&& ((this.getIdEditeur() == castOther.getIdEditeur()) || (this
						.getIdEditeur() != null
						&& castOther.getIdEditeur() != null && this
						.getIdEditeur().equals(castOther.getIdEditeur())))
				&& ((this.getNomediteur() == castOther.getNomediteur()) || (this
						.getNomediteur() != null
						&& castOther.getNomediteur() != null && this
						.getNomediteur().equals(castOther.getNomediteur())))
				&& ((this.getIdCollection() == castOther.getIdCollection()) || (this
						.getIdCollection() != null
						&& castOther.getIdCollection() != null && this
						.getIdCollection().equals(castOther.getIdCollection())))
				&& ((this.getNomcollection() == castOther.getNomcollection()) || (this
						.getNomcollection() != null
						&& castOther.getNomcollection() != null && this
						.getNomcollection()
						.equals(castOther.getNomcollection())))
				&& ((this.getPrete() == castOther.getPrete()) || (this
						.getPrete() != null && castOther.getPrete() != null && this
						.getPrete().equals(castOther.getPrete())))
				&& ((this.getAnneeedition() == castOther.getAnneeedition()) || (this
						.getAnneeedition() != null
						&& castOther.getAnneeedition() != null && this
						.getAnneeedition().equals(castOther.getAnneeedition())))
				&& ((this.getIsbn() == castOther.getIsbn()) || (this.getIsbn() != null
						&& castOther.getIsbn() != null && this.getIsbn()
						.equals(castOther.getIsbn())))
				&& ((this.getIdEmprunteur() == castOther.getIdEmprunteur()) || (this
						.getIdEmprunteur() != null
						&& castOther.getIdEmprunteur() != null && this
						.getIdEmprunteur().equals(castOther.getIdEmprunteur())))
				&& ((this.getNomemprunteur() == castOther.getNomemprunteur()) || (this
						.getNomemprunteur() != null
						&& castOther.getNomemprunteur() != null && this
						.getNomemprunteur()
						.equals(castOther.getNomemprunteur())))
				&& ((this.getPretemprunt() == castOther.getPretemprunt()) || (this
						.getPretemprunt() != null
						&& castOther.getPretemprunt() != null && this
						.getPretemprunt().equals(castOther.getPretemprunt())))
				&& ((this.getDateemprunt() == castOther.getDateemprunt()) || (this
						.getDateemprunt() != null
						&& castOther.getDateemprunt() != null && this
						.getDateemprunt().equals(castOther.getDateemprunt())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getIdStatut() == null ? 0 : this.getIdStatut().hashCode());
		result = 37 * result
				+ (getIdEdition() == null ? 0 : this.getIdEdition().hashCode());
		result = 37 * result
				+ (getIdAlbum() == null ? 0 : this.getIdAlbum().hashCode());
		result = 37
				* result
				+ (getTitrealbum() == null ? 0 : this.getTitrealbum()
						.hashCode());
		result = 37 * result
				+ (getIdSerie() == null ? 0 : this.getIdSerie().hashCode());
		result = 37 * result
				+ (getTome() == null ? 0 : this.getTome().hashCode());
		result = 37 * result
				+ (getIntegrale() == null ? 0 : this.getIntegrale().hashCode());
		result = 37 * result
				+ (getTomedebut() == null ? 0 : this.getTomedebut().hashCode());
		result = 37 * result
				+ (getTomefin() == null ? 0 : this.getTomefin().hashCode());
		result = 37 * result
				+ (getHorsserie() == null ? 0 : this.getHorsserie().hashCode());
		result = 37 * result
				+ (getNotation() == null ? 0 : this.getNotation().hashCode());
		result = 37
				* result
				+ (getTitreserie() == null ? 0 : this.getTitreserie()
						.hashCode());
		result = 37 * result
				+ (getIdEditeur() == null ? 0 : this.getIdEditeur().hashCode());
		result = 37
				* result
				+ (getNomediteur() == null ? 0 : this.getNomediteur()
						.hashCode());
		result = 37
				* result
				+ (getIdCollection() == null ? 0 : this.getIdCollection()
						.hashCode());
		result = 37
				* result
				+ (getNomcollection() == null ? 0 : this.getNomcollection()
						.hashCode());
		result = 37 * result
				+ (getPrete() == null ? 0 : this.getPrete().hashCode());
		result = 37
				* result
				+ (getAnneeedition() == null ? 0 : this.getAnneeedition()
						.hashCode());
		result = 37 * result
				+ (getIsbn() == null ? 0 : this.getIsbn().hashCode());
		result = 37
				* result
				+ (getIdEmprunteur() == null ? 0 : this.getIdEmprunteur()
						.hashCode());
		result = 37
				* result
				+ (getNomemprunteur() == null ? 0 : this.getNomemprunteur()
						.hashCode());
		result = 37
				* result
				+ (getPretemprunt() == null ? 0 : this.getPretemprunt()
						.hashCode());
		result = 37
				* result
				+ (getDateemprunt() == null ? 0 : this.getDateemprunt()
						.hashCode());
		return result;
	}

}
