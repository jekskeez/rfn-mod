package ratings
{
   import §_-B1G§.ScrollPane;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import utils.§_-y1l§;
   
   public class §_-qg§ extends Sprite
   {
      
      private static const §_-v1t§:int = 60;
      
      private static const §_-kv§:Array = [RatingImageNoLeague,RatingImageNoClan];
      
      private static const §_-z1y§:Array = [gls("Ты пока еще не попал ни\nв одну из лиг.\n\nПродолжай проходить\nуровни! Чем лучше ты их\nпроходишь, тем быстрее\nты начнешь состязаться\nс остальными за звание\nлучшей белки."),gls("Твой клан пока еще\nне попал ни в одну из лиг.\n\nПродолжай проходить\nуровни! Чем лучше их\nпроходят все белки клана, тем быстрее вы начнете\nсостязаться с остальными\nза звание лучших."),gls("Ты пока еще не являешься\nчленом какого-либо клана!\n\nВступи в клан\nили создай свой\nи начинай борьбу\nза звание лучшего клана\nмира Трагедии белок!")];
      
      protected static const §_-f1Z§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      protected static const §_-c2m§:GlowFilter = new GlowFilter(6697728,1,4,4,8);
      
      protected static const §_-B34§:GlowFilter = new GlowFilter(16777215,1,4,4,8);
      
      protected static const §_-1z§:DropShadowFilter = new DropShadowFilter(2,45,0,1,2,2,0.25);
      
      public static const §_-A24§:Array = [§_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-t1a§ | §_-Y2E§.§_-w1y§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-L1b§,§_-eT§.§_-P26§ | §_-eT§.§_-J§ | §_-eT§.SIZE | §_-eT§.§_-03H§ | §_-eT§.§_-t1a§ | §_-eT§.§_-w1y§];
      
      protected var type:int = 0;
      
      protected var elements:Vector.<§_-u2r§> = new Vector.<§_-u2r§>(0);
      
      protected var §_-13v§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      protected var §_-P29§:Vector.<§_-i5§> = new Vector.<§_-i5§>(0);
      
      protected var §_-22§:Vector.<§_-i5§> = new Vector.<§_-i5§>(0);
      
      protected var §_-73F§:§_-i5§ = null;
      
      protected var §_-W18§:ScrollPane = null;
      
      protected var §_-61v§:Sprite = null;
      
      protected var §_-o2P§:§_-K2G§ = null;
      
      protected var §_-l1v§:DisplayObjectContainer = null;
      
      private var time:int = 0;
      
      private var loaded:Boolean = false;
      
      public function §_-qg§(param1:int)
      {
         super();
         this.type = param1;
         this.init();
         this.time = this.timeUpdate;
         this.listen();
         §_-p1V§.§_-63T§(this.§_-62z§);
      }
      
      protected function init() : void
      {
         this.§_-83y§();
         this.§_-Z1r§();
         this.update();
         this.§_-zS§(this.ids);
      }
      
      protected function §_-83y§() : void
      {
         this.§_-g22§();
         this.§_-W18§ = new ScrollPane();
         addChild(this.§_-W18§);
         this.§_-m1c§();
         this.§_-61v§ = new Sprite();
         this.§_-W18§.source = this.§_-61v§;
         this.§_-o2P§ = new §_-K2G§(gls("Показать себя"));
         this.§_-o2P§.x = 450 - int(this.§_-o2P§.width * 0.5);
         this.§_-o2P§.y = 500;
         this.§_-o2P§.addEventListener(MouseEvent.CLICK,this.§_-nj§);
         addChild(this.§_-o2P§);
         this.§_-l1v§ = new this.imageClass();
         this.§_-l1v§.scaleX = this.§_-l1v§.scaleY = 1.3;
         this.§_-l1v§.x = 500;
         this.§_-l1v§.y = 350;
         addChild(this.§_-l1v§);
         this.§_-73F§ = new §_-i5§("",-10,-115,new TextFormat(null,14,8870474,true,null,null,null,null,"center"));
         this.§_-73F§.width = 216;
         this.§_-73F§.multiline = true;
         this.§_-73F§.wordWrap = true;
         this.§_-73F§.text = this.imageText;
         this.§_-l1v§.addChild(this.§_-73F§);
      }
      
      protected function get imageClass() : Class
      {
         return §_-kv§[this.type];
      }
      
      protected function get imageText() : String
      {
         var _loc1_:int = this.type == §_-82O§.CLAN_TYPE && Game.self["clan_id"] == 0 ? §_-82O§.§_-x2G§ : this.type;
         return §_-z1y§[_loc1_];
      }
      
      protected function §_-g22§() : void
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(900,175,Math.PI * 0.5,0,0);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,0,900,175);
         _loc1_.createGradientBox(900,360,Math.PI * 0.5,0,175);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,175,900,360);
      }
      
      protected function §_-m1c§() : void
      {
         this.§_-W18§.x = 25;
         this.§_-W18§.y = 190;
         this.§_-W18§.setSize(860,300);
         this.§_-W18§.graphics.beginFill(0,0.05);
         this.§_-W18§.graphics.drawRect(-2,-2,844,304);
      }
      
      protected function §_-Z1r§() : void
      {
         var _loc1_:LeagueTapeView = new LeagueTapeView();
         _loc1_.x = int((§_-Zy§.§_-21V§ - _loc1_.width) * 0.5);
         _loc1_.y = 5;
         addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Уровни лиг"),0,5,new TextFormat(§_-i5§.§_-p1s§,16,16777215));
         _loc2_.x = int(0.5 * (§_-Zy§.§_-21V§ - _loc2_.textWidth));
         _loc2_.filters = [§_-f1Z§];
         addChild(_loc2_);
         this.§_-13v§.push(_loc1_.bronzeView,_loc1_.silverView,_loc1_.goldView,_loc1_.masterView,_loc1_.diamondView,_loc1_.championView);
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-13v§.length)
         {
            _loc2_ = new §_-i5§(§_-93H§.§_-XY§(_loc3_ + 1,this.type),0,0,new TextFormat(§_-i5§.§_-p1s§,14,16777215));
            _loc2_.x = this.§_-13v§[_loc3_].x - int(_loc2_.textWidth * 0.5) - 3;
            _loc2_.y = this.§_-13v§[_loc3_].y + int(this.§_-13v§[_loc3_].height * 0.5);
            _loc2_.filters = [§_-c2m§,§_-1z§];
            _loc1_.addChild(_loc2_);
            this.§_-22§.push(_loc2_);
            _loc2_ = new §_-i5§(§_-93H§.§_-V2W§(_loc3_ + 1,this.type).toString(),0,20,new TextFormat(§_-i5§.§_-p1s§,14,16773823));
            _loc2_.x = this.§_-13v§[_loc3_].x - int(_loc2_.textWidth * 0.5) - 3;
            _loc2_.y = this.§_-13v§[_loc3_].y + int(this.§_-13v§[_loc3_].height * 0.5) + 18;
            _loc2_.filters = [§_-c2m§,§_-1z§];
            _loc1_.addChild(_loc2_);
            this.§_-P29§.push(_loc2_);
            _loc3_++;
         }
      }
      
      protected function listen() : void
      {
         §_-82O§.addEventListener(GameEvent.DIVISION_CHANGED,this.§_-w16§);
         §_-82O§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-T2p§);
      }
      
      protected function §_-nj§(param1:MouseEvent = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            if(this.elements[_loc2_].isSelf)
            {
               this.§_-W18§.verticalScrollPosition = this.elements[_loc2_].y - 100;
               break;
            }
            _loc2_++;
         }
      }
      
      protected function §_-T2p§(param1:GameEvent) : void
      {
         if(param1.data["type"] != this.type)
         {
            return;
         }
         this.update();
      }
      
      protected function §_-w16§(param1:GameEvent) : void
      {
         if(param1 == null || param1.data == null || param1.data["type"] != this.type)
         {
            return;
         }
         if(!("delta" in param1.data))
         {
            this.update();
            this.§_-zS§(this.ids);
         }
         else if("reason" in param1.data && param1.data["reason"] == §_-82O§.§_-TH§)
         {
            this.§_-33M§(param1.data["delta"]);
         }
         else
         {
            this.§_-53L§(param1.data["delta"]);
         }
      }
      
      protected function update() : void
      {
         var _loc2_:DisplayObject = null;
         this.§_-r2B§();
         while(this.elements.length > 0)
         {
            _loc2_ = this.elements.pop();
            _loc2_.removeEventListener(§_-u2r§.VALUE_CHANGE,this.§_-y2Z§);
            if(this.§_-61v§.contains(_loc2_))
            {
               this.§_-61v§.removeChild(_loc2_);
            }
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.ids.length)
         {
            this.elements.push(this.§_-SR§(this.ids[_loc1_]));
            _loc1_++;
         }
         this.§_-ZU§();
      }
      
      protected function §_-r2B§() : void
      {
         var _loc1_:int = §_-82O§.§_-a15§(this.type);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-13v§.length)
         {
            this.§_-13v§[_loc2_].filters = _loc1_ > _loc2_ ? [] : §_-y1l§.§_-Tk§;
            this.§_-22§[_loc2_].filters = _loc1_ > _loc2_ ? [§_-B34§,§_-1z§] : [§_-c2m§,§_-1z§];
            this.§_-22§[_loc2_].textColor = _loc1_ > _loc2_ ? uint(2211605) : uint(16777215);
            this.§_-P29§[_loc2_].visible = _loc1_ <= _loc2_;
            _loc2_++;
         }
      }
      
      protected function §_-33M§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.elements.push(this.§_-SR§(param1[_loc2_]));
            _loc2_++;
         }
         this.§_-zS§(param1);
         this.§_-ZU§();
      }
      
      protected function §_-53L§(param1:Array) : void
      {
         var _loc2_:* = int(this.elements.length - 1);
         while(_loc2_ >= 0)
         {
            if(param1.indexOf(this.elements[_loc2_].id) != -1)
            {
               this.§_-61v§.removeChild(this.elements.splice(_loc2_,1)[0]).removeEventListener(§_-u2r§.VALUE_CHANGE,this.§_-y2Z§);
            }
            _loc2_--;
         }
         this.§_-ZU§();
      }
      
      protected function §_-SR§(param1:int) : §_-u2r§
      {
         var _loc2_:§_-u2r§ = new §_-u2r§(this.type,param1);
         _loc2_.addEventListener(§_-u2r§.VALUE_CHANGE,this.§_-y2Z§);
         return _loc2_;
      }
      
      protected function §_-ZU§() : void
      {
         this.§_-l1v§.visible = this.elements.length == 0;
         this.§_-o2P§.visible = this.elements.length != 0;
         this.§_-W18§.visible = this.elements.length != 0;
         if(this.elements.length == 0)
         {
            return;
         }
         var _loc1_:Object = {};
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            _loc1_[this.elements[_loc2_].id] = _loc2_;
            _loc2_++;
         }
         this.elements.sort(this.§_-620§);
         _loc2_ = 0;
         while(_loc2_ < this.elements.length)
         {
            this.elements[_loc2_].place = _loc2_;
            this.elements[_loc2_].delta = _loc1_[this.elements[_loc2_].id] - _loc2_;
            this.§_-61v§.addChild(this.elements[_loc2_]);
            _loc2_++;
         }
         this.§_-W18§.update();
      }
      
      protected function §_-620§(param1:§_-u2r§, param2:§_-u2r§) : int
      {
         if(param1.value == param2.value)
         {
            return param1.id < param2.id ? 1 : -1;
         }
         return param1.value < param2.value ? 1 : -1;
      }
      
      protected function §_-zS§(param1:Array) : void
      {
         switch(this.type)
         {
            case §_-82O§.PLAYER_TYPE:
               Game.request(param1,§_-A24§[this.type],true);
               break;
            case §_-82O§.CLAN_TYPE:
               §_-B2U§.request(param1,§_-A24§[this.type],true);
         }
      }
      
      protected function §_-y2Z§(param1:Event) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            if(!this.elements[_loc2_].loaded)
            {
               return;
            }
            _loc2_++;
         }
         if(!this.loaded)
         {
            this.§_-nj§();
         }
         this.loaded = true;
         this.§_-ZU§();
      }
      
      protected function get ids() : Array
      {
         return §_-82O§.§_-n2K§(this.type);
      }
      
      protected function get timeUpdate() : int
      {
         return §_-v1t§;
      }
      
      protected function §_-62z§() : void
      {
         if(this.time <= 0)
         {
            return;
         }
         --this.time;
         if(this.time > 0)
         {
            return;
         }
         this.time = this.timeUpdate;
         if(!this.visible)
         {
            return;
         }
         this.§_-m2K§();
      }
      
      protected function §_-m2K§() : void
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            if(this.elements[_loc2_].§_-59§)
            {
               _loc1_.push(this.elements[_loc2_].id);
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            this.§_-zS§(_loc1_);
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            this.§_-m2K§();
         }
      }
   }
}

