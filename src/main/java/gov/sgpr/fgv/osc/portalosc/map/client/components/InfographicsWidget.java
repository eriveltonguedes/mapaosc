package gov.sgpr.fgv.osc.portalosc.map.client.components;

import gov.sgpr.fgv.osc.portalosc.map.client.components.model.GraphRenderer;
import gov.sgpr.fgv.osc.portalosc.map.client.components.model.Infographics;

import java.util.logging.Logger;

import com.google.gwt.dom.client.Element;
import com.google.gwt.user.client.DOM;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.HTML;

/**
 * @author victor Componente gráfico que apresenta os Infográficos na tela.
 */
public class InfographicsWidget extends Composite {
	private Logger logger = Logger.getLogger(this.getClass().getName());
	private Infographics info;

	/**
	 * Construtor
	 */
	public InfographicsWidget(Infographics info) {
		this.info = info;
		initWidget(getHtml(info));
	}

	@Override
	protected void onAttach() {
		super.onAttach();
		final Element div = DOM.getElementById("graphs");
		Grid grid = new Grid(info.getRowCount(), info.getColumnCount());
		for (int i = 0; i < info.getRowCount(); i++) {
			for (int j = 0; j < info.getColumnCount(); j++) {
				GraphRenderer g = info.getGraph(i, j);
				if (g != null) {
					grid.setWidget(i, j, g.getWidget());
				}
			}
		}
		div.appendChild(grid.getElement());
	}
	
	private HTML getHtml(Infographics info) {
		StringBuilder htmlBuilder = new StringBuilder();
		htmlBuilder.append("<h2>");
		htmlBuilder.append(info.getTitle());
		htmlBuilder.append("</h2>");
		htmlBuilder.append("<div id=\"graphs\"></div>");
		HTML html = new HTML(htmlBuilder.toString());
		return html;
	}

}
