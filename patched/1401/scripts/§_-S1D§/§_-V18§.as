package §_-S1D§
{
   import §_-42B§.§_-518§;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-5B§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import buttons.§_-p1R§;
   import chat.§_-v13§;
   import events.GameEvent;
   import events.§_-4Y§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import tape.§_-Dv§;
   import tape.§_-F2n§;
   import tape.§_-pz§;
   
   public class §_-V18§ extends Sprite
   {
      
      private static var _instance:§_-V18§;
      
      private var §_-e2i§:§_-G2L§;
      
      private var §_-31L§:§_-F1F§;
      
      private var §_-a2W§:§_-F1F§;
      
      private var §_-E27§:§_-F1F§;
      
      private var §_-I2b§:§_-p1R§;
      
      private var §_-92G§:§_-Dv§ = null;
      
      private var §_-n1w§:§_-F2n§ = null;
      
      private var §_-73S§:§_-pz§ = null;
      
      private var §_-Z1v§:Boolean = false;
      
      private var state:Boolean = true;
      
      public function §_-V18§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.init();
      }
      
      public static function set §_-v1o§(param1:Boolean) : void
      {
         _instance.§_-v1o§ = param1;
      }
      
      public static function show(param1:Boolean) : void
      {
         if(§_-5B§.playerId != Game.selfId)
         {
            param1 = false;
         }
         _instance.visible = true;
         _instance.§_-E27§.visible = param1;
         if(!param1)
         {
            _instance.§_-e2i§.§_-32c§(_instance.§_-31L§);
         }
         if("clan_id" in Game.self && Game.self["clan_id"] != 0)
         {
            §_-V18§.§_-v1o§ = true;
         }
      }
      
      public static function §_-yc§() : void
      {
         _instance.§_-e2i§.§_-32c§(_instance.§_-E27§);
      }
      
      public static function §_-R2G§() : void
      {
         _instance.§_-R2G§();
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
         _instance.§_-E27§.visible = false;
         _instance.§_-e2i§.§_-32c§(_instance.§_-31L§);
      }
      
      public static function §_-W8§() : void
      {
         §_-5B§.§_-h1R§(GameEvent.PROFILE_PLAYER_CHANGED,_instance.§_-E2c§);
      }
      
      public static function §_-zg§(param1:Boolean = false) : void
      {
         if(param1)
         {
            _instance.§_-I2b§.on();
         }
         else
         {
            _instance.§_-I2b§.off();
         }
         §_-v13§.§_-pC§(_instance.§_-I2b§.§_-l2A§.visible);
      }
      
      public static function §_-S2V§(param1:§_-v13§) : void
      {
         _instance.addChildAt(param1,0);
      }
      
      private function init() : void
      {
         var _loc1_:ImageFooterTop = new ImageFooterTop();
         _loc1_.y = §_-a9§.§_-31m§ - §_-3m§.§_-yL§ - _loc1_.height;
         addChild(_loc1_);
         this.§_-31L§ = new §_-F1F§(new §_-T2z§(gls("Друзья")));
         this.§_-31L§.y = _loc1_.y - this.§_-31L§.height + 2;
         this.§_-31L§.addEventListener(§_-4Y§.SELECT,this.§_-X14§,false,1);
         addChild(this.§_-31L§);
         this.§_-92G§ = new §_-Dv§();
         this.§_-92G§.y = 40;
         addChild(this.§_-92G§);
         this.§_-a2W§ = new §_-F1F§(new §_-T2z§(gls("Клан")));
         this.§_-a2W§.x = this.§_-31L§.x + this.§_-31L§.width + 5;
         this.§_-a2W§.y = this.§_-31L§.y;
         this.§_-a2W§.visible = false;
         this.§_-a2W§.addEventListener(§_-4Y§.SELECT,this.§_-b2§);
         this.§_-a2W§.addEventListener(§_-4Y§.SELECT,this.§_-X14§,false,1);
         addChild(this.§_-a2W§);
         if(§_-a9§.§_-sc§)
         {
            this.§_-E27§ = new §_-F1F§(new §_-T2z§(gls("Мебель")));
         }
         else
         {
            this.§_-E27§ = new §_-F1F§(new §_-T2z§(gls("Мебель"),§_-T2z§.§_-j3§,null,-2,-2));
         }
         this.§_-E27§.x = this.§_-a2W§.x;
         this.§_-E27§.y = this.§_-31L§.y;
         this.§_-E27§.visible = false;
         this.§_-E27§.addEventListener(§_-4Y§.SELECT,this.§_-X14§,false,1);
         addChild(this.§_-E27§);
         this.§_-n1w§ = new §_-F2n§();
         this.§_-n1w§.visible = false;
         this.§_-n1w§.y = 49;
         addChild(this.§_-n1w§);
         this.§_-I2b§ = new §_-p1R§(new ButtonFooterChatOff(),new ButtonFooterChatOn(),false);
         this.§_-I2b§.x = 20;
         this.§_-I2b§.y = 37;
         this.§_-I2b§.addEventListener(MouseEvent.CLICK,this.§_-pC§);
         addChild(this.§_-I2b§);
         new §_-Hb§(this.§_-I2b§,gls("Чат"));
         this.§_-e2i§ = new §_-G2L§();
         this.§_-e2i§.insert(this.§_-31L§,this.§_-92G§);
         this.§_-e2i§.insert(this.§_-a2W§,this.§_-n1w§);
         this.§_-e2i§.§_-32c§(this.§_-31L§);
         this.§_-e2i§.x = 40;
         addChild(this.§_-e2i§);
         if("chatState" in §_-82N§.load(§_-82N§.§_-J1S§))
         {
            §_-V18§.§_-zg§(§_-82N§.load(§_-82N§.§_-J1S§)["chatState"] != 0);
         }
         else
         {
            §_-82N§.addCallback(§_-82N§.§_-J1S§,this.onLoad);
         }
         this.y = 78;
      }
      
      private function onLoad() : void
      {
         if("chatState" in §_-82N§.load(§_-82N§.§_-J1S§))
         {
            §_-V18§.§_-zg§(§_-82N§.load(§_-82N§.§_-J1S§)["chatState"] != 0);
         }
         else if(§_-d2x§.§_-z2o§ >= §_-My§.§_-S1A§)
         {
            §_-V18§.§_-zg§(true);
         }
      }
      
      private function §_-X14§(param1:§_-4Y§) : void
      {
         if(param1.button != this.§_-e2i§.selected && !this.state)
         {
            return;
         }
         §_-518§.to(this,0.5,{"y":(this.state ? 0 : 78)});
         this.state = !this.state;
      }
      
      private function §_-E2c§(param1:GameEvent) : void
      {
         this.§_-E27§.visible = §_-5B§.playerId == Game.selfId;
      }
      
      private function §_-R2G§() : void
      {
         this.§_-73S§ = new §_-pz§();
         this.§_-73S§.y = 45;
         addChild(this.§_-73S§);
         this.§_-e2i§.insert(this.§_-E27§,this.§_-73S§);
      }
      
      private function set §_-v1o§(param1:Boolean) : void
      {
         this.§_-a2W§.visible = param1;
         this.§_-E27§.x = this.§_-a2W§.x + (this.§_-a2W§.visible ? this.§_-a2W§.width + 5 : 0);
         if(!param1 && this.§_-e2i§.selected == this.§_-a2W§)
         {
            this.§_-e2i§.§_-32c§(this.§_-31L§);
         }
         if(param1)
         {
            return;
         }
         this.§_-n1w§.clear();
         this.§_-Z1v§ = false;
      }
      
      private function §_-b2§(param1:§_-4Y§) : void
      {
         if(this.§_-Z1v§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-e1g§,Game.self["clan_id"]);
         this.§_-n1w§.clear();
         this.§_-Z1v§ = true;
      }
      
      private function §_-pC§(param1:MouseEvent = null) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-T2D§);
         §_-v13§.§_-pC§(this.§_-I2b§.§_-l2A§.visible);
      }
   }
}

