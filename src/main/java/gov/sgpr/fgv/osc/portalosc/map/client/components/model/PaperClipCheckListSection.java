package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Thassae Santos
 * 
 */
public class PaperClipCheckListSection extends
		PaperClipAbstractSection<Map<String, Boolean>> {

	private String sectionTitle;
	private Map<String, Boolean> checkList = new LinkedHashMap<String, Boolean>();

	/**
	 * Adiciona um elemento String à seção.
	 * 
	 * @param element
	 *            O elemento a ser adicionado.
	 */
	public void addElementToList(String element, boolean checked) {
		this.checkList.put(element, checked);
	}

	/**
	 * Remove um elemento String da seção
	 * 
	 * @param element
	 *            O elemento a ser removido.
	 */
	public void removeElementFromList(String element) {
		if (this.checkList.containsKey(element)) {
			this.checkList.remove(element);
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
	public Map<String, Boolean> getSectionContent() {
		return checkList;
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
