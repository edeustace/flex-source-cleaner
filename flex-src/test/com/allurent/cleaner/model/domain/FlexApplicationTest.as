package test.com.allurent.cleaner.model.domain
{
	import com.allurent.cleaner.model.domain.FlexApplication;
	
	import flash.filesystem.File;
	
	import flexunit.framework.TestCase;
	
	import test.data.DataFactory;

	public class FlexApplicationTest extends TestCase
	{
		public function FlexApplicationTest(methodName:String=null)
		{
			super(methodName);
		}
		
		public function testSetLinkReport() : void
		{
			var flexApp : FlexApplication = new FlexApplication( "ApplicationOne.mxml" );
			var linkReport : File = DataFactory.getLinkReportForApplicationOne();
			
			var errorThrown : Boolean ;
			
			try
			{
				flexApp.linkReport = linkReport;
			}
			catch( e : Error )
			{
				errorThrown = true;
			}		
			assertFalse( "no error was thrown", errorThrown );
			assertEquals("the link report was set successfully", linkReport.name, flexApp.linkReportName );
			
			var linkReportTwo : File;
			try
			{
				flexApp.linkReport = linkReportTwo;
			}
			catch( e : Error )
			{
				errorThrown = true;
			}		
			assertTrue( "an error was thrown", errorThrown );
			
			
		}
	}
}