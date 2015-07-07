package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author thassae
 * 
 */
public class PaperClipKeyValueSection extends PaperClipAbstractSection<Map<String, String>> {

	private String sectionTitle;
	private LinkedHashMap<String, String> keyValueContent = new LinkedHashMap<String, String>();

	/**
	 * Adiciona um par chave/valor à seção.
	 * 
	 * @param key
	 *            A String que servirá como chave.
	 * @param value
	 *            A String que servirá como valor.
	 */
	public void addKeyValue(String key, String value) {
		this.keyValueContent.put(key, value);
	}

	/**
	 * Remove um par chave/valor da seção
	 * 
	 * @param key
	 *            A String chave.
	 */
	public void removeKeyValue(String key) {
		if (this.keyValueContent.containsKey(key)) {
			this.keyValueContent.remove(key);
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
	public Map<String, String> getSectionContent() {
		return keyValueContent;
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
