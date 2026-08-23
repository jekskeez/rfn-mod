package ratings
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-d2x§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-e1G§.§_-Hb§;
   import §_-xm§.§_-n1a§;
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
   import menu.§_-927§;
   import protocol.§_-S2I§;
   import utils.§_-xb§;
   import views.§_-F1z§;
   import views.§_-Z2N§;
   
   public class §_-f1T§ extends Sprite
   {
      
      public static const §_-kI§:int = 50;
      
      public static const VALUE_CHANGE:String = "VALUE_CHANGE";
      
      protected static const §_-gb§:int = 120;
      
      protected static const §_-k2v§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,16777215);
      
      protected static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,16777215);
      
      protected static const §_-5i§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16773823);
      
      protected static const §_-715§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,11,8746579);
      
      protected static const §_-T1k§:TextFormat = new TextFormat(null,12,6697728,true);
      
      protected static const §_-2X§:TextFormat = new TextFormat(null,12,10245160,true);
      
      protected static const §_-a1Y§:TextFormat = new TextFormat(null,11,8812372,true);
      
      protected static const §_-21M§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,10053171);
      
      protected static const §_-V2D§:GlowFilter = new GlowFilter(9786418,1,4,4,16);
      
      private static const §_-z19§:Array = [gls("Чтобы заработать очки рейтинга, нужно играть на локации и спасать белок шаманом.\nУспешная игра на сложных локациях приносит больше очков - заходи в дупло раньше других и собирай коллекции, чтобы стать лучшим."),gls("Чтобы заработать очки рейтинга, нужно играть на локации или районе и спасать белок шаманом.\nУспешная игра на сложных локациях приносит больше очков - заходите в дупло раньше других и собирайте коллекции, чтобы стать лучшими.")];
      
      private static const §_-l2M§:Array = [gls("Уровень игрока"),gls("Уровень клана")];
      
      private static const §_-S1T§:Array = [gls("Количество побед:"),gls("Опыт за сутки:")];
      
      private static const §_-B1§:Array = [gls("Спасено белок:"),gls("Опыт за всё время:")];
      
      protected var §_-4A§:int = -1;
      
      protected var §_-02w§:int = -1;
      
      protected var type:int = -1;
      
      protected var §_-rg§:int = 0;
      
      protected var §_-13L§:§_-22V§ = null;
      
      protected var §_-h1I§:§_-22V§ = null;
      
      protected var §_-Uk§:§_-22V§ = null;
      
      protected var §_-v1s§:§_-22V§ = null;
      
      protected var §_-22o§:§_-22V§ = null;
      
      protected var §_-N2h§:§_-22V§ = null;
      
      protected var §_-Pe§:§_-22V§ = null;
      
      protected var §_-v2k§:§_-22V§ = null;
      
      protected var §_-H1d§:§_-22V§ = null;
      
      protected var §_-zQ§:§_-Z2N§ = null;
      
      protected var §_-f2X§:DisplayObject = null;
      
      protected var §_-e1n§:SimpleButton = null;
      
      private var photo:§_-F1z§ = null;
      
      public function §_-f1T§(param1:int, param2:int)
      {
         super();
         this.type = param1;
         this.§_-4A§ = param2;
         this.§_-W21§();
         this.init();
      }
      
      public function get value() : int
      {
         return this.§_-02w§;
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function get §_-e1W§() : Boolean
      {
         return this.§_-rg§ + this.timeUpdate < getTimer() / 1000 && !this.isSelf;
      }
      
      public function set delta(param1:int) : void
      {
         if(param1 == 0)
         {
            return;
         }
         this.§_-01m§(param1);
         this.§_-N2h§.text = Math.abs(param1).toString();
         this.§_-N2h§.x = 57 - int(this.§_-N2h§.textWidth * 0.5);
         if(this.§_-f2X§)
         {
            removeChild(this.§_-f2X§);
         }
         this.§_-f2X§ = param1 > 0 ? new RatingUpIcon() : new RatingDownIcon();
         this.§_-f2X§.x = 60 - int(this.§_-f2X§.width * 0.5);
         this.§_-f2X§.y = 8;
         addChild(this.§_-f2X§);
      }
      
      public function set place(param1:int) : void
      {
         this.y = param1 * §_-kI§;
         this.§_-13L§.text = (param1 + 1).toString();
         this.§_-13L§.x = 25 - int(this.§_-13L§.textWidth * 0.5);
      }
      
      public function get isSelf() : Boolean
      {
         switch(this.type)
         {
            case §_-13r§.PLAYER_TYPE:
               return this.id == Game.selfId;
            case §_-13r§.CLAN_TYPE:
               return this.id == Game.self["clan_id"];
            default:
               return false;
         }
      }
      
      public function get loaded() : Boolean
      {
         return this.§_-rg§ != 0;
      }
      
      protected function §_-W21§() : void
      {
         if(this.isSelf)
         {
            §_-13r§.addEventListener(GameEvent.RATING_CHANGED,this.§_-K1g§);
            §_-d2x§.addEventListener(GameEvent.LEVEL_CHANGED,this.§_-K1g§);
         }
         switch(this.type)
         {
            case §_-13r§.PLAYER_TYPE:
               Game.getPlayer(this.id).addEventListener(§_-t2m§.§_-03g§[this.type],this.§_-P9§);
               break;
            case §_-13r§.CLAN_TYPE:
               §_-e2W§.§_-W2X§(this.id).addEventListener(§_-t2m§.§_-03g§[this.type],this.onClanLoaded);
         }
      }
      
      protected function §_-01m§(param1:int) : void
      {
         if(this.isSelf)
         {
            §_-13r§.§_-K29§(this.type,param1);
         }
      }
      
      protected function get timeUpdate() : int
      {
         return §_-gb§;
      }
      
      protected function init() : void
      {
         var _loc4_:§_-22V§ = null;
         var _loc1_:MovieClip = addChild(this.isSelf ? new RatingElementSelfBackground() : new RatingElementBackground()) as MovieClip;
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16777215,0);
         _loc2_.graphics.drawRect(_loc1_["imageCup"].x,_loc1_["imageCup"].y,_loc1_["imageCup"].width,_loc1_["imageCup"].height);
         _loc1_.addChild(_loc2_);
         var _loc3_:§_-Hb§ = new §_-Hb§(_loc2_,"",false,true);
         _loc3_.maxWidth = 240;
         _loc3_.setStatus("<body><b>" + this.§_-S2E§ + "</b>\n" + this.§_-d1s§ + "</body>");
         new §_-Hb§(_loc1_.imageLevelBack,this.§_-q2g§);
         this.§_-13L§ = new §_-22V§("",25,7,§_-k2v§);
         this.§_-13L§.filters = [§_-V2D§];
         addChild(this.§_-13L§);
         this.§_-N2h§ = new §_-22V§("",60,25,§_-2X§);
         addChild(this.§_-N2h§);
         this.§_-h1I§ = new §_-22V§("",105,12,§_-i2c§);
         this.§_-h1I§.mouseEnabled = false;
         addChild(this.§_-h1I§);
         this.§_-Uk§ = new §_-22V§("",140,3,§_-i2c§);
         this.§_-Uk§.filters = [§_-V2D§];
         addChild(this.§_-Uk§);
         this.§_-v1s§ = new §_-22V§("",792,3,§_-5i§);
         this.§_-v1s§.filters = [§_-V2D§];
         addChild(this.§_-v1s§);
         new §_-Hb§(this.§_-v1s§,this.§_-t0§);
         this.§_-22o§ = new §_-22V§("",792,25,§_-715§);
         addChild(this.§_-22o§);
         new §_-Hb§(this.§_-22o§,gls("Очки прошлого сезона"));
         this.§_-e1n§ = new ButtonRatingShowProfile();
         this.§_-e1n§.x = this.§_-Uk§.x;
         this.§_-e1n§.y = 13;
         this.§_-e1n§.visible = false;
         this.§_-e1n§.addEventListener(MouseEvent.MOUSE_UP,this.type == §_-13r§.CLAN_TYPE ? this.§_-Z2c§ : this.§_-Z2P§);
         if(!this.isSelf || this.type == §_-13r§.CLAN_TYPE)
         {
            addChild(this.§_-e1n§);
         }
         if(this.type != §_-13r§.CLAN_TYPE)
         {
            this.§_-zQ§ = new §_-Z2N§("",140,28);
            this.§_-zQ§.visible = false;
            this.§_-zQ§.addEventListener(MouseEvent.CLICK,this.§_-Z2c§);
            addChild(this.§_-zQ§);
            this.§_-Pe§ = new §_-22V§("",155,25,§_-T1k§);
            this.§_-Pe§.visible = false;
            this.§_-Pe§.addEventListener(MouseEvent.CLICK,this.§_-Z2c§);
            addChild(this.§_-Pe§);
         }
         else
         {
            this.§_-Uk§.x = 178;
            _loc4_ = new §_-22V§(gls("Вождь:"),178,25,§_-a1Y§);
            addChild(_loc4_);
            this.§_-Pe§ = new §_-22V§("",220,25,§_-T1k§);
            this.§_-Pe§.visible = false;
            this.§_-Pe§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Z2P§);
            addChild(this.§_-Pe§);
            this.photo = new §_-F1z§("",138,5,36);
            addChild(this.photo);
         }
         this.§_-v2k§ = new §_-22V§("",640,1,§_-21M§);
         addChild(this.§_-v2k§);
         this.§_-H1d§ = new §_-22V§("",640,22,§_-21M§);
         addChild(this.§_-H1d§);
         _loc4_ = new §_-22V§(this.§_-p2l§,0,5,§_-a1Y§);
         _loc4_.x = 635 - _loc4_.textWidth;
         addChild(_loc4_);
         _loc4_ = new §_-22V§(this.§_-y1m§,0,25,§_-a1Y§);
         _loc4_.x = 635 - _loc4_.textWidth;
         addChild(_loc4_);
      }
      
      protected function get §_-q2g§() : String
      {
         return §_-l2M§[this.type];
      }
      
      protected function get §_-t0§() : String
      {
         return gls("Очки текущего сезона");
      }
      
      protected function get §_-S2E§() : String
      {
         return gls("Очки рейтинга");
      }
      
      protected function get §_-d1s§() : String
      {
         return §_-z19§[this.type];
      }
      
      protected function get §_-p2l§() : String
      {
         return §_-S1T§[this.type];
      }
      
      protected function get §_-y1m§() : String
      {
         return §_-B1§[this.type];
      }
      
      protected function update(param1:String, param2:int, param3:int, param4:int = 0, param5:int = 0, param6:Array = null) : void
      {
         this.§_-02w§ = param2;
         this.§_-Uk§.htmlText = §_-xb§.§_-e1r§(param1,"event:" + this.id);
         this.§_-e1n§.x = this.§_-Uk§.x + this.§_-Uk§.textWidth + 20;
         this.§_-e1n§.visible = true;
         this.§_-v1s§.text = this.value.toString();
         this.§_-v1s§.x = 792 - this.§_-v1s§.textWidth;
         this.§_-22o§.text = §_-13r§.§_-i1Z§(param6).toString();
         this.§_-22o§.x = 792 - this.§_-22o§.textWidth;
         this.§_-h1I§.text = param3.toString();
         this.§_-h1I§.x = 105 - int(this.§_-h1I§.textWidth * 0.5);
         this.§_-v2k§.text = param4.toString();
         this.§_-H1d§.text = param5.toString();
         this.§_-rg§ = getTimer() / 1000;
         dispatchEvent(new Event(VALUE_CHANGE));
      }
      
      protected function §_-P9§(param1:Player) : void
      {
         this.§_-031§(param1);
         if(param1["clan_id"] == 0)
         {
            return;
         }
         var _loc2_:Clan = §_-e2W§.§_-W2X§(param1["clan_id"]);
         if(_loc2_ != null && _loc2_.isLoaded() && _loc2_.state != §_-S2I§.§_-Wr§)
         {
            return;
         }
         if(_loc2_.isLoaded())
         {
            this.§_-d2G§(_loc2_);
            return;
         }
         _loc2_.addEventListener(§_-Oy§.§_-g2n§,this.§_-d2G§);
         §_-e2W§.request(param1["clan_id"],§_-Oy§.§_-g2n§,true);
      }
      
      protected function §_-031§(param1:Player) : void
      {
         this.update(param1.name,param1["rating_score"],param1["level"],param1["rating_player"],param1["rating_shaman"],param1["rating_history"]);
      }
      
      protected function §_-d2G§(param1:Clan, param2:uint = 0) : void
      {
         param1.removeEventListener(this.§_-d2G§);
         this.§_-Pe§.text = param1.name;
         this.§_-Pe§.name = param1.id.toString();
         this.§_-Pe§.visible = true;
         this.§_-zQ§.load(param1.§_-M24§);
         this.§_-zQ§.name = param1.id.toString();
         this.§_-zQ§.visible = param1.state == §_-S2I§.§_-Wr§;
      }
      
      protected function onClanLoaded(param1:Clan, param2:uint) : void
      {
         this.update(param1.name,param1.§_-t2n§,param1.level,param1.§_-K2A§,param1.exp,param1.§_-A1h§);
         this.photo.load(param1.§_-cy§);
         var _loc3_:Player = Game.getPlayer(param1.§_-R2z§);
         if(_loc3_.isLoaded(§_-hF§.§_-31q§))
         {
            this.§_-D1m§(_loc3_);
            return;
         }
         Game.getPlayer(param1.§_-R2z§).addEventListener(§_-hF§.§_-31q§,this.§_-D1m§);
         Game.request(param1.§_-R2z§,§_-hF§.§_-31q§);
      }
      
      protected function §_-D1m§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-D1m§);
         this.§_-Pe§.text = param1.name;
         this.§_-Pe§.name = param1.id.toString();
         this.§_-Pe§.visible = true;
      }
      
      protected function §_-K1g§(param1:GameEvent) : void
      {
         var _loc2_:Clan = null;
         switch(this.type)
         {
            case §_-13r§.PLAYER_TYPE:
               this.update(Game.self.name,Game.self["rating_score"],§_-d2x§.§_-z2o§,Game.self["rating_player"],Game.self["rating_shaman"],Game.self["rating_history"]);
               break;
            case §_-13r§.CLAN_TYPE:
               _loc2_ = §_-e2W§.§_-W2X§(this.id);
               this.update(_loc2_.name,_loc2_.§_-t2n§,_loc2_.level,_loc2_.§_-K2A§,_loc2_.exp,_loc2_.§_-A1h§);
         }
      }
      
      protected function §_-Z2P§(param1:MouseEvent) : void
      {
         if(this.type == §_-13r§.CLAN_TYPE)
         {
            §_-927§.§_-i2I§(param1.target.name);
         }
         else
         {
            §_-927§.§_-i2I§(this.id);
         }
      }
      
      protected function §_-Z2c§(param1:MouseEvent) : void
      {
         if(this.type == §_-13r§.CLAN_TYPE)
         {
            §_-n1a§.show(this.id);
         }
         else
         {
            §_-n1a§.show(param1.target.name);
         }
      }
   }
}

