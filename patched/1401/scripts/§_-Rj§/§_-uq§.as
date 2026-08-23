package §_-Rj§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-83V§.§_-M2K§;
   import §_-83V§.§_-R2Z§;
   import §_-K2c§.KeyboardEvent;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-T2y§.§_-s1i§;
   import events.§_-63A§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-sd§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-M15§;
   import game.mainGame.entity.§_-P23§;
   import game.mainGame.entity.§_-R2m§;
   import starling.core.Starling;
   import utils.§_-23z§;
   import utils.§_-Z1S§;
   
   public class §_-uq§ extends Sprite
   {
      
      private static const §_-22n§:int = 90;
      
      private static const §_-71J§:int = 400;
      
      private static const §_-v1f§:int = 14;
      
      private static const §_-se§:Number = 4;
      
      public static const §_-dR§:Array = [new GlowFilter(16777215,1,10,10,5,1,true)];
      
      public var §_-K1n§:Vector.<§_-63Q§> = new Vector.<§_-63Q§>();
      
      public var §_-U1k§:Boolean = false;
      
      private var map:§_-K15§ = null;
      
      private var §_-Q29§:Point = null;
      
      private var dragObject:Boolean = false;
      
      private var §_-33O§:Dictionary = new Dictionary(true);
      
      private var §_-d25§:Point = new Point();
      
      private var §_-B3E§:SelectionCenter = new SelectionCenter();
      
      private var §_-Y17§:Boolean = false;
      
      private var §_-J1Z§:Boolean = false;
      
      private var §_-25§:Number = 0;
      
      private var §_-7A§:DisplayObject = new BtnCastRotate();
      
      private var §_-81l§:DisplayObject = new BtnCastCancel();
      
      private var §_-O1b§:Sprite = new Sprite();
      
      private var §_-U1S§:BtnCastResize = new BtnCastResize();
      
      private var §_-917§:BtnCastResize = new BtnCastResize();
      
      private var §_-c2H§:Boolean = false;
      
      private var §_-Yg§:Boolean = false;
      
      private var §_-F2u§:Point = null;
      
      private var §_-4J§:Boolean = false;
      
      private var §_-qD§:b2Vec2 = null;
      
      private var §_-zc§:Point = null;
      
      private var §_-U1E§:BtnCastBind = new BtnCastBind();
      
      private var §_-Q2D§:DisplayObject = new BtnCastMoveForward();
      
      private var §_-HU§:DisplayObject = new BtnCastMoveBack();
      
      private var §_-12J§:DisplayObject = new BtnCastDuplicate();
      
      private var §_-V1X§:DisplayObject = new BtnCastProperties();
      
      private var §_-21V§:Boolean = false;
      
      private var §_-NA§:Sprite = new Sprite();
      
      private var §_-L1a§:Point = new Point();
      
      private var §_-73W§:Point = new Point();
      
      private var §_-wC§:Boolean = true;
      
      private var §_-Us§:Point;
      
      private var §_-k2C§:Point = new Point();
      
      private var §_-q1V§:§_-h2I§ = null;
      
      private var §_-Z1W§:Boolean = false;
      
      private var §_-Qt§:Boolean = false;
      
      private var §_-71w§:int = 0;
      
      public function §_-uq§(param1:§_-K15§)
      {
         super();
         this.map = param1;
         addChild(this.§_-B3E§);
         addChild(this.§_-7A§);
         addChild(this.§_-81l§);
         this.§_-V2C§();
         this.§_-1z§();
         this.§_-O1b§.addChild(this.§_-U1S§);
         this.§_-O1b§.addChild(this.§_-917§);
         addChild(this.§_-O1b§);
         addChild(this.§_-U1E§);
         addChild(this.§_-Q2D§);
         addChild(this.§_-HU§);
         addChild(this.§_-12J§);
         addChild(this.§_-V1X§);
         this.§_-Bs§();
         addChild(this.§_-NA§);
         this.§_-R1N§ = this.§_-a1k§;
         this.§_-B3E§.mouseEnabled = true;
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         §_-s1i§.instance.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D2§,false,0,true);
      }
      
      public function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Point = this.§_-t15§(_loc2_);
         if(this.§_-Z1W§)
         {
            if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
            {
               this.§_-KC§();
            }
            else if(_loc2_.§_-Q2S§ == §_-sj§.§_-i23§)
            {
               this.§_-aB§();
               this.§_-61X§(_loc3_);
            }
            return;
         }
         this.§_-aB§();
         if(_loc2_.§_-Q2S§ != §_-sj§.§_-ML§)
         {
            return;
         }
         if(!(this.map.game as §_-A32§).§_-a2S§(this.§_-k2C§))
         {
            return;
         }
         this.§_-N2O§(_loc3_);
      }
      
      public function get §_-R1N§() : Point
      {
         return this.§_-d25§;
      }
      
      public function set §_-R1N§(param1:Point) : void
      {
         var _loc2_:§_-23z§ = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         this.§_-d25§ = param1;
         for each(_loc2_ in this.§_-33O§)
         {
            _loc2_.§_-31h§(param1);
         }
         _loc3_ = (this.map.game as §_-A32§).scale;
         _loc4_ = param1.x * _loc3_;
         _loc5_ = param1.y * _loc3_;
         _loc6_ = this.§_-K1n§.length > 0;
         this.§_-B3E§.x = int(_loc4_);
         this.§_-B3E§.y = int(_loc5_);
         this.§_-B3E§.visible = _loc6_;
         this.§_-P1L§(_loc4_,_loc5_,_loc6_);
         this.§_-25§ = 0;
         this.§_-V2C§();
      }
      
      public function get §_-a1k§() : Point
      {
         var _loc3_:* = undefined;
         var _loc1_:Point = new Point();
         var _loc2_:int = 0;
         for(_loc3_ in this.§_-33O§)
         {
            _loc2_++;
            _loc1_ = new Point(_loc3_.x,_loc3_.y).add(_loc1_);
         }
         return new Point(_loc1_.x / _loc2_,_loc1_.y / _loc2_);
      }
      
      public function dispose() : void
      {
         this.clear();
         this.§_-21Q§(false);
         §_-s1i§.instance.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D2§);
         this.map = null;
         this.§_-K1n§ = null;
         this.§_-33O§ = null;
         this.§_-7A§ = null;
         this.§_-81l§ = null;
         this.§_-B3E§ = null;
         this.§_-NA§ = null;
         this.§_-U1S§ = null;
         this.§_-917§ = null;
         this.§_-Q2D§ = null;
         this.§_-HU§ = null;
         this.§_-12J§ = null;
         this.§_-V1X§ = null;
         this.§_-U1E§ = null;
      }
      
      public function §_-y2C§() : void
      {
         var _loc1_:§_-63Q§ = null;
         (this.map.game as §_-A32§).§_-Wg§();
         while(this.§_-K1n§.length > 0)
         {
            _loc1_ = this.§_-K1n§[0];
            if(_loc1_ is §_-R2Z§)
            {
               (_loc1_ as §_-R2Z§).§_-M1A§();
            }
            this.remove(_loc1_);
            this.map.remove(_loc1_,true);
         }
      }
      
      public function rotate(param1:Number) : void
      {
         var _loc2_:§_-23z§ = null;
         for each(_loc2_ in this.§_-33O§)
         {
            _loc2_.rotation += param1;
         }
         this.§_-V2C§();
      }
      
      public function add(param1:§_-63Q§, param2:Boolean = false) : void
      {
         if(!param1 || this.§_-K1n§.indexOf(param1) != -1)
         {
            return;
         }
         if(param2)
         {
            this.clear();
         }
         this.§_-K1n§.push(param1);
         if(param1 is §_-v2j§)
         {
            this.§_-33O§[param1] = new §_-23z§(param1);
            this.§_-R1N§ = this.§_-a1k§;
            (param1 as §_-h2I§).filters = §_-dR§;
         }
         if(param1 is §_-72o§)
         {
            (param1 as §_-72o§).§_-91N§(this);
         }
         this.§_-V2C§();
         this.§_-1z§();
         if(!(param1 is Sprite))
         {
            return;
         }
         this.§_-21V§ = false;
         dispatchEvent(new §_-63A§(param1,§_-63A§.SELECT));
      }
      
      public function clear() : void
      {
         while(this.§_-K1n§.length > 0)
         {
            this.remove(this.§_-K1n§[0]);
         }
      }
      
      public function remove(param1:§_-63Q§) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = this.§_-K1n§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-K1n§.splice(_loc2_,1);
         if(param1 is §_-v2j§)
         {
            (param1 as §_-h2I§).filters = null;
            delete this.§_-33O§[param1];
         }
         this.§_-R1N§ = this.§_-a1k§;
         this.§_-V2C§();
         this.§_-1z§();
         dispatchEvent(new §_-63A§(null,§_-63A§.SELECT));
      }
      
      public function §_-Hx§() : void
      {
         this.§_-21Q§(false);
         this.§_-Q29§ = null;
         this.§_-Y17§ = false;
         this.§_-J1Z§ = false;
         this.§_-Yg§ = false;
         this.§_-c2H§ = false;
         this.dragObject = false;
         this.§_-21V§ = false;
         this.§_-4X§();
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:Array = null;
         var _loc7_:§_-63Q§ = null;
         var _loc8_:§_-63Q§ = null;
         var _loc9_:§_-63Q§ = null;
         if(Boolean(this.map) && Boolean(!this.map.§_-k6§()) && !(Game.stage.focus is TextField))
         {
            Game.stage.focus = this.map;
         }
         if(Game.stage.focus != this.map)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.D:
               if(!param1.ctrlKey)
               {
                  break;
               }
               this.copy();
               break;
            case Keyboard.Z:
               if(param1.ctrlKey)
               {
                  for each(_loc7_ in this.§_-K1n§)
                  {
                     if(_loc7_ is §_-sd§)
                     {
                        (_loc7_ as §_-sd§).§_-9y§ = !(_loc7_ as §_-sd§).§_-9y§;
                     }
                  }
               }
               else
               {
                  for each(_loc8_ in this.§_-K1n§)
                  {
                     if(_loc8_ is GameBody)
                     {
                        (_loc8_ as GameBody).ghost = !(_loc8_ as GameBody).ghost;
                     }
                  }
               }
               break;
            case Keyboard.X:
               this.§_-M2U§();
               break;
            case Keyboard.DOWN:
            case Keyboard.UP:
            case Keyboard.LEFT:
            case Keyboard.RIGHT:
               _loc2_ = param1.ctrlKey ? 10 : 1;
               _loc3_ = (param1.keyCode == Keyboard.LEFT ? -1 : 0) + (param1.keyCode == Keyboard.RIGHT ? 1 : 0);
               _loc4_ = (param1.keyCode == Keyboard.UP ? -1 : 0) + (param1.keyCode == Keyboard.DOWN ? 1 : 0);
               _loc5_ = new Point(_loc3_ * _loc2_,_loc4_ * _loc2_);
               if(param1.ctrlKey && param1.shiftKey)
               {
                  this.map.game.shift = this.map.game.shift.add(_loc5_);
                  break;
               }
               if(!param1.shiftKey)
               {
                  this.§_-I14§(_loc5_);
                  break;
               }
               this.§_-ok§(_loc4_);
               break;
            case Keyboard.A:
               if(!param1.ctrlKey)
               {
                  break;
               }
               this.clear();
               _loc6_ = this.map.get(Object,true);
               for each(_loc8_ in _loc6_)
               {
                  this.add(_loc8_);
               }
               break;
            case Keyboard.O:
               for each(_loc9_ in this.§_-K1n§)
               {
                  if(_loc9_ is GameBody)
                  {
                     (_loc9_ as GameBody).fixed = !(_loc9_ as GameBody).fixed;
                  }
               }
         }
      }
      
      private function §_-z6§(param1:Point) : Boolean
      {
         if(!this.§_-B3E§.visible || !this.§_-OU§(this.§_-B3E§))
         {
            return false;
         }
         var _loc2_:int = getTimer();
         if(this.§_-71w§ > 0 && _loc2_ - this.§_-71w§ <= §_-71J§)
         {
            this.§_-71w§ = 0;
            this.§_-M2U§();
            return true;
         }
         this.§_-71w§ = _loc2_;
         this.§_-52N§(param1);
         return true;
      }
      
      private function §_-52N§(param1:Point) : void
      {
         this.dragObject = true;
         (this.map.game as §_-A32§).§_-Wg§();
         this.§_-21V§ = false;
         this.§_-Q29§ = param1;
      }
      
      private function §_-M2U§() : void
      {
         this.map.§_-o12§();
      }
      
      private function copy() : void
      {
         var _loc2_:§_-63Q§ = null;
         var _loc3_:Array = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-K1n§)
         {
            if(_loc2_ is §_-03u§)
            {
               _loc1_.push([§_-03s§.§_-X21§(_loc2_),(_loc2_ as §_-03u§).§_-A1X§()]);
            }
         }
         this.clear();
         for each(_loc3_ in _loc1_)
         {
            _loc2_ = new (§_-03s§.§_-F1T§(_loc3_[0]) as Class)();
            (_loc2_ as §_-03u§).§_-41M§(_loc3_[1]);
            this.map.add(_loc2_);
            this.add(_loc2_);
         }
      }
      
      private function §_-Bs§() : void
      {
         this.§_-NA§.graphics.clear();
         this.§_-NA§.graphics.beginFill(16580566,0.1);
         this.§_-NA§.graphics.lineStyle(1,16777046);
         this.§_-NA§.graphics.drawRect(this.§_-L1a§.x,this.§_-L1a§.y,this.§_-73W§.x - this.§_-L1a§.x,this.§_-73W§.y - this.§_-L1a§.y);
         this.§_-NA§.graphics.lineStyle(0);
         this.§_-NA§.graphics.endFill();
      }
      
      private function §_-Ha§() : void
      {
         this.§_-21V§ = false;
         this.§_-L1a§ = new Point();
         this.§_-73W§ = new Point();
         this.§_-Bs§();
      }
      
      private function §_-5Z§(param1:§_-63Q§) : Boolean
      {
         return this.§_-K1n§.indexOf(param1) > -1;
      }
      
      private function §_-61X§(param1:Point) : void
      {
         var _loc2_:§_-63Q§ = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:b2Vec2 = null;
         var _loc9_:b2Vec2 = null;
         var _loc10_:Point = null;
         var _loc11_:Point = null;
         var _loc12_:Number = NaN;
         if(!this.§_-Z1W§ || !this.map || !this.map.§_-kz§)
         {
            return;
         }
         for each(_loc2_ in this.§_-K1n§)
         {
            if(_loc2_ is §_-P23§ && (_loc2_ as §_-P23§).§_-Vq§)
            {
               return;
            }
         }
         if(this.§_-wC§ && !this.§_-Q29§)
         {
            this.§_-73W§ = param1;
            this.§_-Bs§();
            return;
         }
         if(this.§_-c2H§)
         {
            if(this.§_-K1n§.length == 1 && this.§_-K1n§[0] is §_-R2m§ && this.§_-Sk§())
            {
               _loc4_ = (this.§_-K1n§[0] as §_-h2I§).globalToLocal(this.§_-k2C§);
               (this.§_-K1n§[0] as §_-R2m§).size = new b2Vec2(_loc4_.x * 2 / Game.§_-x2P§ / (this.map.game as §_-A32§).scale,_loc4_.y * 2 / Game.§_-x2P§ / (this.map.game as §_-A32§).scale);
               this.§_-U1S§.x = (this.§_-K1n§[0] as §_-R2m§).size.x * Game.§_-x2P§ * 0.5 * (this.map.game as §_-A32§).scale;
               this.§_-U1S§.y = (this.§_-K1n§[0] as §_-R2m§).size.y * Game.§_-x2P§ * 0.5 * (this.map.game as §_-A32§).scale;
            }
            return;
         }
         if(this.§_-Yg§)
         {
            if(this.§_-K1n§.length == 1 && this.§_-K1n§[0] is §_-R2m§ && this.§_-Sk§())
            {
               _loc5_ = (this.§_-K1n§[0] as §_-h2I§).globalToLocal(this.§_-k2C§);
               _loc6_ = this.§_-O1b§.localToGlobal(new Point(this.§_-U1S§.x,this.§_-U1S§.y));
               _loc7_ = new Point(this.§_-U1S§.x,this.§_-U1S§.y).subtract(_loc5_);
               _loc8_ = (this.§_-K1n§[0] as §_-R2m§).size.Copy();
               (this.§_-K1n§[0] as §_-R2m§).size = new b2Vec2(_loc7_.x * 2 / Game.§_-x2P§ / (this.map.game as §_-A32§).scale,_loc7_.y * 2 / Game.§_-x2P§ / (this.map.game as §_-A32§).scale);
               _loc9_ = _loc8_.Copy();
               _loc9_.Subtract((this.§_-K1n§[0] as §_-R2m§).size);
               if(_loc9_.x == 0 && _loc9_.y == 0)
               {
                  return;
               }
               _loc10_ = (this.§_-K1n§[0] as §_-h2I§).parentStarling.globalToLocal(this.§_-O1b§.localToGlobal(_loc5_));
               (this.§_-K1n§[0] as §_-h2I§).x = _loc10_.x;
               (this.§_-K1n§[0] as §_-h2I§).y = _loc10_.y;
               this.§_-R1N§ = this.§_-a1k§;
               _loc11_ = this.§_-O1b§.localToGlobal(new Point(this.§_-U1S§.x,this.§_-U1S§.y));
               _loc5_ = _loc6_.subtract(_loc11_);
               (this.§_-K1n§[0] as §_-h2I§).x += _loc5_.x / (this.map.game as §_-A32§).scale;
               (this.§_-K1n§[0] as §_-h2I§).y += _loc5_.y / (this.map.game as §_-A32§).scale;
               this.§_-R1N§ = this.§_-a1k§;
            }
            return;
         }
         if(this.§_-J1Z§)
         {
            this.§_-7A§.x = param1.x;
            this.§_-7A§.y = param1.y;
            _loc12_ = §_-Z1S§.getAngle(this.§_-R1N§,new Point(param1.x / (this.map.game as §_-A32§).scale,param1.y / (this.map.game as §_-A32§).scale)) - 90;
            this.rotate(_loc12_ - this.§_-25§);
            this.§_-25§ = _loc12_;
            return;
         }
         if(this.§_-Q29§ == null)
         {
            return;
         }
         var _loc3_:Point = param1.subtract(this.§_-Q29§);
         if(this.§_-Y17§)
         {
            if(!(this.map.game as §_-A32§).§_-a2S§(this.§_-k2C§))
            {
               this.§_-Q29§ = param1;
               return;
            }
            _loc3_ = new Point(_loc3_.x * (this.map.game as §_-A32§).scale,_loc3_.y * (this.map.game as §_-A32§).scale);
            this.map.game.shift = this.map.game.shift.add(_loc3_);
            return;
         }
         this.§_-Q29§ = param1;
         this.§_-I14§(_loc3_);
         if(!this.§_-21V§)
         {
            return;
         }
         this.§_-21V§ = false;
         this.§_-L1a§ = param1;
         this.§_-73W§ = param1;
         this.§_-Bs§();
      }
      
      private function §_-N2O§(param1:Point) : void
      {
         var _loc2_:int = 0;
         if(this.map.§_-X7§)
         {
            return;
         }
         if(this.§_-U1k§ && !this.§_-R2d§(this.§_-k2C§))
         {
            return;
         }
         this.§_-21Q§(true);
         this.§_-21V§ = false;
         this.§_-Q29§ = null;
         this.§_-wC§ = false;
         this.§_-Yg§ = false;
         this.§_-Y17§ = false;
         this.§_-J1Z§ = false;
         this.§_-c2H§ = false;
         if(this.§_-U1k§)
         {
            this.§_-Q29§ = param1;
            this.§_-Y17§ = true;
            return;
         }
         if(this.§_-7A§.visible && this.§_-OU§(this.§_-7A§))
         {
            this.§_-J1Z§ = true;
            (this.map.game as §_-A32§).§_-Wg§();
            return;
         }
         if(Boolean(this.§_-U1S§.visible) && this.§_-OU§(this.§_-U1S§))
         {
            this.§_-c2H§ = true;
            this.§_-o25§();
            return;
         }
         if(Boolean(this.§_-917§.visible) && this.§_-OU§(this.§_-917§))
         {
            this.§_-Yg§ = true;
            this.§_-o25§();
            return;
         }
         if(this.§_-81l§.visible && this.§_-OU§(this.§_-81l§))
         {
            this.§_-y2C§();
            this.§_-n2p§();
            return;
         }
         if(Boolean(this.§_-U1E§.visible) && this.§_-OU§(this.§_-U1E§))
         {
            (this.§_-K1n§[0] as §_-R2Z§).§_-r11§(this.§_-K1n§.slice(1));
            _loc2_ = 1;
            while(_loc2_ < this.§_-K1n§.length)
            {
               (this.§_-K1n§[_loc2_] as §_-R2Z§).§_-r11§(this.§_-K1n§.slice(0,_loc2_).concat(this.§_-K1n§.slice(_loc2_ + 1)));
               _loc2_++;
            }
            this.§_-n2p§();
            return;
         }
         if(this.§_-Q2D§.visible && this.§_-OU§(this.§_-Q2D§))
         {
            this.§_-ok§(1);
            this.§_-n2p§();
            return;
         }
         if(this.§_-HU§.visible && this.§_-OU§(this.§_-HU§))
         {
            this.§_-ok§(-1);
            this.§_-n2p§();
            return;
         }
         if(this.§_-12J§.visible && this.§_-OU§(this.§_-12J§))
         {
            this.copy();
            this.§_-n2p§();
            return;
         }
         if(this.§_-V1X§.visible && this.§_-OU§(this.§_-V1X§))
         {
            this.§_-M2U§();
            this.§_-n2p§();
            return;
         }
         if(this.§_-z6§(param1))
         {
            return;
         }
         if((this.map.game as §_-A32§).§_-o1W§.§_-N2O§(this.§_-k2C§))
         {
            this.§_-n2p§();
            return;
         }
         this.§_-q1V§ = this.map.§_-GH§(this.§_-Us§);
         if(this.§_-q1V§ is §_-P23§ && (this.§_-q1V§ as §_-P23§).§_-H1E§(this.§_-Us§))
         {
            this.§_-q1V§ = null;
            this.§_-Qt§ = true;
         }
         else
         {
            this.§_-Qt§ = false;
         }
         if(this.§_-q1V§)
         {
            this.§_-21V§ = true;
            this.§_-Q29§ = param1;
         }
         this.§_-L1a§ = param1;
         this.§_-73W§ = param1;
         this.§_-wC§ = !this.§_-21V§;
         this.§_-Bs§();
      }
      
      private function §_-KC§() : void
      {
         var _loc5_:* = undefined;
         var _loc6_:Array = null;
         var _loc7_:§_-63Q§ = null;
         if(!this.§_-Z1W§)
         {
            return;
         }
         this.§_-21Q§(false);
         if(this.§_-Qt§)
         {
            this.§_-Qt§ = false;
            this.§_-Q29§ = null;
            this.§_-wC§ = true;
            this.§_-Ha§();
            return;
         }
         var _loc1_:Boolean = this.§_-J1Z§;
         var _loc2_:Boolean = this.§_-c2H§ || this.§_-Yg§;
         var _loc3_:Boolean = this.dragObject;
         var _loc4_:Boolean = this.§_-Y17§;
         this.§_-Q29§ = null;
         this.§_-wC§ = true;
         this.§_-J1Z§ = false;
         this.§_-Yg§ = false;
         this.§_-c2H§ = false;
         this.§_-Y17§ = false;
         this.dragObject = false;
         if(_loc1_)
         {
            for(_loc5_ in this.§_-33O§)
            {
               if(_loc5_ is §_-M15§)
               {
                  (_loc5_ as §_-v2j§).rotation = (_loc5_ as §_-M15§).§_-42Y§((_loc5_ as §_-v2j§).rotation);
               }
            }
            this.§_-R1N§ = this.§_-a1k§;
         }
         if(_loc2_ || _loc3_ || _loc1_ || _loc4_)
         {
            if(_loc2_)
            {
               this.§_-611§();
               this.§_-Qt§ = true;
            }
            this.§_-Ha§();
            return;
         }
         if(this.visible && !this.map.§_-k6§())
         {
            _loc6_ = this.map.get(§_-63Q§,true);
            this.clear();
            if(this.§_-NA§.width < 10 && this.§_-NA§.height < 10)
            {
               if(Boolean(this.§_-q1V§) && this.§_-q1V§ is §_-63Q§)
               {
                  this.add(this.§_-q1V§ as §_-63Q§);
               }
               this.§_-q1V§ = null;
            }
            else
            {
               for each(_loc7_ in _loc6_)
               {
                  if(_loc7_ is §_-v2j§)
                  {
                     if(this.§_-M1x§(_loc7_ as §_-h2I§,this.§_-NA§))
                     {
                        this.add(_loc7_);
                     }
                  }
               }
            }
         }
         this.§_-Ha§();
      }
      
      private function §_-t15§(param1:§_-e2m§) : Point
      {
         this.§_-k2C§.setTo(Game.stage.mouseX,Game.stage.mouseY);
         this.§_-Us§ = param1.§_-l29§(§_-s1i§.instance);
         return this.map.globalToLocal(this.§_-k2C§);
      }
      
      private function §_-aB§() : void
      {
         if(!this.§_-U1k§)
         {
            return;
         }
         Mouse.cursor = this.§_-R2d§(this.§_-k2C§) ? MouseCursor.HAND : MouseCursor.AUTO;
      }
      
      private function §_-R2d§(param1:Point) : Boolean
      {
         var _loc2_:§_-A32§ = this.map.game as §_-A32§;
         return _loc2_.§_-a2S§(param1) && !_loc2_.§_-o1W§.§_-C29§(param1);
      }
      
      private function §_-D2§(param1:MouseEvent) : void
      {
         if(this.§_-Z1W§)
         {
            return;
         }
         this.§_-k2C§.setTo(param1.stageX,param1.stageY);
         this.§_-aB§();
      }
      
      private function §_-21Q§(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.§_-Z1W§)
            {
               return;
            }
            this.§_-Z1W§ = true;
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-l1q§,false,0,true);
            Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-l1q§,false,0,true);
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-l1q§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-l1q§);
         this.§_-Z1W§ = false;
      }
      
      private function §_-n2p§() : void
      {
         this.§_-21Q§(false);
         this.§_-wC§ = true;
      }
      
      private function §_-l1q§(param1:MouseEvent) : void
      {
         if(!this.§_-Z1W§)
         {
            return;
         }
         if(§_-a9§.§_-O1z§)
         {
            if(param1.type == MouseEvent.MOUSE_UP)
            {
               this.§_-KC§();
            }
            return;
         }
         if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            if(param1.buttonDown)
            {
               this.§_-k2C§.setTo(param1.stageX,param1.stageY);
               this.§_-61X§(this.map.globalToLocal(this.§_-k2C§));
               return;
            }
            this.§_-KC§();
            return;
         }
         if(param1.type == MouseEvent.MOUSE_UP)
         {
            this.§_-KC§();
         }
      }
      
      private function §_-o25§() : void
      {
         var _loc1_:§_-h2I§ = null;
         this.§_-4X§();
         if(this.§_-K1n§.length != 1 || !(this.§_-K1n§[0] is §_-R2m§))
         {
            return;
         }
         this.§_-F2u§ = this.§_-k2C§.clone();
         this.§_-qD§ = (this.§_-K1n§[0] as §_-R2m§).size.Copy();
         if(this.§_-K1n§[0] is §_-h2I§)
         {
            _loc1_ = this.§_-K1n§[0] as §_-h2I§;
            this.§_-zc§ = new Point(_loc1_.x,_loc1_.y);
         }
      }
      
      private function §_-Sk§() : Boolean
      {
         if(this.§_-4J§)
         {
            return true;
         }
         if(!this.§_-F2u§)
         {
            return false;
         }
         if(this.§_-k2C§.subtract(this.§_-F2u§).length < §_-se§)
         {
            return false;
         }
         this.§_-4J§ = true;
         (this.map.game as §_-A32§).§_-Wg§();
         return true;
      }
      
      private function §_-611§() : void
      {
         if(!this.§_-4J§ && this.§_-K1n§.length == 1 && this.§_-K1n§[0] is §_-R2m§ && Boolean(this.§_-qD§))
         {
            (this.§_-K1n§[0] as §_-R2m§).size = this.§_-qD§;
            if(Boolean(this.§_-zc§) && this.§_-K1n§[0] is §_-h2I§)
            {
               (this.§_-K1n§[0] as §_-h2I§).x = this.§_-zc§.x;
               (this.§_-K1n§[0] as §_-h2I§).y = this.§_-zc§.y;
            }
            this.§_-V2C§();
            this.§_-R1N§ = this.§_-a1k§;
         }
         this.§_-4X§();
      }
      
      private function §_-4X§() : void
      {
         this.§_-F2u§ = null;
         this.§_-4J§ = false;
         this.§_-qD§ = null;
         this.§_-zc§ = null;
      }
      
      private function §_-OU§(param1:DisplayObject) : Boolean
      {
         if(!param1 || !param1.visible || !param1.stage)
         {
            return false;
         }
         var _loc2_:Rectangle = param1.getBounds(param1.stage);
         if(§_-a9§.§_-O1z§)
         {
            _loc2_.inflate(§_-v1f§,§_-v1f§);
         }
         return _loc2_.contains(this.§_-k2C§.x,this.§_-k2C§.y);
      }
      
      private function §_-M1x§(param1:*, param2:DisplayObject) : Boolean
      {
         var _loc3_:Rectangle = param2.getRect(Game.stage);
         var _loc4_:Rectangle = §_-h2I§(param1).boundsStarling();
         var _loc5_:Number = (this.map.game as §_-A32§).scale;
         return _loc4_.left * _loc5_ + this.map.x >= _loc3_.left - Game.§_-d2t§.x && _loc4_.right * _loc5_ + this.map.x <= _loc3_.right - Game.§_-d2t§.x && _loc4_.top * _loc5_ + this.map.y >= _loc3_.top - Game.§_-d2t§.y && _loc4_.bottom * _loc5_ + this.map.y <= _loc3_.bottom - Game.§_-d2t§.y;
      }
      
      private function §_-I14§(param1:Point) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.§_-K1n§)
         {
            _loc2_.x += param1.x / (this.map.game as §_-A32§).scale;
            _loc2_.y += param1.y / (this.map.game as §_-A32§).scale;
         }
         this.§_-R1N§ = this.§_-a1k§;
      }
      
      private function §_-P1L§(param1:Number, param2:Number, param3:Boolean) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc4_:Array = [this.§_-7A§,this.§_-81l§,this.§_-V1X§,this.§_-12J§,this.§_-HU§,this.§_-Q2D§];
         if(this.§_-wX§())
         {
            _loc4_.push(this.§_-U1E§);
         }
         var _loc5_:Boolean = this.§_-K1n§.length == 1 && this.§_-K1n§[0] is §_-R2m§;
         var _loc6_:Array = _loc5_ ? (_loc4_.length > 6 ? [1] : [1,5]) : [];
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < 8)
         {
            if(_loc6_.indexOf(_loc8_) == -1)
            {
               _loc7_.push(_loc8_);
            }
            _loc8_++;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_.length)
         {
            if(_loc7_.length > 0 && _loc7_.length < 8)
            {
               _loc11_ = _loc4_.length == 1 ? 0 : int(Math.round(_loc9_ * (_loc7_.length - 1) / (_loc4_.length - 1)));
               _loc10_ = 2 * Math.PI * _loc7_[_loc11_] / 8;
            }
            else
            {
               _loc10_ = 2 * Math.PI * _loc9_ / _loc4_.length - Math.PI / 2;
            }
            _loc4_[_loc9_].x = param1 + Math.cos(_loc10_) * §_-22n§;
            _loc4_[_loc9_].y = param2 + Math.sin(_loc10_) * §_-22n§;
            _loc4_[_loc9_].visible = param3;
            _loc9_++;
         }
         this.§_-U1E§.visible = param3 && this.§_-wX§();
      }
      
      private function §_-wX§() : Boolean
      {
         var _loc1_:DisplayObject = null;
         if(this.§_-K1n§.length < 2)
         {
            return false;
         }
         for each(_loc1_ in this.§_-K1n§)
         {
            if(!(_loc1_ is §_-M2K§))
            {
               return this.§_-K1n§.length == 2 && (this.§_-K1n§[0] is GameBody && this.§_-K1n§[1] is §_-M2K§ || this.§_-K1n§[1] is GameBody && this.§_-K1n§[0] is §_-M2K§);
            }
         }
         return true;
      }
      
      private function §_-ok§(param1:int) : void
      {
         var _loc2_:§_-63Q§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         for each(_loc2_ in this.§_-K1n§)
         {
            _loc3_ = this.map.§_-8q§().indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               _loc4_ = _loc3_ + param1;
               if(_loc4_ > this.map.§_-8q§().length)
               {
                  _loc4_ = int(this.map.§_-8q§().length);
               }
               if(_loc4_ < 0)
               {
                  _loc4_ = 0;
               }
               _loc5_ = this.map.§_-8q§()[_loc3_];
               this.map.§_-8q§().splice(_loc3_,1);
               this.map.§_-8q§().splice(_loc4_,0,_loc5_);
               (_loc5_ as §_-h2I§).lastIndex = this.map.§_-8q§().indexOf(_loc2_);
               this.map.§_-kz§.§_-d2R§(_loc5_ as §_-h2I§,_loc4_ + 1);
            }
         }
      }
      
      private function §_-V2C§() : void
      {
         this.§_-U1S§.visible = this.§_-917§.visible = this.§_-K1n§.length == 1 && this.§_-K1n§[0] is §_-R2m§;
         if(!this.§_-U1S§.visible)
         {
            return;
         }
         var _loc1_:b2Vec2 = (this.§_-K1n§[0] as §_-R2m§).size.Copy();
         _loc1_.Multiply(0.5);
         _loc1_.Multiply(Game.§_-x2P§);
         this.§_-U1S§.x = _loc1_.x * (this.map.game as §_-A32§).scale + 5;
         this.§_-U1S§.y = _loc1_.y * (this.map.game as §_-A32§).scale + 5;
         this.§_-917§.x = -this.§_-917§.width - 5;
         this.§_-917§.y = -this.§_-917§.height - 5;
         this.§_-O1b§.x = this.§_-K1n§[0].position.x * Game.§_-x2P§ * (this.map.game as §_-A32§).scale;
         this.§_-O1b§.y = this.§_-K1n§[0].position.y * Game.§_-x2P§ * (this.map.game as §_-A32§).scale;
         this.§_-O1b§.rotation = this.§_-K1n§[0].angle / Game.D2R;
      }
      
      private function §_-1z§() : void
      {
         if(!this.map || this.§_-K1n§.length == 0)
         {
            this.§_-U1E§.visible = false;
            return;
         }
         var _loc1_:Number = (this.map.game as §_-A32§).scale;
         this.§_-P1L§(this.§_-d25§.x * _loc1_,this.§_-d25§.y * _loc1_,true);
      }
   }
}

