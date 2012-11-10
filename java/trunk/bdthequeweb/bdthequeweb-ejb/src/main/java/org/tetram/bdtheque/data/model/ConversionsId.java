package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * ConversionsId generated by hbm2java
 */
@Embeddable
public class ConversionsId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idConversion;
	private BigDecimal taux;
	private Date dcConversions;
	private Date dmConversions;
	private String monnaie1;
	private String monnaie2;

	public ConversionsId() {
	}

	public ConversionsId(String idConversion, Date dcConversions,
			Date dmConversions) {
		this.idConversion = idConversion;
		this.dcConversions = dcConversions;
		this.dmConversions = dmConversions;
	}

	public ConversionsId(String idConversion, BigDecimal taux,
			Date dcConversions, Date dmConversions, String monnaie1,
			String monnaie2) {
		this.idConversion = idConversion;
		this.taux = taux;
		this.dcConversions = dcConversions;
		this.dmConversions = dmConversions;
		this.monnaie1 = monnaie1;
		this.monnaie2 = monnaie2;
	}

	@Column(name = "ID_CONVERSION", unique = true, nullable = false, length = 38)
	public String getIdConversion() {
		return this.idConversion;
	}

	public void setIdConversion(String idConversion) {
		this.idConversion = idConversion;
	}

	@Column(name = "TAUX", precision = 5, scale = 5)
	public BigDecimal getTaux() {
		return this.taux;
	}

	public void setTaux(BigDecimal taux) {
		this.taux = taux;
	}

	@Column(name = "DC_CONVERSIONS", nullable = false, length = 19)
	public Date getDcConversions() {
		return this.dcConversions;
	}

	public void setDcConversions(Date dcConversions) {
		this.dcConversions = dcConversions;
	}

	@Column(name = "DM_CONVERSIONS", nullable = false, length = 19)
	public Date getDmConversions() {
		return this.dmConversions;
	}

	public void setDmConversions(Date dmConversions) {
		this.dmConversions = dmConversions;
	}

	@Column(name = "MONNAIE1", length = 5)
	public String getMonnaie1() {
		return this.monnaie1;
	}

	public void setMonnaie1(String monnaie1) {
		this.monnaie1 = monnaie1;
	}

	@Column(name = "MONNAIE2", length = 5)
	public String getMonnaie2() {
		return this.monnaie2;
	}

	public void setMonnaie2(String monnaie2) {
		this.monnaie2 = monnaie2;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ConversionsId))
			return false;
		ConversionsId castOther = (ConversionsId) other;

		return ((this.getIdConversion() == castOther.getIdConversion()) || (this
				.getIdConversion() != null
				&& castOther.getIdConversion() != null && this
				.getIdConversion().equals(castOther.getIdConversion())))
				&& ((this.getTaux() == castOther.getTaux()) || (this.getTaux() != null
						&& castOther.getTaux() != null && this.getTaux()
						.equals(castOther.getTaux())))
				&& ((this.getDcConversions() == castOther.getDcConversions()) || (this
						.getDcConversions() != null
						&& castOther.getDcConversions() != null && this
						.getDcConversions()
						.equals(castOther.getDcConversions())))
				&& ((this.getDmConversions() == castOther.getDmConversions()) || (this
						.getDmConversions() != null
						&& castOther.getDmConversions() != null && this
						.getDmConversions()
						.equals(castOther.getDmConversions())))
				&& ((this.getMonnaie1() == castOther.getMonnaie1()) || (this
						.getMonnaie1() != null
						&& castOther.getMonnaie1() != null && this
						.getMonnaie1().equals(castOther.getMonnaie1())))
				&& ((this.getMonnaie2() == castOther.getMonnaie2()) || (this
						.getMonnaie2() != null
						&& castOther.getMonnaie2() != null && this
						.getMonnaie2().equals(castOther.getMonnaie2())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getIdConversion() == null ? 0 : this.getIdConversion()
						.hashCode());
		result = 37 * result
				+ (getTaux() == null ? 0 : this.getTaux().hashCode());
		result = 37
				* result
				+ (getDcConversions() == null ? 0 : this.getDcConversions()
						.hashCode());
		result = 37
				* result
				+ (getDmConversions() == null ? 0 : this.getDmConversions()
						.hashCode());
		result = 37 * result
				+ (getMonnaie1() == null ? 0 : this.getMonnaie1().hashCode());
		result = 37 * result
				+ (getMonnaie2() == null ? 0 : this.getMonnaie2().hashCode());
		return result;
	}

}
