package com.allurent.cleaner.model.domain
{
	import flash.filesystem.File;
	
	public class FlexProjectFolder
	{
		public static const ACTIONSCRIPT_PROPERTIES : String = ".actionScriptProperties";
		public static const PROJECT : String = ".project";
		
		private var projectFolder : File;
		
		public function FlexProjectFolder( projectFolder : File )
		{
			if( !FlexProjectFolder.isValid( projectFolder ) )
			{
				throw new Error( "this isn't a valid project folder" );
			}
			this.projectFolder = projectFolder;
		}
		
		public function getFolder() : File
		{
			return projectFolder;
		}
		
		public static function isValid( folder : File ) : Boolean
        {
        	if( folder == null )
        	{
        		return false;
        	}
        	
        	var projectFiles : Array = folder.getDirectoryListing();
            	
            var hasDotProjectFile : Boolean;
            var hasDotASPropertiesFile : Boolean;
            	
            for each( var file : File in projectFiles )
           	{
           		if( file.name == PROJECT )
            	{
            		hasDotProjectFile = true;
				}
            		
            	if( file.name == ACTIONSCRIPT_PROPERTIES )
            	{
            		hasDotASPropertiesFile = true;
				}
            		
            	if( hasDotASPropertiesFile && hasDotProjectFile )
            	{
            		return true;
				}
			}
            	
            return false;
		}
		
		public function getASPropertiesFile() : File
        {
        	var projectFiles : Array = projectFolder.getDirectoryListing();
            	
            for each( var file : File in projectFiles )
            {
            	if( file.name == ACTIONSCRIPT_PROPERTIES )
            	{
            		return file;
				}
			}
            	
            return null;
		}
            

	}
}