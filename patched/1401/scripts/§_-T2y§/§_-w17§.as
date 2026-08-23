package §_-T2y§
{
   import §_-83V§.§_-li§;
   import §_-83V§.§_-o29§;
   import §_-D2e§.§_-936§;
   import §_-I10§.§_-C3U§;
   import §_-I10§.§_-Q2v§;
   import §_-Y22§.§_-E1J§;
   import §_-t1l§.§_-EX§;
   import §_-t1l§.§_-m28§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import views.§_-Vm§;
   
   public class §_-w17§ extends Screen implements §_-E1J§
   {
      
      public static const EVENT_COLLECT:String = "EVENT_COLLECT";
      
      private static var _instance:§_-w17§;
      
      public static var §_-Vx§:Object = {};
      
      private var §_-i13§:§_-m28§;
      
      private var §_-92h§:Array = [];
      
      private var §_-F1Q§:§_-li§;
      
      public function §_-w17§()
      {
         super();
         _instance = this;
      }
      
      public static function §_-e10§() : void
      {
         var _loc1_:Timer = new Timer(1,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,§_-a2b§);
         _loc1_.reset();
         _loc1_.start();
      }
      
      public static function onComplete() : void
      {
         _instance.§_-i13§.finish();
         setTimeout(§_-qK§,1500);
      }
      
      private static function §_-a2b§(param1:Event) : void
      {
         if(_instance)
         {
            _instance.§_-e10§();
         }
      }
      
      private static function §_-qK§() : void
      {
         if(_instance)
         {
            _instance.§_-j1q§();
         }
      }
      
      override public function show() : void
      {
         this.§_-i13§ = new §_-m28§();
         this.addChild(this.§_-i13§);
         §_-s1i§.instance.addChild(this.§_-i13§.getStarlingView());
         super.show();
         this.§_-e10§();
         this.§_-H1M§();
         §_-Vm§.instance.open();
      }
      
      override public function hide() : void
      {
         super.hide();
         if(this.§_-i13§ != null)
         {
            if(§_-s1i§.instance.contains(this.§_-i13§.getStarlingView()))
            {
               §_-s1i§.instance.removeChild(this.§_-i13§.getStarlingView());
            }
            this.§_-i13§.dispose();
            this.§_-i13§ = null;
         }
         this.§_-i2x§();
      }
      
      private function §_-e10§() : void
      {
         this.§_-t9§();
      }
      
      private function §_-t9§(param1:String = null) : void
      {
         if(!this.§_-i13§)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = §_-C3U§.§_-92K§();
         }
         this.§_-i13§.map.§_-41M§(param1);
         this.§_-i13§.start();
         this.§_-F1Q§ = new §_-li§();
         this.§_-F1Q§.x = 1542;
         this.§_-F1Q§.y = 216;
         this.§_-F1Q§.addEventListener(EVENT_COLLECT,this.§_-Q2h§);
         this.§_-i13§.map.add(this.§_-F1Q§);
         this.§_-F1Q§.build(this.§_-i13§.world);
         new §_-936§().show();
      }
      
      private function §_-Q2h§(param1:Event) : void
      {
         Hero.self.heroView.§_-cn§(0,§_-o29§.§_-Y1l§);
         this.§_-i13§.§_-K1E§();
      }
      
      private function §_-H1M§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:DisplayObject = null;
         for each(_loc1_ in §_-C3U§.§_-93K§())
         {
            _loc2_ = new _loc1_["image"]();
            _loc2_.x = _loc1_["x"];
            _loc2_.y = _loc1_["y"];
            addChild(_loc2_);
            this.§_-92h§.push(_loc2_);
         }
      }
      
      private function §_-i2x§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-92h§.length)
         {
            (this.§_-92h§[_loc1_] as DisplayObject).parent.removeChild(this.§_-92h§[_loc1_]);
            _loc1_++;
         }
         this.§_-92h§ = [];
      }
      
      private function §_-j1q§() : void
      {
         §_-EX§.finish();
         §_-Q2v§.complete(§_-Q2v§.§_-W1q§);
         §_-Vm§.instance.close(false);
         §_-92z§.start(§_-q1p§.§_-C25§,false,false,0);
      }
   }
}

