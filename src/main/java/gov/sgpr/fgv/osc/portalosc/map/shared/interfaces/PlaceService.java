package gov.sgpr.fgv.osc.portalosc.map.shared.interfaces;

import gov.sgpr.fgv.osc.portalosc.map.shared.model.Place;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.PlaceType;
import gov.sgpr.fgv.osc.portalosc.user.shared.exception.RemoteException;

import java.util.SortedMap;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * Interface do Serviço que busca informações sobre as divisões geopoliticas.
 * 
 * @author victor
 * 
 */
@RemoteServiceRelativePath("placeService")
public interface PlaceService extends RemoteService {

	/**
	 * @param placeId
	 *            indentificador de uma localidade (Região, estado ou município)
	 * @return lista ordenada das localidades que pertencem a localidade passada
	 *         como parâmetro.
	 * @throws RemoteException
	 */
	Place[] getPlaces(int placeId) throws RemoteException;

	/**
	 * @param type
	 *            Tipo de Localidade (Região, estado ou município)
	 * @return lista ordenada com todas as localidades do tipo passado como
	 *         parâmetro.
	 * @throws RemoteException
	 */
	Place[] getPlaces(PlaceType type) throws RemoteException;

	/**
	 * @param placeId
	 *            código IBGE da localidade
	 * @return mapa com nome ordenado e id das OSCs que estão dentro da localidade.
	 * @throws RemoteException
	 */
	SortedMap<String, Integer> getOsc(int placeId, boolean all) throws RemoteException;
	
	/**
	 * @param placeId
	 *            código IBGE da localidade
	 * @return informações sobre a localidade.
	 * @throws RemoteException
	 */
	Place getPlaceInfo(int placeId) throws RemoteException;
	
	
	/**
	 * @param placeId
	 *            código IBGE da localidade
	 * @return informações sobre a localidade.
	 * @throws RemoteException
	 */
	Place[] getPlaceAncestorsInfo(int placeId) throws RemoteException;
}
