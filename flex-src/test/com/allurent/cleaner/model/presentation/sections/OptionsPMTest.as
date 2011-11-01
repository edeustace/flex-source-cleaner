package test.com.allurent.cleaner.model.presentation.sections
{
	import com.allurent.cleaner.model.domain.Cleaner;
	import com.allurent.cleaner.model.domain.FlexApplication;
	import com.allurent.cleaner.model.presentation.sections.OptionsPM;
	
	import flexunit.framework.TestCase;
	
	import test.data.DataFactory;

	public class OptionsPMTest extends TestCase
	{
		public function OptionsPMTest(methodName:String=null)
		{
			super(methodName);
		}
		
		public function testConstructor() : void
		{
			var optionsPM : OptionsPM = new OptionsPM( new Cleaner() );
			assertNotNull("the cleaner has been set", optionsPM.cleaner );
		}	
		
		public function testCanBeginSearching() : void
		{
			var optionsPM : OptionsPM = new OptionsPM( new Cleaner() );
			
			optionsPM.flexProjectFolderSelected( DataFactory.getTestProjectFolder() );
			assertFalse( "1: can't begin searching", optionsPM.canBeginSearching );

			optionsPM.setMoveLocation( DataFactory.getUnusedSrcFolder() );
			assertFalse( "2: can't begin searching", optionsPM.canBeginSearching );
			
			optionsPM.currentModel = optionsPM.cleaner.actionscriptProperties.applications.getItemAt( 0 ) as FlexApplication;
			optionsPM.linkReportSelected( DataFactory.getLinkReportForApplicationOne() );
			assertFalse( "3: can't begin searching", optionsPM.canBeginSearching );
			
			optionsPM.currentModel = optionsPM.cleaner.actionscriptProperties.applications.getItemAt( 1 ) as FlexApplication;
			optionsPM.linkReportSelected( DataFactory.getLinkReportForApplicationTwo() );
			assertTrue( "can begin searching", optionsPM.canBeginSearching );
			
			optionsPM.clearMoveLocation();
			assertFalse("can't begin searching", optionsPM.canBeginSearching );
		}	
	}
}