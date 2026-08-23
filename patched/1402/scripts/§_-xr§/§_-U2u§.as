package §_-xr§
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-LZ§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import utils.§_-K1Y§;
   import utils.§_-y1l§;
   
   public class §_-U2u§ extends Dialog
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #6D4D37;","}"].join("\n");
      
      public static const §_-81Q§:Array = [{
         "replaceString":"#Ac",
         "imageClass":ImageIconNut,
         "scaleX":1,
         "scaleY":1,
         "shiftX":2,
         "shiftY":2
      },{
         "replaceString":"#Ex",
         "imageClass":ImageIconExp,
         "scaleX":1,
         "scaleY":1,
         "shiftX":2,
         "shiftY":2
      },{
         "replaceString":"#Mn",
         "imageClass":ImageIconMana,
         "scaleX":1,
         "scaleY":1,
         "shiftX":2,
         "shiftY":2
      },{
         "replaceString":"#Co",
         "imageClass":ImageIconCoins,
         "scaleX":1,
         "scaleY":1,
         "shiftX":2,
         "shiftY":2
      }];
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,13,9337447,true);
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16777215);
      
      private static const §_-C1Q§:TextFormat = new TextFormat(null,12,9337447);
      
      private static const §_-1M§:TextFormat = new TextFormat(null,16,7232071,true);
      
      private static const §_-Ji§:TextFormat = new TextFormat(null,13,16777215,true);
      
      private static const §_-FU§:GlowFilter = new GlowFilter(11769728,1,6,6,8);
      
      private static const §_-S1Z§:GlowFilter = new GlowFilter(0,1,4,4,1);
      
      private static var _instance:§_-U2u§ = null;
      
      public static var §_-p2j§:Boolean = false;
      
      private var §_-Sh§:Sprite = null;
      
      private var §_-q2l§:Sprite = null;
      
      private var §_-v2H§:Array = [];
      
      private var §_-Q1w§:§_-i5§ = null;
      
      private var §_-Z11§:§_-i5§ = null;
      
      private var §_-a8§:Sprite = null;
      
      public function §_-U2u§()
      {
         super(gls("Миссии"),true,true,null,false);
         this.init();
         §_-Ac§.addEventListener(GameEvent.EDUCATION_QUEST_PROGRESS,this.§_-D16§);
         §_-Ac§.addEventListener(GameEvent.EDUCATION_QUEST_CHANGED,this.update);
         §_-LZ§.addEventListener(GameEvent.LEVEL_CHANGED,this.§_-22l§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-U2u§();
         }
         _instance.show();
         §_-p2j§ = true;
         §_-Ac§.§_-Vj§();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,29,16763904,null,null,null,null,null,"center");
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-q2l§ = new EducationQuestGeneraImage();
         addChild(this.§_-q2l§);
         this.§_-Q1w§ = new §_-i5§("",38,233,§_-W2U§);
         this.§_-Q1w§.filters = [§_-FU§];
         this.§_-q2l§.addChild(this.§_-Q1w§);
         var _loc2_:String = gls("Ты прекрасно справляешься, но нет времени отдыхать - пора двигаться дальше.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о твоей следующей миссии.");
         if(§_-Ac§.§_-21c§)
         {
            _loc2_ = gls("Здесь ты сможешь ознакомиться со своими текущими миссиями. То, что нужно сделать в первую очередь, чтобы освоиться в мире белок. Итак, мой друг, нажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о твоей первой миссии.");
         }
         this.§_-Z11§ = new §_-i5§("<body>" + _loc2_ + "</body>",28,255,_loc1_,560);
         this.§_-q2l§.addChild(this.§_-Z11§);
         this.§_-Sh§ = §_-Zy§.§_-BI§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
         this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
         addChild(this.§_-Sh§);
         addChild(this.§_-q2l§);
         this.§_-a8§ = new Sprite();
         this.§_-a8§.x = 10;
         this.§_-a8§.y = 320;
         this.§_-a8§.graphics.beginFill(16777215,0.6);
         this.§_-a8§.graphics.drawRect(0,0,590,215);
         addChild(this.§_-a8§);
         this.update();
         place();
         this.width = 640;
         this.height = 590;
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Sprite = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:§_-i5§ = null;
         var _loc9_:§_-K2G§ = null;
         var _loc10_:§_-K2G§ = null;
         var _loc11_:Sprite = null;
         var _loc2_:Array = §_-Ac§.§_-if§;
         if(Boolean(param1) && Boolean(param1.data["onComplete"]))
         {
            if(this.§_-Sh§)
            {
               removeChild(this.§_-Sh§);
            }
            this.§_-Sh§ = §_-Zy§.§_-BI§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
            addChild(this.§_-Sh§);
            addChild(this.§_-q2l§);
            this.§_-Q1w§.text = "";
            this.§_-Z11§.text = "<body>" + gls("Ты делаешь успехи в этом нелёгком деле, мой друг! Но расслабляться не стоит, тебе ещё многое предстоит узнать! Посмотри, какие ещё поручения я для тебя подготовил. Нажми кнопку <b>«Подробно»</b>, чтобы узнать больше о задании.") + "</body>";
         }
         while(this.§_-a8§.numChildren > 0)
         {
            this.§_-a8§.removeChildAt(0);
         }
         this.§_-v2H§ = [];
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = §_-Ac§.§_-G1x§(_loc2_[_loc4_]);
            _loc6_ = new Sprite();
            _loc6_.x = 5;
            _loc6_.y = 10 + _loc4_ * 69;
            _loc6_.addChild(new EducationQuestBack());
            _loc7_ = new (getDefinitionByName(_loc5_["icon"]) as Class)();
            _loc7_.x = 5;
            _loc7_.y = 12;
            _loc6_.addChild(_loc7_);
            _loc6_.addChild(new §_-i5§(_loc5_["name"],40,10,§_-W2P§));
            _loc6_.addChild(new §_-i5§(_loc5_["short"],40,25,§_-C1Q§,250));
            _loc6_.addChild(this.§_-73y§(_loc5_["award"]));
            _loc8_ = new §_-i5§(gls("Награда"),0,3,§_-Ji§);
            _loc8_.x = 295 + int((168 - _loc8_.textWidth) * 0.5);
            _loc8_.filters = [§_-FU§];
            _loc6_.addChild(_loc8_);
            _loc9_ = new §_-K2G§(gls("Подробно"),95);
            _loc9_.x = 475;
            _loc9_.y = 15;
            _loc9_.name = _loc5_["id"];
            _loc9_.addEventListener(MouseEvent.CLICK,this.§_-434§);
            _loc9_.visible = !§_-Ac§.§_-f2l§(_loc5_["id"]);
            _loc9_.§_-lT§();
            _loc6_.addChild(_loc9_);
            _loc10_ = new §_-K2G§(gls("Завершить"),95);
            _loc10_.x = 475;
            _loc10_.y = 15;
            _loc10_.name = _loc5_["id"];
            _loc10_.addEventListener(MouseEvent.CLICK,this.onComplete);
            _loc10_.visible = §_-Ac§.§_-f2l§(_loc5_["id"]);
            _loc6_.addChild(_loc10_);
            _loc3_ ||= §_-Ac§.§_-C1O§(_loc5_["id"]);
            _loc11_ = new EducationQuestBlockView();
            _loc11_.visible = !§_-Ac§.§_-C1O§(_loc5_["id"]);
            _loc11_.addChild(new §_-i5§(gls("Миссия доступна с {0} уровня",_loc5_["level"]),175,18,§_-W2U§)).filters = [§_-S1Z§];
            _loc6_.addChild(_loc11_);
            _loc6_.filters = !§_-Ac§.§_-C1O§(_loc5_["id"]) ? §_-y1l§.§_-Tk§ : [];
            this.§_-a8§.addChild(_loc6_);
            this.§_-v2H§.push({
               "id":_loc2_[_loc4_],
               "more":_loc9_,
               "complete":_loc10_,
               "block":_loc11_,
               "view":_loc6_
            });
            _loc4_++;
         }
         if(!_loc3_)
         {
            this.§_-Z11§.text = "<body>" + gls("Изумительно! Ещё есть много всего, о чём я хочу тебе ещё рассказать. Но сперва тебе надо набраться опыта на Солнечной Долине. Станешь сильнее - возвращайся. Мы продолжим исследование невероятного мира Белок!") + "</body>";
            if(this.§_-Sh§)
            {
               removeChild(this.§_-Sh§);
            }
            this.§_-Sh§ = new EducationQuestImageNoActive();
            this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
            addChild(this.§_-Sh§);
            addChild(this.§_-q2l§);
         }
         if(this.§_-v2H§.length == 0)
         {
            hide();
         }
      }
      
      private function §_-D16§(param1:GameEvent = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-v2H§.length)
         {
            this.§_-v2H§[_loc2_]["more"].visible = !§_-Ac§.§_-f2l§(this.§_-v2H§[_loc2_]["id"]);
            this.§_-v2H§[_loc2_]["complete"].visible = §_-Ac§.§_-f2l§(this.§_-v2H§[_loc2_]["id"]);
            _loc2_++;
         }
      }
      
      private function §_-22l§(param1:GameEvent = null) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-v2H§.length)
         {
            _loc2_ ||= this.§_-v2H§[_loc3_]["block"].visible != !§_-Ac§.§_-C1O§(this.§_-v2H§[_loc3_]["id"]);
            this.§_-v2H§[_loc3_]["block"].visible = !§_-Ac§.§_-C1O§(this.§_-v2H§[_loc3_]["id"]);
            this.§_-v2H§[_loc3_]["view"].filters = !§_-Ac§.§_-C1O§(this.§_-v2H§[_loc3_]["id"]) ? §_-y1l§.§_-Tk§ : [];
            _loc3_++;
         }
         if(_loc2_)
         {
            if(!this.visible)
            {
               §_-p2j§ = false;
               §_-Ac§.§_-Vj§();
            }
            if(this.§_-Sh§)
            {
               removeChild(this.§_-Sh§);
            }
            this.§_-Sh§ = §_-Zy§.§_-BI§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
            addChild(this.§_-Sh§);
            addChild(this.§_-q2l§);
            this.§_-Q1w§.text = "";
            this.§_-Z11§.text = "<body>" + gls("Ты делаешь успехи в этом нелёгком деле, мой друг! Но расслабляться не стоит, тебе ещё многое предстоит узнать! Посмотри, какие ещё поручения я для тебя подготовил. Нажми кнопку <b>«Подробно»</b>, чтобы узнать больше о задании.") + "</body>";
         }
      }
      
      private function §_-73y§(param1:String) : DisplayObject
      {
         var _loc5_:DisplayObject = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:§_-i5§ = new §_-i5§(param1,0,0,§_-1M§);
         _loc2_.addChild(_loc3_);
         §_-K1Y§.§_-31q§(_loc3_,§_-81Q§);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.numChildren)
         {
            _loc5_ = _loc2_.getChildAt(_loc4_);
            if(_loc5_ is ImageIconNut)
            {
               new §_-kr§(_loc5_,gls("Орехи"));
            }
            if(_loc5_ is ImageIconExp)
            {
               new §_-kr§(_loc5_,gls("Опыт"));
            }
            if(_loc5_ is ImageIconMana)
            {
               new §_-kr§(_loc5_,gls("Мана"));
            }
            if(_loc5_ is ImageIconCoins)
            {
               new §_-kr§(_loc5_,gls("Монеты"));
            }
            _loc4_++;
         }
         _loc2_.x = 295 + int((168 - _loc2_.width) * 0.5);
         _loc2_.y = 22;
         return _loc2_;
      }
      
      private function §_-434§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget.name);
         var _loc3_:Object = §_-Ac§.§_-G1x§(_loc2_);
         if(this.§_-Sh§)
         {
            removeChild(this.§_-Sh§);
         }
         this.§_-Sh§ = new (getDefinitionByName(_loc3_["image"]) as Class)();
         this.§_-Sh§.x = this.§_-q2l§.x + (this.§_-q2l§.width - this.§_-Sh§.width);
         addChild(this.§_-Sh§);
         addChild(this.§_-q2l§);
         this.§_-Q1w§.text = _loc3_["name"];
         this.§_-Z11§.text = "<body>" + _loc3_["text"] + "</body>";
      }
      
      private function onComplete(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget.name);
         var _loc3_:Object = §_-Ac§.§_-G1x§(_loc2_);
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < §_-81Q§.length)
         {
            if((_loc3_["award"] as String).indexOf(§_-81Q§[_loc5_]["replaceString"]) != -1)
            {
               this.showAward(§_-81Q§[_loc5_]["imageClass"],param1.currentTarget.localToGlobal(new Point(45,-5)),_loc4_);
               _loc4_ += 0.1;
            }
            _loc5_++;
         }
         §_-Ac§.complete(_loc2_);
      }
      
      private function showAward(param1:Class, param2:Point, param3:Number) : void
      {
         var object:DisplayObject = null;
         var imageClass:Class = param1;
         var point:Point = param2;
         var delay:Number = param3;
         object = new imageClass() as DisplayObject;
         object.x = point.x;
         object.y = point.y;
         Game.§_-q1L§.addChild(object);
         TweenMax.to(object,1,{
            "bezier":[{
               "x":600,
               "y":300
            },{
               "x":80,
               "y":80
            }],
            "delay":delay,
            "onComplete":function():void
            {
               Game.§_-q1L§.removeChild(object);
            }
         });
      }
   }
}

