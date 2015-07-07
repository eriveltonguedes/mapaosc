package gov.sgpr.fgv.osc.portalosc.prototype.client;


import java.util.logging.Logger;

import com.google.gwt.junit.client.GWTTestCase;

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
public class GwtTestPrototype extends GWTTestCase {

	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(this.getClass().getName());
	/**
	 * Must refer to a valid module that sources this class.
	 */
	public String getModuleName() {
		return "gov.sgpr.fgv.osc.portalosc.prototype.PrototypeJUnit";
	}

	public void testOne()
	{
		assertTrue(true);
	}

}
