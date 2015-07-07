package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

public enum Infographic {
	OSC_NUMEROS("I01"), OSC_RECURSOS("I02"), NATUREZA_JURIDICA("I03");

	private final String id;

	Infographic(String id) {
		this.id = id;
	}

	public String id() {
		return id;
	}

	public static Infographic get(String id) {
		for (Infographic info : values()) {
			if (info.id.equals(id)) {
				return info;
			}
		}
		return null;
	}
}
