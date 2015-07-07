package gov.sgpr.fgv.osc.portalosc.map.shared.model;

import java.io.Serializable;
import java.util.Arrays;

/**
 * Resumo da OSC apresentado no pin do mapa.
 * 
 * @author victor
 * 
 */
public class OscSummary implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6340713012325103579L;

	private int id;
	private String name;
	private int recommendations = 0;
	private String length;
	private Integer partnerships;
	private Double partnershipGlobalValue;
	private String legalTypeDescription;
	private Integer foundationYear;
	private boolean committeeParticipant;
	private Double encourageLawValue;
	private Certifications certifications;
	private DataSource[] dataSources = null;

	/**
	 * @return identificador da OSC
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            {@link #getId()}
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return Nome da OSC
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            {@link #getName()}
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return Quantidade de recomendações feitas à OSC
	 */
	public int getRecomendations() {
		return recommendations;
	}

	/**
	 * @param recomendations
	 *            {@link #getRecomendations()}
	 */
	public void setRecomendations(int recomendations) {
		this.recommendations = recomendations;
	}

	/**
	 * @return Tamanho (em número de vínculos) da OSC
	 */
	public String getLength() {
		return length;
	}

	/**
	 * @param length
	 *            {@link #getLength()}
	 */
	public void setLength(String length) {
		this.length = length;
	}

	/**
	 * @return Quantidade de parcerias com o governo federal feita OSC
	 */
	public Integer getPartnerships() {
		return partnerships;
	}

	/**
	 * @param partnerships
	 *            {@link #getPartnerships()}
	 */
	public void setPartnerships(Integer partnerships) {
		this.partnerships = partnerships;
	}

	/**
	 * @return Valor global das parcerias realizadas pela OSC com o governo
	 *         federal
	 */
	public Double getPartnershipGlobalValue() {
		return partnershipGlobalValue;
	}

	/**
	 * @param partnershipGlobalValue
	 *            {@link #getPartnershipGlobalValue()}
	 */
	public void setPartnershipGlobalValue(Double partnershipGlobalValue) {
		this.partnershipGlobalValue = partnershipGlobalValue;
	}

	public String getLegalTypeDescription() {
		return legalTypeDescription;
	}

	public void setLegalTypeDescription(String legalTypeDescription) {
		this.legalTypeDescription = legalTypeDescription;
	}

	public Integer getFoundationYear() {
		return foundationYear;
	}

	public void setFoundationYear(Integer foundationYear) {
		this.foundationYear = foundationYear;
	}

	public boolean isCommitteeParticipant() {
		return committeeParticipant;
	}

	public void setCommitteeParticipant(boolean committeeParticipant) {
		this.committeeParticipant = committeeParticipant;
	}

	public Certifications getCertifications() {
		return certifications;
	}

	public void setCertifications(Certifications certifications) {
		this.certifications = certifications;
	}
	
	public Double getEncourageLawValue() {
		return encourageLawValue;
	}

	public void setEncourageLawValue(Double encourageLawValue) {
		this.encourageLawValue = encourageLawValue;
	}

	/**
	 * @return Fontes de dados da Informação
	 */
	public DataSource[] getDataSources() {
		return dataSources;
	}

	/**
	 * @param dataSources {@link #getDataSources()}
	 */
	public void setDataSources(DataSource[] dataSources) {
		this.dataSources = dataSources;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((certifications == null) ? 0 : certifications.hashCode());
		result = prime * result + (committeeParticipant ? 1231 : 1237);
		result = prime * result + Arrays.hashCode(dataSources);
		result = prime
				* result
				+ ((encourageLawValue == null) ? 0 : encourageLawValue
						.hashCode());
		result = prime * result
				+ ((foundationYear == null) ? 0 : foundationYear.hashCode());
		result = prime * result + id;
		result = prime
				* result
				+ ((legalTypeDescription == null) ? 0 : legalTypeDescription
						.hashCode());
		result = prime * result + ((length == null) ? 0 : length.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime
				* result
				+ ((partnershipGlobalValue == null) ? 0
						: partnershipGlobalValue.hashCode());
		result = prime * result
				+ ((partnerships == null) ? 0 : partnerships.hashCode());
		result = prime * result + recommendations;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OscSummary other = (OscSummary) obj;
		if (certifications == null) {
			if (other.certifications != null)
				return false;
		} else if (!certifications.equals(other.certifications))
			return false;
		if (committeeParticipant != other.committeeParticipant)
			return false;
		if (!Arrays.equals(dataSources, other.dataSources))
			return false;
		if (encourageLawValue == null) {
			if (other.encourageLawValue != null)
				return false;
		} else if (!encourageLawValue.equals(other.encourageLawValue))
			return false;
		if (foundationYear == null) {
			if (other.foundationYear != null)
				return false;
		} else if (!foundationYear.equals(other.foundationYear))
			return false;
		if (id != other.id)
			return false;
		if (legalTypeDescription == null) {
			if (other.legalTypeDescription != null)
				return false;
		} else if (!legalTypeDescription.equals(other.legalTypeDescription))
			return false;
		if (length == null) {
			if (other.length != null)
				return false;
		} else if (!length.equals(other.length))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (partnershipGlobalValue == null) {
			if (other.partnershipGlobalValue != null)
				return false;
		} else if (!partnershipGlobalValue.equals(other.partnershipGlobalValue))
			return false;
		if (partnerships == null) {
			if (other.partnerships != null)
				return false;
		} else if (!partnerships.equals(other.partnerships))
			return false;
		if (recommendations != other.recommendations)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OscSummary [id=" + id + ", name=" + name + ", recomendations="
				+ recommendations + ", length=" + length + ", partnerships="
				+ partnerships + ", partnershipGlobalValue="
				+ partnershipGlobalValue + ", legalTypeDescription="
				+ legalTypeDescription + ", foundationYear=" + foundationYear
				+ ", committeeParticipant=" + committeeParticipant
				+ ", encourageLawValue=" + encourageLawValue
				+ ", certifications=" + certifications + ", dataSources="
				+ Arrays.toString(dataSources) + "]";
	}


}
