package
{
	import flash.display.Sprite;
	
	import so.cuo.platform.iad.IAd;
	import so.cuo.platform.iad.IAdPosition;
	
	
	public class SimpleDemo extends Sprite
	{
		public function SimpleDemo()
		{
			super();
			if(IAd.getInstance().supportDevice){
				IAd.getInstance().showBanner(IAd.BANNER,IAdPosition.BOTTOM_CENTER);
			}
		}
	}
}