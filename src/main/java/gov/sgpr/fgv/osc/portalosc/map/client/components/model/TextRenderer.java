package gov.sgpr.fgv.osc.portalosc.map.client.components.model;


/**
 * @author victor
 * 
 * Interface que transforma um bean em um texto renderizável
 *
 */
public interface TextRenderer<T> {
	
	/**
	 * @return o conteúdo de um bean no formato de texto.
	 */
	public T getContent();

}
