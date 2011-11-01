package test.com.allurent.cleaner.model.domain
{
	import com.allurent.cleaner.model.domain.FlexProjectFolder;
	
	import flash.filesystem.File;
	
	import flexunit.framework.TestCase;
	
	import test.data.DataFactory;

	public class FlexProjectFolderTest extends TestCase
	{
		public function FlexProjectFolderTest(methodName:String=null)
		{
			super(methodName);
		}
		
		public function testConstructor() : void
		{
			var flexProjectFolder : FlexProjectFolder = new FlexProjectFolder( DataFactory.getTestProjectFolder() );
			assertNotNull("the project folder isn't null", flexProjectFolder.getFolder() );
			assertNotNull("the actionscript properties folder isn't null", flexProjectFolder.getASPropertiesFile() );
			
			
			var errorThrown : Boolean;
			try
			{
				flexProjectFolder =  new FlexProjectFolder( DataFactory.getUnusedSrcFolder() );
			}
			catch( e : Error ) 
			{
				errorThrown = true;
			}
			
			assertTrue("setting a folder that isn't a source folder throws an error", errorThrown );
		}
		
		public function testGetAsPropertiesFile() : void
		{
			var flexProjectFolder : FlexProjectFolder = new FlexProjectFolder( DataFactory.getTestProjectFolder() );
			var asPropertiesFile : File = flexProjectFolder.getASPropertiesFile();
			
			assertEquals("the filename is correct", FlexProjectFolder.ACTIONSCRIPT_PROPERTIES, asPropertiesFile.name );		
		}
		
	}
}