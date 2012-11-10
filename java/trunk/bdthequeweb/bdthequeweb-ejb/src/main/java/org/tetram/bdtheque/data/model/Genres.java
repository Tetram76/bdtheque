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
 * Genres generated by hbm2java
 */
@Entity
@Table(name = "GENRES")
public class Genres implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idGenre;
	private Date dcGenres;
	private Date dmGenres;
	private Character initialegenre;
	private String genre;
	private String test;
	private Set<Genreseries> genreserieses = new HashSet<Genreseries>(0);

	public Genres() {
	}

	public Genres(String idGenre, Date dcGenres, Date dmGenres) {
		this.idGenre = idGenre;
		this.dcGenres = dcGenres;
		this.dmGenres = dmGenres;
	}

	public Genres(String idGenre, Date dcGenres, Date dmGenres,
			Character initialegenre, String genre, String test,
			Set<Genreseries> genreserieses) {
		this.idGenre = idGenre;
		this.dcGenres = dcGenres;
		this.dmGenres = dmGenres;
		this.initialegenre = initialegenre;
		this.genre = genre;
		this.test = test;
		this.genreserieses = genreserieses;
	}

	@Id
	@Column(name = "ID_GENRE", unique = true, nullable = false, length = 38)
	public String getIdGenre() {
		return this.idGenre;
	}

	public void setIdGenre(String idGenre) {
		this.idGenre = idGenre;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DC_GENRES", nullable = false, length = 19)
	public Date getDcGenres() {
		return this.dcGenres;
	}

	public void setDcGenres(Date dcGenres) {
		this.dcGenres = dcGenres;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DM_GENRES", nullable = false, length = 19)
	public Date getDmGenres() {
		return this.dmGenres;
	}

	public void setDmGenres(Date dmGenres) {
		this.dmGenres = dmGenres;
	}

	@Column(name = "INITIALEGENRE", length = 1)
	public Character getInitialegenre() {
		return this.initialegenre;
	}

	public void setInitialegenre(Character initialegenre) {
		this.initialegenre = initialegenre;
	}

	@Column(name = "GENRE", length = 30)
	public String getGenre() {
		return this.genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Column(name = "TEST", length = 10)
	public String getTest() {
		return this.test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "genres")
	public Set<Genreseries> getGenreserieses() {
		return this.genreserieses;
	}

	public void setGenreserieses(Set<Genreseries> genreserieses) {
		this.genreserieses = genreserieses;
	}

}