package gov.sgpr.fgv.osc.portalosc.map.shared.model;

public class OscMenuSummary {
	private String imageUrl;
	private String title;
	private int likeCounter;
    private boolean recommended;
    private int oscId;
    
	/**
	 * @return the imageUrl
	 */
	public String getImageUrl() {
		return imageUrl;
	}

	/**
	 * @param imageUrl
	 *            the imageUrl to set
	 */
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the likeCounter
	 */
	public int getLikeCounter() {
		return likeCounter;
	}

	/**
	 * @param likeCounter
	 *            the likeCounter to set
	 */
	public void setLikeCounter(int likeCounter) {
		this.likeCounter = likeCounter;
	}

	public boolean isRecommended() {
		return recommended;
	}

	public void setRecommended(boolean recommended) {
		this.recommended = recommended;
	}

	public int getOscId() {
		return oscId;
	}

	public void setOscId(int oscId) {
		this.oscId = oscId;
	}

}
