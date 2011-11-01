package test.data
{
	import flash.filesystem.File;
	
	public class DataFactory
	{
		public function DataFactory()
		{
		}
	
		public static function getTestProjectFolder() : File
		{
			return File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject" );
		}

		public static function getUnusedSrcFolder() : File
		{
			return File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject/unused-src" );
		}
		
		public static function getLinkReportForApplicationOne() : File
		{
			return File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject/link-reports/ApplicationOne_link-report.xml" );
		}

		public static function getLinkReportForApplicationTwo() : File
		{
			return File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject/link-reports/ApplicationTwo_link-report.xml" );
		}
		
		public static function getAsPropertiesFile() : File
		{
			return File.applicationDirectory.resolvePath( "test/data/LinkReportTestProject/.actionScriptProperties" );
		}

	}
}