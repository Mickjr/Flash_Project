package com.yekcim.view
{
	import com.yekcim.event.FantasyFootballEvent;
	import com.yekcim.vo.PassingVO;	
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	public class FantasyFootballView extends FantasyFTAPPBase
	{
		private var _passingPlayers:Array;
		private var _rushingPlayers:Array;
		private var _receivingPlayers:Array;
		private var _fieldGoalPlayers:Array;		
		public var seasonType:String = "";
		public var weekNumber:String = "";
		
		public function FantasyFootballView()
		{
			super();
			
			this.stop();
			
			btnEnter.buttonMode = true;
			btnEnter.mouseChildren = false;
			btnEnter.addEventListener(MouseEvent.CLICK, onEnterClick);
			
			this.tfSeasonType.text = "REG";
			this.tfWeekNumber.text = "2";
			
			tfSeasonType.addEventListener(FocusEvent.FOCUS_IN, onFocus);
			tfWeekNumber.addEventListener(FocusEvent.FOCUS_IN, onFocus);
		}
		
		private function onFocus(event:FocusEvent):void
		{
			event.currentTarget.text = "";
		}
		
		private function onEnterClick(event:MouseEvent):void
		{
			trace("running");
			seasonType = tfSeasonType.text;
			weekNumber = tfWeekNumber.text;
			
			dispatchEvent(new FantasyFootballEvent(FantasyFootballEvent.SEARCH));
		}
		
		public function showSearch():void
		{
			gotoAndStop(1);
			
			tfSeasonType.addEventListener(FocusEvent.FOCUS_IN, onFocus);
			tfWeekNumber.addEventListener(FocusEvent.FOCUS_IN, onFocus);
			
			btnEnter.addEventListener(MouseEvent.CLICK, onEnterClick);
		}
		// Display of 2nd frame and eventlisteners added for CLICK's
		public function showDetails():void
		{
			gotoAndStop(5);
			
			this.tfSeasonType.text = seasonType;
			this.tfWeekNumber.text = weekNumber;
			
			topPassers.addEventListener(MouseEvent.CLICK, onTopPassers);
			topReceivers.addEventListener(MouseEvent.CLICK, onTopReceivers);
			topRushers.addEventListener(MouseEvent.CLICK, onTopRushers);
			topKickers.addEventListener(MouseEvent.CLICK, onTopKickers);
			
			btnBackDetail.addEventListener(MouseEvent.CLICK, onBackFromDetail);
		}
		
		public function showTop():void
		{
			gotoAndStop(10);
			
			btnBackTop.addEventListener(MouseEvent.CLICK, onBackFromTop);
		}
		
		private function onBackFromDetail(event:MouseEvent):void
		{
			showSearch();
		}
		
		private function onBackFromTop(event:MouseEvent):void
		{
			updateDetailsText();
		}
		
		public function updateDetailsText():void
		{
			showDetails();
			
			this.tfPasserLeader.text = _passingPlayers[0].playerName;
			this.tfRushingLeader.text = _rushingPlayers[0].playerName;
			this.tfReceivingLeader.text = _receivingPlayers[0].playerName;
			this.tfFieldGoalLeader.text = _fieldGoalPlayers[0].playerName;  
		}
		
		private function onTopPassers(event:MouseEvent):void
		{
			showTop();
			
			this.tfPasserOne.text = _passingPlayers[0].playerName;
			this.tfPasserTwo.text = _passingPlayers[1].playerName;
			this.tfPasserthree.text = _passingPlayers[2].playerName;
			this.tfPasserFour.text = _passingPlayers[3].playerName;
			this.tfPasserFive.text = _passingPlayers[4].playerName;
		}
		
		private function onTopReceivers(event:MouseEvent):void
		{
			showTop();
			
			this.tfPasserOne.text = _receivingPlayers[0].playerName;
			this.tfPasserTwo.text = _receivingPlayers[1].playerName;
			this.tfPasserthree.text = _receivingPlayers[2].playerName;
			this.tfPasserFour.text = _receivingPlayers[3].playerName;
			this.tfPasserFive.text = _receivingPlayers[4].playerName;
		}
		
		private function onTopRushers(event:MouseEvent):void
		{
			showTop();
			
			this.tfPasserOne.text = _rushingPlayers[0].playerName;
			this.tfPasserTwo.text = _rushingPlayers[1].playerName;
			this.tfPasserthree.text = _rushingPlayers[2].playerName;
			this.tfPasserFour.text = _rushingPlayers[3].playerName;
			this.tfPasserFive.text = _rushingPlayers[4].playerName;
		}
		
		private function onTopKickers(event:MouseEvent):void
		{
			showTop();
			
			this.tfPasserOne.text = _fieldGoalPlayers[0].playerName;
			this.tfPasserTwo.text = _fieldGoalPlayers[1].playerName;
			this.tfPasserthree.text = _fieldGoalPlayers[2].playerName;
			this.tfPasserFour.text = _fieldGoalPlayers[3].playerName;
			this.tfPasserFive.text = _fieldGoalPlayers[4].playerName;
		}
		// setters for players
		public function set passingPlayers(value:Array):void
		{
			_passingPlayers = value;
		}
		// setters for players
		public function set rushingPlayers(value:Array):void
		{
			_rushingPlayers = value;
		}
		// setters for players
		public function set receivingPlayers(value:Array):void
		{
			_receivingPlayers = value;
		}
		// setters for players
		public function set fieldGoalPlayers(value:Array):void
		{
			_fieldGoalPlayers = value;
		}

	}
}