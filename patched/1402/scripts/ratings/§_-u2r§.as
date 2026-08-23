package ratings
{
   import §_-I18§.§_-Tw§;
   import §_-S1n§.§_-kr§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-LZ§;
   import com.api.Player;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import menu.§_-cD§;
   import protocol.§_-s2l§;
   import utils.§_-r1G§;
   import views.§_-236§;
   import views.§_-SZ§;
   
   public class §_-u2r§ extends Sprite
   {
      
      public static const §_-i2u§:int = 50;
      
      public static const VALUE_CHANGE:String = "VALUE_CHANGE";
      
      protected static const §_-v1t§:int = 120;
      
      protected static const §_-u14§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,16777215);
      
      protected static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,16777215);
      
      protected static const §_-fC§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16773823);
      
      protected static const §_-28§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,11,8746579);
      
      protected static const §_-RW§:TextFormat = new TextFormat(null,12,6697728,true);
      
      protected static const §_-u25§:TextFormat = new TextFormat(null,12,10245160,true);
      
      protected static const §_-W2U§:TextFormat = new TextFormat(null,11,8812372,true);
      
      protected static const §_-T1f§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,10053171);
      
      protected static const §_-1n§:GlowFilter = new GlowFilter(9786418,1,4,4,16);
      
      private static const §_-I1§:Array = [gls("Чтобы заработать очки рейтинга, нужно играть на локации и спасать белок шаманом.\nУспешная игра на сложных локациях приносит больше очков - заходи в дупло раньше других и собирай коллекции, чтобы стать лучшим."),gls("Чтобы заработать очки рейтинга, нужно играть на локации или районе и спасать белок шаманом.\nУспешная игра на сложных локациях приносит больше очков - заходите в дупло раньше других и собирайте коллекции, чтобы стать лучшими.")];
      
      private static const §_-72p§:Array = [gls("Уровень игрока"),gls("Уровень клана")];
      
      private static const §_-v1n§:Array = [gls("Количество побед:"),gls("Опыт за сутки:")];
      
      private static const §_-n1i§:Array = [gls("Спасено белок:"),gls("Опыт за всё время:")];
      
      protected var §_-n2x§:int = -1;
      
      protected var §_-4r§:int = -1;
      
      protected var type:int = -1;
      
      protected var §_-H1m§:int = 0;
      
      protected var §_-Mt§:§_-i5§ = null;
      
      protected var §_-kh§:§_-i5§ = null;
      
      protected var §_-N2m§:§_-i5§ = null;
      
      protected var §_-I1z§:§_-i5§ = null;
      
      protected var §_-J1S§:§_-i5§ = null;
      
      protected var §_-HX§:§_-i5§ = null;
      
      protected var §_-73v§:§_-i5§ = null;
      
      protected var §_-f20§:§_-i5§ = null;
      
      protected var §_-I1O§:§_-i5§ = null;
      
      protected var §_-32i§:§_-SZ§ = null;
      
      protected var §_-22Q§:DisplayObject = null;
      
      protected var §_-k2z§:SimpleButton = null;
      
      private var photo:§_-236§ = null;
      
      public function §_-u2r§(param1:int, param2:int)
      {
         super();
         this.type = param1;
         this.§_-n2x§ = param2;
         this.§_-c1y§();
         this.init();
      }
      
      public function get value() : int
      {
         return this.§_-4r§;
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function get §_-59§() : Boolean
      {
         return this.§_-H1m§ + this.timeUpdate < getTimer() / 1000 && !this.isSelf;
      }
      
      public function set delta(param1:int) : void
      {
         if(param1 == 0)
         {
            return;
         }
         this.§_-I17§(param1);
         this.§_-HX§.text = Math.abs(param1).toString();
         this.§_-HX§.x = 57 - int(this.§_-HX§.textWidth * 0.5);
         if(this.§_-22Q§)
         {
            removeChild(this.§_-22Q§);
         }
         this.§_-22Q§ = param1 > 0 ? new RatingUpIcon() : new RatingDownIcon();
         this.§_-22Q§.x = 60 - int(this.§_-22Q§.width * 0.5);
         this.§_-22Q§.y = 8;
         addChild(this.§_-22Q§);
      }
      
      public function set place(param1:int) : void
      {
         this.y = param1 * §_-i2u§;
         this.§_-Mt§.text = (param1 + 1).toString();
         this.§_-Mt§.x = 25 - int(this.§_-Mt§.textWidth * 0.5);
      }
      
      public function get isSelf() : Boolean
      {
         switch(this.type)
         {
            case §_-82O§.PLAYER_TYPE:
               return this.id == Game.selfId;
            case §_-82O§.CLAN_TYPE:
               return this.id == Game.self["clan_id"];
            default:
               return false;
         }
      }
      
      public function get loaded() : Boolean
      {
         return this.§_-H1m§ != 0;
      }
      
      protected function §_-c1y§() : void
      {
         if(this.isSelf)
         {
            §_-82O§.addEventListener(GameEvent.RATING_CHANGED,this.§_-h29§);
            §_-LZ§.addEventListener(GameEvent.LEVEL_CHANGED,this.§_-h29§);
         }
         switch(this.type)
         {
            case §_-82O§.PLAYER_TYPE:
               Game.getPlayer(this.id).addEventListener(§_-qg§.§_-A24§[this.type],this.§_-Y16§);
               break;
            case §_-82O§.CLAN_TYPE:
               §_-B2U§.§_-Q2g§(this.id).addEventListener(§_-qg§.§_-A24§[this.type],this.onClanLoaded);
         }
      }
      
      protected function §_-I17§(param1:int) : void
      {
         if(this.isSelf)
         {
            §_-82O§.§_-42M§(this.type,param1);
         }
      }
      
      protected function get timeUpdate() : int
      {
         return §_-v1t§;
      }
      
      protected function init() : void
      {
         var _loc4_:§_-i5§ = null;
         var _loc1_:MovieClip = addChild(this.isSelf ? new RatingElementSelfBackground() : new RatingElementBackground()) as MovieClip;
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16777215,0);
         _loc2_.graphics.drawRect(_loc1_["imageCup"].x,_loc1_["imageCup"].y,_loc1_["imageCup"].width,_loc1_["imageCup"].height);
         _loc1_.addChild(_loc2_);
         var _loc3_:§_-kr§ = new §_-kr§(_loc2_,"",false,true);
         _loc3_.maxWidth = 240;
         _loc3_.setStatus("<body><b>" + this.§_-xP§ + "</b>\n" + this.§_-Y9§ + "</body>");
         new §_-kr§(_loc1_.imageLevelBack,this.§_-W2c§);
         this.§_-Mt§ = new §_-i5§("",25,7,§_-u14§);
         this.§_-Mt§.filters = [§_-1n§];
         addChild(this.§_-Mt§);
         this.§_-HX§ = new §_-i5§("",60,25,§_-u25§);
         addChild(this.§_-HX§);
         this.§_-kh§ = new §_-i5§("",105,12,§_-W2P§);
         this.§_-kh§.mouseEnabled = false;
         addChild(this.§_-kh§);
         this.§_-N2m§ = new §_-i5§("",140,3,§_-W2P§);
         this.§_-N2m§.filters = [§_-1n§];
         addChild(this.§_-N2m§);
         this.§_-I1z§ = new §_-i5§("",792,3,§_-fC§);
         this.§_-I1z§.filters = [§_-1n§];
         addChild(this.§_-I1z§);
         new §_-kr§(this.§_-I1z§,this.§_-E1A§);
         this.§_-J1S§ = new §_-i5§("",792,25,§_-28§);
         addChild(this.§_-J1S§);
         new §_-kr§(this.§_-J1S§,gls("Очки прошлого сезона"));
         this.§_-k2z§ = new ButtonRatingShowProfile();
         this.§_-k2z§.x = this.§_-N2m§.x;
         this.§_-k2z§.y = 13;
         this.§_-k2z§.visible = false;
         this.§_-k2z§.addEventListener(MouseEvent.MOUSE_UP,this.type == §_-82O§.CLAN_TYPE ? this.§_-334§ : this.§_-91v§);
         if(!this.isSelf || this.type == §_-82O§.CLAN_TYPE)
         {
            addChild(this.§_-k2z§);
         }
         if(this.type != §_-82O§.CLAN_TYPE)
         {
            this.§_-32i§ = new §_-SZ§("",140,28);
            this.§_-32i§.visible = false;
            this.§_-32i§.addEventListener(MouseEvent.CLICK,this.§_-334§);
            addChild(this.§_-32i§);
            this.§_-73v§ = new §_-i5§("",155,25,§_-RW§);
            this.§_-73v§.visible = false;
            this.§_-73v§.addEventListener(MouseEvent.CLICK,this.§_-334§);
            addChild(this.§_-73v§);
         }
         else
         {
            this.§_-N2m§.x = 178;
            _loc4_ = new §_-i5§(gls("Вождь:"),178,25,§_-W2U§);
            addChild(_loc4_);
            this.§_-73v§ = new §_-i5§("",220,25,§_-RW§);
            this.§_-73v§.visible = false;
            this.§_-73v§.addEventListener(MouseEvent.MOUSE_UP,this.§_-91v§);
            addChild(this.§_-73v§);
            this.photo = new §_-236§("",138,5,36);
            addChild(this.photo);
         }
         this.§_-f20§ = new §_-i5§("",640,1,§_-T1f§);
         addChild(this.§_-f20§);
         this.§_-I1O§ = new §_-i5§("",640,22,§_-T1f§);
         addChild(this.§_-I1O§);
         _loc4_ = new §_-i5§(this.§_-VO§,0,5,§_-W2U§);
         _loc4_.x = 635 - _loc4_.textWidth;
         addChild(_loc4_);
         _loc4_ = new §_-i5§(this.§_-n2R§,0,25,§_-W2U§);
         _loc4_.x = 635 - _loc4_.textWidth;
         addChild(_loc4_);
      }
      
      protected function get §_-W2c§() : String
      {
         return §_-72p§[this.type];
      }
      
      protected function get §_-E1A§() : String
      {
         return gls("Очки текущего сезона");
      }
      
      protected function get §_-xP§() : String
      {
         return gls("Очки рейтинга");
      }
      
      protected function get §_-Y9§() : String
      {
         return §_-I1§[this.type];
      }
      
      protected function get §_-VO§() : String
      {
         return §_-v1n§[this.type];
      }
      
      protected function get §_-n2R§() : String
      {
         return §_-n1i§[this.type];
      }
      
      protected function update(param1:String, param2:int, param3:int, param4:int = 0, param5:int = 0, param6:Array = null) : void
      {
         this.§_-4r§ = param2;
         this.§_-N2m§.htmlText = §_-r1G§.§_-fU§(param1,"event:" + this.id);
         this.§_-k2z§.x = this.§_-N2m§.x + this.§_-N2m§.textWidth + 20;
         this.§_-k2z§.visible = true;
         this.§_-I1z§.text = this.value.toString();
         this.§_-I1z§.x = 792 - this.§_-I1z§.textWidth;
         this.§_-J1S§.text = §_-82O§.§_-p1E§(param6).toString();
         this.§_-J1S§.x = 792 - this.§_-J1S§.textWidth;
         this.§_-kh§.text = param3.toString();
         this.§_-kh§.x = 105 - int(this.§_-kh§.textWidth * 0.5);
         this.§_-f20§.text = param4.toString();
         this.§_-I1O§.text = param5.toString();
         this.§_-H1m§ = getTimer() / 1000;
         dispatchEvent(new Event(VALUE_CHANGE));
      }
      
      protected function §_-Y16§(param1:Player) : void
      {
         this.§_-yC§(param1);
         if(param1["clan_id"] == 0)
         {
            return;
         }
         var _loc2_:Clan = §_-B2U§.§_-Q2g§(param1["clan_id"]);
         if(_loc2_ != null && _loc2_.isLoaded() && _loc2_.state != §_-s2l§.§_-YU§)
         {
            return;
         }
         if(_loc2_.isLoaded())
         {
            this.§_-W2O§(_loc2_);
            return;
         }
         _loc2_.addEventListener(§_-eT§.§_-P26§,this.§_-W2O§);
         §_-B2U§.request(param1["clan_id"],§_-eT§.§_-P26§,true);
      }
      
      protected function §_-yC§(param1:Player) : void
      {
         this.update(param1.name,param1["rating_score"],param1["level"],param1["rating_player"],param1["rating_shaman"],param1["rating_history"]);
      }
      
      protected function §_-W2O§(param1:Clan, param2:uint = 0) : void
      {
         param1.removeEventListener(this.§_-W2O§);
         this.§_-73v§.text = param1.name;
         this.§_-73v§.name = param1.id.toString();
         this.§_-73v§.visible = true;
         this.§_-32i§.load(param1.§_-o1p§);
         this.§_-32i§.name = param1.id.toString();
         this.§_-32i§.visible = param1.state == §_-s2l§.§_-YU§;
      }
      
      protected function onClanLoaded(param1:Clan, param2:uint) : void
      {
         this.update(param1.name,param1.§_-u2q§,param1.level,param1.§_-q1B§,param1.exp,param1.§_-gF§);
         this.photo.load(param1.§_-51L§);
         var _loc3_:Player = Game.getPlayer(param1.§_-W2t§);
         if(_loc3_.isLoaded(§_-Y2E§.§_-n2H§))
         {
            this.§_-81J§(_loc3_);
            return;
         }
         Game.getPlayer(param1.§_-W2t§).addEventListener(§_-Y2E§.§_-n2H§,this.§_-81J§);
         Game.request(param1.§_-W2t§,§_-Y2E§.§_-n2H§);
      }
      
      protected function §_-81J§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-81J§);
         this.§_-73v§.text = param1.name;
         this.§_-73v§.name = param1.id.toString();
         this.§_-73v§.visible = true;
      }
      
      protected function §_-h29§(param1:GameEvent) : void
      {
         var _loc2_:Clan = null;
         switch(this.type)
         {
            case §_-82O§.PLAYER_TYPE:
               this.update(Game.self.name,Game.self["rating_score"],§_-LZ§.§_-mA§,Game.self["rating_player"],Game.self["rating_shaman"],Game.self["rating_history"]);
               break;
            case §_-82O§.CLAN_TYPE:
               _loc2_ = §_-B2U§.§_-Q2g§(this.id);
               this.update(_loc2_.name,_loc2_.§_-u2q§,_loc2_.level,_loc2_.§_-q1B§,_loc2_.exp,_loc2_.§_-gF§);
         }
      }
      
      protected function §_-91v§(param1:MouseEvent) : void
      {
         if(this.type == §_-82O§.CLAN_TYPE)
         {
            §_-cD§.§_-e25§(param1.target.name);
         }
         else
         {
            §_-cD§.§_-e25§(this.id);
         }
      }
      
      protected function §_-334§(param1:MouseEvent) : void
      {
         if(this.type == §_-82O§.CLAN_TYPE)
         {
            §_-Tw§.show(this.id);
         }
         else
         {
            §_-Tw§.show(param1.target.name);
         }
      }
   }
}

