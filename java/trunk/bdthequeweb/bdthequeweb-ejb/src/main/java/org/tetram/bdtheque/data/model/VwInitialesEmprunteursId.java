package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * VwInitialesEmprunteursId generated by hbm2java
 */
@Embeddable
public class VwInitialesEmprunteursId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String initialenomemprunteur;
	private Integer countinitiale;

	public VwInitialesEmprunteursId() {
	}

	public VwInitialesEmprunteursId(String initialenomemprunteur,
			Integer countinitiale) {
		this.initialenomemprunteur = initialenomemprunteur;
		this.countinitiale = countinitiale;
	}

	@Column(name = "INITIALENOMEMPRUNTEUR", length = 4)
	public String getInitialenomemprunteur() {
		return this.initialenomemprunteur;
	}

	public void setInitialenomemprunteur(String initialenomemprunteur) {
		this.initialenomemprunteur = initialenomemprunteur;
	}

	@Column(name = "COUNTINITIALE")
	public Integer getCountinitiale() {
		return this.countinitiale;
	}

	public void setCountinitiale(Integer countinitiale) {
		this.countinitiale = countinitiale;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VwInitialesEmprunteursId))
			return false;
		VwInitialesEmprunteursId castOther = (VwInitialesEmprunteursId) other;

		return ((this.getInitialenomemprunteur() == castOther
				.getInitialenomemprunteur()) || (this
				.getInitialenomemprunteur() != null
				&& castOther.getInitialenomemprunteur() != null && this
				.getInitialenomemprunteur().equals(
						castOther.getInitialenomemprunteur())))
				&& ((this.getCountinitiale() == castOther.getCountinitiale()) || (this
						.getCountinitiale() != null
						&& castOther.getCountinitiale() != null && this
						.getCountinitiale()
						.equals(castOther.getCountinitiale())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getInitialenomemprunteur() == null ? 0 : this
						.getInitialenomemprunteur().hashCode());
		result = 37
				* result
				+ (getCountinitiale() == null ? 0 : this.getCountinitiale()
						.hashCode());
		return result;
	}

}