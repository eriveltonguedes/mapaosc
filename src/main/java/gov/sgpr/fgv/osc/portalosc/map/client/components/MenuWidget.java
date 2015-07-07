package gov.sgpr.fgv.osc.portalosc.map.client.components;

import gov.sgpr.fgv.osc.portalosc.map.client.components.model.AbstractMenuItem;

import java.util.ArrayList;
import java.util.List;

import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.Panel;

public class MenuWidget extends Composite {

	private List<AbstractMenuItem> menuItems = new ArrayList<AbstractMenuItem>();

	public MenuWidget(List<AbstractMenuItem> menuItems) {
		this.menuItems = menuItems;
		Panel itens = new FlowPanel();
		for (AbstractMenuItem item : menuItems) {
			MenuItemWidget widget = new MenuItemWidget(item);
			itens.add(widget);
		}
		initWidget(itens);
	}
}
