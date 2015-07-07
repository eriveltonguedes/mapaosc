package gov.sgpr.fgv.osc.portalosc.user.shared;

import junit.framework.Test;
import junit.framework.TestSuite;

import com.google.gwt.junit.tools.GWTTestSuite;

public class GwtTestUser extends GWTTestSuite {
	  public static Test suite() {
	    TestSuite suite = new TestSuite("Teste dos serviços de usuário");
	    suite.addTestSuite(GwtTestUserService.class); 
	    return suite;
	  }
	}
