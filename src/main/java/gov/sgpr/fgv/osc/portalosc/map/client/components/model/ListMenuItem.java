/**
 * 
 */
package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Thassae
 * 
 */
public class ListMenuItem extends AbstractMenuItem<List<String>> {
	private String id;
	private String itemTitle;
	private String itemValue;
	private List<String> listInfo = new ArrayList<String>();
	private String infoSource;
	private String cssClass;
	private String titleToolTip;

	/**
	 * Construtor
	 */
	public ListMenuItem(){
		
	}
	/**
	 * Construtor
	 * 
	 * @param values Valores que serão renderizados
	 */
	public ListMenuItem(ListRenderer<String> values){
		for (String value : values.getContent()){
			addInfo(value);
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
	public List<String> getContent() {
		return listInfo;
	}

	public void addInfo(String value) {
		this.listInfo.add(value);
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
