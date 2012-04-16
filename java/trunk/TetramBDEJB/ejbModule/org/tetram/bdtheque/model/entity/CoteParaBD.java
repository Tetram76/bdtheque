package org.tetram.bdtheque.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cotes_parabd")
public class CoteParaBD implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@GeneratedValue
	@Id
	@Column(name = "id_cote")
	private String id;

	@Embedded
	private Cote cote;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_parabd")
	private ParaBD paraBD;

	protected String getId() {
		return id;
	}

	protected void setId(String id) {
		this.id = id;
	}

	protected Cote getCote() {
		return cote;
	}

	protected void setCote(Cote cote) {
		this.cote = cote;
	}

	protected ParaBD getParaBD() {
		return paraBD;
	}

	protected void setParaBD(ParaBD paraBD) {
		this.paraBD = paraBD;
	}

}