package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

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
 * Emprunteurs generated by hbm2java
 */
@Entity
@Table(name = "EMPRUNTEURS")
public class Emprunteurs implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idEmprunteur;
	private Character initialenomemprunteur;
	private Date dcEmprunteurs;
	private Date dmEmprunteurs;
	private String nomemprunteur;
	private String adresseemprunteur;
	private Set<Statut> statuts = new HashSet<Statut>(0);

	public Emprunteurs() {
	}

	public Emprunteurs(String idEmprunteur, Date dcEmprunteurs,
			Date dmEmprunteurs) {
		this.idEmprunteur = idEmprunteur;
		this.dcEmprunteurs = dcEmprunteurs;
		this.dmEmprunteurs = dmEmprunteurs;
	}

	public Emprunteurs(String idEmprunteur, Character initialenomemprunteur,
			Date dcEmprunteurs, Date dmEmprunteurs, String nomemprunteur,
			String adresseemprunteur, Set<Statut> statuts) {
		this.idEmprunteur = idEmprunteur;
		this.initialenomemprunteur = initialenomemprunteur;
		this.dcEmprunteurs = dcEmprunteurs;
		this.dmEmprunteurs = dmEmprunteurs;
		this.nomemprunteur = nomemprunteur;
		this.adresseemprunteur = adresseemprunteur;
		this.statuts = statuts;
	}

	@Id
	@Column(name = "ID_EMPRUNTEUR", unique = true, nullable = false, length = 38)
	public String getIdEmprunteur() {
		return this.idEmprunteur;
	}

	public void setIdEmprunteur(String idEmprunteur) {
		this.idEmprunteur = idEmprunteur;
	}

	@Column(name = "INITIALENOMEMPRUNTEUR", length = 1)
	public Character getInitialenomemprunteur() {
		return this.initialenomemprunteur;
	}

	public void setInitialenomemprunteur(Character initialenomemprunteur) {
		this.initialenomemprunteur = initialenomemprunteur;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DC_EMPRUNTEURS", nullable = false, length = 19)
	public Date getDcEmprunteurs() {
		return this.dcEmprunteurs;
	}

	public void setDcEmprunteurs(Date dcEmprunteurs) {
		this.dcEmprunteurs = dcEmprunteurs;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DM_EMPRUNTEURS", nullable = false, length = 19)
	public Date getDmEmprunteurs() {
		return this.dmEmprunteurs;
	}

	public void setDmEmprunteurs(Date dmEmprunteurs) {
		this.dmEmprunteurs = dmEmprunteurs;
	}

	@Column(name = "NOMEMPRUNTEUR", length = 150)
	public String getNomemprunteur() {
		return this.nomemprunteur;
	}

	public void setNomemprunteur(String nomemprunteur) {
		this.nomemprunteur = nomemprunteur;
	}

	@Column(name = "ADRESSEEMPRUNTEUR", length = 0)
	public String getAdresseemprunteur() {
		return this.adresseemprunteur;
	}

	public void setAdresseemprunteur(String adresseemprunteur) {
		this.adresseemprunteur = adresseemprunteur;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "emprunteurs")
	public Set<Statut> getStatuts() {
		return this.statuts;
	}

	public void setStatuts(Set<Statut> statuts) {
		this.statuts = statuts;
	}

}
