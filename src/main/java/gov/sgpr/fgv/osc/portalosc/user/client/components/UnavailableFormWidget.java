package gov.sgpr.fgv.osc.portalosc.user.client.components;

import java.util.logging.Logger;

import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.HTML;

/**
 * @author Victor Azevedo
 * 
 */
public class UnavailableFormWidget extends Composite {
	private final Logger logger = Logger.getLogger(this.getClass().getName());

	public UnavailableFormWidget() {
		initWidget(getHtml());
	}

	private HTML getHtml() {
		logger.info("Iniciando widget de cadastro indisponível.");
		StringBuilder htmlBuilder = new StringBuilder();
		htmlBuilder
				.append("<h3 class=\"b-redes\">Cadastro Indisponível</h3>");
		htmlBuilder.append("<div>");
		htmlBuilder
				.append("Este Cadastro está indisponível no momento. Aguarde as novas versões do mapa para realizar o seu cadastro ou utilize o cadastro padrão do mapa.");
		htmlBuilder.append("</div>");

		HTML html = new HTML(htmlBuilder.toString());
		return html;

	}

	public native void close() /*-{
		$wnd.jQuery.fancybox.close();
	}-*/;

	
}
