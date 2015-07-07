package gov.sgpr.fgv.osc.portalosc.user.shared.model;

public class RepresentantUser extends DefaultUser {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2427545050138580534L;
	/**
	 * 
	 */
	private int oscId;
	public int getOscId() {
		return oscId;
	}
	public void setOscId(int oscId) {
		this.oscId = oscId;
	}
	@Override
	public String toString() {
		return "RepresentantUser [oscId=" + oscId + "]";
	}
	
}
