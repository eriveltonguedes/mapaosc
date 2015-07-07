/**
 * 
 */
package gov.sgpr.fgv.osc.portalosc.map.server;

import gov.sgpr.fgv.osc.portalosc.map.shared.interfaces.SearchService;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.SearchResult;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.SearchResultType;
import gov.sgpr.fgv.osc.portalosc.user.server.RemoteServiceImpl;
import gov.sgpr.fgv.osc.portalosc.user.shared.exception.RemoteException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.apache.commons.lang.StringUtils;

/**
 * @author victor Serviço de Busca do mapa
 * 
 */
public class SearchServiceImpl extends RemoteServiceImpl implements
		SearchService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2944399891133442097L;

	private Logger logger = Logger.getLogger(this.getClass().getName());

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * gov.sgpr.fgv.osc.portalosc.map.shared.interfaces.SearchService#search
	 * (java.lang.String)
	 */
	public List<SearchResult> search(String criteria, int limit)
			throws RemoteException {
		List<SearchResult> result = new ArrayList<SearchResult>();

		// Busca por cnpj
		String criteria1 = criteria;
		// criteria1 = criteria1.replaceAll("\\D","");
		criteria1 = criteria1.replace(".", "");
		criteria1 = criteria1.replace("-", "");
		criteria1 = criteria1.replace("/", "");

		if (StringUtils.isNumeric(criteria1.trim())) {
			List<SearchResult> ret = searchOscByCode(Long.valueOf(criteria1),
					limit);
			result.addAll(ret);
			if (result.size() == limit) {
				return result;
			}
		}
		// Busca por Região
		int newLimit = limit - result.size();
		List<SearchResult> ret = searchRegionByName(criteria, newLimit);
		result.addAll(ret);
		if (result.size() == limit) {
			return result;
		}
		// Busca por uf
		newLimit = limit - result.size();
		ret = searchStateByName(criteria, newLimit);
		result.addAll(ret);
		if (result.size() == limit) {
			return result;
		}
		// Busca por município
		newLimit = limit - result.size();
		ret = searchCountyByName(criteria, newLimit);
		result.addAll(ret);
		if (result.size() == limit) {
			return result;
		}

		// Busca por nome Completo da OSC
		newLimit = limit - result.size();
		ret = searchOscByFullName(criteria, newLimit);
		result.addAll(ret);
		if (result.size() == limit) {
			return result;
		}

		// Busca por nome fantasia da OSC
		newLimit = limit - result.size();
		ret = searchOscByFantasyName(criteria, newLimit);
		result.addAll(ret);
		if (result.size() == limit) {
			return result;
		}

		// Busca por nome da OSC
		newLimit = limit - result.size();
		ret = searchOscByName(criteria, newLimit);
		result.addAll(ret);

		return result;
	}

	private List<SearchResult> searchOscByCode(long code, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT a.bosc_sq_osc, COALESCE(a.bosc_nm_fantasia_osc, a.bosc_nm_osc) nome  "
				+ "FROM portal.vm_osc_principal a JOIN portal.tb_osc_interacao b ON (a.bosc_sq_osc = b.bosc_sq_osc)"
				+ "WHERE b.inte_in_ativa = true AND b.inte_in_osc = true AND "
				+ "CAST(a.bosc_nr_identificacao as character varying) like ? ORDER BY a.bosc_nr_identificacao LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String value = "%" + code + "%";
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("bosc_sq_osc"));
				sr.setValue(rs.getString("nome"));
				sr.setType(SearchResultType.OSC);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

	private List<SearchResult> searchOscByFullName(String name, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT a.bosc_sq_osc, a.bosc_nm_osc  "
				+ "FROM portal.vm_osc_principal a JOIN portal.tb_osc_interacao b ON (a.bosc_sq_osc = b.bosc_sq_osc)"
				+ "WHERE b.inte_in_ativa = true AND b.inte_in_osc = true AND "
				+ "UPPER(unaccent(a.bosc_nm_osc)) = (unaccent(?)) ORDER BY a.bosc_nm_osc LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String normalized = Normalizer.normalize(name, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String value = normalized.toUpperCase();
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("bosc_sq_osc"));
				sr.setValue(rs.getString("bosc_nm_osc"));
				sr.setType(SearchResultType.OSC);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

	private List<SearchResult> searchOscByFantasyName(String name, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT a.bosc_sq_osc, a.bosc_nm_fantasia_osc  "
				+ "FROM portal.vm_osc_principal a JOIN portal.tb_osc_interacao b ON (a.bosc_sq_osc = b.bosc_sq_osc)"
				+ "WHERE b.inte_in_ativa = true AND b.inte_in_osc = true AND "
				+ "UPPER(unaccent(a.bosc_nm_fantasia_osc)) like ? ORDER BY a.bosc_nm_fantasia_osc LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String normalized = Normalizer.normalize(name, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String value = "%" + normalized.toUpperCase() + "%";
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("bosc_sq_osc"));
				sr.setValue(rs.getString("bosc_nm_fantasia_osc"));
				sr.setType(SearchResultType.OSC);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

	private List<SearchResult> searchOscByName(String name, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT a.bosc_sq_osc, a.bosc_nm_osc  "
				+ "FROM portal.vm_osc_principal a JOIN portal.tb_osc_interacao b ON (a.bosc_sq_osc = b.bosc_sq_osc)"
				+ "WHERE b.inte_in_ativa = true AND b.inte_in_osc = true AND "
				+ "UPPER(unaccent(a.bosc_nm_osc)) like (unaccent(?)) ORDER BY a.bosc_nm_osc LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String normalized = Normalizer.normalize(name, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String value = "%" + normalized.toUpperCase() + "%";
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("bosc_sq_osc"));
				sr.setValue(rs.getString("bosc_nm_osc"));
				sr.setType(SearchResultType.OSC);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

	private List<SearchResult> searchRegionByName(String name, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT edre_cd_regiao, edre_nm_regiao  FROM spat.ed_regiao "
				+ "WHERE UPPER(unaccent(edre_nm_regiao)) like ? ORDER BY edre_nm_regiao LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String normalized = Normalizer.normalize(name, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String value = "%" + normalized.toUpperCase() + "%";
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("edre_cd_regiao"));
				sr.setValue(rs.getString("edre_nm_regiao"));
				sr.setType(SearchResultType.REGION);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

	private List<SearchResult> searchStateByName(String name, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT eduf_cd_uf, eduf_nm_uf  FROM spat.ed_uf "
				+ "WHERE UPPER(unaccent(eduf_nm_uf)) like ? ORDER BY eduf_nm_uf LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String normalized = Normalizer.normalize(name, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String value = "%" + normalized.toUpperCase() + "%";
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("eduf_cd_uf"));
				sr.setValue(rs.getString("eduf_nm_uf"));
				sr.setType(SearchResultType.STATE);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

	private List<SearchResult> searchCountyByName(String name, int limit)
			throws RemoteException {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT edmu_cd_municipio, edmu_nm_municipio  FROM spat.ed_municipio "
				+ "WHERE UPPER(unaccent(edmu_nm_municipio)) like ? ORDER BY edmu_nm_municipio LIMIT ? ";

		// logger.info(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			String normalized = Normalizer.normalize(name, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String value = "%" + normalized.toUpperCase() + "%";
			pstmt.setString(1, value);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			List<SearchResult> result = new ArrayList<SearchResult>();
			while (rs.next()) {
				SearchResult sr = new SearchResult();
				sr.setId(rs.getInt("edmu_cd_municipio"));
				sr.setValue(rs.getString("edmu_nm_municipio"));
				sr.setType(SearchResultType.COUNTY);
				result.add(sr);
			}
			return result;

		} catch (SQLException e) {
			logger.severe(e.getMessage());
			throw new RemoteException(e);
		} finally {
			releaseConnection(conn, pstmt, rs);
		}
	}

}
