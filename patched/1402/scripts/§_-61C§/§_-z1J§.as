package §_-61C§
{
   import §_-22D§.§_-S1H§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-u2n§;
   import §_-c2C§.§_-51A§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-c6§;
   import buttons.§_-uH§;
   import chat.§_-Q1F§;
   import events.GameEvent;
   import events.§_-b2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import tape.§_-02g§;
   import tape.§_-T2G§;
   import tape.§_-p2a§;
   
   public class §_-z1J§ extends Sprite
   {
      
      private static var _instance:§_-z1J§;
      
      private var §_-f1L§:§_-Hg§;
      
      private var §_-a1W§:§_-uH§;
      
      private var §_-j2i§:§_-uH§;
      
      private var §_-81r§:§_-uH§;
      
      private var §_-L1O§:§_-c6§;
      
      private var §_-iN§:§_-02g§ = null;
      
      private var §_-717§:§_-T2G§ = null;
      
      private var §_-G2c§:§_-p2a§ = null;
      
      private var §_-s1x§:Boolean = false;
      
      private var state:Boolean = true;
      
      public function §_-z1J§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.init();
      }
      
      public static function set §_-E2e§(param1:Boolean) : void
      {
         _instance.§_-E2e§ = param1;
      }
      
      public static function show(param1:Boolean) : void
      {
         if(§_-51A§.playerId != Game.selfId)
         {
            param1 = false;
         }
         _instance.visible = true;
         _instance.§_-81r§.visible = param1;
         if(!param1)
         {
            _instance.§_-f1L§.§_-l1Y§(_instance.§_-a1W§);
         }
         if("clan_id" in Game.self && Game.self["clan_id"] != 0)
         {
            §_-z1J§.§_-E2e§ = true;
         }
      }
      
      public static function §_-e22§() : void
      {
         _instance.§_-f1L§.§_-l1Y§(_instance.§_-81r§);
      }
      
      public static function §_-S1j§() : void
      {
         _instance.§_-S1j§();
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
         _instance.§_-81r§.visible = false;
         _instance.§_-f1L§.§_-l1Y§(_instance.§_-a1W§);
      }
      
      public static function §_-s2d§() : void
      {
         §_-51A§.§_-A3z§(GameEvent.PROFILE_PLAYER_CHANGED,_instance.§_-41E§);
      }
      
      public static function §_-81q§(param1:Boolean = false) : void
      {
         if(param1)
         {
            _instance.§_-L1O§.on();
         }
         else
         {
            _instance.§_-L1O§.off();
         }
         §_-Q1F§.§_-82u§(_instance.§_-L1O§.§_-A3W§.visible);
      }
      
      public static function §_-DQ§(param1:§_-Q1F§) : void
      {
         _instance.addChildAt(param1,0);
      }
      
      private function init() : void
      {
         var _loc1_:ImageFooterTop = new ImageFooterTop();
         _loc1_.y = §_-Zy§.§_-02T§ - §_-im§.§_-u2F§ - _loc1_.height;
         addChild(_loc1_);
         this.§_-a1W§ = new §_-uH§(new §_-Q1W§(gls("Друзья")));
         this.§_-a1W§.y = _loc1_.y - this.§_-a1W§.height + 2;
         this.§_-a1W§.addEventListener(§_-b2G§.SELECT,this.§_-J11§,false,1);
         addChild(this.§_-a1W§);
         this.§_-iN§ = new §_-02g§();
         this.§_-iN§.y = 40;
         addChild(this.§_-iN§);
         this.§_-j2i§ = new §_-uH§(new §_-Q1W§(gls("Клан")));
         this.§_-j2i§.x = this.§_-a1W§.x + this.§_-a1W§.width + 5;
         this.§_-j2i§.y = this.§_-a1W§.y;
         this.§_-j2i§.visible = false;
         this.§_-j2i§.addEventListener(§_-b2G§.SELECT,this.§_-f2C§);
         this.§_-j2i§.addEventListener(§_-b2G§.SELECT,this.§_-J11§,false,1);
         addChild(this.§_-j2i§);
         if(§_-Zy§.§_-BI§)
         {
            this.§_-81r§ = new §_-uH§(new §_-Q1W§(gls("Мебель")));
         }
         else
         {
            this.§_-81r§ = new §_-uH§(new §_-Q1W§(gls("Мебель"),§_-Q1W§.§_-Y2U§,null,-2,-2));
         }
         this.§_-81r§.x = this.§_-j2i§.x;
         this.§_-81r§.y = this.§_-a1W§.y;
         this.§_-81r§.visible = false;
         this.§_-81r§.addEventListener(§_-b2G§.SELECT,this.§_-J11§,false,1);
         addChild(this.§_-81r§);
         this.§_-717§ = new §_-T2G§();
         this.§_-717§.visible = false;
         this.§_-717§.y = 49;
         addChild(this.§_-717§);
         this.§_-L1O§ = new §_-c6§(new ButtonFooterChatOff(),new ButtonFooterChatOn(),false);
         this.§_-L1O§.x = 20;
         this.§_-L1O§.y = 37;
         this.§_-L1O§.addEventListener(MouseEvent.CLICK,this.§_-82u§);
         addChild(this.§_-L1O§);
         new §_-kr§(this.§_-L1O§,gls("Чат"));
         this.§_-f1L§ = new §_-Hg§();
         this.§_-f1L§.insert(this.§_-a1W§,this.§_-iN§);
         this.§_-f1L§.insert(this.§_-j2i§,this.§_-717§);
         this.§_-f1L§.§_-l1Y§(this.§_-a1W§);
         this.§_-f1L§.x = 40;
         addChild(this.§_-f1L§);
         if("chatState" in §_-u2n§.load(§_-u2n§.§_-M1L§))
         {
            §_-z1J§.§_-81q§(§_-u2n§.load(§_-u2n§.§_-M1L§)["chatState"] != 0);
         }
         else
         {
            §_-u2n§.addCallback(§_-u2n§.§_-M1L§,this.onLoad);
         }
         this.y = 78;
      }
      
      private function onLoad() : void
      {
         if("chatState" in §_-u2n§.load(§_-u2n§.§_-M1L§))
         {
            §_-z1J§.§_-81q§(§_-u2n§.load(§_-u2n§.§_-M1L§)["chatState"] != 0);
         }
         else if(§_-LZ§.§_-mA§ >= §_-XW§.§_-a26§)
         {
            §_-z1J§.§_-81q§(true);
         }
      }
      
      private function §_-J11§(param1:§_-b2G§) : void
      {
         if(param1.button != this.§_-f1L§.selected && !this.state)
         {
            return;
         }
         §_-S1H§.to(this,0.5,{"y":(this.state ? 0 : 78)});
         this.state = !this.state;
      }
      
      private function §_-41E§(param1:GameEvent) : void
      {
         this.§_-81r§.visible = §_-51A§.playerId == Game.selfId;
      }
      
      private function §_-S1j§() : void
      {
         this.§_-G2c§ = new §_-p2a§();
         this.§_-G2c§.y = 45;
         addChild(this.§_-G2c§);
         this.§_-f1L§.insert(this.§_-81r§,this.§_-G2c§);
      }
      
      private function set §_-E2e§(param1:Boolean) : void
      {
         this.§_-j2i§.visible = param1;
         this.§_-81r§.x = this.§_-j2i§.x + (this.§_-j2i§.visible ? this.§_-j2i§.width + 5 : 0);
         if(!param1 && this.§_-f1L§.selected == this.§_-j2i§)
         {
            this.§_-f1L§.§_-l1Y§(this.§_-a1W§);
         }
         if(param1)
         {
            return;
         }
         this.§_-717§.clear();
         this.§_-s1x§ = false;
      }
      
      private function §_-f2C§(param1:§_-b2G§) : void
      {
         if(this.§_-s1x§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-63V§,Game.self["clan_id"]);
         this.§_-717§.clear();
         this.§_-s1x§ = true;
      }
      
      private function §_-82u§(param1:MouseEvent = null) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-71f§);
         §_-Q1F§.§_-82u§(this.§_-L1O§.§_-A3W§.visible);
      }
   }
}

