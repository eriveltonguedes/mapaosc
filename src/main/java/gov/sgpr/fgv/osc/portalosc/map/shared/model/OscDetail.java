package gov.sgpr.fgv.osc.portalosc.map.shared.model;

import java.io.Serializable;
import java.util.Arrays;

/**
 * Informações detalahdas da OSC apresentado no menu.
 * 
 * @author victor
 * 
 */
public class OscDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5657324285045834484L;

	private OscMain main;
	private WorkRelationship workRelationship;
	private Certifications certifications;
	private PublicResources publicResources;
	
	private Committees Committees;
	
	private String byLawPath = null;
	private String directorsBoardPath = null;
	private String treatyPath = null;
	private String accountabilityPath = null;
	private int recommendations = 0;
	private OscCoordinate coordinate;
	private Place[] places;
	private boolean recommended;
	/**
	 * @return TRUE se a OSC possui documento cadastrado no mapa
	 */
	public boolean hasDocuments() {
		return getByLawPath() != null || getDirectorsBoardPath() != null
				|| getTreatyPath() != null || getAccountabilityPath() != null;
	}

	public String getByLawPath() {
		return byLawPath;
	}

	public void setByLawPath(String byLawPath) {
		this.byLawPath = byLawPath;
	}

	public String getDirectorsBoardPath() {
		return directorsBoardPath;
	}

	public void setDirectorsBoardPath(String directorsBoardPath) {
		this.directorsBoardPath = directorsBoardPath;
	}

	public String getTreatyPath() {
		return treatyPath;
	}

	public void setTreatyPath(String treatyPath) {
		this.treatyPath = treatyPath;
	}

	public String getAccountabilityPath() {
		return accountabilityPath;
	}

	public void setAccountabilityPath(String accountabilityPath) {
		this.accountabilityPath = accountabilityPath;
	}

	public OscMain getMain() {
		return main;
	}

	public void setMain(OscMain main) {
		this.main = main;
	}

	public WorkRelationship getWorkRelationship() {
		return workRelationship;
	}

	public void setWorkRelationship(WorkRelationship workRelationship) {
		this.workRelationship = workRelationship;
	}

	public Certifications getCertifications() {
		return certifications;
	}

	public void setCertifications(Certifications certifications) {
		this.certifications = certifications;
	}

	public PublicResources getPublicResources() {
		return publicResources;
	}

	public void setPublicResources(PublicResources publicResources) {
		this.publicResources = publicResources;
	}

	public int getRecommendations() {
		return recommendations;
	}

	public void setRecommendations(int recommendations) {
		this.recommendations = recommendations;
	}

	public OscCoordinate getCoordinate() {
		return main.getCoordinate();
	}
	public DataSource getDocumentDataSource(){
		for (DataSource ds : publicResources.getDataSources()){
			if (ds.getId() == 13){
				return ds;
			}
		}
		return null;
	}

	public Place[] getPlaces() {
		return places;
	}

	public void setPlaces(Place[] places) {
		this.places = places;
	}

	
	public Committees getCommittees() {
		return Committees;
	}

	public void setCommittees(Committees Committees) {
		this.Committees = Committees;
	}

	public boolean isRecommended() {
		return recommended;
	}

	public void setRecommended(boolean recommended) {
		this.recommended = recommended;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((Committees == null) ? 0 : Committees.hashCode());
		result = prime
				* result
				+ ((accountabilityPath == null) ? 0 : accountabilityPath
						.hashCode());
		result = prime * result
				+ ((byLawPath == null) ? 0 : byLawPath.hashCode());
		result = prime * result
				+ ((certifications == null) ? 0 : certifications.hashCode());
		result = prime * result
				+ ((coordinate == null) ? 0 : coordinate.hashCode());
		result = prime
				* result
				+ ((directorsBoardPath == null) ? 0 : directorsBoardPath
						.hashCode());
		result = prime * result + ((main == null) ? 0 : main.hashCode());
		result = prime * result + Arrays.hashCode(places);
		result = prime * result
				+ ((publicResources == null) ? 0 : publicResources.hashCode());
		result = prime * result + recommendations;
		result = prime * result + (recommended ? 1231 : 1237);
		result = prime * result
				+ ((treatyPath == null) ? 0 : treatyPath.hashCode());
		result = prime
				* result
				+ ((workRelationship == null) ? 0 : workRelationship.hashCode());
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
		OscDetail other = (OscDetail) obj;
		if (Committees == null) {
			if (other.Committees != null)
				return false;
		} else if (!Committees.equals(other.Committees))
			return false;
		if (accountabilityPath == null) {
			if (other.accountabilityPath != null)
				return false;
		} else if (!accountabilityPath.equals(other.accountabilityPath))
			return false;
		if (byLawPath == null) {
			if (other.byLawPath != null)
				return false;
		} else if (!byLawPath.equals(other.byLawPath))
			return false;
		if (certifications == null) {
			if (other.certifications != null)
				return false;
		} else if (!certifications.equals(other.certifications))
			return false;
		if (coordinate == null) {
			if (other.coordinate != null)
				return false;
		} else if (!coordinate.equals(other.coordinate))
			return false;
		if (directorsBoardPath == null) {
			if (other.directorsBoardPath != null)
				return false;
		} else if (!directorsBoardPath.equals(other.directorsBoardPath))
			return false;
		if (main == null) {
			if (other.main != null)
				return false;
		} else if (!main.equals(other.main))
			return false;
		if (!Arrays.equals(places, other.places))
			return false;
		if (publicResources == null) {
			if (other.publicResources != null)
				return false;
		} else if (!publicResources.equals(other.publicResources))
			return false;
		if (recommendations != other.recommendations)
			return false;
		if (recommended != other.recommended)
			return false;
		if (treatyPath == null) {
			if (other.treatyPath != null)
				return false;
		} else if (!treatyPath.equals(other.treatyPath))
			return false;
		if (workRelationship == null) {
			if (other.workRelationship != null)
				return false;
		} else if (!workRelationship.equals(other.workRelationship))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OscDetail [main=" + main + ", workRelationship="
				+ workRelationship + ", certifications=" + certifications
				+ ", publicResources=" + publicResources + ", Committees="
				+ Committees + ", byLawPath=" + byLawPath
				+ ", directorsBoardPath=" + directorsBoardPath
				+ ", treatyPath=" + treatyPath + ", accountabilityPath="
				+ accountabilityPath + ", recommendations=" + recommendations
				+ ", coordinate=" + coordinate + ", places="
				+ Arrays.toString(places) + ", recommended=" + recommended
				+ "]";
	}


}
