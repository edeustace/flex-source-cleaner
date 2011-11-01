package test.com.allurent.sizing.model
{
	
	import com.allurent.cleaner.model.domain.FlexApplication;
	
	import flash.filesystem.File;
	
	import flexunit.framework.TestCase;

	public class FlexApplicationModelTest extends TestCase
	{
		private var applicationOneFile : File;
		private var applicationTwoFile : File;
		
		public function FlexApplicationModelTest(methodName:String=null)
		{
			super(methodName);
		}
		
		override public function setUp() : void
		{
			applicationOneFile = File.applicationDirectory.resolvePath("test/data/ApplicationOne_link-report.xml");
			applicationTwoFile = File.applicationDirectory.resolvePath("test/data/ApplicationTwo_link-report.xml");
		}
		
		public function testSetLinkReport_badLinkReport() : void
		{
			var model : FlexApplication = new FlexApplication( "ApplicationOne.mxml" );
			var errorThrown : Boolean;
			
			try
			{
				model.linkReport = applicationTwoFile;
			}
			catch( error : Error ) 
			{
				errorThrown = true;
			}
			assertTrue( "error was thrown", errorThrown );
		}
		
		public function testSetLinkReport_goodLinkReport() : void
		{
			var model : FlexApplication = new FlexApplication( "ApplicationOne.mxml" );
			var errorThrown : Boolean;
			
			try
			{
				model.linkReport = applicationOneFile;
			}
			catch( error : Error ) 
			{
				errorThrown = true;
			}
			assertFalse( "error was not thrown", errorThrown );
		}
		
	}
}