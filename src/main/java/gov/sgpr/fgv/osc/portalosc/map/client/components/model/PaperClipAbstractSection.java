package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

/**
 * Classe abstrata que define os métodos a serem implementados pelas classes
 * "Section" a serem utilizadas pelo PaperClip
 * 
 * @author Thassae Santos
 * 
 */
public abstract class PaperClipAbstractSection<T> {

	/**
	 * Pega o título da seção.
	 * 
	 * @return O título da seção em formato String.
	 */
	public abstract String getSectionTitle();

	/**
	 * Define o título da seção.
	 * 
	 * @param sectionTitle
	 *            O título da seção.
	 */
	public abstract void setSectionTitle(String sectionTitle);

	/**
	 * Pega o conteúdo da seção
	 * 
	 * @return O conteúdo da seção em formato String.
	 */
	public abstract T getSectionContent();

}