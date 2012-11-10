package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SuppressionsId generated by hbm2java
 */
@Embeddable
public class SuppressionsId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idSuppression;
	private String tablename;
	private String fieldname;
	private String id;
	private Date dcSuppressions;
	private Date dmSuppressions;

	public SuppressionsId() {
	}

	public SuppressionsId(String idSuppression, String id, Date dcSuppressions,
			Date dmSuppressions) {
		this.idSuppression = idSuppression;
		this.id = id;
		this.dcSuppressions = dcSuppressions;
		this.dmSuppressions = dmSuppressions;
	}

	public SuppressionsId(String idSuppression, String tablename,
			String fieldname, String id, Date dcSuppressions,
			Date dmSuppressions) {
		this.idSuppression = idSuppression;
		this.tablename = tablename;
		this.fieldname = fieldname;
		this.id = id;
		this.dcSuppressions = dcSuppressions;
		this.dmSuppressions = dmSuppressions;
	}

	@Column(name = "ID_SUPPRESSION", nullable = false, length = 38)
	public String getIdSuppression() {
		return this.idSuppression;
	}

	public void setIdSuppression(String idSuppression) {
		this.idSuppression = idSuppression;
	}

	@Column(name = "TABLENAME", length = 31)
	public String getTablename() {
		return this.tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	@Column(name = "FIELDNAME", length = 31)
	public String getFieldname() {
		return this.fieldname;
	}

	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}

	@Column(name = "ID", nullable = false, length = 38)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "DC_SUPPRESSIONS", nullable = false, length = 19)
	public Date getDcSuppressions() {
		return this.dcSuppressions;
	}

	public void setDcSuppressions(Date dcSuppressions) {
		this.dcSuppressions = dcSuppressions;
	}

	@Column(name = "DM_SUPPRESSIONS", nullable = false, length = 19)
	public Date getDmSuppressions() {
		return this.dmSuppressions;
	}

	public void setDmSuppressions(Date dmSuppressions) {
		this.dmSuppressions = dmSuppressions;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SuppressionsId))
			return false;
		SuppressionsId castOther = (SuppressionsId) other;

		return ((this.getIdSuppression() == castOther.getIdSuppression()) || (this
				.getIdSuppression() != null
				&& castOther.getIdSuppression() != null && this
				.getIdSuppression().equals(castOther.getIdSuppression())))
				&& ((this.getTablename() == castOther.getTablename()) || (this
						.getTablename() != null
						&& castOther.getTablename() != null && this
						.getTablename().equals(castOther.getTablename())))
				&& ((this.getFieldname() == castOther.getFieldname()) || (this
						.getFieldname() != null
						&& castOther.getFieldname() != null && this
						.getFieldname().equals(castOther.getFieldname())))
				&& ((this.getId() == castOther.getId()) || (this.getId() != null
						&& castOther.getId() != null && this.getId().equals(
						castOther.getId())))
				&& ((this.getDcSuppressions() == castOther.getDcSuppressions()) || (this
						.getDcSuppressions() != null
						&& castOther.getDcSuppressions() != null && this
						.getDcSuppressions().equals(
								castOther.getDcSuppressions())))
				&& ((this.getDmSuppressions() == castOther.getDmSuppressions()) || (this
						.getDmSuppressions() != null
						&& castOther.getDmSuppressions() != null && this
						.getDmSuppressions().equals(
								castOther.getDmSuppressions())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getIdSuppression() == null ? 0 : this.getIdSuppression()
						.hashCode());
		result = 37 * result
				+ (getTablename() == null ? 0 : this.getTablename().hashCode());
		result = 37 * result
				+ (getFieldname() == null ? 0 : this.getFieldname().hashCode());
		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37
				* result
				+ (getDcSuppressions() == null ? 0 : this.getDcSuppressions()
						.hashCode());
		result = 37
				* result
				+ (getDmSuppressions() == null ? 0 : this.getDmSuppressions()
						.hashCode());
		return result;
	}

}
