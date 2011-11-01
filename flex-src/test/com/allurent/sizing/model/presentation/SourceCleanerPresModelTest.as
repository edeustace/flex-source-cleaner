package test.com.allurent.sizing.model.presentation
{
	import com.allurent.cleaner.model.presentation.SourceCleanerPresModel;
	
	import flash.filesystem.File;
	
	import flexunit.framework.TestCase;

	public class SourceCleanerPresModelTest extends TestCase
	{
		public function SourceCleanerPresModelTest(methodName:String=null)
		{
			super(methodName);
		}
		
		public function testConstructor() : void
		{
			/* var sourceCleaner : SourceCleanerPresModel = new SourceCleanerPresModel();
			
			assertFalse("canBeginSearching is false", sourceCleaner.canBeginSearching );
			assertFalse("cleanComplete is false", sourceCleaner.cleanComplete );
			assertFalse("scanFoundUnusedClasses is false", sourceCleaner.scanFoundUnusedClasses );
			assertFalse("showBadLinkReportError is false", sourceCleaner.showBadLinkReportError );
			assertEquals("moveDirectory is null", null, sourceCleaner.moveDirectory );
			assertEquals("the form is being displayed", SourceCleanerPresModel.FORM_INDEX, sourceCleaner.selectedIndex ); */
		}
		
		public function testFlexProjectFolderSelected() : void
		{
			/* var sourceCleaner : SourceCleanerPresModel = new SourceCleanerPresModel();
			var mockProjectFolder : File = File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject" );
			sourceCleaner.flexProjectFolderSelected( mockProjectFolder );
			assertTrue( "the actionscript properties object has been initialised", sourceCleaner.actionscriptProperties != null ); */
		}
		
	}
}