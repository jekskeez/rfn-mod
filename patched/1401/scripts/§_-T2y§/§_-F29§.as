package §_-T2y§
{
   import §_-1§.§_-03q§;
   import §_-1§.§_-7F§;
   import §_-1§.§_-UP§;
   import §_-1§.§_-X1k§;
   import §_-1§.§_-Y2x§;
   import §_-1§.§_-Z10§;
   import §_-1§.§_-c2t§;
   import §_-1§.§_-k1u§;
   import §_-1§.§_-uV§;
   import §_-1§.§_-vk§;
   import §_-8I§.CastEvent;
   import §_-D2k§.§_-A2q§;
   import §_-D2k§.§_-z2u§;
   import §_-I10§.§_-Bm§;
   import §_-S1D§.§_-O1M§;
   import §_-X1Q§.§_-O6§;
   import §_-Y22§.§_-E1J§;
   import events.§_-55§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-P1h§;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import utils.StringUtil;
   import views.§_-Vm§;
   
   public class §_-F29§ extends Screen implements §_-E1J§
   {
      
      public static const §_-q1M§:int = 0;
      
      public static const §_-S2i§:int = 1;
      
      public static const §_-fY§:int = 2;
      
      private static const §_-x1c§:int = 1;
      
      private static const §_-PX§:int = 244128;
      
      private static const §_-nu§:int = 244134;
      
      private static const §_-j2g§:int = 244431;
      
      private static const §_-q2j§:int = 244609;
      
      private static const §_-X2l§:int = 244454;
      
      private static const §_-wq§:int = 244142;
      
      private static const §_-r1Q§:int = 244402;
      
      private static const §_-UX§:int = 244212;
      
      private static const §_-xJ§:int = 400084;
      
      private static const §_-O1O§:int = 244509;
      
      private static var _instance:§_-F29§;
      
      public static var type:int = 0;
      
      public static var §_-Vx§:Object = {};
      
      private var §_-i13§:§_-A2q§;
      
      private var §_-K1Z§:Object = {};
      
      private var §_-G2h§:int = -1;
      
      private var §_-z2Y§:int = -1;
      
      private var §_-O1p§:int = 0;
      
      private var §_-n2O§:§_-22V§ = null;
      
      private var §_-Z2W§:Timer = new Timer(1000);
      
      public function §_-F29§()
      {
         super();
         _instance = this;
         this.init();
      }
      
      public static function §_-e10§() : void
      {
         var _loc1_:Timer = new Timer(1,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,§_-a2b§);
         _loc1_.reset();
         _loc1_.start();
         §_-O1M§.§_-F2g§ = §_-S2I§.ROUND_STARTING;
         §_-Vx§ = {};
      }
      
      public static function §_-g15§() : void
      {
         var _loc1_:Timer = new Timer(1,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,§_-k2V§);
         _loc1_.reset();
         _loc1_.start();
         §_-O1M§.§_-F2g§ = §_-S2I§.ROUND_STARTING;
         §_-Vx§ = {};
      }
      
      public static function §_-02n§(param1:Boolean) : void
      {
         _instance.§_-02n§(param1);
      }
      
      private static function §_-a2b§(param1:Event) : void
      {
         if(_instance)
         {
            _instance.§_-e10§();
         }
      }
      
      private static function §_-k2V§(param1:Event) : void
      {
         if(_instance)
         {
            _instance.§_-g15§();
         }
      }
      
      private static function get maps() : Array
      {
         switch(type)
         {
            case §_-q1M§:
               return [§_-PX§,§_-nu§,§_-j2g§,§_-q2j§,§_-X2l§,§_-wq§,§_-r1Q§,§_-UX§,§_-xJ§,§_-O1O§];
            case §_-S2i§:
               return [28419,32045,288119,10771,28279,28426,31615,28455,29040,288253,288191,360235,382138,383967,384030,1158183,1286170];
            case §_-fY§:
               return [1503586,1503587,1503588,1503589,1503590,1503591];
            default:
               return [];
         }
      }
      
      private static function get §_-4U§() : int
      {
         switch(type)
         {
            case §_-q1M§:
               return §_-Bm§.§_-z1M§(§_-T2o§.§_-s2X§).value;
            case §_-S2i§:
               return §_-Bm§.§_-z1M§(§_-T2o§.§_-CT§).value;
            case §_-fY§:
               return §_-Bm§.§_-z1M§(§_-T2o§.§_-p1G§).value;
            default:
               return 0;
         }
      }
      
      private static function set §_-4U§(param1:int) : void
      {
         switch(type)
         {
            case §_-q1M§:
               §_-Bm§.§_-z1M§(§_-T2o§.§_-s2X§).§_-r1g§(param1);
               break;
            case §_-S2i§:
               §_-Bm§.§_-z1M§(§_-T2o§.§_-CT§).§_-r1g§(param1);
               break;
            case §_-fY§:
               §_-Bm§.§_-z1M§(§_-T2o§.§_-p1G§).§_-r1g§(param1);
         }
      }
      
      private static function get §_-s21§() : Boolean
      {
         switch(type)
         {
            case §_-q1M§:
               return §_-Bm§.§_-z1M§(§_-T2o§.§_-Q2R§).value != 0;
            case §_-S2i§:
               return §_-Bm§.§_-z1M§(§_-T2o§.§_-m11§).value != 0;
            case §_-fY§:
               return §_-Bm§.§_-z1M§(§_-T2o§.§_-mM§).value != 0;
            default:
               return false;
         }
      }
      
      private static function set §_-s21§(param1:Boolean) : void
      {
         switch(type)
         {
            case §_-q1M§:
               §_-Bm§.§_-z1M§(§_-T2o§.§_-Q2R§).§_-r1g§(param1 ? 1 : 0);
               break;
            case §_-S2i§:
               §_-Bm§.§_-z1M§(§_-T2o§.§_-m11§).§_-r1g§(param1 ? 1 : 0);
               break;
            case §_-fY§:
               §_-Bm§.§_-z1M§(§_-T2o§.§_-mM§).§_-r1g§(param1 ? 1 : 0);
         }
      }
      
      override public function show() : void
      {
         super.show();
         §_-Vm§.instance.open();
         this.§_-O1p§ = §_-4U§;
         if(type == §_-fY§)
         {
            §_-92z§.location = §_-q1p§.§_-M1m§;
         }
         else
         {
            §_-92z§.location = §_-q1p§.§_-C25§;
         }
         this.§_-i13§ = type == §_-fY§ ? new §_-z2u§() : new §_-A2q§();
         this.addChild(this.§_-i13§);
         §_-s1i§.§_-831§.addChild(this.§_-i13§.getStarlingView());
         §_-O1M§.hero = null;
         §_-O1M§.§_-C6§(this.§_-S2Z§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-pN§]);
         this.§_-e10§();
      }
      
      override public function hide() : void
      {
         super.hide();
         if(this.§_-i13§ != null)
         {
            if(contains(this.§_-i13§))
            {
               removeChild(this.§_-i13§);
            }
            this.§_-i13§.dispose();
            this.§_-i13§ = null;
         }
         §_-O1M§.hero = null;
         §_-O1M§.§_-L2u§(this.§_-S2Z§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-pN§]);
      }
      
      private function init() : void
      {
         this.§_-n2O§ = new §_-22V§("",0,0,new TextFormat(null,60,16774444,true));
         this.§_-n2O§.filters = [new DropShadowFilter(0,45,13700,1,4,4,5,1)];
         this.§_-n2O§.width = §_-a9§.§_-9o§;
         this.§_-n2O§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-n2O§);
         this.§_-Z2W§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-J1O§);
      }
      
      private function §_-J1O§(param1:TimerEvent) : void
      {
         this.§_-n2O§.text = "";
         if(this.§_-i13§ == null)
         {
            return;
         }
         this.§_-i13§.start();
      }
      
      private function §_-OC§() : void
      {
         this.§_-n2O§.text = gls("Урок {0}",this.§_-O1p§);
         this.§_-n2O§.x = (Game.starling.stage.stageWidth - this.§_-n2O§.width) * 0.5;
         this.§_-n2O§.y = (Game.starling.stage.stageHeight - this.§_-n2O§.height) * 0.5;
      }
      
      private function §_-e10§() : void
      {
         var _loc1_:Array = maps;
         §_-4U§ = this.§_-O1p§;
         ++this.§_-O1p§;
         if(_loc1_.length < this.§_-O1p§ && !§_-s21§)
         {
            §_-71o§.show("Location");
            §_-s21§ = true;
            §_-5K§.§_-b1W§();
            type = -1;
            return;
         }
         if(this.§_-O1p§ > _loc1_.length)
         {
            this.§_-O1p§ = 1;
         }
         var _loc2_:int = int(_loc1_[this.§_-O1p§ - 1]);
         if(_loc2_ in this.§_-K1Z§)
         {
            this.§_-t9§(_loc2_,this.§_-K1Z§[_loc2_]);
            return;
         }
         this.§_-G2h§ = _loc2_;
         Connection.§_-Li§(§_-h2B§.§_-V2T§,_loc2_);
      }
      
      private function §_-S2Z§(param1:§_-55§) : void
      {
         if(this.§_-i13§ == null)
         {
            return;
         }
         this.§_-i13§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,param1.className));
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.§_-G2h§ != param1[0])
         {
            return;
         }
         this.§_-t9§(this.§_-G2h§,StringUtil.§_-B1K§(param1[4]));
         §_-P1h§.add(param1[4]);
         this.§_-G2h§ = -1;
      }
      
      private function §_-t9§(param1:int, param2:String) : void
      {
         if(!this.§_-i13§)
         {
            return;
         }
         if(this.§_-i13§.squirrels)
         {
            this.§_-i13§.squirrels.clear();
         }
         this.§_-i13§.§_-si§();
         this.§_-z2Y§ = param1;
         this.§_-K1Z§[param1] = param2;
         this.§_-i13§.map.§_-41M§(param2);
         this.§_-E1F§();
      }
      
      private function §_-E1F§() : void
      {
         addChild(this.§_-n2O§);
         this.§_-Z2W§.reset();
         this.§_-Z2W§.repeatCount = §_-x1c§;
         this.§_-Z2W§.start();
         this.§_-OC§();
      }
      
      private function §_-g15§() : void
      {
         this.§_-t9§(this.§_-z2Y§,this.§_-K1Z§[this.§_-z2Y§]);
      }
      
      private function §_-02n§(param1:Boolean) : void
      {
         if(!this.§_-i13§)
         {
            return;
         }
         if(!param1)
         {
            §_-O6§.instance().§_-K21§();
            return;
         }
         this.§_-i13§.removeHintArrow("magicArrow");
         switch(this.§_-z2Y§)
         {
            case §_-PX§:
               §_-O6§.instance().§_-qS§(§_-X1k§);
               break;
            case §_-nu§:
               §_-O6§.instance().§_-qS§(§_-c2t§);
               break;
            case §_-j2g§:
               §_-O6§.instance().§_-qS§(§_-03q§);
               break;
            case §_-q2j§:
               §_-O6§.instance().§_-qS§(§_-Z10§);
               break;
            case §_-X2l§:
               §_-O6§.instance().§_-qS§(§_-Y2x§);
               break;
            case §_-wq§:
               §_-O6§.instance().§_-qS§(§_-k1u§);
               break;
            case §_-r1Q§:
               §_-O6§.instance().§_-qS§(§_-uV§);
               break;
            case §_-UX§:
               §_-O6§.instance().§_-qS§(§_-UP§);
               break;
            case §_-xJ§:
               §_-O6§.instance().§_-qS§(§_-7F§);
               break;
            case §_-O1O§:
               §_-O6§.instance().§_-qS§(§_-vk§);
               break;
            default:
               return;
         }
      }
   }
}

