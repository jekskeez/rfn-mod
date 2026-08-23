package ratings
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-Kr§.ScrollPane;
   import §_-dc§.§_-e2W§;
   import buttons.§_-j18§;
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
   import utils.§_-x1Z§;
   
   public class §_-t2m§ extends Sprite
   {
      
      private static const §_-gb§:int = 60;
      
      private static const §_-b1S§:Array = [RatingImageNoLeague,RatingImageNoClan];
      
      private static const §_-l19§:Array = [gls("Ты пока еще не попал ни\nв одну из лиг.\n\nПродолжай проходить\nуровни! Чем лучше ты их\nпроходишь, тем быстрее\nты начнешь состязаться\nс остальными за звание\nлучшей белки."),gls("Твой клан пока еще\nне попал ни в одну из лиг.\n\nПродолжай проходить\nуровни! Чем лучше их\nпроходят все белки клана, тем быстрее вы начнете\nсостязаться с остальными\nза звание лучших."),gls("Ты пока еще не являешься\nчленом какого-либо клана!\n\nВступи в клан\nили создай свой\nи начинай борьбу\nза звание лучшего клана\nмира Трагедии белок!")];
      
      protected static const §_-j5§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      protected static const §_-M2L§:GlowFilter = new GlowFilter(6697728,1,4,4,8);
      
      protected static const §_-x2T§:GlowFilter = new GlowFilter(16777215,1,4,4,8);
      
      protected static const §_-p25§:DropShadowFilter = new DropShadowFilter(2,45,0,1,2,2,0.25);
      
      public static const §_-03g§:Array = [§_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-Ng§ | §_-hF§.§_-81Z§ | §_-hF§.§_-P13§ | §_-hF§.§_-329§,§_-Oy§.§_-g2n§ | §_-Oy§.§_-U1d§ | §_-Oy§.SIZE | §_-Oy§.§_-819§ | §_-Oy§.§_-Ng§ | §_-Oy§.§_-81Z§];
      
      protected var type:int = 0;
      
      protected var elements:Vector.<§_-f1T§> = new Vector.<§_-f1T§>(0);
      
      protected var §_-GQ§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      protected var §_-Yz§:Vector.<§_-22V§> = new Vector.<§_-22V§>(0);
      
      protected var §_-k1I§:Vector.<§_-22V§> = new Vector.<§_-22V§>(0);
      
      protected var §_-P1z§:§_-22V§ = null;
      
      protected var §_-M1N§:ScrollPane = null;
      
      protected var §_-sa§:Sprite = null;
      
      protected var §_-S2T§:§_-j18§ = null;
      
      protected var §_-31E§:DisplayObjectContainer = null;
      
      private var time:int = 0;
      
      private var loaded:Boolean = false;
      
      public function §_-t2m§(param1:int)
      {
         super();
         this.type = param1;
         this.init();
         this.time = this.timeUpdate;
         this.listen();
         §_-01Y§.§_-c9§(this.§_-A1b§);
      }
      
      protected function init() : void
      {
         this.§_-q2u§();
         this.§_-036§();
         this.update();
         this.§_-E14§(this.ids);
      }
      
      protected function §_-q2u§() : void
      {
         this.§_-s2A§();
         this.§_-M1N§ = new ScrollPane();
         addChild(this.§_-M1N§);
         this.§_-V1H§();
         this.§_-sa§ = new Sprite();
         this.§_-M1N§.source = this.§_-sa§;
         this.§_-S2T§ = new §_-j18§(gls("Показать себя"));
         this.§_-S2T§.x = 450 - int(this.§_-S2T§.width * 0.5);
         this.§_-S2T§.y = 500;
         this.§_-S2T§.addEventListener(MouseEvent.CLICK,this.§_-h24§);
         addChild(this.§_-S2T§);
         this.§_-31E§ = new this.imageClass();
         this.§_-31E§.scaleX = this.§_-31E§.scaleY = 1.3;
         this.§_-31E§.x = 500;
         this.§_-31E§.y = 350;
         addChild(this.§_-31E§);
         this.§_-P1z§ = new §_-22V§("",-10,-115,new TextFormat(null,14,8870474,true,null,null,null,null,"center"));
         this.§_-P1z§.width = 216;
         this.§_-P1z§.multiline = true;
         this.§_-P1z§.wordWrap = true;
         this.§_-P1z§.text = this.imageText;
         this.§_-31E§.addChild(this.§_-P1z§);
      }
      
      protected function get imageClass() : Class
      {
         return §_-b1S§[this.type];
      }
      
      protected function get imageText() : String
      {
         var _loc1_:int = this.type == §_-13r§.CLAN_TYPE && Game.self["clan_id"] == 0 ? §_-13r§.§_-6n§ : this.type;
         return §_-l19§[_loc1_];
      }
      
      protected function §_-s2A§() : void
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(900,175,Math.PI * 0.5,0,0);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,0,900,175);
         _loc1_.createGradientBox(900,360,Math.PI * 0.5,0,175);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,175,900,360);
      }
      
      protected function §_-V1H§() : void
      {
         this.§_-M1N§.x = 25;
         this.§_-M1N§.y = 190;
         this.§_-M1N§.setSize(860,300);
         this.§_-M1N§.graphics.beginFill(0,0.05);
         this.§_-M1N§.graphics.drawRect(-2,-2,844,304);
      }
      
      protected function §_-036§() : void
      {
         var _loc1_:LeagueTapeView = new LeagueTapeView();
         _loc1_.x = int((§_-a9§.§_-9o§ - _loc1_.width) * 0.5);
         _loc1_.y = 5;
         addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Уровни лиг"),0,5,new TextFormat(§_-22V§.§_-pJ§,16,16777215));
         _loc2_.x = int(0.5 * (§_-a9§.§_-9o§ - _loc2_.textWidth));
         _loc2_.filters = [§_-j5§];
         addChild(_loc2_);
         this.§_-GQ§.push(_loc1_.bronzeView,_loc1_.silverView,_loc1_.goldView,_loc1_.masterView,_loc1_.diamondView,_loc1_.championView);
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-GQ§.length)
         {
            _loc2_ = new §_-22V§(§_-8S§.§_-11s§(_loc3_ + 1,this.type),0,0,new TextFormat(§_-22V§.§_-pJ§,14,16777215));
            _loc2_.x = this.§_-GQ§[_loc3_].x - int(_loc2_.textWidth * 0.5) - 3;
            _loc2_.y = this.§_-GQ§[_loc3_].y + int(this.§_-GQ§[_loc3_].height * 0.5);
            _loc2_.filters = [§_-M2L§,§_-p25§];
            _loc1_.addChild(_loc2_);
            this.§_-k1I§.push(_loc2_);
            _loc2_ = new §_-22V§(§_-8S§.§_-B18§(_loc3_ + 1,this.type).toString(),0,20,new TextFormat(§_-22V§.§_-pJ§,14,16773823));
            _loc2_.x = this.§_-GQ§[_loc3_].x - int(_loc2_.textWidth * 0.5) - 3;
            _loc2_.y = this.§_-GQ§[_loc3_].y + int(this.§_-GQ§[_loc3_].height * 0.5) + 18;
            _loc2_.filters = [§_-M2L§,§_-p25§];
            _loc1_.addChild(_loc2_);
            this.§_-Yz§.push(_loc2_);
            _loc3_++;
         }
      }
      
      protected function listen() : void
      {
         §_-13r§.addEventListener(GameEvent.DIVISION_CHANGED,this.§_-vM§);
         §_-13r§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-21H§);
      }
      
      protected function §_-h24§(param1:MouseEvent = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            if(this.elements[_loc2_].isSelf)
            {
               this.§_-M1N§.verticalScrollPosition = this.elements[_loc2_].y - 100;
               break;
            }
            _loc2_++;
         }
      }
      
      protected function §_-21H§(param1:GameEvent) : void
      {
         if(param1.data["type"] != this.type)
         {
            return;
         }
         this.update();
      }
      
      protected function §_-vM§(param1:GameEvent) : void
      {
         if(param1 == null || param1.data == null || param1.data["type"] != this.type)
         {
            return;
         }
         if(!("delta" in param1.data))
         {
            this.update();
            this.§_-E14§(this.ids);
         }
         else if("reason" in param1.data && param1.data["reason"] == §_-13r§.§_-O2n§)
         {
            this.§_-92Y§(param1.data["delta"]);
         }
         else
         {
            this.§_-H2Y§(param1.data["delta"]);
         }
      }
      
      protected function update() : void
      {
         var _loc2_:DisplayObject = null;
         this.§_-y2i§();
         while(this.elements.length > 0)
         {
            _loc2_ = this.elements.pop();
            _loc2_.removeEventListener(§_-f1T§.VALUE_CHANGE,this.§_-q2K§);
            if(this.§_-sa§.contains(_loc2_))
            {
               this.§_-sa§.removeChild(_loc2_);
            }
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.ids.length)
         {
            this.elements.push(this.§_-F13§(this.ids[_loc1_]));
            _loc1_++;
         }
         this.§_-l13§();
      }
      
      protected function §_-y2i§() : void
      {
         var _loc1_:int = §_-13r§.§_-DX§(this.type);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-GQ§.length)
         {
            this.§_-GQ§[_loc2_].filters = _loc1_ > _loc2_ ? [] : §_-x1Z§.§_-c2G§;
            this.§_-k1I§[_loc2_].filters = _loc1_ > _loc2_ ? [§_-x2T§,§_-p25§] : [§_-M2L§,§_-p25§];
            this.§_-k1I§[_loc2_].textColor = _loc1_ > _loc2_ ? uint(2211605) : uint(16777215);
            this.§_-Yz§[_loc2_].visible = _loc1_ <= _loc2_;
            _loc2_++;
         }
      }
      
      protected function §_-92Y§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.elements.push(this.§_-F13§(param1[_loc2_]));
            _loc2_++;
         }
         this.§_-E14§(param1);
         this.§_-l13§();
      }
      
      protected function §_-H2Y§(param1:Array) : void
      {
         var _loc2_:* = int(this.elements.length - 1);
         while(_loc2_ >= 0)
         {
            if(param1.indexOf(this.elements[_loc2_].id) != -1)
            {
               this.§_-sa§.removeChild(this.elements.splice(_loc2_,1)[0]).removeEventListener(§_-f1T§.VALUE_CHANGE,this.§_-q2K§);
            }
            _loc2_--;
         }
         this.§_-l13§();
      }
      
      protected function §_-F13§(param1:int) : §_-f1T§
      {
         var _loc2_:§_-f1T§ = new §_-f1T§(this.type,param1);
         _loc2_.addEventListener(§_-f1T§.VALUE_CHANGE,this.§_-q2K§);
         return _loc2_;
      }
      
      protected function §_-l13§() : void
      {
         this.§_-31E§.visible = this.elements.length == 0;
         this.§_-S2T§.visible = this.elements.length != 0;
         this.§_-M1N§.visible = this.elements.length != 0;
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
         this.elements.sort(this.§_-n2o§);
         _loc2_ = 0;
         while(_loc2_ < this.elements.length)
         {
            this.elements[_loc2_].place = _loc2_;
            this.elements[_loc2_].delta = _loc1_[this.elements[_loc2_].id] - _loc2_;
            this.§_-sa§.addChild(this.elements[_loc2_]);
            _loc2_++;
         }
         this.§_-M1N§.update();
      }
      
      protected function §_-n2o§(param1:§_-f1T§, param2:§_-f1T§) : int
      {
         if(param1.value == param2.value)
         {
            return param1.id < param2.id ? 1 : -1;
         }
         return param1.value < param2.value ? 1 : -1;
      }
      
      protected function §_-E14§(param1:Array) : void
      {
         switch(this.type)
         {
            case §_-13r§.PLAYER_TYPE:
               Game.request(param1,§_-03g§[this.type],true);
               break;
            case §_-13r§.CLAN_TYPE:
               §_-e2W§.request(param1,§_-03g§[this.type],true);
         }
      }
      
      protected function §_-q2K§(param1:Event) : void
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
            this.§_-h24§();
         }
         this.loaded = true;
         this.§_-l13§();
      }
      
      protected function get ids() : Array
      {
         return §_-13r§.§_-f12§(this.type);
      }
      
      protected function get timeUpdate() : int
      {
         return §_-gb§;
      }
      
      protected function §_-A1b§() : void
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
         this.§_-P2w§();
      }
      
      protected function §_-P2w§() : void
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            if(this.elements[_loc2_].§_-e1W§)
            {
               _loc1_.push(this.elements[_loc2_].id);
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            this.§_-E14§(_loc1_);
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            this.§_-P2w§();
         }
      }
   }
}

