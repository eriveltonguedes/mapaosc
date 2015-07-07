package gov.sgpr.fgv.osc.portalosc.map.shared;

import gov.sgpr.fgv.osc.portalosc.map.shared.interfaces.SearchService;
import gov.sgpr.fgv.osc.portalosc.map.shared.interfaces.SearchServiceAsync;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.SearchResult;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.SearchResultType;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.google.gwt.core.client.GWT;
import com.google.gwt.junit.client.GWTTestCase;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * GWT JUnit <b>integration</b> tests must extend GWTTestCase. Using
 * <code>"GwtTest*"</code> naming pattern exclude them from running with
 * surefire during the test phase.
 * 
 * If you run the tests using the Maven command line, you will have to navigate
 * with your browser to a specific url given by Maven. See
 * http://mojo.codehaus.org/gwt-maven-plugin/user-guide/testing.html for
 * details.
 */
public class GwtTestSearchService extends GWTTestCase {

	private Logger logger = Logger.getLogger(this.getClass().getName());
	private int delayPeriod;
	private int schedulePeriod;
	private int limit;
	private String criteria1;
	private String criteria2;
	private String criteria3;
	private String criteria4;
	private String criteria5;
	private String criteria6;
	private SearchResult result1;
	private SearchResult result2;
	private SearchResult result3;
	private SearchResult result4;
	private SearchResult result5;
	private SearchResult result6;

	/**
	 * Must refer to a valid module that sources this class.
	 */
	public String getModuleName() {
		return "gov.sgpr.fgv.osc.portalosc.map.MapJUnit";
	}

	@Override
	protected void gwtSetUp() throws Exception {
		super.gwtSetUp();
		delayPeriod = 500;
		schedulePeriod = 100;
		limit = 5;
		// 192964;19719103000134;1;"ASSOCIACAO BENEFICENTE SAO CAMILO";"";"De 20 a 49";37;1;83572.54
		criteria1 = "19719103000134";
		result1 = new SearchResult();
		result1.setId(192964);
		result1.setValue("ASSOCIACAO BENEFICENTE SAO CAMILO");
		result1.setType(SearchResultType.OSC);
		// 192964;19719103000134;1;"ASSOCIACAO BENEFICENTE SAO CAMILO";"";"De 20 a 49";37;1;83572.54
		criteria2 = "SAO CAMILO";
		result2 = new SearchResult();
		result2.setId(192964);
		result2.setType(SearchResultType.OSC);
		result2.setValue("ASSOCIACAO BENEFICENTE SAO CAMILO");
		// São Paulo
		criteria3 = "SÃO PAULO";
		result3 = new SearchResult();
		result3.setId(3550308);
		result3.setValue("São Paulo");
		result3.setType(SearchResultType.COUNTY);
		// São Paulo
		criteria4 = "SÃO PAULO";
		result4 = new SearchResult();
		result4.setId(35);
		result4.setValue("São Paulo");
		result4.setType(SearchResultType.STATE);
		// SUDESTE
		criteria5 = "SUDESTE";
		result5 = new SearchResult();
		result5.setId(3);
		result5.setValue("Sudeste");
		result5.setType(SearchResultType.REGION);
		
		// cnpj 19.719.103/0001-34
		criteria6 = "19.719.103/0001-34";
		result6 = new SearchResult();
		result6.setId(192964);
		result6.setValue("ASSOCIACAO BENEFICENTE SAO CAMILO");
		result6.setType(SearchResultType.OSC);

	}

	@Override
	protected void gwtTearDown() throws Exception {
		super.gwtTearDown();
	}

	public void testSearch1() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				SearchServiceAsync searchService = GWT
						.create(SearchService.class);

				AsyncCallback<List<SearchResult>> callback = new AsyncCallback<List<SearchResult>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(List<SearchResult> result) {
						assertTrue(result.contains(result1));
						// tell the test system the test is now done
						finishTest();
					}
				};
				searchService.search(criteria1, limit, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
	public void testSearch2() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				SearchServiceAsync searchService = GWT
						.create(SearchService.class);

				AsyncCallback<List<SearchResult>> callback = new AsyncCallback<List<SearchResult>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(List<SearchResult> result) {
						assertTrue(result.contains(result2));
						// tell the test system the test is now done
						finishTest();
					}
				};
				searchService.search(criteria2, limit, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
	public void testSearch3() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				SearchServiceAsync searchService = GWT
						.create(SearchService.class);

				AsyncCallback<List<SearchResult>> callback = new AsyncCallback<List<SearchResult>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(List<SearchResult> result) {
						assertTrue(result.contains(result3));
						// tell the test system the test is now done
						finishTest();
					}
				};
				searchService.search(criteria3, limit, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
	public void testSearch4() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				SearchServiceAsync searchService = GWT
						.create(SearchService.class);

				AsyncCallback<List<SearchResult>> callback = new AsyncCallback<List<SearchResult>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(List<SearchResult> result) {
						assertTrue(result.contains(result4));
						// tell the test system the test is now done
						finishTest();
					}
				};
				searchService.search(criteria4, limit, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
	public void testSearch5() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				SearchServiceAsync searchService = GWT
						.create(SearchService.class);

				AsyncCallback<List<SearchResult>> callback = new AsyncCallback<List<SearchResult>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(List<SearchResult> result) {
						assertTrue(result.contains(result5));
						
						// tell the test system the test is now done
						finishTest();
					}
				};
				searchService.search(criteria5, limit, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
	
	public void testSearch6() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				SearchServiceAsync searchService = GWT
						.create(SearchService.class);

				AsyncCallback<List<SearchResult>> callback = new AsyncCallback<List<SearchResult>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(List<SearchResult> result) {
						assertTrue(result.contains(result6));
						
						// tell the test system the test is now done
						finishTest();
					}
				};
				searchService.search(criteria6, limit, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
}
