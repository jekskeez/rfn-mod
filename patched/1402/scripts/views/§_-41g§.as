package views
{
   import §_-22D§.TweenMax;
   import §_-Kc§.§_-i1a§;
   import §_-U19§.§_-su§;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-K0§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import utils.§_-K1Y§;
   import utils.§_-y1l§;
   
   public class §_-41g§ extends Sprite
   {
      
      public static const §_-G2i§:int = 0;
      
      public static const §_-5G§:int = 1;
      
      public static const §_-Xd§:int = 2;
      
      public static const §_-13g§:int = 3;
      
      public static const §_-qk§:int = 4;
      
      public static const §_-h2A§:int = 5;
      
      public static const §_-g1D§:int = 6;
      
      private static const §_-a1F§:int = 30;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #623E19;","}",".bold","{","font-weight: bold;","}"].join("\n");
      
      private static var §_-oB§:Array = null;
      
      private static var §_-C3T§:Array = null;
      
      private static var §_-P1z§:Array = [1,0.75,0.6,0.8];
      
      private static const §_-u2P§:Array = [ImageIconExp,null,null,ImageIconMana,null,ImageIconNut];
      
      private static const §_-m2n§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,16546087);
      
      private static var style:StyleSheet = null;
      
      private var lifeTime:int = 0;
      
      private var §_-Bx§:Number = 0;
      
      private var button:SimpleButton = null;
      
      private var view:Sprite = null;
      
      private var tween:TweenMax = null;
      
      private var §_-i3§:Boolean = false;
      
      private var §_-2J§:Boolean = false;
      
      public var type:int = 0;
      
      public var id:int = 0;
      
      public var value:int = 0;
      
      public function §_-41g§(param1:int, param2:int, param3:int)
      {
         super();
         if(!style)
         {
            style = new StyleSheet();
            style.parseCSS(§_-aD§);
         }
         this.lifeTime = int(getTimer() / 1000);
         this.type = param1;
         this.id = param2;
         this.value = param3;
         this.init();
      }
      
      private static function get §_-53x§() : Array
      {
         if(!§_-oB§)
         {
            §_-oB§ = [ImageLevelUp0,ImageLevelUp1,ImageLevelUp2,ImageLevelUp3,ImageLevelUp4,ImageLevelUp5,ImageLevelUp6,ImageLevelUp7,ImageLevelUp8,ImageLevelUp9];
         }
         return §_-oB§;
      }
      
      private static function get §_-E2O§() : Array
      {
         if(!§_-C3T§)
         {
            §_-C3T§ = [ShamanLevelUp0,ShamanLevelUp1,ShamanLevelUp2,ShamanLevelUp3,ShamanLevelUp4,ShamanLevelUp5,ShamanLevelUp6,ShamanLevelUp7,ShamanLevelUp8,ShamanLevelUp9];
         }
         return §_-C3T§;
      }
      
      public function start() : void
      {
         TweenMax.to(this,0.5,{
            "x":0,
            "ease":§_-i1a§.easeOut,
            "onComplete":this.onComplete
         });
      }
      
      public function stop() : void
      {
         this.§_-2J§ = true;
         this.view.visible = false;
         this.button.removeEventListener(MouseEvent.CLICK,this.§_-937§);
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
         §_-p1V§.§_-DO§(this.§_-t29§);
         TweenMax.to(this,0.5,{
            "x":-40,
            "ease":§_-i1a§.easeIn,
            "onComplete":this.§_-ee§
         });
      }
      
      public function set offsetY(param1:int) : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this,0.5,{"y":param1});
      }
      
      public function get §_-59§() : Boolean
      {
         return !this.§_-2J§ && this.lifeTime + this.§_-Bx§ + §_-a1F§ < int(getTimer() / 1000);
      }
      
      public function get §_-S2v§() : Boolean
      {
         return this.§_-i3§;
      }
      
      private function init() : void
      {
         this.x = -40;
         this.button = this.§_-Q2i§();
         addChild(this.button);
         this.view = this.§_-U25§();
         this.view.x = 40;
         this.view.visible = false;
         this.view.alpha = 0;
         addChild(this.view);
      }
      
      private function §_-t29§() : void
      {
         this.§_-Bx§ += this.view.visible ? §_-p1V§.delay : 0;
      }
      
      private function onComplete() : void
      {
         this.button.addEventListener(MouseEvent.CLICK,this.§_-937§);
      }
      
      private function §_-ee§() : void
      {
         this.§_-i3§ = true;
      }
      
      private function §_-937§(param1:MouseEvent) : void
      {
         this.view.visible = !this.view.visible;
         if(this.view.visible)
         {
            Game.stage.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
            §_-p1V§.§_-A3z§(this.§_-t29§);
            TweenMax.to(this.view,0.2,{"alpha":1});
         }
         else
         {
            this.stop();
         }
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
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
      
      private function §_-Q2i§() : SimpleButton
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16249053);
         _loc1_.graphics.lineStyle(1,14535087);
         _loc1_.graphics.drawRect(0,0,40,40);
         _loc1_.addChild(this.§_-f2x§());
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16446431);
         _loc2_.graphics.lineStyle(1,14535087);
         _loc2_.graphics.drawRect(0,0,40,40);
         _loc2_.addChild(this.§_-f2x§());
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(16051418);
         _loc3_.graphics.lineStyle(1,14535087);
         _loc3_.graphics.drawRect(0,0,40,40);
         _loc3_.addChild(this.§_-f2x§());
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(0,0);
         _loc4_.graphics.drawRect(0,0,40,40);
         return new SimpleButton(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      private function §_-U25§() : Sprite
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:Sprite = null;
         var _loc4_:String = null;
         var _loc5_:§_-pv§ = null;
         var _loc6_:§_-i5§ = null;
         var _loc7_:int = 0;
         var _loc8_:Class = null;
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16249053);
         _loc1_.graphics.lineStyle(1,14535087);
         _loc1_.graphics.drawRoundRectComplex(0,0,290,85,0,5,0,5);
         switch(this.type)
         {
            case §_-G2i§:
               _loc2_ = new Sprite();
               (_loc2_ as Sprite).addChild(new GameEventLevelBack());
               _loc3_ = this.§_-O1t§(this.value);
               _loc3_.x = 5 + int((_loc2_.width - _loc3_.width) * 0.5);
               _loc3_.y = int(_loc2_.height * 0.5);
               (_loc2_ as Sprite).addChild(_loc3_);
               _loc2_.x = 5;
               _loc2_.y = 5;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-i5§(gls("Новый Уровень!"),80,8,§_-m2n§));
               _loc1_.addChild(new §_-i5§("<body>" + gls("Тебе удалось достичь\n<b>{0} уровня!</b>",this.value) + "</body>",80,25,style,205));
               break;
            case §_-5G§:
               _loc2_ = new §_-Rj§(this.value,1.5);
               _loc2_.x = 40;
               _loc2_.y = 40;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-i5§(gls("Новая Лига!"),80,8,§_-m2n§));
               _loc4_ = this.id == §_-82O§.CLAN_TYPE ? gls("Твой клан перешёл в лигу <b>{0}</b>!",§_-93H§.§_-XY§(this.value,this.id)) : gls("Тебе удалось перейти в лигу <b>{0}</b>!",§_-93H§.§_-XY§(this.value,this.id));
               _loc1_.addChild(new §_-i5§("<body>" + _loc4_ + "</body>",80,25,style,205));
               break;
            case §_-Xd§:
               _loc5_ = new §_-pv§();
               _loc5_.§_-J2m§(this.id);
               _loc5_.x = 27;
               _loc5_.y = 3;
               _loc1_.addChild(_loc5_);
               break;
            case §_-13g§:
               _loc2_ = §_-K0§.§_-e14§(this.id);
               _loc2_.width = _loc2_.height = 65;
               _loc2_.x = _loc2_.y = 10;
               _loc1_.addChild(_loc2_);
               if(this.value == 100)
               {
                  _loc1_.addChild(new §_-i5§(gls("Получено достижение!"),80,8,§_-m2n§));
                  _loc1_.addChild(new §_-i5§("<body>" + gls("Тебе удалось заработать достижение <b>{0}</b>!",§_-K0§.DATA[this.id]["name"]) + "</body>",80,25,style,205));
               }
               else
               {
                  _loc1_.addChild(new §_-i5§(gls("Прогресс в достижении!"),80,8,§_-m2n§));
                  _loc1_.addChild(new §_-i5§("<body>" + gls("Достижение <b>{0}</b> выполнено на {1}%.",§_-K0§.DATA[this.id]["name"],this.value) + "</body>",80,25,style,205));
               }
               break;
            case §_-qk§:
               _loc2_ = this.§_-O1t§(this.value,true);
               _loc2_.x = 22;
               _loc2_.y = 18;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-i5§(gls("Новый уровень шамана!"),80,8,§_-m2n§));
               _loc1_.addChild(new §_-i5§("<body>" + gls("Ты получаешь волшебное перо для изучения способностей.") + "</body>",80,25,style,205));
               break;
            case §_-h2A§:
               _loc2_ = this.§_-J1P§(this.id);
               _loc2_.x = _loc2_.y = -5;
               _loc2_.scaleX = _loc2_.scaleY = 1.2;
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-i5§(§_-su§.getName(this.id),80,8,§_-m2n§));
               _loc6_ = new §_-i5§(gls("<body>Бонус <span class = \'bold\'>+{0} </span> #Award</body>",this.value),80,25,style,205);
               _loc1_.addChild(_loc6_);
               §_-K1Y§.§_-P2W§(_loc6_,"#Award",§_-u2P§[this.id],0.6,0.6,_loc6_.x - 155,-_loc6_.y,true,true);
               break;
            case §_-g1D§:
               _loc7_ = this.id;
               _loc8_ = §_-C2b§.§_-K2T§(_loc7_);
               _loc2_ = new _loc8_() as Sprite;
               _loc2_.scaleX = _loc2_.scaleY = 65 / Math.max(_loc2_.width,_loc2_.height);
               _loc2_.x = 10 + int((65 - _loc2_.width) * 0.5);
               _loc2_.y = 10 + int((65 - _loc2_.height) * 0.5);
               _loc1_.addChild(_loc2_);
               _loc1_.addChild(new §_-i5§(§_-C2b§.§_-S14§(_loc7_),80,8,§_-m2n§));
               _loc1_.addChild(new §_-i5§("<body>" + gls("Задание ") + §_-C2b§.§_-52F§(NuttyPassManager.§_-d1l§(_loc7_),this.value) + gls(" выполнено!") + "</body>",80,25,style,205));
         }
         return _loc1_;
      }
      
      private function §_-f2x§() : DisplayObject
      {
         var _loc2_:Sprite = null;
         var _loc3_:Class = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Class = null;
         var _loc6_:Sprite = null;
         var _loc1_:DisplayObject = null;
         switch(this.type)
         {
            case §_-G2i§:
               _loc1_ = new Sprite();
               (_loc1_ as Sprite).addChild(new GameEventLevelBack());
               _loc2_ = this.§_-O1t§(this.value);
               _loc2_.x = 5 + int((_loc1_.width - _loc2_.width) * 0.5);
               _loc2_.y = int(_loc1_.height * 0.5);
               (_loc1_ as Sprite).addChild(_loc2_);
               _loc1_.scaleX = _loc1_.scaleY = 0.4;
               _loc1_.x = _loc1_.y = 5;
               break;
            case §_-5G§:
               _loc1_ = new §_-Rj§(this.value,0.8);
               _loc1_.x = 20;
               _loc1_.y = 20;
               break;
            case §_-Xd§:
               _loc3_ = §_-42H§.§_-D1U§(this.id);
               _loc1_ = new _loc3_();
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
               _loc1_.x = 20 - int(_loc1_.width * 0.5);
               _loc1_.y = 20 - int(_loc1_.height * 0.5);
               break;
            case §_-13g§:
               _loc1_ = new Sprite();
               _loc4_ = §_-K0§.§_-e14§(this.id);
               _loc4_.width = _loc4_.height = 30;
               _loc4_.filters = this.value == 100 ? [] : §_-y1l§.§_-Tk§;
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
            case §_-qk§:
               _loc1_ = this.§_-O1t§(this.value,true);
               _loc1_.x = _loc1_.y = 10;
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
               break;
            case §_-h2A§:
               _loc1_ = this.§_-J1P§(this.id);
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
               break;
            case §_-g1D§:
               _loc5_ = §_-C2b§.§_-K2T§(this.id);
               _loc1_ = new _loc5_() as Sprite;
               _loc1_.scaleX = _loc1_.scaleY = 30 / _loc1_.width;
               _loc1_.x = 20 - int(_loc1_.width * 0.5);
               _loc1_.y = 20 - int(_loc1_.height * 0.5);
         }
         return _loc1_;
      }
      
      private function §_-O1t§(param1:int, param2:Boolean = false) : Sprite
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
                  _loc3_.addChildAt(new §_-53x§[param1 % 10](),0).x = 15;
                  param1 = int(param1 / 10);
               }
            }
            _loc3_.scaleX = _loc3_.scaleY = §_-P1z§[_loc3_.numChildren - 1];
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
                  _loc6_ = new §_-E2O§[param1 % 10]();
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
      
      private function §_-J1P§(param1:int) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TotemItemCircleImage = new TotemItemCircleImage();
         _loc3_.x = 15;
         _loc3_.y = 15;
         _loc2_.addChild(_loc3_);
         var _loc4_:DisplayObject = §_-su§.§_-C2h§(param1);
         _loc4_.x = _loc3_.x + 13;
         _loc4_.y = _loc3_.y + 8;
         _loc2_.addChild(_loc4_);
         return _loc2_;
      }
   }
}

