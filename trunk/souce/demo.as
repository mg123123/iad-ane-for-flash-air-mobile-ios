package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import so.cuo.platform.iad.IAd;
	import so.cuo.platform.iad.IAdEvent;
	import so.cuo.platform.iad.IAdSize;
	
	[SWF(backgroundColor="0xffff00")]
	public class demo extends Sprite
	{ 
		public var xkey:TextField=new TextField();
		public var ykey:TextField=new TextField();
		public var typekey:TextField=new TextField();
		public var absSubmitButton:TextField=new TextField();
		public var relationSubmitButton:TextField=new TextField();
		public var hideSubmitButton:TextField=new TextField();
		public var interstitialSubmitButton:TextField=new TextField();
		private var format:TextFormat=new TextFormat(null,38);
		private var iad:IAd;
		
		public function demo()
		{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			initUI();
			iad= IAd.getInstance();
			if(iad.supportDevice){
				iad.addEventListener(IAdEvent.onInterstitialReceive,onAdReceived);
				iad.addEventListener(IAdEvent.onBannerReceive,onAdReceived);
			}
		}
		
		private function initUI():void
		{
			typekey.y=ykey.y=xkey.y=100;
			xkey.x=100;	
			ykey.x=300;
			typekey.x=500;
			typekey.type=ykey.type=xkey.type=TextFieldType.INPUT;
			typekey.border=xkey.border=ykey.border=true;
			
			this.hideSubmitButton.width=relationSubmitButton.width=interstitialSubmitButton.width=absSubmitButton.width=xkey.width=ykey.width=140;
			this.typekey.height=this.hideSubmitButton.height=relationSubmitButton.height=interstitialSubmitButton.height=absSubmitButton.height=xkey.height=ykey.height=48;
			this.typekey.defaultTextFormat=this.hideSubmitButton.defaultTextFormat=interstitialSubmitButton.defaultTextFormat=relationSubmitButton.defaultTextFormat=absSubmitButton.defaultTextFormat=xkey.defaultTextFormat=ykey.defaultTextFormat=this.format;
			absSubmitButton.text="absolute";
			relationSubmitButton.text="relation";
			interstitialSubmitButton.text="interstitial";
			this.hideSubmitButton.text="hide";
			xkey.text="8";// relation position type or abs position x value
			ykey.text="0";//abs position y value
			typekey.text="1";// banner type
			this.addChild(xkey);
			this.addChild(ykey);
			this.addChild(this.typekey);
			this.addChild(absSubmitButton);
			this.addChild(this.relationSubmitButton);
			this.addChild(this.interstitialSubmitButton);
			this.addChild(this.hideSubmitButton);
			this.hideSubmitButton.x=relationSubmitButton.x=interstitialSubmitButton.x=absSubmitButton.x=100;
			this.relationSubmitButton.selectable=this.absSubmitButton.selectable=this.interstitialSubmitButton.selectable=false;
			this.relationSubmitButton.border=this.absSubmitButton.border=this.interstitialSubmitButton.border=true;
			this.relationSubmitButton.y=200;
			this.absSubmitButton.y=300;
			this.interstitialSubmitButton.y=400;
			this.hideSubmitButton.y=500;
			absSubmitButton.addEventListener(MouseEvent.CLICK,this.click);
			relationSubmitButton.addEventListener(MouseEvent.CLICK,this.click);
			interstitialSubmitButton.addEventListener(MouseEvent.CLICK,this.click);
			this.hideSubmitButton.addEventListener(MouseEvent.CLICK,this.click);
		}
		
		protected function click(event:MouseEvent):void
		{
			if (!iad.supportDevice)
			{
				trace("not support device");
				return
			}
			else
			{
				var text:TextField=event.currentTarget as TextField;
				var xv:int=parseInt(xkey.text);
				var yv:int=parseInt(ykey.text);
				var size:int=parseInt(typekey.text);
				var adsize:IAdSize=IAd.BANNER;
				if(size==2){
					adsize=IAd.IAB_MRECT;
				}
				if(text==this.hideSubmitButton){
					iad.hideBanner();
				}
				if(text==this.absSubmitButton){
					iad.showBannerAbsolute(adsize,xv,yv);
				}
				else if(text==this.relationSubmitButton){
					if(xv>9)xv=9;
					if(xv<1)xv=1;
					iad.showBanner(adsize,xv);
				}
				else if(text==this.interstitialSubmitButton){
					if(iad.isInterstitialReady()){
						iad.showInterstitial();
					}else{
						iad.cacheInterstitial();
					}
				}
			}
		}
		
		protected function onBannerFail(event:Event):void
		{
			trace(event.type);
		}
		
		protected function onAdReceived(event:IAdEvent):void
		{
			if(event.type==IAdEvent.onBannerReceive){
				trace(event.data.width,event.data.height);
			}
			if(event.type==IAdEvent.onInterstitialReceive){
			}
		}
		
	}
}