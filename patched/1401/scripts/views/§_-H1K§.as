package views
{
   import §_-42B§.TweenMax;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-O1T§;
   import §_-I10§.§_-a1D§;
   import §_-I10§.§_-vy§;
   import §_-dc§.§_-d1q§;
   import §_-r2A§.§_-E2G§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import utils.§_-jB§;
   import utils.§_-x1Z§;
   
   public class §_-H1K§ extends Sprite
   {
      
      public static const §_-73G§:int = 0;
      
      public static const §_-62m§:int = 1;
      
      public static const §_-M0§:int = 2;
      
      public static const §_-q2x§:int = 3;
      
      public static const §_-AA§:int = 4;
      
      public static const §_-rB§:int = 5;
      
      public static const §_-51o§:int = 6;
      
      private static const §_-A3F§:int = 30;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #623E19;","}",".bold","{","font-weight: bold;","}"].join("\n");
      
      private static var §_-E1A§:Array = null;
      
      private static var §_-vN§:Array = null;
      
      private static var §_-K1z§:Array = [1,0.75,0.6,0.8];
      
      private static const §_-Q1V§:Array = [ImageIconExp,null,null,ImageIconMana,null,ImageIconNut];
      
      private static const §_-h2m§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,16546087);
      
      private static var style:StyleSheet = null;
      
      private var lifeTime:int = 0;
      
      private var §_-t2Z§:Number = 0;
      
      private var button:SimpleButton = null;
      
      private var view:Sprite = null;
      
      private var tween:TweenMax = null;
      
      private var §_-33h§:Boolean = false;
      
      private var §_-R2Y§:Boolean = false;
      
      public var type:int = 0;
      
      public var id:int = 0;
      
      public var value:int = 0;
      
      public function §_-H1K§(param1:int, param2:int, param3:int)
      {
         super();
         if(!style)
         {
            style = new StyleSheet();
            style.parseCSS(§_-I2U§);
         }
         this.lifeTime = int(getTimer() / 1000);
         this.type = param1;
         this.id = param2;
         this.value = param3;
         this.init();
      }
      
      private static function get §_-Pp§() : Array
      {
         if(!§_-E1A§)
         {
            §_-E1A§ = [ImageLevelUp0,ImageLevelUp1,ImageLevelUp2,ImageLevelUp3,ImageLevelUp4,ImageLevelUp5,ImageLevelUp6,ImageLevelUp7,ImageLevelUp8,ImageLevelUp9];
         }
         return §_-E1A§;
      }
      
      private static function get §_-l§() : Array
      {
         if(!§_-vN§)
         {
            §_-vN§ = [ShamanLevelUp0,ShamanLevelUp1,ShamanLevelUp2,ShamanLevelUp3,ShamanLevelUp4,ShamanLevelUp5,ShamanLevelUp6,ShamanLevelUp7,ShamanLevelUp8,ShamanLevelUp9];
         }
         return §_-vN§;
      }
      
      public function start() : void
      {
         TweenMax.to(this,0.5,{
            "x":0,
            "ease":§_-E2G§.easeOut,
            "onComplete":this.onComplete
         });
      }
      
      public function stop() : void
      {
         this.§_-R2Y§ = true;
         this.view.visible = false;
         this.button.removeEventListener(MouseEvent.CLICK,this.§_-J2E§);
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
         §_-01Y§.§_-t1s§(this.§_-H5§);
         TweenMax.to(this,0.5,{
            "x":-40,
            "ease":§_-E2G§.easeIn,
            "onComplete":this.§_-D18§
         });
      }
      
      public function set offsetY(param1:int) : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this,0.5,{"y":param1});
      }
      
      public function get §_-e1W§() : Boolean
      {
         return !this.§_-R2Y§ && this.lifeTime + this.§_-t2Z§ + §_-A3F§ < int(getTimer() / 1000);
      }
      
      public function get §_-01y§() : Boolean
      {
         return this.§_-33h§;
      }
      
      private function init() : void
      {
         this.x = -40;
         this.button = this.§_-k2E§();
         addChild(this.button);
         this.view = this.§_-61E§();
         this.view.x = 40;
         this.view.visible = false;
         this.view.alpha = 0;
         addChild(this.view);
      }
      
      private function §_-H5§() : void
      {
         this.§_-t2Z§ += this.view.visible ? §_-01Y§.delay : 0;
      }
      
      private function onComplete() : void
      {
         this.button.addEventListener(MouseEvent.CLICK,this.§_-J2E§);
      }
      
      private function §_-D18§() : void
      {
         this.§_-33h§ = true;
      }
      
      private function §_-J2E§(param1:MouseEvent) : void
      {
         this.view.visible = !this.view.visible;
         if(this.view.visible)
         {
            Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
            §_-01Y§.§_-h1R§(this.§_-H5§);
            TweenMax.to(this.view,0.2,{"alpha":1});
         }
         else
         {
            this.stop();
         }
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         while(_loc2_ != null)
         {
            if(_loc2_ == this)
            {
               return;
            }
            _loc2_ = _loc2_.parent;
         }
         this.view.visible = false;
         this.stop();
      }
      
      private function §_-k2E§() : SimpleButton
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16249053);
         _loc1_.graphics.lineStyle(1,14535087);
         _loc1_.graphics.drawRect(0,0,40,40);
         _loc1_.addChild(this.§_-ng§());
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16446431);
         _loc2_.graphics.lineStyle(1,14535087);
         _loc2_.graphics.drawRect(0,0,40,40);
         _loc2_.addChild(this.§_-ng§());
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(16051418);
         _loc3_.graphics.lineStyle(1,14535087);
         _loc3_.graphics.drawRect(0,0,40,40);
         _loc3_.addChild(this.§_-ng§());
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(0,0);
         _loc4_.graphics.drawRect(0,0,40,40);
         return new SimpleButton(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      private function §_-61E§() : Sprite
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:Sprite = null;
         var _loc4_:String = null;
         var _loc5_:§_-c1t§ = null;
         var _loc6_:§_-22V§ = null;
         var _loc7_:int = 0;
         var _loc8_:Class = null;
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16249053);
         _loc1_.graphics.lineStyle(1,14535087);
         _loc1_.graphics.drawRoundRectComplex(0,0,290,85,0,5,0,5);
         switch(this.type)
         {
            case §_-73G§:
               _loc2_ = new Sprite();
               (_loc2_ as Sprite).addChild(new GameEventLevelBack());
               _loc3_ = this.§_-M1b§(this.value);
               _loc3_.x = 5 + int((_loc2_.width - _loc3_.width) * 0.5);
               _loc3_.y = int(_loc2_.height * 0.5);
               (_loc2_ as Sprite).addChild(_loc3_);
               _loc2_.x = 5;
               _loc2_.y = 5;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-22V§(gls("Новый Уровень!"),80,8,§_-h2m§));
               _loc1_.addChild(new §_-22V§("<body>" + gls("Тебе удалось достичь\n<b>{0} уровня!</b>",this.value) + "</body>",80,25,style,205));
               break;
            case §_-62m§:
               _loc2_ = new §_-S1U§(this.value,1.5);
               _loc2_.x = 40;
               _loc2_.y = 40;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-22V§(gls("Новая Лига!"),80,8,§_-h2m§));
               _loc4_ = this.id == §_-13r§.CLAN_TYPE ? gls("Твой клан перешёл в лигу <b>{0}</b>!",§_-8S§.§_-11s§(this.value,this.id)) : gls("Тебе удалось перейти в лигу <b>{0}</b>!",§_-8S§.§_-11s§(this.value,this.id));
               _loc1_.addChild(new §_-22V§("<body>" + _loc4_ + "</body>",80,25,style,205));
               break;
            case §_-M0§:
               _loc5_ = new §_-c1t§();
               _loc5_.§_-iU§(this.id);
               _loc5_.x = 27;
               _loc5_.y = 3;
               _loc1_.addChild(_loc5_);
               break;
            case §_-q2x§:
               _loc2_ = §_-O1T§.§_-81e§(this.id);
               _loc2_.width = _loc2_.height = 65;
               _loc2_.x = _loc2_.y = 10;
               _loc1_.addChild(_loc2_);
               if(this.value == 100)
               {
                  _loc1_.addChild(new §_-22V§(gls("Получено достижение!"),80,8,§_-h2m§));
                  _loc1_.addChild(new §_-22V§("<body>" + gls("Тебе удалось заработать достижение <b>{0}</b>!",§_-O1T§.DATA[this.id]["name"]) + "</body>",80,25,style,205));
               }
               else
               {
                  _loc1_.addChild(new §_-22V§(gls("Прогресс в достижении!"),80,8,§_-h2m§));
                  _loc1_.addChild(new §_-22V§("<body>" + gls("Достижение <b>{0}</b> выполнено на {1}%.",§_-O1T§.DATA[this.id]["name"],this.value) + "</body>",80,25,style,205));
               }
               break;
            case §_-AA§:
               _loc2_ = this.§_-M1b§(this.value,true);
               _loc2_.x = 22;
               _loc2_.y = 18;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-22V§(gls("Новый уровень шамана!"),80,8,§_-h2m§));
               _loc1_.addChild(new §_-22V§("<body>" + gls("Ты получаешь волшебное перо для изучения способностей.") + "</body>",80,25,style,205));
               break;
            case §_-rB§:
               _loc2_ = this.§_-71K§(this.id);
               _loc2_.x = _loc2_.y = -5;
               _loc2_.scaleX = _loc2_.scaleY = 1.2;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-22V§(§_-d1q§.getName(this.id),80,8,§_-h2m§));
               _loc6_ = new §_-22V§(gls("<body>Бонус <span class = \'bold\'>+{0} </span> #Award</body>",this.value),80,25,style,205);
               _loc1_.addChild(_loc6_);
               §_-jB§.§_-fG§(_loc6_,"#Award",§_-Q1V§[this.id],0.6,0.6,_loc6_.x - 155,-_loc6_.y,true,true);
               break;
            case §_-51o§:
               _loc7_ = this.id;
               _loc8_ = §_-a1D§.§_-1A§(_loc7_);
               _loc2_ = new _loc8_() as Sprite;
               _loc2_.scaleX = _loc2_.scaleY = 65 / Math.max(_loc2_.width,_loc2_.height);
               _loc2_.x = 10 + int((65 - _loc2_.width) * 0.5);
               _loc2_.y = 10 + int((65 - _loc2_.height) * 0.5);
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-22V§(§_-a1D§.§_-hY§(_loc7_),80,8,§_-h2m§));
               _loc1_.addChild(new §_-22V§("<body>" + gls("Задание ") + §_-a1D§.§_-N2v§(NuttyPassManager.§_-R2B§(_loc7_),this.value) + gls(" выполнено!") + "</body>",80,25,style,205));
         }
         return _loc1_;
      }
      
      private function §_-ng§() : DisplayObject
      {
         var _loc2_:Sprite = null;
         var _loc3_:Class = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Class = null;
         var _loc6_:Sprite = null;
         var _loc1_:DisplayObject = null;
         switch(this.type)
         {
            case §_-73G§:
               _loc1_ = new Sprite();
               (_loc1_ as Sprite).addChild(new GameEventLevelBack());
               _loc2_ = this.§_-M1b§(this.value);
               _loc2_.x = 5 + int((_loc1_.width - _loc2_.width) * 0.5);
               _loc2_.y = int(_loc1_.height * 0.5);
               (_loc1_ as Sprite).addChild(_loc2_);
               _loc1_.scaleX = _loc1_.scaleY = 0.4;
               _loc1_.x = _loc1_.y = 5;
               break;
            case §_-62m§:
               _loc1_ = new §_-S1U§(this.value,0.8);
               _loc1_.x = 20;
               _loc1_.y = 20;
               break;
            case §_-M0§:
               _loc3_ = §_-vy§.§_-z2p§(this.id);
               _loc1_ = new _loc3_();
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
               _loc1_.x = 20 - int(_loc1_.width * 0.5);
               _loc1_.y = 20 - int(_loc1_.height * 0.5);
               break;
            case §_-q2x§:
               _loc1_ = new Sprite();
               _loc4_ = §_-O1T§.§_-81e§(this.id);
               _loc4_.width = _loc4_.height = 30;
               _loc4_.filters = this.value == 100 ? [] : §_-x1Z§.§_-c2G§;
               _loc4_.x = _loc4_.y = 5;
               (_loc1_ as Sprite).addChild(_loc4_);
               if(this.value != 100)
               {
                  _loc6_ = new Sprite();
                  _loc6_.x = 5;
                  _loc6_.y = 32;
                  _loc6_.graphics.beginFill(7829367,1);
                  _loc6_.graphics.drawRect(0,0,30,3);
                  _loc6_.graphics.beginFill(65280,1);
                  _loc6_.graphics.drawRect(0,0,15,3);
                  (_loc1_ as Sprite).addChild(_loc6_);
               }
               break;
            case §_-AA§:
               _loc1_ = this.§_-M1b§(this.value,true);
               _loc1_.x = _loc1_.y = 10;
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
               break;
            case §_-rB§:
               _loc1_ = this.§_-71K§(this.id);
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
               break;
            case §_-51o§:
               _loc5_ = §_-a1D§.§_-1A§(this.id);
               _loc1_ = new _loc5_() as Sprite;
               _loc1_.scaleX = _loc1_.scaleY = 30 / _loc1_.width;
               _loc1_.x = 20 - int(_loc1_.width * 0.5);
               _loc1_.y = 20 - int(_loc1_.height * 0.5);
         }
         return _loc1_;
      }
      
      private function §_-M1b§(param1:int, param2:Boolean = false) : Sprite
      {
         var _loc4_:int = 0;
         var _loc5_:ImageIconFeather = null;
         var _loc6_:Sprite = null;
         var _loc3_:Sprite = new Sprite();
         if(!param2)
         {
            if(param1 == 0)
            {
               _loc3_.addChild(new ImageLevelUp0());
            }
            else
            {
               while(param1 > 0)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc3_.numChildren)
                  {
                     _loc3_.getChildAt(_loc4_).x = _loc3_.getChildAt(_loc4_).x + 35;
                     _loc4_++;
                  }
                  _loc3_.addChildAt(new §_-Pp§[param1 % 10](),0).x = 15;
                  param1 = int(param1 / 10);
               }
            }
            _loc3_.scaleX = _loc3_.scaleY = §_-K1z§[_loc3_.numChildren - 1];
         }
         else
         {
            if(param1 == 0)
            {
               _loc3_.addChild(new ShamanLevelUp0());
            }
            else
            {
               while(param1 > 0)
               {
                  _loc4_ = 0;
                  while(_loc4_ < _loc3_.numChildren)
                  {
                     _loc3_.getChildAt(_loc4_).x = _loc3_.getChildAt(_loc4_).x + 27;
                     _loc4_++;
                  }
                  _loc6_ = new §_-l§[param1 % 10]();
                  _loc6_.scaleX = _loc6_.scaleY = 0.6;
                  _loc6_.y = _loc6_.height + _loc4_ * -6;
                  _loc3_.addChildAt(_loc6_,0);
                  param1 = int(param1 / 10);
               }
            }
            if(param1 < 10)
            {
               _loc3_.x += _loc3_.width * 0.5;
            }
            _loc5_ = new ImageIconFeather();
            _loc5_.x = _loc3_.x + _loc3_.width - 27;
            _loc5_.y = _loc3_.y + _loc3_.height - 27;
            _loc3_.addChild(_loc5_);
         }
         return _loc3_;
      }
      
      private function §_-71K§(param1:int) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TotemItemCircleImage = new TotemItemCircleImage();
         _loc3_.x = 15;
         _loc3_.y = 15;
         _loc2_.addChild(_loc3_);
         var _loc4_:DisplayObject = §_-d1q§.§_-hw§(param1);
         _loc4_.x = _loc3_.x + 13;
         _loc4_.y = _loc3_.y + 8;
         _loc2_.addChild(_loc4_);
         return _loc2_;
      }
   }
}

