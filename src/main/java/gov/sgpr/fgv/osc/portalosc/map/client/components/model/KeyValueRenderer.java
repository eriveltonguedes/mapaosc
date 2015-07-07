package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.Map;

/**
 * @author victor
 * 
 * Interface que transforma um bean em um mapa chave/valor
 *
 */
public interface KeyValueRenderer<K,V> {
	
	/**
	 * @return o conteúdo de um bean no formato chave-valor.
	 */
	public Map<K,V> getContent();

}
