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
 * Genreseries generated by hbm2java
 */
@Entity
@Table(name = "GENRESERIES", uniqueConstraints = @UniqueConstraint(columnNames = "ID_GENRESERIES"))
public class Genreseries implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private GenreseriesId id;
	private Series series;
	private Genres genres;
	private String idGenreseries;
	private Date dcGenreseries;
	private Date dmGenreseries;

	public Genreseries() {
	}

	public Genreseries(GenreseriesId id, Series series, Genres genres,
			String idGenreseries, Date dcGenreseries, Date dmGenreseries) {
		this.id = id;
		this.series = series;
		this.genres = genres;
		this.idGenreseries = idGenreseries;
		this.dcGenreseries = dcGenreseries;
		this.dmGenreseries = dmGenreseries;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "idSerie", column = @Column(name = "ID_SERIE", nullable = false, length = 38)),
			@AttributeOverride(name = "idGenre", column = @Column(name = "ID_GENRE", nullable = false, length = 38)) })
	public GenreseriesId getId() {
		return this.id;
	}

	public void setId(GenreseriesId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_SERIE", nullable = false, insertable = false, updatable = false)
	public Series getSeries() {
		return this.series;
	}

	public void setSeries(Series series) {
		this.series = series;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_GENRE", nullable = false, insertable = false, updatable = false)
	public Genres getGenres() {
		return this.genres;
	}

	public void setGenres(Genres genres) {
		this.genres = genres;
	}

	@Column(name = "ID_GENRESERIES", unique = true, nullable = false, length = 38)
	public String getIdGenreseries() {
		return this.idGenreseries;
	}

	public void setIdGenreseries(String idGenreseries) {
		this.idGenreseries = idGenreseries;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DC_GENRESERIES", nullable = false, length = 19)
	public Date getDcGenreseries() {
		return this.dcGenreseries;
	}

	public void setDcGenreseries(Date dcGenreseries) {
		this.dcGenreseries = dcGenreseries;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DM_GENRESERIES", nullable = false, length = 19)
	public Date getDmGenreseries() {
		return this.dmGenreseries;
	}

	public void setDmGenreseries(Date dmGenreseries) {
		this.dmGenreseries = dmGenreseries;
	}

}