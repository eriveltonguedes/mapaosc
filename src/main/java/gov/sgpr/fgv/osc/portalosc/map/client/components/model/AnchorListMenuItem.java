/**
 * 
 */
package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Thassae
 * 
 */
public class AnchorListMenuItem extends AbstractMenuItem<Map<String, String>> {
	private String id;
	private String itemTitle;
	private String itemValue;
	private Map<String, String> listInfo = new LinkedHashMap<String, String>();
	private String infoSource;
	private String cssClass;
	private String titleToolTip;

	/**
	 * Construtor
	 */
	public AnchorListMenuItem(){
		
	}
	/**
	 * Construtor
	 * 
	 * @param values Valores que serão renderizados
	 */
	public AnchorListMenuItem(KeyValueRenderer<String, String> values){
		for (String key : values.getContent().keySet()){
			addInfo(key, values.getContent().get(key));
		}
	}
	@Override
	public String getItemTitle() {
		return this.itemTitle;
	}

	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}

	@Override
	public String getItemValue() {

		return itemValue;
	}

	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}

	@Override
	public Map<String, String> getContent() {
		return listInfo;
	}

	public void addInfo(String name, String anchor) {
		this.listInfo.put(name, anchor);
	}

	@Override
	public String getInfoSource() {
		return this.infoSource;
	}

	@Override
	public void setInfoSource(String infoSource) {
		this.infoSource = infoSource;
	}

	@Override
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;

	}

	@Override
	public String getCssClass() {
		return this.cssClass;

	}

	@Override
	public void setId(String id) {
		this.id = id;
		
	}

	@Override
	public String getId() {
		return id;
	}

	public String getTitleToolTip() {
		return titleToolTip;
	}

	public void setTitleToolTip(String titleToolTip) {
		this.titleToolTip = titleToolTip;
	}

}
