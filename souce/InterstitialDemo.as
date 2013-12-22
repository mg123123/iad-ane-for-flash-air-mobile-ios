package
{
	import flash.display.Sprite;
	
	import so.cuo.platform.iad.IAd;
	import so.cuo.platform.iad.IAdEvent;
	
	public class InterstitialDemo extends Sprite
	{
		var iad:IAd= IAd.getInstance();
		public function InterstitialDemo()
		{
			super();
			if(IAd.getInstance().supportDevice&&IAd.getInstance().supportedInterstitial){
				IAd.getInstance().addEventListener(IAdEvent.onInterstitialReceive,onAdReceived);
				IAd.getInstance().cacheInterstitial();
			}
		}
		protected function onAdReceived(event:IAdEvent):void
		{
			if(event.type==IAdEvent.onInterstitialReceive){
				IAd.getInstance().showInterstitial();
			}
		}
	}
}