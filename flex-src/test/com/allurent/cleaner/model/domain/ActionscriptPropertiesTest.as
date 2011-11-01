package test.com.allurent.cleaner.model.domain
{
	import com.allurent.cleaner.model.domain.ActionscriptProperties;
	import com.allurent.cleaner.model.domain.FlexApplication;
	
	import flexunit.framework.TestCase;
	
	import test.data.DataFactory;

	public class ActionscriptPropertiesTest extends TestCase
	{
		public function ActionscriptPropertiesTest(methodName:String=null)
		{
			super(methodName);
		}
		
		
		public function testConstructor() : void
		{
			var asProperties : ActionscriptProperties = 
						new ActionscriptProperties( DataFactory.getAsPropertiesFile() );
			
			assertEquals("2 applications have been read from the properties file", 2, asProperties.applications.length );
			assertEquals("The source folder has been set to 'flex-src'", "flex-src", asProperties.sourceFolderPath );
		}
		
		public function testAllApplicationsHaveLinkReports() : void
		{
			var asProperties : ActionscriptProperties = 
						new ActionscriptProperties( DataFactory.getAsPropertiesFile() );
			
			assertFalse("1: not all applications are covered by linkreports", asProperties.allApplicationsHaveLinkReports() );			

			var appOne : FlexApplication = asProperties.applications.getItemAt( 0 ) as FlexApplication;
			appOne.linkReport = DataFactory.getLinkReportForApplicationOne();
			
			assertFalse("2: not all applications are covered by linkreports", asProperties.allApplicationsHaveLinkReports() );			

			var appTwo : FlexApplication = asProperties.applications.getItemAt( 1 ) as FlexApplication;
			appTwo.linkReport = DataFactory.getLinkReportForApplicationTwo();
			
			assertTrue("now all the applications have link-reports", asProperties.allApplicationsHaveLinkReports() );			
		}	
		
		public function testIsPartOfApplicationClassPath() : void
		{
			//TODO
		}	
	}
}