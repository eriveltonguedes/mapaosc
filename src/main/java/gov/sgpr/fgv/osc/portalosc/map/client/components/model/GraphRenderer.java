package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import com.google.gwt.user.client.ui.Widget;

/**
 * @author victor
 * 
 * Gráfico ou coleção de gráficos renderizáveis.
 *
 */
public interface GraphRenderer {
	/**
	 * @return O Widget que será renderizado na tela.
	 */
	public Widget getWidget();

}
