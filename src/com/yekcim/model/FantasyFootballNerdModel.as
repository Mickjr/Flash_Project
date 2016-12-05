package com.yekcim.model
{
	import com.yekcim.event.FantasyFootballEvent;
	import com.yekcim.vo.FieldGoalVO;
	import com.yekcim.vo.PassingVO;
	import com.yekcim.vo.ReceivingVO;
	import com.yekcim.vo.RushingVO;	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class FantasyFootballNerdModel extends EventDispatcher
	{
		private var _passingPlayers:Array;
		private var _rushingPlayers:Array;
		private var _receivingPlayers:Array;
		private var _fieldGoalPlayers:Array;
		
		public function FantasyFootballNerdModel(target:IEventDispatcher=null)
		{
			super(target);
		}
		// requesting for XML data
		public function getdata(season:String, week:String):void
		{
			var ul:URLLoader = new URLLoader();
			ul.addEventListener(Event.COMPLETE, onParse);
			ul.load(new URLRequest("http://api.sportsdatallc.org/nfl-t1/2013/" + season + "/" + week + "/leaders.xml?api_key=aqymwqkdkvks5c3y5t36yx33"));
		}
		// parsing data
		private function onParse(event:Event):void
		{
			var xmlData:XML = XML(event.currentTarget.data);
			
			var ns:Namespace = new Namespace("http://feed.elasticstats.com/schema/nfl/statistics-v1.0.xsd");
			_passingPlayers = [];
			_rushingPlayers = [];
			_receivingPlayers = [];
			_fieldGoalPlayers = [];
			
			// parse all the passing players
			for each (var passingXML:XML in xmlData.ns::passing.ns::player) 
			{
				var passingPlayer:PassingVO = new PassingVO();
		
				passingPlayer.playerName = passingXML.@name;
				passingPlayer.qbrRating = passingXML.@rating;
				passingPlayer.touchdowns = passingXML.@td;
				passingPlayer.totalYards = passingXML.@yds;
				passingPlayer.teamName = passingXML.ns::team.@name;
			
				_passingPlayers.push(passingPlayer);		
			}
			
			// parse all the rushing players
			for each (var rushingXML:XML in xmlData.ns::rushing.ns::player) 
			{
				var rushingPlayer:RushingVO = new RushingVO();
				
				rushingPlayer.playerName = rushingXML.@name;
				rushingPlayer.avearageYards = rushingXML.@avg;
				rushingPlayer.touchdowns = rushingXML.@td;
				rushingPlayer.totalYards = rushingXML.@yds;
				rushingPlayer.teamName = rushingXML.ns::team.@name;
					
				_rushingPlayers.push(rushingPlayer);
			}
			
			// parse all recieving players
			for each (var receivingXML:XML in xmlData.ns::receiving.ns::player) 
			{
				var receivingPlayer:ReceivingVO = new ReceivingVO();
				
				receivingPlayer.playerName = receivingXML.@name;
				receivingPlayer.totalYards = receivingXML.@yds;
				receivingPlayer.avearageYards = receivingXML.@avg;
				receivingPlayer.touchdowns = receivingXML.@td;
				receivingPlayer.teamName = receivingXML.ns::team.@name;
			
				_receivingPlayers.push(receivingPlayer);
			}
			
			// parse all field goal players
			for each (var field_goalXML:XML in xmlData.ns::field_goal.ns::player)
			{
				var fieldGoalPlayer:FieldGoalVO = new FieldGoalVO;
				
				fieldGoalPlayer.playerName = field_goalXML.@name;
				fieldGoalPlayer.fieldgoalAttempt = field_goalXML.@att; 
				fieldGoalPlayer.fieldgoalMade = field_goalXML.@made;
				fieldGoalPlayer.longestMade = field_goalXML.@lg;
				fieldGoalPlayer.teamName = field_goalXML.ns::team.@name;
			
				_fieldGoalPlayers.push(fieldGoalPlayer);
			}
			dispatchEvent(new FantasyFootballEvent(FantasyFootballEvent.COMPLETE));
		} 
		// getters for players
		public function get passingPlayers():Array
		{
			return _passingPlayers;  	
		}
		// getters for players
		public function get rushingPlayers():Array
		{
			return _rushingPlayers;
		}
		// getters for players
		public function get receivingPlayers():Array
		{
			return _receivingPlayers;
		}
		// getters for players
		public function get fieldGoalPlayers():Array
		{
			return _fieldGoalPlayers;
		}
		
	}
	
}