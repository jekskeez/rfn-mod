package §_-81S§
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-j18§;
   import com.api.Player;
   import events.PostEvent;
   import events.§_-n13§;
   import flash.events.MouseEvent;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-xb§;
   import views.§_-F1z§;
   import views.§_-Z2N§;
   
   public class §_-e1x§ extends §_-33w§ implements §_-c11§
   {
      
      private static var §_-u10§:§_-Q13§ = null;
      
      private static var §_-L2t§:§_-Q13§ = null;
      
      private static var §_-b1F§:§_-Q13§ = null;
      
      public static var §_-o1§:int = 0;
      
      private var caption:§_-22V§ = null;
      
      private var §_-6w§:§_-22V§ = null;
      
      private var emblem:§_-Z2N§ = null;
      
      private var photo:§_-F1z§ = null;
      
      private var playerId:int = -1;
      
      private var §_-a1R§:int = -1;
      
      public function §_-e1x§(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         super(param1,param2,param5);
         this.clanId = param4;
         this.playerId = param3;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-M1P§]);
      }
      
      private static function get §_-u2V§() : §_-Q13§
      {
         if(§_-u10§ == null)
         {
            §_-u10§ = new §_-Q13§(gls("Ты уже в клане"),gls("Чтобы вступить в этот клан, ты должен выйти из своего."));
         }
         return §_-u10§;
      }
      
      private static function get §_-51X§() : §_-Q13§
      {
         if(§_-L2t§ == null)
         {
            §_-L2t§ = new §_-Q13§(gls("Вступление в клан"),gls("Ты точно хочешь вступить в клан?"),true,§_-o2i§);
         }
         return §_-L2t§;
      }
      
      private static function get §_-h2O§() : §_-Q13§
      {
         if(§_-b1F§ == null)
         {
            §_-b1F§ = new §_-Q13§(gls("Вступление в клан"),gls("Чтобы перейти в другой клан,\nвождь должен сначала распустить\nсвой."));
         }
         return §_-b1F§;
      }
      
      private static function §_-o2i§() : void
      {
         if(§_-o1§ == 0)
         {
            return;
         }
         if(Game.self["clan_id"] != 0)
         {
            §_-u2V§.show();
            return;
         }
         Game.§_-qZ§ = §_-o1§;
         Connection.§_-Li§(§_-h2B§.§_-t2k§,§_-o1§);
      }
      
      public function get clanId() : int
      {
         return this.§_-a1R§;
      }
      
      public function set clanId(param1:int) : void
      {
         this.§_-a1R§ = param1;
      }
      
      override public function §_-027§() : void
      {
         var _loc3_:§_-j18§ = null;
         if(this.caption != null)
         {
            return;
         }
         super.§_-027§();
         this.photo = new §_-F1z§("",0,0,80);
         addChild(this.photo);
         this.caption = new §_-22V§("",85,10,style);
         this.caption.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-o1P§);
         addChild(this.caption);
         var _loc1_:§_-22V§ = new §_-22V§("",85,28,style);
         addChild(_loc1_);
         switch(this.type)
         {
            case §_-S2I§.§_-Wx§:
               _loc1_.htmlText = "<body>" + gls("приглашает тебя в клан") + "<body>";
               _loc3_ = new §_-j18§(gls("Вступить"));
               _loc3_.x = 660 - int(_loc3_.width * 0.5);
               _loc3_.y = 35;
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-V24§);
               addChild(_loc3_);
               break;
            case §_-S2I§.§_-23Z§:
               _loc1_.htmlText = gls("<body>выгнал тебя из клана<body>");
         }
         this.emblem = new §_-Z2N§("",90,50);
         addChild(this.emblem);
         this.§_-6w§ = new §_-22V§("",100,45,style);
         addChild(this.§_-6w§);
         var _loc2_:Player = Game.getPlayer(this.playerId);
         _loc2_.addEventListener(§_-hF§.§_-31q§,this.§_-rF§);
         §_-e2W§.listen(this.§_-r1P§);
         Game.request(this.playerId,§_-hF§.§_-31q§);
         §_-e2W§.request(this.clanId,§_-Oy§.ALL);
      }
      
      private function §_-o1P§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-V24§(param1:MouseEvent) : void
      {
         §_-o1§ = this.clanId;
         if(Game.self["clan_id"] != 0)
         {
            if(Game.self["clan_duty"] == Clan.§_-k1P§)
            {
               §_-h2O§.show();
            }
            else
            {
               §_-u2V§.show();
            }
         }
         else
         {
            §_-51X§.show();
         }
      }
      
      private function §_-rF§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-rF§);
         this.caption.htmlText = "<body><b>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + "</b><body>";
      }
      
      private function §_-r1P§(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         §_-e2W§.forget(this.§_-r1P§);
         this.photo.load(_loc2_.§_-cy§);
         this.emblem.load(_loc2_.§_-M24§);
         this.§_-6w§.htmlText = "<body>" + _loc2_.name + "<body>";
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != §_-S2I§.§_-N1b§ && param1[0] != §_-S2I§.§_-13l§ && param1[0] != §_-S2I§.§_-F2Q§)
         {
            return;
         }
         if(param1[1] != this.clanId)
         {
            return;
         }
         dispatchEvent(new PostEvent(this.eventId));
      }
   }
}

