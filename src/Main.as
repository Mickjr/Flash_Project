package
{
	
	
	import com.yekcim.event.FantasyFootballEvent;
	import com.yekcim.model.FantasyFootballNerdModel;
	import com.yekcim.view.FantasyFootballView;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width="600",height="500", backgroundColor ="#ededed")]
	
	public class Main extends Sprite
	{
		private var _sportsModel:FantasyFootballNerdModel;
		private var _fantasyFootballView:FantasyFootballView;
		private var _fantasyFootballModel:FantasyFootballNerdModel;
		
		
		public function Main()
		{
			_fantasyFootballView = new FantasyFootballView();
			_fantasyFootballView.addEventListener(FantasyFootballEvent.SEARCH, onSearch);
			addChild(_fantasyFootballView);
			_fantasyFootballView.x = 500;
			_fantasyFootballView.y = 300;		
			
			_fantasyFootballModel = new FantasyFootballNerdModel();
			_fantasyFootballModel.addEventListener(FantasyFootballEvent.COMPLETE, onModelComplete);
		}
		
		private function onSearch(event:FantasyFootballEvent):void
		{
			var seasonType:String = _fantasyFootballView.tfSeasonType.text;
			var weekNumber:String = _fantasyFootballView.tfWeekNumber.text;
			
			_fantasyFootballModel.getdata(seasonType, weekNumber);
		}
		
		private function onModelComplete(event:Event):void
		{
			trace("model loaded" + _fantasyFootballModel.passingPlayers);
			
			_fantasyFootballView.passingPlayers = _fantasyFootballModel.passingPlayers;
			_fantasyFootballView.rushingPlayers = _fantasyFootballModel.rushingPlayers;
			_fantasyFootballView.receivingPlayers = _fantasyFootballModel.receivingPlayers;
			_fantasyFootballView.fieldGoalPlayers = _fantasyFootballModel.fieldGoalPlayers;
			
			_fantasyFootballView.updateDetailsText();
		}
		
	}
}