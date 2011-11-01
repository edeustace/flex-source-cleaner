package com.allurent.cleaner.model.presentation.sections
{
	import com.allurent.cleaner.model.domain.Cleaner;
	import com.allurent.cleaner.model.presentation.sections.base.BaseSectionPM;
	
	public class CompletePM extends BaseSectionPM
	{
		
		[Bindable]
		public var cleaner : Cleaner;
		
		public function CompletePM( cleaner : Cleaner )
		{
			super( "Complete" );
			this.cleaner = cleaner;
		}

	}
}