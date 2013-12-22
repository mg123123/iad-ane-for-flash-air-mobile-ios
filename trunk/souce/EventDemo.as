package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.ReturnKeyLabel;
	import so.cuo.platform.iad.IAd;
	import so.cuo.platform.iad.IAdEvent;

	public class EventDemo extends Sprite
	{
		var iad:IAd=IAd.getInstance();

		public function EventDemo()
		{
			super();
			if (!iad.supportDevice)
			{
				trace("not support");
				return;
			}
			iad.addEventListener(IAdEvent.onBannerFailedReceive, onAdReceived);
			iad.addEventListener(IAdEvent.onBannerReceive, onAdReceived);
			stage.addEventListener(MouseEvent.CLICK, clickStage);
		}

		protected function clickStage(event:MouseEvent):void
		{
			iad.showBannerAbsolute(IAd.BANNER, 0, 10);
			if (iad.isInterstitialReady())
			{
				iad.showInterstitial();
			}
			else
			{
				iad.cacheInterstitial();
			}
		}

		protected function onAdReceived(event:IAdEvent):void
		{
			trace(event.type, event.data);
		}
	}
}
