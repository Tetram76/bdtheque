package org.tetram.bdtheque.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "metier", discriminatorType = DiscriminatorType.STRING)
@Table(name = "auteurs_series")
public class AuteurSerie implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@GeneratedValue
	@Id
	@Column(name = "id_auteur_series")
	private String id;

	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_personne")
	private Auteur auteur;
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_serie")
	private Serie serie;

	@Enumerated
	@Column(nullable = false, insertable = false, updatable = false)
	private MetierAuteur metier;

	protected String getId() {
		return id;
	}

	protected void setId(String id) {
		this.id = id;
	}

	protected Auteur getAuteur() {
		return auteur;
	}

	protected void setAuteur(Auteur auteur) {
		this.auteur = auteur;
	}

	protected Serie getSerie() {
		return serie;
	}

	protected void setSerie(Serie serie) {
		this.serie = serie;
	}

	protected MetierAuteur getMetier() {
		return metier;
	}

	protected void setMetier(MetierAuteur metier) {
		this.metier = metier;
	}

}