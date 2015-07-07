package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

/**
 * Adiciona as informações básicas à um MagnetPaperClipWidget
 * 
 * @author Thassae Santos
 * 
 */
public class PaperClipWindowInfo {

	private String title;
	private String subTitle;
	private String cssClass;
	private int likeCounter;
	private String footer;
	private String footerToolTip;

	/**
	 * Pega o título do PaperClip.
	 * 
	 * @return O título do PaperClip.
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Seta o título do PaperClip
	 * 
	 * @param title
	 *            O título do PaperClip.
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * Pega o sub-título do PaperClip.
	 * 
	 * @return O sub-título do PaperClip.
	 */
	public String getSubTitle() {
		return subTitle;
	}

	/**
	 * Seta o sub-título do PaperClip.
	 * 
	 * @param subTitle
	 *            O sub-título do PaperClip.
	 */
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	/**
	 * Pega a contagem de "curtidas" do PaperClip.
	 * 
	 * @return O número de "curtidas" do PaperClip.
	 */
	public int getLikeCounter() {
		return likeCounter;
	}

	/**
	 * Seta o número de "curtidas" do PaperClip.
	 * 
	 * @param likeCounter
	 *            A quantidade de "curtidas" do PaperClip.
	 */
	public void setLikeCounter(int likeCounter) {
		this.likeCounter = likeCounter;
	}

	/**
	 * Pega o nome da classe CSS que formata o PaperClip.
	 * 
	 * @return A classe CSS associada ao PaperClip.
	 */
	public String getCssClass() {
		return cssClass;
	}

	/**
	 * Seta o nome da classe CSS que formatará o PaperClip.
	 * 
	 * @param cssClass
	 *            O nome da classe CSS que irá formatar o PaperClip.
	 */
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	/**
	 * @return Rodapé do componente. Geralmente apresenta os metadados dos dados apresentados
	 */
	public String getFooter() {
		return footer;
	}

	/**
	 * @param footer {@link #getFooter()}
	 */
	public void setFooter(String footer) {
		this.footer = footer;
	}

	/**
	 * @return Tooltip de explicação do rodapé
	 */
	public String getFooterToolTip() {
		return footerToolTip;
	}

	/**
	 * @param footerToolTip {@link #getFooterToolTip()}
	 */
	public void setFooterToolTip(String footerToolTip) {
		this.footerToolTip = footerToolTip;
	}
	
}
