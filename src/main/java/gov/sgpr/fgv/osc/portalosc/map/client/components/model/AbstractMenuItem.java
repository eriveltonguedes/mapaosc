package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

public abstract class AbstractMenuItem<T> {
	public abstract void setId(String id);
	public abstract String getId();
	public abstract String getItemTitle();
	public abstract String getTitleToolTip();
	public abstract void setTitleToolTip(String toolTip);
	public abstract String getItemValue();
	public abstract T getContent();
	public abstract String getInfoSource();
	public abstract void setInfoSource(String infoSource);
	public abstract void setCssClass(String cssClass);
	public abstract String getCssClass();
}

