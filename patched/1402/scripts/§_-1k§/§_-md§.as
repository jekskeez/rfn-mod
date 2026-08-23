package §_-1k§
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-bN§.§_-Fk§;
   import buttons.§_-K2G§;
   import com.api.Player;
   import events.PostEvent;
   import events.§_-a1V§;
   import flash.events.MouseEvent;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-r1G§;
   import views.§_-236§;
   import views.§_-SZ§;
   
   public class §_-md§ extends §_-G2R§ implements §_-122§
   {
      
      private static var §_-BH§:§_-Fk§ = null;
      
      private static var §_-iA§:§_-Fk§ = null;
      
      private static var §_-6c§:§_-Fk§ = null;
      
      public static var §_-J2u§:int = 0;
      
      private var caption:§_-i5§ = null;
      
      private var §_-g1F§:§_-i5§ = null;
      
      private var emblem:§_-SZ§ = null;
      
      private var photo:§_-236§ = null;
      
      private var playerId:int = -1;
      
      private var §_-Jx§:int = -1;
      
      public function §_-md§(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         super(param1,param2,param5);
         this.clanId = param4;
         this.playerId = param3;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-R1X§]);
      }
      
      private static function get §_-hK§() : §_-Fk§
      {
         if(§_-BH§ == null)
         {
            §_-BH§ = new §_-Fk§(gls("Ты уже в клане"),gls("Чтобы вступить в этот клан, ты должен выйти из своего."));
         }
         return §_-BH§;
      }
      
      private static function get §_-w1z§() : §_-Fk§
      {
         if(§_-iA§ == null)
         {
            §_-iA§ = new §_-Fk§(gls("Вступление в клан"),gls("Ты точно хочешь вступить в клан?"),true,§_-73d§);
         }
         return §_-iA§;
      }
      
      private static function get §_-G2v§() : §_-Fk§
      {
         if(§_-6c§ == null)
         {
            §_-6c§ = new §_-Fk§(gls("Вступление в клан"),gls("Чтобы перейти в другой клан,\nвождь должен сначала распустить\nсвой."));
         }
         return §_-6c§;
      }
      
      private static function §_-73d§() : void
      {
         if(§_-J2u§ == 0)
         {
            return;
         }
         if(Game.self["clan_id"] != 0)
         {
            §_-hK§.show();
            return;
         }
         Game.§_-KO§ = §_-J2u§;
         Connection.§_-e2T§(§_-u1O§.§_-nH§,§_-J2u§);
      }
      
      public function get clanId() : int
      {
         return this.§_-Jx§;
      }
      
      public function set clanId(param1:int) : void
      {
         this.§_-Jx§ = param1;
      }
      
      override public function §_-O1s§() : void
      {
         var _loc3_:§_-K2G§ = null;
         if(this.caption != null)
         {
            return;
         }
         super.§_-O1s§();
         this.photo = new §_-236§("",0,0,80);
         addChild(this.photo);
         this.caption = new §_-i5§("",85,10,style);
         this.caption.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QQ§);
         addChild(this.caption);
         var _loc1_:§_-i5§ = new §_-i5§("",85,28,style);
         addChild(_loc1_);
         switch(this.type)
         {
            case §_-s2l§.§_-33l§:
               _loc1_.htmlText = "<body>" + gls("приглашает тебя в клан") + "<body>";
               _loc3_ = new §_-K2G§(gls("Вступить"));
               _loc3_.x = 660 - int(_loc3_.width * 0.5);
               _loc3_.y = 35;
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-Ii§);
               addChild(_loc3_);
               break;
            case §_-s2l§.§_-z1l§:
               _loc1_.htmlText = gls("<body>выгнал тебя из клана<body>");
         }
         this.emblem = new §_-SZ§("",90,50);
         addChild(this.emblem);
         this.§_-g1F§ = new §_-i5§("",100,45,style);
         addChild(this.§_-g1F§);
         var _loc2_:Player = Game.getPlayer(this.playerId);
         _loc2_.addEventListener(§_-Y2E§.§_-n2H§,this.§_-K16§);
         §_-B2U§.listen(this.§_-g1w§);
         Game.request(this.playerId,§_-Y2E§.§_-n2H§);
         §_-B2U§.request(this.clanId,§_-eT§.ALL);
      }
      
      private function §_-QQ§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-Ii§(param1:MouseEvent) : void
      {
         §_-J2u§ = this.clanId;
         if(Game.self["clan_id"] != 0)
         {
            if(Game.self["clan_duty"] == Clan.§_-01X§)
            {
               §_-G2v§.show();
            }
            else
            {
               §_-hK§.show();
            }
         }
         else
         {
            §_-w1z§.show();
         }
      }
      
      private function §_-K16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-K16§);
         this.caption.htmlText = "<body><b>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + "</b><body>";
      }
      
      private function §_-g1w§(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         §_-B2U§.forget(this.§_-g1w§);
         this.photo.load(_loc2_.§_-51L§);
         this.emblem.load(_loc2_.§_-o1p§);
         this.§_-g1F§.htmlText = "<body>" + _loc2_.name + "<body>";
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != §_-s2l§.§_-s2b§ && param1[0] != §_-s2l§.§_-M3§ && param1[0] != §_-s2l§.§_-F2E§)
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

