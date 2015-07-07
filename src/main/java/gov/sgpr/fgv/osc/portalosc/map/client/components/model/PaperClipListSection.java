package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Thassae Santos
 * 
 */
public class PaperClipListSection extends PaperClipAbstractSection<List<String>> {

	private String sectionTitle;
	private List<String> list = new ArrayList<String>();

	/**
	 * Adiciona um elemento String à seção.
	 * 
	 * @param element
	 *            O elemento a ser adicionado.
	 */
	public void addElementToList(String element) {
		this.list.add(element);
	}

	/**
	 * Remove um elemento String da seção
	 * 
	 * @param element
	 *            O elemento a ser removido.
	 */
	public void removeElementFromList(String element) {
		if (this.list.contains(element)) {
			this.list.remove(element);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.sgpr.fgv.osc.portalosc.map.shared.model.PaperClipAbstractSection#
	 * getSectionContent()
	 */
	@Override
	public List<String> getSectionContent() {
		return list;
	}

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

}
