/**
 * 
 */
package gov.sgpr.fgv.osc.portalosc.user.shared.interfaces;

import gov.sgpr.fgv.osc.portalosc.user.shared.exception.RemoteException;
import gov.sgpr.fgv.osc.portalosc.user.shared.model.DefaultUser;
import gov.sgpr.fgv.osc.portalosc.user.shared.model.RepresentantUser;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * @author victor
 * 
 *         Interface de acesso ao serviço de cadastro de usuários
 * 
 */
@RemoteServiceRelativePath("userService")
public interface UserService extends RemoteService {

	/**
	 * Adiciona um usuário no banco de dados
	 * 
	 * @param user
	 *            usuário a ser adicionado
	 */
	public void addUser(DefaultUser user) throws RemoteException;

	/**
	 * @param email
	 *            Endereço de email do usuário
	 * @return usuário cadastrado no portal. NULL se não existir usuário com
	 *         este email.
	 */
	public DefaultUser getUser(String email) throws RemoteException;

	/**
	 * @param cpf
	 *            CPF do usuário
	 * @return usuário cadastrado no portal. NULL se não existir usuário com
	 *         este email.
	 */
	public DefaultUser getUser(long cpf) throws RemoteException;

	/**
	 * Atualiza as informações de um usuário no banco de dados
	 * 
	 * @param user
	 *            usuário a ser atualizado
	 */
	public void updateUser(DefaultUser user) throws RemoteException;

	/**
	 * @return Chave de criptografia
	 * @throws RemoteException
	 */
	public Byte[] getEncryptKey() throws RemoteException;
	
	public  RepresentantUser getRepresentantUser(String email) throws RemoteException;

	/**
	 * Adiciona um usuário no banco de dados
	 * 
	 * @param user
	 *           representante OSC a ser cadastrado
	 */
	public void addRepresentantUser(RepresentantUser user) throws RemoteException;
}
