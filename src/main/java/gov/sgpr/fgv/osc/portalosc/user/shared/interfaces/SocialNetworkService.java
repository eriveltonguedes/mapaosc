package gov.sgpr.fgv.osc.portalosc.user.shared.interfaces;

import java.sql.SQLException;

import gov.sgpr.fgv.osc.portalosc.user.shared.exception.RemoteException;
import gov.sgpr.fgv.osc.portalosc.user.shared.model.FacebookUser;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

@RemoteServiceRelativePath("socialNetworkService")
public interface SocialNetworkService extends RemoteService {

	/**
	 * @param user representa um usuário do facebook 
	 * @throws RemoteException
	 */
	public void addUser(FacebookUser user) throws RemoteException;

	/**
	 * @param uid identificador do usuário no facebook
	 * @return TRUE se o usuário existe na base de dados do Mapa.
	 * @throws RemoteException
	 */
	public boolean hasUser(FacebookUser user) throws RemoteException;

	/**
	 * @param userId identificador do usuário no facebook
	 * @param appToken identificador do token de acesso 
	 * @return  o email do usuário cadastrado no facebook
	 * @throws RemoteException
	 */
	
	public FacebookUser getAppAccessTokenAndUserInfo(String facebookUserCode,String urlUser) throws RemoteException;
	
	public String getFacebookAppId();

	public FacebookUser getFacebookuser(String email) throws RemoteException;
}
