package gov.sgpr.fgv.osc.portalosc.map.client.components.model;

import java.util.HashMap;

public class SearchBoxItem {
private String searchCategory;
private HashMap<String,String> searchItems = new HashMap<String,String>();

public String getSearchCategory() {
	return searchCategory;
}

public void setSearchCategory(String searchCategory) {
	this.searchCategory = searchCategory;
}

public HashMap<String, String> getSearchItems() {
	return searchItems;
}

public void setSearchItems(HashMap<String, String> searchItems) {
	this.searchItems = searchItems;
}

}
