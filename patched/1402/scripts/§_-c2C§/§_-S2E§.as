package §_-c2C§
{
   import §_-5P§.§_-7z§;
   import §_-5P§.§_-A1n§;
   import §_-5P§.§_-B31§;
   import §_-5P§.§_-ER§;
   import §_-5P§.§_-F2D§;
   import §_-5P§.§_-R1n§;
   import §_-5P§.§_-V11§;
   import §_-5P§.§_-l2L§;
   import §_-5P§.§_-r2x§;
   import §_-5P§.§_-y22§;
   import §_-61C§.§_-a2p§;
   import §_-I2Y§.§_-91K§;
   import §_-M1h§.§_-Vk§;
   import §_-M1h§.§_-p1U§;
   import §_-P2Y§.§_-dn§;
   import §_-X1k§.§_-r12§;
   import §_-X2V§.CastEvent;
   import events.§_-Am§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-Q17§;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   import views.§_-aW§;
   
   public class §_-S2E§ extends Screen implements §_-91K§
   {
      
      public static const §_-y3§:int = 0;
      
      public static const §_-Z2N§:int = 1;
      
      public static const §_-K1w§:int = 2;
      
      private static const §_-a1l§:int = 1;
      
      private static const §_-G2F§:int = 244128;
      
      private static const §_-KK§:int = 244134;
      
      private static const §_-93j§:int = 244431;
      
      private static const §_-X15§:int = 244609;
      
      private static const §_-C1t§:int = 244454;
      
      private static const §_-LQ§:int = 244142;
      
      private static const §_-13Q§:int = 244402;
      
      private static const §_-4Q§:int = 244212;
      
      private static const §_-02H§:int = 400084;
      
      private static const §_-62P§:int = 244509;
      
      private static var _instance:§_-S2E§;
      
      public static var type:int = 0;
      
      public static var §_-t1y§:Object = {};
      
      private var §_-C1B§:§_-Vk§;
      
      private var §_-jP§:Object = {};
      
      private var §_-63X§:int = -1;
      
      private var §_-g2x§:int = -1;
      
      private var §_-w0§:int = 0;
      
      private var §_-w2N§:§_-i5§ = null;
      
      private var §_-V28§:Timer = new Timer(1000);
      
      public function §_-S2E§()
      {
         super();
         _instance = this;
         this.init();
      }
      
      public static function §_-T1l§() : void
      {
         var _loc1_:Timer = new Timer(1,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,§_-y1e§);
         _loc1_.reset();
         _loc1_.start();
         §_-a2p§.§_-j2F§ = §_-s2l§.ROUND_STARTING;
         §_-t1y§ = {};
      }
      
      public static function §_-k1i§() : void
      {
         var _loc1_:Timer = new Timer(1,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,§_-v2V§);
         _loc1_.reset();
         _loc1_.start();
         §_-a2p§.§_-j2F§ = §_-s2l§.ROUND_STARTING;
         §_-t1y§ = {};
      }
      
      public static function §_-r15§(param1:Boolean) : void
      {
         _instance.§_-r15§(param1);
      }
      
      private static function §_-y1e§(param1:Event) : void
      {
         if(_instance)
         {
            _instance.§_-T1l§();
         }
      }
      
      private static function §_-v2V§(param1:Event) : void
      {
         if(_instance)
         {
            _instance.§_-k1i§();
         }
      }
      
      private static function get maps() : Array
      {
         switch(type)
         {
            case §_-y3§:
               return [§_-G2F§,§_-KK§,§_-93j§,§_-X15§,§_-C1t§,§_-LQ§,§_-13Q§,§_-4Q§,§_-02H§,§_-62P§];
            case §_-Z2N§:
               return [28419,32045,288119,10771,28279,28426,31615,28455,29040,288253,288191,360235,382138,383967,384030,1158183,1286170];
            case §_-K1w§:
               return [1503586,1503587,1503588,1503589,1503590,1503591];
            default:
               return [];
         }
      }
      
      private static function get §_-L2X§() : int
      {
         switch(type)
         {
            case §_-y3§:
               return §_-r12§.§_-73x§(§_-n2E§.§_-NL§).value;
            case §_-Z2N§:
               return §_-r12§.§_-73x§(§_-n2E§.§_-qO§).value;
            case §_-K1w§:
               return §_-r12§.§_-73x§(§_-n2E§.§_-72d§).value;
            default:
               return 0;
         }
      }
      
      private static function set §_-L2X§(param1:int) : void
      {
         switch(type)
         {
            case §_-y3§:
               §_-r12§.§_-73x§(§_-n2E§.§_-NL§).§_-i2T§(param1);
               break;
            case §_-Z2N§:
               §_-r12§.§_-73x§(§_-n2E§.§_-qO§).§_-i2T§(param1);
               break;
            case §_-K1w§:
               §_-r12§.§_-73x§(§_-n2E§.§_-72d§).§_-i2T§(param1);
         }
      }
      
      private static function get §_-b1P§() : Boolean
      {
         switch(type)
         {
            case §_-y3§:
               return §_-r12§.§_-73x§(§_-n2E§.§_-y1i§).value != 0;
            case §_-Z2N§:
               return §_-r12§.§_-73x§(§_-n2E§.§_-X1A§).value != 0;
            case §_-K1w§:
               return §_-r12§.§_-73x§(§_-n2E§.§_-A3F§).value != 0;
            default:
               return false;
         }
      }
      
      private static function set §_-b1P§(param1:Boolean) : void
      {
         switch(type)
         {
            case §_-y3§:
               §_-r12§.§_-73x§(§_-n2E§.§_-y1i§).§_-i2T§(param1 ? 1 : 0);
               break;
            case §_-Z2N§:
               §_-r12§.§_-73x§(§_-n2E§.§_-X1A§).§_-i2T§(param1 ? 1 : 0);
               break;
            case §_-K1w§:
               §_-r12§.§_-73x§(§_-n2E§.§_-A3F§).§_-i2T§(param1 ? 1 : 0);
         }
      }
      
      override public function show() : void
      {
         super.show();
         §_-aW§.instance.open();
         this.§_-w0§ = §_-L2X§;
         if(type == §_-K1w§)
         {
            §_-u24§.location = §_-at§.§_-N2g§;
         }
         else
         {
            §_-u24§.location = §_-at§.§_-I6§;
         }
         this.§_-C1B§ = type == §_-K1w§ ? new §_-p1U§() : new §_-Vk§();
         this.addChild(this.§_-C1B§);
         §_-817§.§_-X2a§.addChild(this.§_-C1B§.getStarlingView());
         §_-a2p§.hero = null;
         §_-a2p§.§_-f15§(this.§_-BS§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-02u§]);
         this.§_-T1l§();
      }
      
      override public function hide() : void
      {
         super.hide();
         if(this.§_-C1B§ != null)
         {
            if(contains(this.§_-C1B§))
            {
               removeChild(this.§_-C1B§);
            }
            this.§_-C1B§.dispose();
            this.§_-C1B§ = null;
         }
         §_-a2p§.hero = null;
         §_-a2p§.§_-Dg§(this.§_-BS§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-02u§]);
      }
      
      private function init() : void
      {
         this.§_-w2N§ = new §_-i5§("",0,0,new TextFormat(null,60,16774444,true));
         this.§_-w2N§.filters = [new DropShadowFilter(0,45,13700,1,4,4,5,1)];
         this.§_-w2N§.width = §_-Zy§.§_-21V§;
         this.§_-w2N§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-w2N§);
         this.§_-V28§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-13T§);
      }
      
      private function §_-13T§(param1:TimerEvent) : void
      {
         this.§_-w2N§.text = "";
         if(this.§_-C1B§ == null)
         {
            return;
         }
         this.§_-C1B§.start();
      }
      
      private function §_-s0§() : void
      {
         this.§_-w2N§.text = gls("Урок {0}",this.§_-w0§);
         this.§_-w2N§.x = (Game.starling.stage.stageWidth - this.§_-w2N§.width) * 0.5;
         this.§_-w2N§.y = (Game.starling.stage.stageHeight - this.§_-w2N§.height) * 0.5;
      }
      
      private function §_-T1l§() : void
      {
         var _loc1_:Array = maps;
         §_-L2X§ = this.§_-w0§;
         ++this.§_-w0§;
         if(_loc1_.length < this.§_-w0§ && !§_-b1P§)
         {
            §_-t2c§.show("Location");
            §_-b1P§ = true;
            §_-si§.§_-m1x§();
            type = -1;
            return;
         }
         if(this.§_-w0§ > _loc1_.length)
         {
            this.§_-w0§ = 1;
         }
         var _loc2_:int = int(_loc1_[this.§_-w0§ - 1]);
         if(_loc2_ in this.§_-jP§)
         {
            this.§_-a1r§(_loc2_,this.§_-jP§[_loc2_]);
            return;
         }
         this.§_-63X§ = _loc2_;
         Connection.§_-e2T§(§_-u1O§.§_-n2D§,_loc2_);
      }
      
      private function §_-BS§(param1:§_-Am§) : void
      {
         if(this.§_-C1B§ == null)
         {
            return;
         }
         this.§_-C1B§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,param1.className));
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.§_-63X§ != param1[0])
         {
            return;
         }
         this.§_-a1r§(this.§_-63X§,StringUtil.§_-a14§(param1[4]));
         §_-Q17§.add(param1[4]);
         this.§_-63X§ = -1;
      }
      
      private function §_-a1r§(param1:int, param2:String) : void
      {
         if(!this.§_-C1B§)
         {
            return;
         }
         if(this.§_-C1B§.squirrels)
         {
            this.§_-C1B§.squirrels.clear();
         }
         this.§_-C1B§.§_-733§();
         this.§_-g2x§ = param1;
         this.§_-jP§[param1] = param2;
         this.§_-C1B§.map.§_-o2I§(param2);
         this.§_-F2A§();
      }
      
      private function §_-F2A§() : void
      {
         addChild(this.§_-w2N§);
         this.§_-V28§.reset();
         this.§_-V28§.repeatCount = §_-a1l§;
         this.§_-V28§.start();
         this.§_-s0§();
      }
      
      private function §_-k1i§() : void
      {
         this.§_-a1r§(this.§_-g2x§,this.§_-jP§[this.§_-g2x§]);
      }
      
      private function §_-r15§(param1:Boolean) : void
      {
         if(!this.§_-C1B§)
         {
            return;
         }
         if(!param1)
         {
            §_-dn§.instance().§_-dz§();
            return;
         }
         this.§_-C1B§.removeHintArrow("magicArrow");
         switch(this.§_-g2x§)
         {
            case §_-G2F§:
               §_-dn§.instance().§_-H2u§(§_-R1n§);
               break;
            case §_-KK§:
               §_-dn§.instance().§_-H2u§(§_-l2L§);
               break;
            case §_-93j§:
               §_-dn§.instance().§_-H2u§(§_-ER§);
               break;
            case §_-X15§:
               §_-dn§.instance().§_-H2u§(§_-7z§);
               break;
            case §_-C1t§:
               §_-dn§.instance().§_-H2u§(§_-B31§);
               break;
            case §_-LQ§:
               §_-dn§.instance().§_-H2u§(§_-V11§);
               break;
            case §_-13Q§:
               §_-dn§.instance().§_-H2u§(§_-y22§);
               break;
            case §_-4Q§:
               §_-dn§.instance().§_-H2u§(§_-r2x§);
               break;
            case §_-02H§:
               §_-dn§.instance().§_-H2u§(§_-F2D§);
               break;
            case §_-62P§:
               §_-dn§.instance().§_-H2u§(§_-A1n§);
               break;
            default:
               return;
         }
      }
   }
}

