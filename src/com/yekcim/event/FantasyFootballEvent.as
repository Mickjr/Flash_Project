package com.yekcim.event
{
	import flash.events.Event;
	
	public class FantasyFootballEvent extends Event
	{
		public static const SEARCH:String = "sports_search";
		public static const COMPLETE:String = "sports_complete";
		public static const ERROR:String = "sports_error";
		
		public function FantasyFootballEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}