package gov.sgpr.fgv.osc.portalosc.map.shared.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author victor
 * 
 * Fonte de dados das informações das OSCs
 *
 */
public class DataSource implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7976384828380045980L;
	private int id;
	private String acronym;
	private String name;
	private Date acquisitionDate;
	private String siteURL;
	
	/**
	 * @return Identificador da fonte
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id {@link #getId()}
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return Sigla da Fonte de dados
	 */
	public String getAcronym() {
		return acronym;
	}
	/**
	 * @param acronym {@link #getAcronym()}
	 */
	public void setAcronym(String acronym) {
		this.acronym = acronym;
	}
	/**
	 * @return Nome da fonte de dados
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name {@link #getName()}
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return Data de aquisição dos dados junto a fonte.
	 */
	public Date getAcquisitionDate() {
		return acquisitionDate;
	}
	/**
	 * @param acquisitionDate {@link #getAcquisitionDate()}
	 */
	public void setAcquisitionDate(Date acquisitionDate) {
		this.acquisitionDate = acquisitionDate;
	}
	/**
	 * @return Endereço do site da fonte. 
	 */
	public String getSiteURL() {
		return siteURL;
	}
	/**
	 * @param siteURL {@link #getSiteURL()}
	 */
	public void setSiteURL(String siteURL) {
		this.siteURL = siteURL;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((acquisitionDate == null) ? 0 : acquisitionDate.hashCode());
		result = prime * result + ((acronym == null) ? 0 : acronym.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((siteURL == null) ? 0 : siteURL.hashCode());
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
		DataSource other = (DataSource) obj;
		if (acquisitionDate == null) {
			if (other.acquisitionDate != null)
				return false;
		} else if (!acquisitionDate.equals(other.acquisitionDate))
			return false;
		if (acronym == null) {
			if (other.acronym != null)
				return false;
		} else if (!acronym.equals(other.acronym))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (siteURL == null) {
			if (other.siteURL != null)
				return false;
		} else if (!siteURL.equals(other.siteURL))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "DataSource [id=" + id + ", acronym=" + acronym + ", name="
				+ name + ", acquisitionDate=" + acquisitionDate + ", siteURL="
				+ siteURL + "]";
	}
	

}
