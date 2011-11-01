package com.allurent.cleaner.model.presentation.sections
{
	import com.allurent.cleaner.model.domain.Cleaner;
	import com.allurent.cleaner.model.domain.FlexApplication;
	import com.allurent.cleaner.model.presentation.sections.base.BaseSectionPM;
	
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	public class OptionsPM extends BaseSectionPM
	{
		[Bindable]
		public var canBeginSearching : Boolean;
		
		[Bindable]
		public var showBadLinkReportError : Boolean;
		
		[Bindable]
		public var cleaner : Cleaner;
		
		[Bindable]
		public var canManuallyAddApplication : Boolean;
		
		 public var currentModel : FlexApplication;
		
		public function OptionsPM( cleaner : Cleaner )
		{
			super( "Set your options" );
			this.cleaner = cleaner;
		}
		
		public function flexProjectFolderSelected( folder : File ) : void	
		{
			try
			{
		       	cleaner.projectFolder = folder;
			}
	        catch( e : Error )
			{
	        	Alert.show("This isn't a valid flex project folder");
			}
		}
		
		
		public function ignoreThisApplication( application : FlexApplication, ignore : Boolean ) : void
		{
			application.ignore = ignore;
			canBeginSearching = getCanBeginSearching();
		}
		
		private function getCanBeginSearching() : Boolean
		{
		 	return  cleaner.actionscriptProperties.allApplicationsHaveLinkReports() 
		 			&&
		 			cleaner.moveDirectory != null;
		}
		
		public function linkReportSelected( selectedReport  : File ) : void
        {
            try
            {
            	 currentModel.linkReport = selectedReport;
            }
            catch( e : Error )
            {
	           showBadLinkReportError=true;
            }
            canBeginSearching = getCanBeginSearching();
		}
		
		public function removeLinkReport( appModel : FlexApplication ) : void
        {
        	appModel.linkReport = null;
        	canBeginSearching = getCanBeginSearching();
        }
        
        public function setMoveLocation( file : File ) : void
        {
        	cleaner.moveLocationChosen( file );
			canBeginSearching = getCanBeginSearching();
        }
        
        public function clearMoveLocation() : void
        {
        	cleaner.moveDirectory = null;
        	canBeginSearching = getCanBeginSearching();
        }
		

	}
}