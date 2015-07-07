/**
 * 
 */
package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

/**
 * @author thassae
 * 
 */
public class PaperClipSimpleSection extends PaperClipAbstractSection {
	private String sectionTitle;
	private String sectionContent;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.sgpr.fgv.osc.portalosc.map.shared.model.PaperClipAbstractSection#
	 * getSectionTitle()
	 */
	@Override
	public String getSectionTitle() {
		return sectionTitle;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.sgpr.fgv.osc.portalosc.map.shared.model.PaperClipAbstractSection#
	 * setSectionTitle(java.lang.String)
	 */
	@Override
	public void setSectionTitle(String sectionTitle) {
		this.sectionTitle = sectionTitle;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.sgpr.fgv.osc.portalosc.map.shared.model.PaperClipAbstractSection#
	 * getSectionContent()
	 */
	@Override
	public String getSectionContent() {
		return sectionContent;
	}

	/**
	 * Seta o conteúdo da seção. Pode ser texto puro ou HTML.
	 * 
	 * @param sectionContent
	 *            O conteúdo da seção.
	 */
	public void setSectionContent(String sectionContent) {
		this.sectionContent = sectionContent;
	}

}
