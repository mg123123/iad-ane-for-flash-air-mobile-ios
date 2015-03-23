this is a free actionscript native extension  of iad for flash air mobile application,enable as3 developter to add iad ad in ios app.this ane for air
is a ios ane ,not support android.apple ad network just support banner(iphone,ipad) and Interstitial(ipad),and this air ane support all native function,include all size type banner,interstitial and event

1.to use this native extension ,you would enable iad in https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa

2.requrie flash air sdk 3.9 or high

ref:http://labs.adobe.com

3.native extension has been test on iphone 4(ios 7) and ipad mini2(ios 7) work well

home:http://code.google.com/p/iad-ane-for-flash-air-mobile-ios/

## usage: ##
1.add iad1.0.ane to your actionscript mobile project or flex mobile project

2.add as3 code

> a. show iad banner in flash  air application
```
	if(IAd.getInstance().supportDevice){	//check is ane air available,this will been true on device 				      
	    IAd.getInstance().showBanner(IAd.BANNER,IAdPosition.BOTTOM_CENTER);
	}
```
> > b. show iad interstitial Advertisement with native extensions for air iad is this same easy
```
  if(IAd.getInstance().supportDevice&&IAd.getInstance().supportedInterstitial){//check ane support ,apple not provice Interstitial ad on iphone
		IAd.getInstance().addEventListener(IAdEvent.onInterstitialReceive,onAdReceived);
		IAd.getInstance().cacheInterstitial();
	}
      protected function onAdReceived(event:IAdEvent):void
	{//when ad received success, show it
		if(event.type==IAdEvent.onInterstitialReceive){
			IAd.getInstance().showInterstitial();
		}
	}
```
## you may like ##
[flash air ad network](http://code.google.com/p/adoble-flash-air-ad-network-framework/)