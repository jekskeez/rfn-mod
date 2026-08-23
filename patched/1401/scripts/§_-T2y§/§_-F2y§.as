package §_-T2y§
{
   import §_-I10§.§_-f22§;
   import §_-dc§.§_-X1g§;
   import §_-dc§.§_-e2W§;
   import §_-xm§.§_-n29§;
   import buttons.§_-LD§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import views.§_-B2T§;
   
   public class §_-F2y§ extends Screen
   {
      
      private static var _instance:§_-F2y§;
      
      private var §_-M2w§:Boolean = false;
      
      private var §_-s1k§:Timer = new Timer(15000,1);
      
      private var §_-A3f§:Sprite;
      
      private var §_-P20§:Boolean = false;
      
      private var §_-C3d§:§_-B2T§;
      
      private var §_-H1g§:Sprite;
      
      private var §_-23s§:Number = -50;
      
      public function §_-F2y§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-F2y§
      {
         return _instance;
      }
      
      public static function §_-p2a§() : void
      {
         if(!_instance.§_-P20§)
         {
            return;
         }
         (_instance.§_-A3f§ as §_-X1g§).clanId = Game.self["clan_id"];
         (_instance.§_-A3f§ as §_-X1g§).§_-j11§();
      }
      
      public static function §_-725§() : void
      {
         if(!_instance.§_-P20§)
         {
            return;
         }
         (_instance.§_-A3f§ as §_-X1g§).§_-725§();
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-P20§)
         {
            this.init();
            (this.§_-A3f§ as §_-X1g§).clanId = Game.self["clan_id"];
            §_-e2W§.request(Game.self["clan_id"],§_-Oy§.ALL);
            this.§_-P20§ = true;
            if(§_-e2W§.§_-Rg§ != null && §_-e2W§.§_-Rg§ != "")
            {
               new §_-n29§(§_-e2W§.§_-Rg§).show();
            }
         }
         else
         {
            this.§_-A3f§.visible = true;
            §_-e2W§.request(Game.self["clan_id"],§_-Oy§.§_-TZ§ | §_-Oy§.§_-6V§,true);
         }
         if(!§_-X1g§.§_-G2p§)
         {
            Connection.§_-Li§(§_-h2B§.§_-cw§);
            §_-X1g§.§_-G2p§ = true;
         }
         this.§_-Ib§ = this.§_-A3f§.visible;
      }
      
      override public function hide() : void
      {
         super.hide();
         this.§_-Ib§ = false;
         this.§_-A3f§.visible = false;
      }
      
      public function get §_-Ib§() : Boolean
      {
         return this.§_-M2w§;
      }
      
      public function set §_-Ib§(param1:Boolean) : void
      {
         if(this.§_-M2w§ == param1)
         {
            return;
         }
         this.§_-M2w§ = param1;
         if(param1)
         {
            Connection.§_-Li§(§_-h2B§.§_-D1A§);
            this.§_-s1k§.stop();
            this.§_-s1k§.reset();
            this.§_-s1k§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-UD§);
         }
         else
         {
            this.§_-s1k§.start();
            this.§_-s1k§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-UD§);
         }
      }
      
      private function init() : void
      {
         this.§_-C3d§ = new §_-B2T§(Game.self["interior"],true);
         addChild(this.§_-C3d§);
         §_-f22§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-oZ§);
         this.§_-H1g§ = new Sprite();
         addChild(this.§_-H1g§);
         this.§_-A3f§ = new §_-X1g§();
         this.§_-A3f§.x = this.§_-23s§;
         this.§_-H1g§.addChild(this.§_-A3f§);
         var _loc1_:§_-LD§ = new §_-LD§();
         _loc1_.x = 400;
         _loc1_.y = 150;
         this.§_-H1g§.addChild(_loc1_);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         this.§_-H1g§.x = (Game.starling.stage.stageWidth - §_-a9§.§_-9o§) * 0.5;
         this.§_-H1g§.y = (Game.starling.stage.stageHeight - §_-a9§.§_-31m§) * 0.5;
      }
      
      private function §_-oZ§(param1:GameEvent) : void
      {
         this.§_-C3d§.load(Game.self["interior"]);
      }
      
      private function §_-UD§(param1:TimerEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-S2q§);
         this.§_-s1k§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-UD§);
      }
   }
}

