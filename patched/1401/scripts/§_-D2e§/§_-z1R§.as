package §_-D2e§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-d2x§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import utils.§_-jB§;
   import utils.§_-x1Z§;
   
   public class §_-z1R§ extends Dialog
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #6D4D37;","}"].join("\n");
      
      public static const §_-81v§:Array = [{
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
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,13,9337447,true);
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16777215);
      
      private static const §_-CD§:TextFormat = new TextFormat(null,12,9337447);
      
      private static const §_-K1D§:TextFormat = new TextFormat(null,16,7232071,true);
      
      private static const §_-Tu§:TextFormat = new TextFormat(null,13,16777215,true);
      
      private static const §_-u18§:GlowFilter = new GlowFilter(11769728,1,6,6,8);
      
      private static const §_-D2h§:GlowFilter = new GlowFilter(0,1,4,4,1);
      
      private static var _instance:§_-z1R§ = null;
      
      public static var §_-q1R§:Boolean = false;
      
      private var §_-ys§:Sprite = null;
      
      private var §_-i2b§:Sprite = null;
      
      private var §_-p1y§:Array = [];
      
      private var §_-T1j§:§_-22V§ = null;
      
      private var §_-n2P§:§_-22V§ = null;
      
      private var §_-f2n§:Sprite = null;
      
      public function §_-z1R§()
      {
         super(gls("Миссии"),true,true,null,false);
         this.init();
         §_-Q2v§.addEventListener(GameEvent.EDUCATION_QUEST_PROGRESS,this.§_-E2X§);
         §_-Q2v§.addEventListener(GameEvent.EDUCATION_QUEST_CHANGED,this.update);
         §_-d2x§.addEventListener(GameEvent.LEVEL_CHANGED,this.§_-A1O§);
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-z1R§();
         }
         _instance.show();
         §_-q1R§ = true;
         §_-Q2v§.§_-EK§();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,29,16763904,null,null,null,null,null,"center");
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-i2b§ = new EducationQuestGeneraImage();
         addChild(this.§_-i2b§);
         this.§_-T1j§ = new §_-22V§("",38,233,§_-a1Y§);
         this.§_-T1j§.filters = [§_-u18§];
         this.§_-i2b§.addChild(this.§_-T1j§);
         var _loc2_:String = gls("Ты прекрасно справляешься, но нет времени отдыхать - пора двигаться дальше.\nНажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о твоей следующей миссии.");
         if(§_-Q2v§.§_-U2F§)
         {
            _loc2_ = gls("Здесь ты сможешь ознакомиться со своими текущими миссиями. То, что нужно сделать в первую очередь, чтобы освоиться в мире белок. Итак, мой друг, нажми кнопку <b>«Подробно»</b>, чтобы узнать побольше о твоей первой миссии.");
         }
         this.§_-n2P§ = new §_-22V§("<body>" + _loc2_ + "</body>",28,255,_loc1_,560);
         this.§_-i2b§.addChild(this.§_-n2P§);
         this.§_-ys§ = §_-a9§.§_-sc§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
         this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
         addChild(this.§_-ys§);
         addChild(this.§_-i2b§);
         this.§_-f2n§ = new Sprite();
         this.§_-f2n§.x = 10;
         this.§_-f2n§.y = 320;
         this.§_-f2n§.graphics.beginFill(16777215,0.6);
         this.§_-f2n§.graphics.drawRect(0,0,590,215);
         addChild(this.§_-f2n§);
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
         var _loc8_:§_-22V§ = null;
         var _loc9_:§_-j18§ = null;
         var _loc10_:§_-j18§ = null;
         var _loc11_:Sprite = null;
         var _loc2_:Array = §_-Q2v§.§_-62b§;
         if(Boolean(param1) && Boolean(param1.data["onComplete"]))
         {
            if(this.§_-ys§)
            {
               removeChild(this.§_-ys§);
            }
            this.§_-ys§ = §_-a9§.§_-sc§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
            addChild(this.§_-ys§);
            addChild(this.§_-i2b§);
            this.§_-T1j§.text = "";
            this.§_-n2P§.text = "<body>" + gls("Ты делаешь успехи в этом нелёгком деле, мой друг! Но расслабляться не стоит, тебе ещё многое предстоит узнать! Посмотри, какие ещё поручения я для тебя подготовил. Нажми кнопку <b>«Подробно»</b>, чтобы узнать больше о задании.") + "</body>";
         }
         while(this.§_-f2n§.numChildren > 0)
         {
            this.§_-f2n§.removeChildAt(0);
         }
         this.§_-p1y§ = [];
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = §_-Q2v§.§_-d2I§(_loc2_[_loc4_]);
            _loc6_ = new Sprite();
            _loc6_.x = 5;
            _loc6_.y = 10 + _loc4_ * 69;
            _loc6_.addChild(new EducationQuestBack());
            _loc7_ = new (getDefinitionByName(_loc5_["icon"]) as Class)();
            _loc7_.x = 5;
            _loc7_.y = 12;
            _loc6_.addChild(_loc7_);
            _loc6_.addChild(new §_-22V§(_loc5_["name"],40,10,§_-i2c§));
            _loc6_.addChild(new §_-22V§(_loc5_["short"],40,25,§_-CD§,250));
            _loc6_.addChild(this.§_-X2A§(_loc5_["award"]));
            _loc8_ = new §_-22V§(gls("Награда"),0,3,§_-Tu§);
            _loc8_.x = 295 + int((168 - _loc8_.textWidth) * 0.5);
            _loc8_.filters = [§_-u18§];
            _loc6_.addChild(_loc8_);
            _loc9_ = new §_-j18§(gls("Подробно"),95);
            _loc9_.x = 475;
            _loc9_.y = 15;
            _loc9_.name = _loc5_["id"];
            _loc9_.addEventListener(MouseEvent.CLICK,this.§_-R1u§);
            _loc9_.visible = !§_-Q2v§.§_-H4§(_loc5_["id"]);
            _loc9_.§_-v5§();
            _loc6_.addChild(_loc9_);
            _loc10_ = new §_-j18§(gls("Завершить"),95);
            _loc10_.x = 475;
            _loc10_.y = 15;
            _loc10_.name = _loc5_["id"];
            _loc10_.addEventListener(MouseEvent.CLICK,this.onComplete);
            _loc10_.visible = §_-Q2v§.§_-H4§(_loc5_["id"]);
            _loc6_.addChild(_loc10_);
            _loc3_ ||= §_-Q2v§.§_-d2A§(_loc5_["id"]);
            _loc11_ = new EducationQuestBlockView();
            _loc11_.visible = !§_-Q2v§.§_-d2A§(_loc5_["id"]);
            _loc11_.addChild(new §_-22V§(gls("Миссия доступна с {0} уровня",_loc5_["level"]),175,18,§_-a1Y§)).filters = [§_-D2h§];
            _loc6_.addChild(_loc11_);
            _loc6_.filters = !§_-Q2v§.§_-d2A§(_loc5_["id"]) ? §_-x1Z§.§_-c2G§ : [];
            this.§_-f2n§.addChild(_loc6_);
            this.§_-p1y§.push({
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
            this.§_-n2P§.text = "<body>" + gls("Изумительно! Ещё есть много всего, о чём я хочу тебе ещё рассказать. Но сперва тебе надо набраться опыта на Солнечной Долине. Станешь сильнее - возвращайся. Мы продолжим исследование невероятного мира Белок!") + "</body>";
            if(this.§_-ys§)
            {
               removeChild(this.§_-ys§);
            }
            this.§_-ys§ = new EducationQuestImageNoActive();
            this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
            addChild(this.§_-ys§);
            addChild(this.§_-i2b§);
         }
         if(this.§_-p1y§.length == 0)
         {
            hide();
         }
      }
      
      private function §_-E2X§(param1:GameEvent = null) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-p1y§.length)
         {
            this.§_-p1y§[_loc2_]["more"].visible = !§_-Q2v§.§_-H4§(this.§_-p1y§[_loc2_]["id"]);
            this.§_-p1y§[_loc2_]["complete"].visible = §_-Q2v§.§_-H4§(this.§_-p1y§[_loc2_]["id"]);
            _loc2_++;
         }
      }
      
      private function §_-A1O§(param1:GameEvent = null) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-p1y§.length)
         {
            _loc2_ ||= this.§_-p1y§[_loc3_]["block"].visible != !§_-Q2v§.§_-d2A§(this.§_-p1y§[_loc3_]["id"]);
            this.§_-p1y§[_loc3_]["block"].visible = !§_-Q2v§.§_-d2A§(this.§_-p1y§[_loc3_]["id"]);
            this.§_-p1y§[_loc3_]["view"].filters = !§_-Q2v§.§_-d2A§(this.§_-p1y§[_loc3_]["id"]) ? §_-x1Z§.§_-c2G§ : [];
            _loc3_++;
         }
         if(_loc2_)
         {
            if(!this.visible)
            {
               §_-q1R§ = false;
               §_-Q2v§.§_-EK§();
            }
            if(this.§_-ys§)
            {
               removeChild(this.§_-ys§);
            }
            this.§_-ys§ = §_-a9§.§_-sc§ ? new EducationQuestImageShowMoreRu() : new EducationQuestImageShowMoreEn();
            this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
            addChild(this.§_-ys§);
            addChild(this.§_-i2b§);
            this.§_-T1j§.text = "";
            this.§_-n2P§.text = "<body>" + gls("Ты делаешь успехи в этом нелёгком деле, мой друг! Но расслабляться не стоит, тебе ещё многое предстоит узнать! Посмотри, какие ещё поручения я для тебя подготовил. Нажми кнопку <b>«Подробно»</b>, чтобы узнать больше о задании.") + "</body>";
         }
      }
      
      private function §_-X2A§(param1:String) : DisplayObject
      {
         var _loc5_:DisplayObject = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:§_-22V§ = new §_-22V§(param1,0,0,§_-K1D§);
         _loc2_.addChild(_loc3_);
         §_-jB§.§_-Y2B§(_loc3_,§_-81v§);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.numChildren)
         {
            _loc5_ = _loc2_.getChildAt(_loc4_);
            if(_loc5_ is ImageIconNut)
            {
               new §_-Hb§(_loc5_,gls("Орехи"));
            }
            if(_loc5_ is ImageIconExp)
            {
               new §_-Hb§(_loc5_,gls("Опыт"));
            }
            if(_loc5_ is ImageIconMana)
            {
               new §_-Hb§(_loc5_,gls("Мана"));
            }
            if(_loc5_ is ImageIconCoins)
            {
               new §_-Hb§(_loc5_,gls("Монеты"));
            }
            _loc4_++;
         }
         _loc2_.x = 295 + int((168 - _loc2_.width) * 0.5);
         _loc2_.y = 22;
         return _loc2_;
      }
      
      private function §_-R1u§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget.name);
         var _loc3_:Object = §_-Q2v§.§_-d2I§(_loc2_);
         if(this.§_-ys§)
         {
            removeChild(this.§_-ys§);
         }
         this.§_-ys§ = new (getDefinitionByName(_loc3_["image"]) as Class)();
         this.§_-ys§.x = this.§_-i2b§.x + (this.§_-i2b§.width - this.§_-ys§.width);
         addChild(this.§_-ys§);
         addChild(this.§_-i2b§);
         this.§_-T1j§.text = _loc3_["name"];
         this.§_-n2P§.text = "<body>" + _loc3_["text"] + "</body>";
      }
      
      private function onComplete(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget.name);
         var _loc3_:Object = §_-Q2v§.§_-d2I§(_loc2_);
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < §_-81v§.length)
         {
            if((_loc3_["award"] as String).indexOf(§_-81v§[_loc5_]["replaceString"]) != -1)
            {
               this.showAward(§_-81v§[_loc5_]["imageClass"],param1.currentTarget.localToGlobal(new Point(45,-5)),_loc4_);
               _loc4_ += 0.1;
            }
            _loc5_++;
         }
         §_-Q2v§.complete(_loc2_);
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
         Game.§_-d2t§.addChild(object);
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
               Game.§_-d2t§.removeChild(object);
            }
         });
      }
   }
}

