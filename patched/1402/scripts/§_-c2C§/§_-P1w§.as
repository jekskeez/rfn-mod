package §_-c2C§
{
   import §_-I18§.§_-jv§;
   import §_-U19§.§_-B2U§;
   import §_-U19§.§_-m1L§;
   import §_-X1k§.§_-I2l§;
   import buttons.§_-Z2B§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import views.§_-53g§;
   
   public class §_-P1w§ extends Screen
   {
      
      private static var _instance:§_-P1w§;
      
      private var §_-013§:Boolean = false;
      
      private var §_-by§:Timer = new Timer(15000,1);
      
      private var §_-D1c§:Sprite;
      
      private var §_-u21§:Boolean = false;
      
      private var §_-Z6§:§_-53g§;
      
      private var §_-K2K§:Sprite;
      
      private var §_-C1§:Number = -50;
      
      public function §_-P1w§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-P1w§
      {
         return _instance;
      }
      
      public static function §_-71A§() : void
      {
         if(!_instance.§_-u21§)
         {
            return;
         }
         (_instance.§_-D1c§ as §_-m1L§).clanId = Game.self["clan_id"];
         (_instance.§_-D1c§ as §_-m1L§).§_-s2W§();
      }
      
      public static function §_-51k§() : void
      {
         if(!_instance.§_-u21§)
         {
            return;
         }
         (_instance.§_-D1c§ as §_-m1L§).§_-51k§();
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-u21§)
         {
            this.init();
            (this.§_-D1c§ as §_-m1L§).clanId = Game.self["clan_id"];
            §_-B2U§.request(Game.self["clan_id"],§_-eT§.ALL);
            this.§_-u21§ = true;
            if(§_-B2U§.§_-Z2Y§ != null && §_-B2U§.§_-Z2Y§ != "")
            {
               new §_-jv§(§_-B2U§.§_-Z2Y§).show();
            }
         }
         else
         {
            this.§_-D1c§.visible = true;
            §_-B2U§.request(Game.self["clan_id"],§_-eT§.§_-t1d§ | §_-eT§.§_-x2Q§,true);
         }
         if(!§_-m1L§.§_-K1W§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-12j§);
            §_-m1L§.§_-K1W§ = true;
         }
         this.§_-Z1j§ = this.§_-D1c§.visible;
      }
      
      override public function hide() : void
      {
         super.hide();
         this.§_-Z1j§ = false;
         this.§_-D1c§.visible = false;
      }
      
      public function get §_-Z1j§() : Boolean
      {
         return this.§_-013§;
      }
      
      public function set §_-Z1j§(param1:Boolean) : void
      {
         if(this.§_-013§ == param1)
         {
            return;
         }
         this.§_-013§ = param1;
         if(param1)
         {
            Connection.§_-e2T§(§_-u1O§.§_-J1s§);
            this.§_-by§.stop();
            this.§_-by§.reset();
            this.§_-by§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-s1Z§);
         }
         else
         {
            this.§_-by§.start();
            this.§_-by§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-s1Z§);
         }
      }
      
      private function init() : void
      {
         this.§_-Z6§ = new §_-53g§(Game.self["interior"],true);
         addChild(this.§_-Z6§);
         §_-I2l§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-U1J§);
         this.§_-K2K§ = new Sprite();
         addChild(this.§_-K2K§);
         this.§_-D1c§ = new §_-m1L§();
         this.§_-D1c§.x = this.§_-C1§;
         this.§_-K2K§.addChild(this.§_-D1c§);
         var _loc1_:§_-Z2B§ = new §_-Z2B§();
         _loc1_.x = 400;
         _loc1_.y = 150;
         this.§_-K2K§.addChild(_loc1_);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         this.§_-K2K§.x = (Game.starling.stage.stageWidth - §_-Zy§.§_-21V§) * 0.5;
         this.§_-K2K§.y = (Game.starling.stage.stageHeight - §_-Zy§.§_-02T§) * 0.5;
      }
      
      private function §_-U1J§(param1:GameEvent) : void
      {
         this.§_-Z6§.load(Game.self["interior"]);
      }
      
      private function §_-s1Z§(param1:TimerEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-h1Z§);
         this.§_-by§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-s1Z§);
      }
   }
}

