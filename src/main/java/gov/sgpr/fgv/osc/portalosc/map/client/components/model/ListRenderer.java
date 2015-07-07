package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.List;

/**
 * @author victor
 * 
 * Interface que transforma um bean em uma lista renderizável
 *
 */
public interface ListRenderer<K> {
	
	/**
	 * @return o conteúdo de um bean no formato de lista.
	 */
	public List<K> getContent();

}
