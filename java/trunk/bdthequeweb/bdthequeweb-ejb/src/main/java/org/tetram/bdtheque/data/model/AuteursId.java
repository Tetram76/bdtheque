package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * AuteursId generated by hbm2java
 */
@Embeddable
public class AuteursId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idAlbum;
	private String idPersonne;
	private short metier;

	public AuteursId() {
	}

	public AuteursId(String idAlbum, String idPersonne, short metier) {
		this.idAlbum = idAlbum;
		this.idPersonne = idPersonne;
		this.metier = metier;
	}

	@Column(name = "ID_ALBUM", nullable = false, length = 38)
	public String getIdAlbum() {
		return this.idAlbum;
	}

	public void setIdAlbum(String idAlbum) {
		this.idAlbum = idAlbum;
	}

	@Column(name = "ID_PERSONNE", nullable = false, length = 38)
	public String getIdPersonne() {
		return this.idPersonne;
	}

	public void setIdPersonne(String idPersonne) {
		this.idPersonne = idPersonne;
	}

	@Column(name = "METIER", nullable = false)
	public short getMetier() {
		return this.metier;
	}

	public void setMetier(short metier) {
		this.metier = metier;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AuteursId))
			return false;
		AuteursId castOther = (AuteursId) other;

		return ((this.getIdAlbum() == castOther.getIdAlbum()) || (this
				.getIdAlbum() != null && castOther.getIdAlbum() != null && this
				.getIdAlbum().equals(castOther.getIdAlbum())))
				&& ((this.getIdPersonne() == castOther.getIdPersonne()) || (this
						.getIdPersonne() != null
						&& castOther.getIdPersonne() != null && this
						.getIdPersonne().equals(castOther.getIdPersonne())))
				&& (this.getMetier() == castOther.getMetier());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getIdAlbum() == null ? 0 : this.getIdAlbum().hashCode());
		result = 37
				* result
				+ (getIdPersonne() == null ? 0 : this.getIdPersonne()
						.hashCode());
		result = 37 * result + this.getMetier();
		return result;
	}

}
