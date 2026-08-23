package §_-c2C§
{
   import §_-8Q§.§_-i2W§;
   import §_-8Q§.§_-u1i§;
   import §_-I2Y§.§_-91K§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-gU§;
   import §_-t14§.§_-62O§;
   import §_-t14§.§_-Q2X§;
   import §_-xr§.§_-32k§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import views.§_-aW§;
   
   public class §_-fx§ extends Screen implements §_-91K§
   {
      
      public static const EVENT_COLLECT:String = "EVENT_COLLECT";
      
      private static var _instance:§_-fx§;
      
      public static var §_-t1y§:Object = {};
      
      private var §_-C1B§:§_-62O§;
      
      private var §_-G2Q§:Array = [];
      
      private var §_-72Q§:§_-i2W§;
      
      public function §_-fx§()
      {
         super();
         _instance = this;
      }
      
      public static function §_-T1l§() : void
      {
         var _loc1_:Timer = new Timer(1,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,§_-y1e§);
         _loc1_.reset();
         _loc1_.start();
      }
      
      public static function onComplete() : void
      {
         _instance.§_-C1B§.finish();
         setTimeout(§_-X7§,1500);
      }
      
      private static function §_-y1e§(param1:Event) : void
      {
         if(_instance)
         {
            _instance.§_-T1l§();
         }
      }
      
      private static function §_-X7§() : void
      {
         if(_instance)
         {
            _instance.§_-x2I§();
         }
      }
      
      override public function show() : void
      {
         this.§_-C1B§ = new §_-62O§();
         this.addChild(this.§_-C1B§);
         §_-817§.instance.addChild(this.§_-C1B§.getStarlingView());
         super.show();
         this.§_-T1l§();
         this.§_-r1L§();
         §_-aW§.instance.open();
      }
      
      override public function hide() : void
      {
         super.hide();
         if(this.§_-C1B§ != null)
         {
            if(§_-817§.instance.contains(this.§_-C1B§.getStarlingView()))
            {
               §_-817§.instance.removeChild(this.§_-C1B§.getStarlingView());
            }
            this.§_-C1B§.dispose();
            this.§_-C1B§ = null;
         }
         this.§_-jA§();
      }
      
      private function §_-T1l§() : void
      {
         this.§_-a1r§();
      }
      
      private function §_-a1r§(param1:String = null) : void
      {
         if(!this.§_-C1B§)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = §_-gU§.§_-V1T§();
         }
         this.§_-C1B§.map.§_-o2I§(param1);
         this.§_-C1B§.start();
         this.§_-72Q§ = new §_-i2W§();
         this.§_-72Q§.x = 1542;
         this.§_-72Q§.y = 216;
         this.§_-72Q§.addEventListener(EVENT_COLLECT,this.§_-73W§);
         this.§_-C1B§.map.add(this.§_-72Q§);
         this.§_-72Q§.build(this.§_-C1B§.world);
         new §_-32k§().show();
      }
      
      private function §_-73W§(param1:Event) : void
      {
         Hero.self.heroView.§_-YN§(0,§_-u1i§.§_-13j§);
         this.§_-C1B§.§_-i2X§();
      }
      
      private function §_-r1L§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:DisplayObject = null;
         for each(_loc1_ in §_-gU§.§_-529§())
         {
            _loc2_ = new _loc1_["image"]();
            _loc2_.x = _loc1_["x"];
            _loc2_.y = _loc1_["y"];
            addChild(_loc2_);
            this.§_-G2Q§.push(_loc2_);
         }
      }
      
      private function §_-jA§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-G2Q§.length)
         {
            (this.§_-G2Q§[_loc1_] as DisplayObject).parent.removeChild(this.§_-G2Q§[_loc1_]);
            _loc1_++;
         }
         this.§_-G2Q§ = [];
      }
      
      private function §_-x2I§() : void
      {
         §_-Q2X§.finish();
         §_-Ac§.complete(§_-Ac§.§_-j18§);
         §_-aW§.instance.close(false);
         §_-u24§.start(§_-at§.§_-I6§,false,false,0);
      }
   }
}

