package com.allurent.cleaner.model.domain
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.collections.ArrayCollection;
	
	public class ActionscriptProperties
	{
		[Bindable] 
		public var applications : ArrayCollection;
		
		[Bindable]
		public var sourceFolderPath : String;
		
		
		public function ActionscriptProperties( actionscriptPropertiesFile : File )
		{
			var stream:FileStream = new FileStream();
			stream.open( actionscriptPropertiesFile, FileMode.READ );
			var contents:String = stream.readUTFBytes( stream.bytesAvailable )

			var actionscriptPropertiesXML : XML = new XML( contents );

			sourceFolderPath = getSourceFolderPathFromPropertiesXML( actionscriptPropertiesXML );
			createApplicationsCollection( actionscriptPropertiesXML );
		}
		
		public function isPartOfApplicationClassPath( classFile : File ) : Boolean
		{
			for( var i : int = 0 ; i < applications.length ; i++ )
			{
				var model : FlexApplication = applications.getItemAt( i ) as FlexApplication;
				if( model.name == classFile.name )
				{
					return true;
				}
				
			}
			return false;
		}
		
		public function addApplication( file : File ) : void
		{
			for( var i : int = 0 ; i < applications.length; i++ )
			{
				var app : FlexApplication = applications.getItemAt( i ) as FlexApplication;
				
				if( app.name == file.name )
				{
					return;
				}
			}
			
			applications.addItem( new FlexApplication( file.name ) );
		}

		private function getSourceFolderPathFromPropertiesXML( propertiesXML : XML ) : String
		{
			return propertiesXML..compiler.@sourceFolderPath;
		}
		
		private function createApplicationsCollection( propertiesXML : XML ) : void
		{
			applications = new ArrayCollection();
			
			for each( var item :  XML in propertiesXML..application.@path )
			{
				applications.addItem( new FlexApplication( item.toString() ) );
			}
		}
		
		public function allApplicationsHaveLinkReports() : Boolean
		{
			for( var i : int = 0 ; i < applications.length ; i++ )
			{
				var model : FlexApplication = FlexApplication( applications.getItemAt(i) );
				if( !model.hasLinkReport && !model.ignore )
				{
					return false;	
				}
			}
			return true;
		}

	}
}