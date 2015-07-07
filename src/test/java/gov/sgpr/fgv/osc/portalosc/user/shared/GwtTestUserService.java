package gov.sgpr.fgv.osc.portalosc.user.shared;

import gov.sgpr.fgv.osc.portalosc.user.shared.interfaces.UserService;
import gov.sgpr.fgv.osc.portalosc.user.shared.interfaces.UserServiceAsync;
import gov.sgpr.fgv.osc.portalosc.user.shared.model.DefaultUser;
import gov.sgpr.fgv.osc.portalosc.user.shared.model.UserType;

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
public class GwtTestUserService extends GWTTestCase {

	private Logger logger = Logger.getLogger(this.getClass().getName());
	private int delayPeriod;
	private int schedulePeriod;
	private DefaultUser user1;
	private DefaultUser user2;

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
		user1 = new DefaultUser();
		long cpf = Long.parseLong("02201210799");
		user1.setCpf(cpf);
		user1.setEmail("vhmeirelles@gmail.com");
		user1.setMailingListMember(true);
		user1.setName("Victor Azevedo");
		user1.setPassword("Y4rTe450OKjhrtInrtP)rt65%923");
		user1.setType(UserType.DEFAULT);

		user2 = new DefaultUser();
		user2.setCpf(cpf);
		user2.setEmail("vhmeirelles@gmail.com");
		user2.setMailingListMember(false);
		user2.setName("Victor Hugo Meirelles");
		user2.setPassword("Y4rTe450OKjGTYUOIhrtInrtP)rt65%923");
		user2.setType(UserType.OSC_AGENT);
	}

	@Override
	protected void gwtTearDown() throws Exception {
		super.gwtTearDown();
	}

	public void testAddUser() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				UserServiceAsync userService = GWT.create(UserService.class);

				AsyncCallback<Void> callback = new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(Void result) {
						// tell the test system the test is now done
						finishTest();
					}
				};
				userService.addUser(user1, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}

	public void testGetUser() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				UserServiceAsync userService = GWT.create(UserService.class);

				AsyncCallback<DefaultUser> callback = new AsyncCallback<DefaultUser>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(DefaultUser result) {
						user1.setId(result.getId());
						assertEquals(user1, result);
						// tell the test system the test is now done
						finishTest();
					}
				};
				userService.getUser(user1.getEmail(), callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
	public void testUpdateUser() {
		// Setup an asynchronous event handler.
		Timer timer = new Timer() {
			public void run() {
				// do some validation logic
				UserServiceAsync userService = GWT.create(UserService.class);

				AsyncCallback<Void> callback = new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						logger.log(Level.SEVERE, caught.getMessage());
						caught.printStackTrace();
					}

					public void onSuccess(Void result) {
						// tell the test system the test is now done
						finishTest();
					}
				};
				userService.updateUser(user2, callback);
			}
		};

		// Set a delay period significantly longer than the
		// event is expected to take.
		delayTestFinish(delayPeriod);

		// Schedule the event and return control to the test system.
		timer.schedule(schedulePeriod);
	}
}
