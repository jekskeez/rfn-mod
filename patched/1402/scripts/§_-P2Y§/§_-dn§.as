package §_-P2Y§
{
   import §_-22D§.§_-S1H§;
   import §_-5P§.§_-A1n§;
   import §_-5P§.§_-Z1f§;
   import §_-61C§.§_-a2p§;
   import §_-HG§.§_-i1N§;
   import §_-HG§.§_-w2L§;
   import §_-S1n§.§_-K1y§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-r12§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-l2u§.§_-Rp§;
   import §_-n1h§.Perk;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import starling.core.Starling;
   
   public class §_-dn§ extends §_-i1N§
   {
      
      private static const §_-l1L§:Number = 57.462;
      
      private static const §_-g1k§:Number = 16711680;
      
      private static const §_-Q2j§:Number = 65280;
      
      private static const §_-6o§:Number = 0;
      
      private static const §_-ci§:Number = 0.16;
      
      private static const §_-a2v§:Number = 0;
      
      private static const §_-fY§:Number = -12;
      
      private static const §_-B1t§:Number = 33;
      
      private static const §_-z1P§:Number = 45;
      
      private static const §_-a2x§:Number = 18;
      
      private static const §_-B24§:Number = -0.9;
      
      private static const §_-41N§:Number = 10;
      
      private static var _instance:§_-dn§;
      
      private static var §_-k1j§:Point = new Point(§_-Zy§.§_-21V§ - 60,525);
      
      private static var border:Rectangle = new Rectangle(0,90,§_-Zy§.§_-21V§,§_-Zy§.§_-02T§ - 140);
      
      private var radius:Number;
      
      private var §_-f1k§:Number;
      
      private var arrow:Sprite = null;
      
      private var §_-R18§:ImageArrowRespawn = null;
      
      private var §_-G2o§:DisplayObject = null;
      
      private var §_-jl§:Boolean = true;
      
      private var §_-23n§:Point = new Point(0,0);
      
      public function §_-dn§()
      {
         super();
         _instance = this;
         var _loc1_:int = 0;
         while(_loc1_ < §_-Z1f§.§_-3P§.length)
         {
            this.addButton(new §_-hZ§(§_-Z1f§.§_-3P§[_loc1_]));
            _loc1_++;
         }
         §_-hO§.addEventListener(GameEvent.MANA_CHANGED,this.§_-o2X§);
         Perk.§_-jx§.addEventListener(Perk.§_-E1b§,this.onUpdate);
         this.§_-E1l§.x = 0;
         this.§_-E1l§.y = 0;
         this.§_-R18§ = new ImageArrowRespawn();
         this.§_-R18§.x = -21;
         this.§_-R18§.y = -40;
         addChild(this.§_-R18§);
         this.arrow = new Sprite();
         this.arrow.addChild(new ArrowMovie()).y = -13;
         this.§_-dz§();
         this.§_-G2o§ = new BtnCastCancel();
         this.§_-E1l§.addChild(this.§_-G2o§);
         this.§_-G2o§.addEventListener(MouseEvent.CLICK,this.§_-M2s§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
         this.§_-22v§();
         this.§_-R18§ = new ImageArrowRespawn();
         this.§_-R18§.x = -21;
         this.§_-R18§.y = -40;
         addChild(this.§_-R18§);
      }
      
      public static function instance() : §_-dn§
      {
         return _instance;
      }
      
      public static function set hero(param1:Hero) : void
      {
         var _loc2_:§_-hZ§ = null;
         if(!_instance)
         {
            return;
         }
         for each(_loc2_ in _instance.buttons)
         {
            _loc2_.hero = param1;
         }
      }
      
      override public function addButton(param1:§_-w2L§) : void
      {
         super.addButton(param1);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(super.visible == param1)
         {
            return;
         }
         if(param1 && !this.§_-jl§)
         {
            §_-p1V§.§_-A3z§(this.§_-c2v§);
         }
         else
         {
            §_-p1V§.§_-DO§(this.§_-c2v§);
         }
         super.visible = param1;
         §_-33H§();
         §_-a2p§.§_-r15§();
         if(§_-t2c§.active is §_-S2E§)
         {
            §_-S2E§.§_-r15§(param1);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.buttons.length && !param1)
         {
            (this.buttons[_loc2_] as §_-hZ§).§_-R2x§().hide();
            _loc2_++;
         }
         this.§_-c2v§();
         if(param1)
         {
            this.redraw(true);
         }
         else
         {
            this.§_-NU§ = false;
         }
      }
      
      override public function get perksAvailable() : Boolean
      {
         return !(§_-at§.§_-F2u§.nonPerk && !(§_-t2c§.active is §_-S2E§)) && §_-a2p§.§_-j2F§ == §_-s2l§.ROUND_START && !(!§_-r12§.§_-FS§(§_-n2E§.§_-y1i§) && !(§_-t2c§.active is §_-S2E§));
      }
      
      override public function get perksVisible() : Boolean
      {
         var _loc1_:Boolean = super.perksVisible && !(§_-a2p§.hero && §_-a2p§.hero.isHare);
         if(§_-t2c§.active is §_-H1k§)
         {
            return _loc1_;
         }
         return _loc1_ && (§_-t2c§.active is §_-u24§ && §_-r12§.§_-FS§(§_-n2E§.§_-y1i§) || §_-t2c§.active is §_-S2E§ && §_-S2E§.type == §_-S2E§.§_-y3§);
      }
      
      override protected function get keyCode() : uint
      {
         return Keyboard.TAB;
      }
      
      override protected function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this.keyCode)
         {
            if(§_-t2c§.active is §_-H1k§)
            {
               return;
            }
            if(param1.shiftKey || param1.ctrlKey || Boolean(Game.chat) && Boolean(Game.chat.visible))
            {
               return;
            }
            if(!this.perksAvailable || !this.perksVisible)
            {
               return;
            }
            this.§_-t1O§(!this.visible,false);
            return;
         }
         super.§_-r1i§(param1);
      }
      
      public function §_-t1O§(param1:Boolean, param2:Boolean) : void
      {
         this.§_-jl§ = param2;
         this.visible = param1;
      }
      
      public function set §_-NU§(param1:Boolean) : void
      {
         this.§_-R18§.visible = param1;
         if(param1)
         {
            this.§_-R18§.play();
         }
         else
         {
            this.§_-R18§.stop();
         }
      }
      
      public function §_-H2u§(param1:Class) : void
      {
         var _loc3_:Number = NaN;
         if(this.buttons == null)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.buttons.length)
         {
            if((this.buttons[_loc2_] as §_-hZ§).perk == param1)
            {
               if(!contains(this.arrow))
               {
                  addChild(this.arrow);
               }
               this.arrow.visible = true;
               if(this.§_-jl§)
               {
                  this.arrow.rotation = -90;
                  this.arrow.x = -(this.buttons.length - _loc2_) * §_-z1P§ + §_-z1P§ * 0.5;
                  this.arrow.y = -15;
               }
               else
               {
                  _loc3_ = _loc2_ * this.§_-f1k§ - this.§_-f1k§ * 5;
                  this.arrow.rotation = _loc3_ * 180 / Math.PI;
                  this.arrow.x = Math.cos(_loc3_) * this.radius;
                  this.arrow.y = Math.sin(_loc3_) * this.radius;
               }
               return;
            }
            _loc2_++;
         }
      }
      
      public function §_-dz§() : void
      {
         if(!this.buttons)
         {
            return;
         }
         if(contains(this.arrow))
         {
            removeChild(this.arrow);
         }
         this.arrow.visible = false;
         this.§_-NU§ = false;
      }
      
      public function §_-bG§(param1:Boolean) : void
      {
         var _loc2_:§_-hZ§ = null;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_.perk == §_-A1n§)
            {
               _loc2_.cost = param1 ? 0 : _loc2_.§_-bD§;
            }
         }
      }
      
      public function §_-61R§(param1:Boolean) : void
      {
         var _loc2_:§_-hZ§ = null;
         for each(_loc2_ in this.buttons)
         {
            _loc2_.cost = param1 || _loc2_.active ? 0 : _loc2_.§_-bD§;
         }
      }
      
      private function redraw(param1:Boolean) : void
      {
         var _loc4_:Number = NaN;
         this.radius = §_-l1L§ * this.buttons.length / 6.28;
         this.§_-f1k§ = §_-l1L§ / this.radius;
         var _loc2_:Number = -this.§_-f1k§ * 5.5;
         graphics.clear();
         var _loc3_:int = 0;
         while(_loc3_ < this.buttons.length)
         {
            _loc4_ = §_-Q2j§;
            if(!(this.buttons[_loc3_] as §_-hZ§).available)
            {
               _loc4_ = §_-6o§;
            }
            else if(!(this.buttons[_loc3_] as §_-hZ§).§_-42d§)
            {
               _loc4_ = §_-g1k§;
            }
            if(this.§_-jl§)
            {
               this.§_-lf§((_loc3_ - this.buttons.length) * §_-z1P§,this.buttons[_loc3_],_loc4_,param1);
            }
            else
            {
               this.§_-Ek§(_loc3_ * this.§_-f1k§ + _loc2_,this.buttons[_loc3_],_loc4_,param1);
            }
            _loc3_++;
         }
      }
      
      private function §_-h1I§() : void
      {
         var _loc3_:§_-hZ§ = null;
         var _loc4_:§_-K1y§ = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Point = null;
         var _loc8_:Boolean = false;
         var _loc1_:Number = -this.§_-f1k§ * 5;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttons.length)
         {
            _loc3_ = this.buttons[_loc2_] as §_-hZ§;
            _loc4_ = _loc3_.§_-R2x§() as §_-K1y§;
            if(this.§_-jl§)
            {
               _loc4_.setPosition(§_-k1j§.x - (this.buttons.length - _loc2_) * §_-z1P§,§_-k1j§.y - 70);
            }
            else
            {
               _loc5_ = _loc2_ * this.§_-f1k§ + _loc1_;
               _loc6_ = this.radius + _loc4_.height * 0.5;
               _loc7_ = new Point(_loc6_ * Math.cos(_loc5_) + this.§_-23n§.x,_loc6_ * Math.sin(_loc5_) + this.§_-23n§.y - _loc4_.height * 0.5);
               if(_loc5_ < -Math.PI * 0.5 || _loc5_ > Math.PI * 0.5)
               {
                  _loc7_.x -= _loc4_.width;
               }
               _loc8_ = !(_loc7_.x < border.x || _loc7_.x > border.x + border.width - _loc4_.width || _loc7_.y < border.y + _loc4_.height * 0.5 || _loc7_.y > border.y + border.height - _loc4_.height * 0.5);
               if(_loc8_)
               {
                  _loc4_.setPosition(_loc7_.x,_loc7_.y);
               }
               else
               {
                  _loc4_.fixed = null;
               }
            }
            _loc2_++;
         }
      }
      
      private function §_-Ek§(param1:Number, param2:DisplayObject, param3:int, param4:Boolean) : void
      {
         graphics.lineStyle(0,0,0);
         graphics.moveTo(0,0);
         graphics.beginGradientFill(GradientType.RADIAL,[param3,param3],[0,0.5],[Math.min(230,(this.buttons.length - 8) * 35),255]);
         var _loc5_:Number = §_-B1t§;
         var _loc6_:Point = new Point(§_-E1l§.x - _loc5_ * 0.5,§_-E1l§.y - _loc5_ * 0.5);
         var _loc7_:Number = this.radius - _loc5_ * 0.5;
         var _loc8_:Number = param4 ? this.radius - _loc5_ * 0.5 - 20 : _loc7_;
         var _loc9_:Number = param1 + this.§_-f1k§ * 0.5;
         param2.x = _loc8_ * Math.cos(_loc9_) + _loc6_.x;
         param2.y = _loc8_ * Math.sin(_loc9_) + _loc6_.y;
         var _loc10_:Point = new Point(_loc7_ * Math.cos(_loc9_) + _loc6_.x,_loc7_ * Math.sin(_loc9_) + _loc6_.y);
         param2.scaleX = param2.scaleY = param4 ? 0.85 : 1;
         var _loc11_:Number = this.radius + §_-a2x§;
         this.§_-G2o§.visible = true;
         this.§_-G2o§.x = _loc11_ * Math.cos(§_-B24§) - §_-41N§;
         this.§_-G2o§.y = _loc11_ * Math.sin(§_-B24§) - §_-41N§;
         this.§_-G2o§.scaleX = this.§_-G2o§.scaleY = param4 ? 0.56 : 0.75;
         if(param4)
         {
            §_-S1H§.to(param2,§_-ci§,{
               "scaleX":1,
               "scaleY":1,
               "x":_loc10_.x,
               "y":_loc10_.y,
               "overwrite":true
            });
         }
         _loc5_ = this.§_-f1k§ + param1;
         while(param1 < _loc5_)
         {
            graphics.lineTo(this.radius * Math.cos(param1),this.radius * Math.sin(param1));
            param1 += 0.12;
         }
         param1 -= 0.12;
         while(param1 < _loc5_ + 0.001)
         {
            graphics.lineTo(this.radius * Math.cos(param1),this.radius * Math.sin(param1));
            param1 += 0.001;
         }
         graphics.lineTo(0,0);
         graphics.endFill();
      }
      
      private function §_-lf§(param1:Number, param2:DisplayObject, param3:int, param4:Boolean) : void
      {
         var _loc5_:Rectangle = new Rectangle(param1,0,§_-z1P§,§_-z1P§);
         var _loc6_:Point = new Point(_loc5_.x + _loc5_.width * 0.5 - §_-B1t§ * 0.5,_loc5_.y + _loc5_.height * 0.5 - §_-B1t§ * 0.5);
         var _loc7_:Matrix = new Matrix();
         _loc7_.createGradientBox(_loc5_.width,_loc5_.height,Math.PI * 0.5,0,0);
         graphics.beginGradientFill(GradientType.LINEAR,[param3,param3],[0,0.6],[70,255],_loc7_);
         graphics.drawRect(_loc5_.x,_loc5_.y,_loc5_.width,_loc5_.height);
         param2.x = _loc6_.x;
         param2.y = param4 ? _loc6_.y + 15 : _loc6_.y;
         param2.scaleX = param2.scaleY = param4 ? 0.9 : 1;
         this.§_-G2o§.visible = false;
         if(param4)
         {
            §_-S1H§.to(param2,§_-ci§,{
               "scaleX":1,
               "scaleY":1,
               "x":_loc6_.x,
               "y":_loc6_.y,
               "overwrite":true
            });
         }
         this.graphics.endFill();
      }
      
      private function §_-c2v§() : void
      {
         var _loc1_:Point = null;
         if(!this.parent)
         {
            return;
         }
         var _loc2_:Hero = §_-t2c§.active is §_-H1k§ ? (SquirrelCollection.instance as §_-Rp§).self : Hero.self;
         if(Boolean(_loc2_) && Boolean(GameMap.instance))
         {
            _loc1_ = new Point(_loc2_.x + GameMap.instance.x,_loc2_.y + GameMap.instance.y);
            if(!this.§_-jl§)
            {
               this.§_-23n§ = Starling.§_-n1s§.stage.localToGlobal(_loc1_);
               this.§_-23n§.x = int(this.§_-23n§.x) + §_-a2v§;
               this.§_-23n§.y = int(this.§_-23n§.y) + §_-fY§;
               if(this.§_-23n§.x - this.radius < border.x)
               {
                  this.§_-23n§.x = border.x + this.radius;
               }
               if(this.§_-23n§.y - this.radius < border.y)
               {
                  this.§_-23n§.y = border.y + this.radius;
               }
               if(this.§_-23n§.x + this.radius > border.x + border.width)
               {
                  this.§_-23n§.x = border.x + border.width - this.radius;
               }
               if(this.§_-23n§.y + this.radius > border.y + border.height)
               {
                  this.§_-23n§.y = border.y + border.height - this.radius;
               }
            }
            else
            {
               this.§_-23n§ = §_-k1j§;
            }
            var _loc3_:Rectangle = Starling.§_-n1s§.§_-33S§;
            var _loc4_:Number = Starling.§_-n1s§.stage.stageWidth;
            var _loc5_:Number = Starling.§_-n1s§.stage.stageHeight;
            var _loc6_:Point = new Point(_loc3_.x + this.§_-23n§.x * (_loc3_.width / _loc4_),_loc3_.y + this.§_-23n§.y * (_loc3_.height / _loc5_));
            var _loc7_:Point = this.parent.globalToLocal(_loc6_);
            if(this.x == _loc7_.x && this.y == _loc7_.y)
            {
               return;
            }
            this.x = _loc7_.x;
            this.y = _loc7_.y;
            this.§_-h1I§();
            return;
         }
         this.visible = false;
      }
      
      private function §_-o2X§(param1:GameEvent) : void
      {
         this.§_-NU§ = false;
         updateButtons();
         this.redraw(false);
      }
      
      private function §_-22v§(param1:Event = null) : void
      {
         border = new Rectangle(0,90,GameMap.§_-O19§,GameMap.§_-Gd§ - 140);
         §_-k1j§ = new Point((GameMap.§_-O19§ + §_-Zy§.§_-21V§) * 0.5 - 60,GameMap.§_-Gd§ - 95);
         this.§_-h1I§();
      }
      
      private function onUpdate(param1:Event) : void
      {
         this.redraw(false);
      }
      
      private function §_-M2s§(param1:MouseEvent) : void
      {
         this.visible = !this.visible;
         param1.stopImmediatePropagation();
      }
   }
}

