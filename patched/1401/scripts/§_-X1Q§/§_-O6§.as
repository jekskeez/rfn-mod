package §_-X1Q§
{
   import §_-1§.§_-tY§;
   import §_-1§.§_-vk§;
   import §_-42B§.§_-518§;
   import §_-92M§.§_-Qm§;
   import §_-92M§.§_-X2z§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Z1F§;
   import §_-Rj§.§_-W28§;
   import §_-S1D§.§_-O1M§;
   import §_-S2§.Perk;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-P1Y§;
   import §_-e1G§.§_-N2L§;
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
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import starling.core.Starling;
   
   public class §_-O6§ extends §_-Qm§
   {
      
      private static const §_-61s§:Number = 57.462;
      
      private static const §_-N23§:Number = 16711680;
      
      private static const §_-P2k§:Number = 65280;
      
      private static const §_-Yv§:Number = 0;
      
      private static const §_-N2I§:Number = 0.16;
      
      private static const §_-U24§:Number = 0;
      
      private static const §_-T2B§:Number = -12;
      
      private static const §_-r2u§:Number = 33;
      
      private static const §_-22y§:Number = 45;
      
      private static const §_-32y§:Number = 18;
      
      private static const §_-22a§:Number = -0.9;
      
      private static const §_-C1t§:Number = 10;
      
      private static var _instance:§_-O6§;
      
      private static var §_-g1t§:Point = new Point(§_-a9§.§_-9o§ - 60,525);
      
      private static var border:Rectangle = new Rectangle(0,90,§_-a9§.§_-9o§,§_-a9§.§_-31m§ - 140);
      
      private var radius:Number;
      
      private var §_-L4§:Number;
      
      private var arrow:Sprite = null;
      
      private var §_-K2§:ImageArrowRespawn = null;
      
      private var §_-72p§:DisplayObject = null;
      
      private var §_-Ts§:Boolean = true;
      
      private var §_-x1W§:Point = new Point(0,0);
      
      public function §_-O6§()
      {
         super();
         _instance = this;
         var _loc1_:int = 0;
         while(_loc1_ < §_-tY§.§_-x1w§.length)
         {
            this.addButton(new §_-zr§(§_-tY§.§_-x1w§[_loc1_]));
            _loc1_++;
         }
         §_-Z1F§.addEventListener(GameEvent.MANA_CHANGED,this.§_-sG§);
         Perk.§_-u1o§.addEventListener(Perk.§_-RK§,this.onUpdate);
         this.§_-kH§.x = 0;
         this.§_-kH§.y = 0;
         this.§_-K2§ = new ImageArrowRespawn();
         this.§_-K2§.x = -21;
         this.§_-K2§.y = -40;
         addChild(this.§_-K2§);
         this.arrow = new Sprite();
         this.arrow.addChild(new ArrowMovie()).y = -13;
         this.§_-K21§();
         this.§_-72p§ = new BtnCastCancel();
         this.§_-kH§.addChild(this.§_-72p§);
         this.§_-72p§.addEventListener(MouseEvent.CLICK,this.§_-y1b§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
         this.§_-V1Q§();
         this.§_-K2§ = new ImageArrowRespawn();
         this.§_-K2§.x = -21;
         this.§_-K2§.y = -40;
         addChild(this.§_-K2§);
      }
      
      public static function instance() : §_-O6§
      {
         return _instance;
      }
      
      public static function set hero(param1:Hero) : void
      {
         var _loc2_:§_-zr§ = null;
         if(!_instance)
         {
            return;
         }
         for each(_loc2_ in _instance.buttons)
         {
            _loc2_.hero = param1;
         }
      }
      
      override public function addButton(param1:§_-X2z§) : void
      {
         super.addButton(param1);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(super.visible == param1)
         {
            return;
         }
         if(param1 && !this.§_-Ts§)
         {
            §_-01Y§.§_-h1R§(this.§_-62R§);
         }
         else
         {
            §_-01Y§.§_-t1s§(this.§_-62R§);
         }
         super.visible = param1;
         §_-q2S§();
         §_-O1M§.§_-02n§();
         if(§_-71o§.active is §_-F29§)
         {
            §_-F29§.§_-02n§(param1);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.buttons.length && !param1)
         {
            (this.buttons[_loc2_] as §_-zr§).§_-Z15§().hide();
            _loc2_++;
         }
         this.§_-62R§();
         if(param1)
         {
            this.redraw(true);
         }
         else
         {
            this.§_-V1e§ = false;
         }
      }
      
      override public function get perksAvailable() : Boolean
      {
         return !(§_-q1p§.§_-Vz§.nonPerk && !(§_-71o§.active is §_-F29§)) && §_-O1M§.§_-F2g§ == §_-S2I§.ROUND_START && !(!§_-Bm§.§_-2S§(§_-T2o§.§_-Q2R§) && !(§_-71o§.active is §_-F29§));
      }
      
      override public function get perksVisible() : Boolean
      {
         var _loc1_:Boolean = super.perksVisible && !(§_-O1M§.hero && §_-O1M§.hero.isHare);
         if(§_-71o§.active is §_-P1Y§)
         {
            return _loc1_;
         }
         return _loc1_ && (§_-71o§.active is §_-92z§ && §_-Bm§.§_-2S§(§_-T2o§.§_-Q2R§) || §_-71o§.active is §_-F29§ && §_-F29§.type == §_-F29§.§_-q1M§);
      }
      
      override protected function get keyCode() : uint
      {
         return Keyboard.TAB;
      }
      
      override protected function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this.keyCode)
         {
            if(§_-71o§.active is §_-P1Y§)
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
            this.§_-yr§(!this.visible,false);
            return;
         }
         super.§_-21G§(param1);
      }
      
      public function §_-yr§(param1:Boolean, param2:Boolean) : void
      {
         this.§_-Ts§ = param2;
         this.visible = param1;
      }
      
      public function set §_-V1e§(param1:Boolean) : void
      {
         this.§_-K2§.visible = param1;
         if(param1)
         {
            this.§_-K2§.play();
         }
         else
         {
            this.§_-K2§.stop();
         }
      }
      
      public function §_-qS§(param1:Class) : void
      {
         var _loc3_:Number = NaN;
         if(this.buttons == null)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.buttons.length)
         {
            if((this.buttons[_loc2_] as §_-zr§).perk == param1)
            {
               if(!contains(this.arrow))
               {
                  addChild(this.arrow);
               }
               this.arrow.visible = true;
               if(this.§_-Ts§)
               {
                  this.arrow.rotation = -90;
                  this.arrow.x = -(this.buttons.length - _loc2_) * §_-22y§ + §_-22y§ * 0.5;
                  this.arrow.y = -15;
               }
               else
               {
                  _loc3_ = _loc2_ * this.§_-L4§ - this.§_-L4§ * 5;
                  this.arrow.rotation = _loc3_ * 180 / Math.PI;
                  this.arrow.x = Math.cos(_loc3_) * this.radius;
                  this.arrow.y = Math.sin(_loc3_) * this.radius;
               }
               return;
            }
            _loc2_++;
         }
      }
      
      public function §_-K21§() : void
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
         this.§_-V1e§ = false;
      }
      
      public function §_-W2q§(param1:Boolean) : void
      {
         var _loc2_:§_-zr§ = null;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_.perk == §_-vk§)
            {
               _loc2_.cost = param1 ? 0 : _loc2_.§_-Ll§;
            }
         }
      }
      
      public function §_-f2q§(param1:Boolean) : void
      {
         var _loc2_:§_-zr§ = null;
         for each(_loc2_ in this.buttons)
         {
            _loc2_.cost = param1 || _loc2_.active ? 0 : _loc2_.§_-Ll§;
         }
      }
      
      private function redraw(param1:Boolean) : void
      {
         var _loc4_:Number = NaN;
         this.radius = §_-61s§ * this.buttons.length / 6.28;
         this.§_-L4§ = §_-61s§ / this.radius;
         var _loc2_:Number = -this.§_-L4§ * 5.5;
         graphics.clear();
         var _loc3_:int = 0;
         while(_loc3_ < this.buttons.length)
         {
            _loc4_ = §_-P2k§;
            if(!(this.buttons[_loc3_] as §_-zr§).available)
            {
               _loc4_ = §_-Yv§;
            }
            else if(!(this.buttons[_loc3_] as §_-zr§).§_-k1w§)
            {
               _loc4_ = §_-N23§;
            }
            if(this.§_-Ts§)
            {
               this.§_-02p§((_loc3_ - this.buttons.length) * §_-22y§,this.buttons[_loc3_],_loc4_,param1);
            }
            else
            {
               this.§_-a2X§(_loc3_ * this.§_-L4§ + _loc2_,this.buttons[_loc3_],_loc4_,param1);
            }
            _loc3_++;
         }
      }
      
      private function §_-fg§() : void
      {
         var _loc3_:§_-zr§ = null;
         var _loc4_:§_-N2L§ = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Point = null;
         var _loc8_:Boolean = false;
         var _loc1_:Number = -this.§_-L4§ * 5;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttons.length)
         {
            _loc3_ = this.buttons[_loc2_] as §_-zr§;
            _loc4_ = _loc3_.§_-Z15§() as §_-N2L§;
            if(this.§_-Ts§)
            {
               _loc4_.setPosition(§_-g1t§.x - (this.buttons.length - _loc2_) * §_-22y§,§_-g1t§.y - 70);
            }
            else
            {
               _loc5_ = _loc2_ * this.§_-L4§ + _loc1_;
               _loc6_ = this.radius + _loc4_.height * 0.5;
               _loc7_ = new Point(_loc6_ * Math.cos(_loc5_) + this.§_-x1W§.x,_loc6_ * Math.sin(_loc5_) + this.§_-x1W§.y - _loc4_.height * 0.5);
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
      
      private function §_-a2X§(param1:Number, param2:DisplayObject, param3:int, param4:Boolean) : void
      {
         graphics.lineStyle(0,0,0);
         graphics.moveTo(0,0);
         graphics.beginGradientFill(GradientType.RADIAL,[param3,param3],[0,0.5],[Math.min(230,(this.buttons.length - 8) * 35),255]);
         var _loc5_:Number = §_-r2u§;
         var _loc6_:Point = new Point(§_-kH§.x - _loc5_ * 0.5,§_-kH§.y - _loc5_ * 0.5);
         var _loc7_:Number = this.radius - _loc5_ * 0.5;
         var _loc8_:Number = param4 ? this.radius - _loc5_ * 0.5 - 20 : _loc7_;
         var _loc9_:Number = param1 + this.§_-L4§ * 0.5;
         param2.x = _loc8_ * Math.cos(_loc9_) + _loc6_.x;
         param2.y = _loc8_ * Math.sin(_loc9_) + _loc6_.y;
         var _loc10_:Point = new Point(_loc7_ * Math.cos(_loc9_) + _loc6_.x,_loc7_ * Math.sin(_loc9_) + _loc6_.y);
         param2.scaleX = param2.scaleY = param4 ? 0.85 : 1;
         var _loc11_:Number = this.radius + §_-32y§;
         this.§_-72p§.visible = true;
         this.§_-72p§.x = _loc11_ * Math.cos(§_-22a§) - §_-C1t§;
         this.§_-72p§.y = _loc11_ * Math.sin(§_-22a§) - §_-C1t§;
         this.§_-72p§.scaleX = this.§_-72p§.scaleY = param4 ? 0.56 : 0.75;
         if(param4)
         {
            §_-518§.to(param2,§_-N2I§,{
               "scaleX":1,
               "scaleY":1,
               "x":_loc10_.x,
               "y":_loc10_.y,
               "overwrite":true
            });
         }
         _loc5_ = this.§_-L4§ + param1;
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
      
      private function §_-02p§(param1:Number, param2:DisplayObject, param3:int, param4:Boolean) : void
      {
         var _loc5_:Rectangle = new Rectangle(param1,0,§_-22y§,§_-22y§);
         var _loc6_:Point = new Point(_loc5_.x + _loc5_.width * 0.5 - §_-r2u§ * 0.5,_loc5_.y + _loc5_.height * 0.5 - §_-r2u§ * 0.5);
         var _loc7_:Matrix = new Matrix();
         _loc7_.createGradientBox(_loc5_.width,_loc5_.height,Math.PI * 0.5,0,0);
         graphics.beginGradientFill(GradientType.LINEAR,[param3,param3],[0,0.6],[70,255],_loc7_);
         graphics.drawRect(_loc5_.x,_loc5_.y,_loc5_.width,_loc5_.height);
         param2.x = _loc6_.x;
         param2.y = param4 ? _loc6_.y + 15 : _loc6_.y;
         param2.scaleX = param2.scaleY = param4 ? 0.9 : 1;
         this.§_-72p§.visible = false;
         if(param4)
         {
            §_-518§.to(param2,§_-N2I§,{
               "scaleX":1,
               "scaleY":1,
               "x":_loc6_.x,
               "y":_loc6_.y,
               "overwrite":true
            });
         }
         this.graphics.endFill();
      }
      
      private function §_-62R§() : void
      {
         var _loc1_:Point = null;
         if(!this.parent)
         {
            return;
         }
         var _loc2_:Hero = §_-71o§.active is §_-P1Y§ ? (SquirrelCollection.instance as §_-W28§).self : Hero.self;
         if(Boolean(_loc2_) && Boolean(GameMap.instance))
         {
            _loc1_ = new Point(_loc2_.x + GameMap.instance.x,_loc2_.y + GameMap.instance.y);
            if(!this.§_-Ts§)
            {
               this.§_-x1W§ = Starling.§_-y1l§.stage.localToGlobal(_loc1_);
               this.§_-x1W§.x = int(this.§_-x1W§.x) + §_-U24§;
               this.§_-x1W§.y = int(this.§_-x1W§.y) + §_-T2B§;
               if(this.§_-x1W§.x - this.radius < border.x)
               {
                  this.§_-x1W§.x = border.x + this.radius;
               }
               if(this.§_-x1W§.y - this.radius < border.y)
               {
                  this.§_-x1W§.y = border.y + this.radius;
               }
               if(this.§_-x1W§.x + this.radius > border.x + border.width)
               {
                  this.§_-x1W§.x = border.x + border.width - this.radius;
               }
               if(this.§_-x1W§.y + this.radius > border.y + border.height)
               {
                  this.§_-x1W§.y = border.y + border.height - this.radius;
               }
            }
            else
            {
               this.§_-x1W§ = §_-g1t§;
            }
            var _loc3_:Rectangle = Starling.§_-y1l§.§_-B9§;
            var _loc4_:Number = Starling.§_-y1l§.stage.stageWidth;
            var _loc5_:Number = Starling.§_-y1l§.stage.stageHeight;
            var _loc6_:Point = new Point(_loc3_.x + this.§_-x1W§.x * (_loc3_.width / _loc4_),_loc3_.y + this.§_-x1W§.y * (_loc3_.height / _loc5_));
            var _loc7_:Point = this.parent.globalToLocal(_loc6_);
            if(this.x == _loc7_.x && this.y == _loc7_.y)
            {
               return;
            }
            this.x = _loc7_.x;
            this.y = _loc7_.y;
            this.§_-fg§();
            return;
         }
         this.visible = false;
      }
      
      private function §_-sG§(param1:GameEvent) : void
      {
         this.§_-V1e§ = false;
         updateButtons();
         this.redraw(false);
      }
      
      private function §_-V1Q§(param1:Event = null) : void
      {
         border = new Rectangle(0,90,GameMap.§_-q1n§,GameMap.§_-P1Q§ - 140);
         §_-g1t§ = new Point((GameMap.§_-q1n§ + §_-a9§.§_-9o§) * 0.5 - 60,GameMap.§_-P1Q§ - 95);
         this.§_-fg§();
      }
      
      private function onUpdate(param1:Event) : void
      {
         this.redraw(false);
      }
      
      private function §_-y1b§(param1:MouseEvent) : void
      {
         this.visible = !this.visible;
         param1.stopImmediatePropagation();
      }
   }
}

