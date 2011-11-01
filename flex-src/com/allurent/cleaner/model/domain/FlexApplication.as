package com.allurent.cleaner.model.domain
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class FlexApplication extends EventDispatcher
	{
		private static const APPLICATION : String = "mx.core:Application";
		
		private static const AIR_APPLICATION : String = "mx.core:WindowedApplication";
		
		[Bindable]
		public var name : String;
		
		[Bindable]
		public var linkReportName : String;
		
		[Bindable]
		public var ignore : Boolean;
		
		private var _report : File;
		
		public function FlexApplication( name : String )
		{
			this.name = name;
		}
		
		public function set linkReport( value : File ) : void
		{
			if( value == null )
			{
				_report = null;
				linkReportName = null;
			}
			else
			{
				if( !linkReportDefinesApplication( value ) )
				{
					throw new Error("the linkreport doesn't match this application")
				}
				_report = value;
				linkReportName = _report.name;
			}
			dispatchEvent( new Event("linkReportUpdated") );
		}
		
		public function linkReportDefinesApplication( linkReportFile : File ) : Boolean
		{
			var stream:FileStream = new FileStream();
			stream.open( linkReportFile, FileMode.READ );
			var contents:String = stream.readUTFBytes( stream.bytesAvailable )
			var linkReportXML : XML = new XML( contents );
			
			for each( var item :  XML in linkReportXML..script  )
			{
				var nameAttributeValue : String = item.@name;
				
				if( nameAttributeValue.indexOf( name ) != -1 )
				{
					for each( var pre : XML in item..pre )
					{
						if( pre.@id == APPLICATION || pre.@id == AIR_APPLICATION )
						{
							return true;	
						}
					}
					
				}
			}
			
			return false;
		}
		
		[Bindable]
		public function get linkReport() : File
		{
			return _report;
		}
		
		[Bindable("linkReportUpdated")]
		public function get hasLinkReport() : Boolean
		{
			return _report != null;
		}
		
		

	}
}