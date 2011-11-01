package com.allurent.cleaner.model.presentation.sections
{
	import com.allurent.cleaner.model.domain.Cleaner;
	import com.allurent.cleaner.model.presentation.sections.base.BaseSectionPM;
	 
	public class SearchResultsPM extends BaseSectionPM
	{
		[Bindable]
		public var cleaner : Cleaner;
		
		public function SearchResultsPM( cleaner : Cleaner )
		{
			super( "Search Results" );
			this.cleaner = cleaner;	
		}
		
		public function clean() : void
		{
			cleaner.clean();
			//selectedIndex = COMPLETE_INDEX;
		}

	}
}