/**
 * 
 */
package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

/**
 * @author Thassae
 * 
 */
public class SimpleTextMenuItem extends AbstractMenuItem<String> {
	private String id;
	private String itemTitle;
	private String itemValue;
	private String itemInfo;
	private String infoSource;
	private String cssClass;
	private String titleToolTip;

	/**
	 * Construtor
	 */
	public SimpleTextMenuItem() {

	}

	/**
	 * Construtor
	 * 
	 * @param values
	 *            Valores que serão renderizados
	 */
	public SimpleTextMenuItem(TextRenderer<String> value) {
		setInfo(value.getContent());
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
		return this.itemValue;
	}

	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}

	@Override
	public String getContent() {
		return this.itemInfo;
	}

	public void setInfo(String menuInfo) {
		this.itemInfo = menuInfo;
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
