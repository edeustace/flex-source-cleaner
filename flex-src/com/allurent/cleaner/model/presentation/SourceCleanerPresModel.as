package com.allurent.cleaner.model.presentation
{
	import com.allurent.cleaner.model.domain.Cleaner;
	import com.allurent.cleaner.model.presentation.sections.CompletePM;
	import com.allurent.cleaner.model.presentation.sections.OptionsPM;
	import com.allurent.cleaner.model.presentation.sections.SearchResultsPM;
	import com.allurent.cleaner.model.presentation.sections.base.BaseSectionPM;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;	
	
	public class SourceCleanerPresModel
	{
		public static const OPTIONS_INDEX : int = 0;
		public static const SEARCH_RESULTS_INDEX : int = 1;
		public static const COMPLETE_INDEX : int = 2;
		
		[Bindable]
		public var sections : ArrayCollection = new ArrayCollection();
		[Bindable]
		public var optionsPM : OptionsPM;
		[Bindable]
		public var searchResultsPM : SearchResultsPM;
		[Bindable]
		public var completePM : CompletePM;
		[Bindable]
		public var selectedIndex : int = OPTIONS_INDEX;
		[Bindable]
		public var cleaner : Cleaner = new Cleaner();	
		
		public function SourceCleanerPresModel()
		{
			init();
			createSubSections();
		}
		
		private function createSubSections() : void
		{
			optionsPM = new OptionsPM( cleaner );
			searchResultsPM = new SearchResultsPM( cleaner );
			completePM = new CompletePM( cleaner );
			
			sections.addItem( optionsPM );
			sections.addItem( searchResultsPM );
			sections.addItem( completePM );
		}
		
		private function init() : void
		{
			BindingUtils.bindSetter( scanComplete, cleaner, "scanComplete" );
			BindingUtils.bindSetter( cleanComplete, cleaner, "cleanComplete" );
		}
		
		private function scanComplete( complete : Boolean ) : void
		{
			if( complete )
			{
				selectedIndex = SEARCH_RESULTS_INDEX;
			}
		}
		
		private function cleanComplete( complete : Boolean ) : void
		{
			if( complete )
			{
				selectedIndex = COMPLETE_INDEX;
			}
		}
		
		public function getSectionTitle( index : int ) : String 
		{
			var section : BaseSectionPM = sections.getItemAt( index ) as BaseSectionPM;
			return section.sectionTitle;
		}
		
	}
}