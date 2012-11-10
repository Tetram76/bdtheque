package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Suppressions generated by hbm2java
 */
@Entity
@Table(name = "SUPPRESSIONS")
public class Suppressions implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SuppressionsId id;

	public Suppressions() {
	}

	public Suppressions(SuppressionsId id) {
		this.id = id;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "idSuppression", column = @Column(name = "ID_SUPPRESSION", nullable = false, length = 38)),
			@AttributeOverride(name = "tablename", column = @Column(name = "TABLENAME", length = 31)),
			@AttributeOverride(name = "fieldname", column = @Column(name = "FIELDNAME", length = 31)),
			@AttributeOverride(name = "id", column = @Column(name = "ID", nullable = false, length = 38)),
			@AttributeOverride(name = "dcSuppressions", column = @Column(name = "DC_SUPPRESSIONS", nullable = false, length = 19)),
			@AttributeOverride(name = "dmSuppressions", column = @Column(name = "DM_SUPPRESSIONS", nullable = false, length = 19)) })
	public SuppressionsId getId() {
		return this.id;
	}

	public void setId(SuppressionsId id) {
		this.id = id;
	}

}
