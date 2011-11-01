package test.com.allurent.cleaner.model.domain
{
	import com.allurent.cleaner.model.domain.Cleaner;
	
	import flash.filesystem.File;
	
	import flexunit.framework.TestCase;
	
	import test.data.DataFactory;

	public class CleanerTest extends TestCase
	{
		private var cleaner : Cleaner;
		
		public function CleanerTest(methodName:String=null)
		{
			super(methodName);
		}
		
		public function testMoveLocationChosen() : void
		{
			var cleaner : Cleaner = new Cleaner();
			var mockProjectFolder : File = File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject/unused-src" );
			cleaner.moveLocationChosen( mockProjectFolder);
			assertTrue( "the move directory has been set" , cleaner.moveDirectory.name == "unused-src" );
		}
		
		public function testSetProjectFolder() : void
		{
			var cleaner : Cleaner = new Cleaner();
			
			assertNull("the project folder is null", cleaner.projectFolder );
			assertNull("the as properties is null", cleaner.actionscriptProperties );
			cleaner.projectFolder = DataFactory.getTestProjectFolder();
			assertNotNull("the project folder is not null", cleaner.projectFolder );
			assertNotNull("the as properties is not null", cleaner.actionscriptProperties );
			
			
		}
		
		public function testManuallyAddApplication() : void
		{
			var cleaner : Cleaner = new Cleaner();
			
			var project : File = DataFactory.getTestProjectFolder();
			var application : File = project.resolvePath( "flex-src/ApplicationOne.mxml" );
			cleaner.manuallyAddApplication( application );
			
			assertTrue("the application wasn't added as no project folder has been selected", cleaner.actionscriptProperties == null );
		
			cleaner.projectFolder = DataFactory.getTestProjectFolder();
			
			assertEquals( "there are 2 applications registered", 2, cleaner.actionscriptProperties.applications.length );
		
			cleaner.manuallyAddApplication( application );
			
			assertEquals( "the number of applications is still 2 because we tried to add a app that is already there",
							 2, cleaner.actionscriptProperties.applications.length );
							 
			var applicationToManuallyAdd : File = project.resolvePath("flex-src/ApplicationToManuallyAdd.mxml" );
			
			cleaner.manuallyAddApplication( applicationToManuallyAdd );
			assertEquals( "the number of applications is now 3", 3, cleaner.actionscriptProperties.applications.length );
		}
		
		public function testAddFolderToIgnore() : void
		{
			var cleaner : Cleaner = new Cleaner();
			
			var ignoreFolder : File = DataFactory.getTestProjectFolder().resolvePath("flex-src/com/ignore");
			cleaner.addFolderToIgnore( ignoreFolder );
			
			assertEquals( "the folders to ignore has one item in it", 1, cleaner.foldersToIgnore.length );
			
			cleaner.addFolderToIgnore( ignoreFolder );
			assertEquals( "the folders to ignore still has one item in it", 1, cleaner.foldersToIgnore.length );
		}
		
		
		
		
		
	}
}