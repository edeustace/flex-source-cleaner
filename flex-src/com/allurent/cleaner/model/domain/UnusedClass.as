package com.allurent.cleaner.model.domain
{
	import flash.filesystem.File;
	
	public class UnusedClass
	{
		[Bindable]
		public var markedForRemoval : Boolean;
		
		private var classFile : File;
		
		public function UnusedClass( file : File )
		{
			this.classFile = file;
		}

		public function get name() : String
		{
			return classFile.name;
		}
		
		public function get nativePath() : String
		{
			return classFile.nativePath;
		}
		
		public function get file() : File
		{
			return classFile;
		}
		

	}
}