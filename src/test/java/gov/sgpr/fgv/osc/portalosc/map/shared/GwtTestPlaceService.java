package gov.sgpr.fgv.osc.portalosc.map.shared;

import gov.sgpr.fgv.osc.portalosc.map.shared.interfaces.PlaceService;
import gov.sgpr.fgv.osc.portalosc.map.shared.interfaces.PlaceServiceAsync;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.Place;
import gov.sgpr.fgv.osc.portalosc.map.shared.model.PlaceType;

import java.util.SortedMap;
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
public class GwtTestPlaceService extends GWTTestCase {

	private Logger logger = Logger.getLogger(this.getClass().getName());
	private int delayPeriod;
	private int schedulePeriod;
	private int countyId;
	private int regionId;
	private int countySize;
	private int regionSize;
	private int sp;
	private int spSize;

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
		countyId = 23;
		regionId = 2;
		countySize = 184;
		regionSize = 9;
		sp = 3550308;
		spSize = 270;
	}

	@Override
	protected void gwtTearDown() throws Exception {
		super.gwtTearDown();
	}

	public void testGetPlacesById1() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				PlaceServiceAsync placeService = GWT.create(PlaceService.class);

				AsyncCallback<Place[]> callback = new AsyncCallback<Place[]>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(Place[] result) {
						assertEquals(regionSize, result.length);
						// tell the test system the test is now done
						finishTest();
					}
				};
				placeService.getPlaces(regionId, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}

	public void testGetPlacesById2() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				PlaceServiceAsync placeService = GWT.create(PlaceService.class);

				AsyncCallback<Place[]> callback = new AsyncCallback<Place[]>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(Place[] result) {
						assertEquals(countySize, result.length);
						// tell the test system the test is now done
						finishTest();
					}
				};
				placeService.getPlaces(countyId, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}

	public void testGetPlacesByType() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				PlaceServiceAsync placeService = GWT.create(PlaceService.class);

				AsyncCallback<Place[]> callback = new AsyncCallback<Place[]>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(Place[] result) {
						assertEquals(5, result.length);
						// tell the test system the test is now done
						finishTest();
					}
				};
				placeService.getPlaces(PlaceType.REGION, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}

	public void testGetOsc() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				PlaceServiceAsync placeService = GWT.create(PlaceService.class);

				AsyncCallback<SortedMap<String, Integer>> callback = new AsyncCallback<SortedMap<String, Integer>>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(SortedMap<String, Integer> result) {
						assertEquals(spSize, result.size());
						// tell the test system the test is now done
						finishTest();
					}
				};
				placeService.getOsc(sp, false, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
}
