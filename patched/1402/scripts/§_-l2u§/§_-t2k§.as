package §_-l2u§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-A§;
   import §_-8Q§.§_-g2b§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.KeyboardEvent;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import events.§_-F2k§;
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
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-N1R§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-81a§;
   import game.mainGame.entity.§_-9z§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   import starling.core.Starling;
   import utils.§_-L14§;
   import utils.§_-iZ§;
   
   public class §_-t2k§ extends Sprite
   {
      
      private static const §_-jd§:int = 90;
      
      private static const §_-33t§:int = 400;
      
      private static const §_-w2e§:int = 14;
      
      private static const §_-h2O§:Number = 4;
      
      public static const §_-22t§:Array = [new GlowFilter(16777215,1,10,10,5,1,true)];
      
      public var §_-B3S§:Vector.<§_-xn§> = new Vector.<§_-xn§>();
      
      public var §_-Gl§:Boolean = false;
      
      private var map:§_-53A§ = null;
      
      private var §_-51m§:Point = null;
      
      private var dragObject:Boolean = false;
      
      private var §_-A3r§:Dictionary = new Dictionary(true);
      
      private var §_-J0§:Point = new Point();
      
      private var §_-O20§:SelectionCenter = new SelectionCenter();
      
      private var §_-X21§:Boolean = false;
      
      private var §_-Bj§:Boolean = false;
      
      private var §_-B1b§:Number = 0;
      
      private var §_-p2k§:DisplayObject = new BtnCastRotate();
      
      private var §_-63P§:DisplayObject = new BtnCastCancel();
      
      private var §_-n2J§:Sprite = new Sprite();
      
      private var §_-d2m§:BtnCastResize = new BtnCastResize();
      
      private var §_-z1b§:BtnCastResize = new BtnCastResize();
      
      private var §_-83f§:Boolean = false;
      
      private var §_-h2Q§:Boolean = false;
      
      private var §_-o1n§:Point = null;
      
      private var §_-2z§:Boolean = false;
      
      private var §_-xt§:b2Vec2 = null;
      
      private var §_-AX§:Point = null;
      
      private var §_-l1d§:BtnCastBind = new BtnCastBind();
      
      private var §_-72§:DisplayObject = new BtnCastMoveForward();
      
      private var §_-12R§:DisplayObject = new BtnCastMoveBack();
      
      private var §_-7x§:DisplayObject = new BtnCastDuplicate();
      
      private var §_-83T§:DisplayObject = new BtnCastProperties();
      
      private var §_-J1J§:Boolean = false;
      
      private var §_-q1T§:Sprite = new Sprite();
      
      private var §_-AW§:Point = new Point();
      
      private var §_-r9§:Point = new Point();
      
      private var §_-k1k§:Boolean = true;
      
      private var §_-5b§:Point;
      
      private var §_-z2x§:Point = new Point();
      
      private var §_-x2e§:§_-aS§ = null;
      
      private var §_-u2Y§:Boolean = false;
      
      private var §_-a2N§:Boolean = false;
      
      private var §_-L1r§:int = 0;
      
      public function §_-t2k§(param1:§_-53A§)
      {
         super();
         this.map = param1;
         addChild(this.§_-O20§);
         addChild(this.§_-p2k§);
         addChild(this.§_-63P§);
         this.§_-M2V§();
         this.§_-u2I§();
         this.§_-n2J§.addChild(this.§_-d2m§);
         this.§_-n2J§.addChild(this.§_-z1b§);
         addChild(this.§_-n2J§);
         addChild(this.§_-l1d§);
         addChild(this.§_-72§);
         addChild(this.§_-12R§);
         addChild(this.§_-7x§);
         addChild(this.§_-83T§);
         this.§_-b2L§();
         addChild(this.§_-q1T§);
         this.§_-u9§ = this.§_-W1Z§;
         this.§_-O20§.mouseEnabled = true;
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         §_-817§.instance.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-z2§,false,0,true);
      }
      
      public function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Point = this.§_-P2d§(_loc2_);
         if(this.§_-u2Y§)
         {
            if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
            {
               this.§_-S2H§();
            }
            else if(_loc2_.§_-iR§ == §_-01Z§.§_-kg§)
            {
               this.§_-nN§();
               this.§_-5w§(_loc3_);
            }
            return;
         }
         this.§_-nN§();
         if(_loc2_.§_-iR§ != §_-01Z§.§_-N1v§)
         {
            return;
         }
         if(!(this.map.game as §_-62b§).§_-l2y§(this.§_-z2x§))
         {
            return;
         }
         this.§_-eG§(_loc3_);
      }
      
      public function get §_-u9§() : Point
      {
         return this.§_-J0§;
      }
      
      public function set §_-u9§(param1:Point) : void
      {
         var _loc2_:§_-L14§ = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         this.§_-J0§ = param1;
         for each(_loc2_ in this.§_-A3r§)
         {
            _loc2_.§_-w1§(param1);
         }
         _loc3_ = (this.map.game as §_-62b§).scale;
         _loc4_ = param1.x * _loc3_;
         _loc5_ = param1.y * _loc3_;
         _loc6_ = this.§_-B3S§.length > 0;
         this.§_-O20§.x = int(_loc4_);
         this.§_-O20§.y = int(_loc5_);
         this.§_-O20§.visible = _loc6_;
         this.§_-614§(_loc4_,_loc5_,_loc6_);
         this.§_-B1b§ = 0;
         this.§_-M2V§();
      }
      
      public function get §_-W1Z§() : Point
      {
         var _loc3_:* = undefined;
         var _loc1_:Point = new Point();
         var _loc2_:int = 0;
         for(_loc3_ in this.§_-A3r§)
         {
            _loc2_++;
            _loc1_ = new Point(_loc3_.x,_loc3_.y).add(_loc1_);
         }
         return new Point(_loc1_.x / _loc2_,_loc1_.y / _loc2_);
      }
      
      public function dispose() : void
      {
         this.clear();
         this.§_-8R§(false);
         §_-817§.instance.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-z2§);
         this.map = null;
         this.§_-B3S§ = null;
         this.§_-A3r§ = null;
         this.§_-p2k§ = null;
         this.§_-63P§ = null;
         this.§_-O20§ = null;
         this.§_-q1T§ = null;
         this.§_-d2m§ = null;
         this.§_-z1b§ = null;
         this.§_-72§ = null;
         this.§_-12R§ = null;
         this.§_-7x§ = null;
         this.§_-83T§ = null;
         this.§_-l1d§ = null;
      }
      
      public function §_-xu§() : void
      {
         var _loc1_:§_-xn§ = null;
         (this.map.game as §_-62b§).§_-Vb§();
         while(this.§_-B3S§.length > 0)
         {
            _loc1_ = this.§_-B3S§[0];
            if(_loc1_ is §_-A§)
            {
               (_loc1_ as §_-A§).§_-Z4§();
            }
            this.remove(_loc1_);
            this.map.remove(_loc1_,true);
         }
      }
      
      public function rotate(param1:Number) : void
      {
         var _loc2_:§_-L14§ = null;
         for each(_loc2_ in this.§_-A3r§)
         {
            _loc2_.rotation += param1;
         }
         this.§_-M2V§();
      }
      
      public function add(param1:§_-xn§, param2:Boolean = false) : void
      {
         if(!param1 || this.§_-B3S§.indexOf(param1) != -1)
         {
            return;
         }
         if(param2)
         {
            this.clear();
         }
         this.§_-B3S§.push(param1);
         if(param1 is §_-51g§)
         {
            this.§_-A3r§[param1] = new §_-L14§(param1);
            this.§_-u9§ = this.§_-W1Z§;
            (param1 as §_-aS§).filters = §_-22t§;
         }
         if(param1 is §_-hQ§)
         {
            (param1 as §_-hQ§).§_-h1u§(this);
         }
         this.§_-M2V§();
         this.§_-u2I§();
         if(!(param1 is Sprite))
         {
            return;
         }
         this.§_-J1J§ = false;
         dispatchEvent(new §_-F2k§(param1,§_-F2k§.SELECT));
      }
      
      public function clear() : void
      {
         while(this.§_-B3S§.length > 0)
         {
            this.remove(this.§_-B3S§[0]);
         }
      }
      
      public function remove(param1:§_-xn§) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = this.§_-B3S§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-B3S§.splice(_loc2_,1);
         if(param1 is §_-51g§)
         {
            (param1 as §_-aS§).filters = null;
            delete this.§_-A3r§[param1];
         }
         this.§_-u9§ = this.§_-W1Z§;
         this.§_-M2V§();
         this.§_-u2I§();
         dispatchEvent(new §_-F2k§(null,§_-F2k§.SELECT));
      }
      
      public function §_-o2K§() : void
      {
         this.§_-8R§(false);
         this.§_-51m§ = null;
         this.§_-X21§ = false;
         this.§_-Bj§ = false;
         this.§_-h2Q§ = false;
         this.§_-83f§ = false;
         this.dragObject = false;
         this.§_-J1J§ = false;
         this.§_-Fv§();
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:Array = null;
         var _loc7_:§_-xn§ = null;
         var _loc8_:§_-xn§ = null;
         var _loc9_:§_-xn§ = null;
         if(Boolean(this.map) && Boolean(!this.map.§_-Wf§()) && !(Game.stage.focus is TextField))
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
                  for each(_loc7_ in this.§_-B3S§)
                  {
                     if(_loc7_ is §_-N1R§)
                     {
                        (_loc7_ as §_-N1R§).§_-N2C§ = !(_loc7_ as §_-N1R§).§_-N2C§;
                     }
                  }
               }
               else
               {
                  for each(_loc8_ in this.§_-B3S§)
                  {
                     if(_loc8_ is GameBody)
                     {
                        (_loc8_ as GameBody).ghost = !(_loc8_ as GameBody).ghost;
                     }
                  }
               }
               break;
            case Keyboard.X:
               this.§_-o1h§();
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
                  this.§_-92w§(_loc5_);
                  break;
               }
               this.§_-fH§(_loc4_);
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
               for each(_loc9_ in this.§_-B3S§)
               {
                  if(_loc9_ is GameBody)
                  {
                     (_loc9_ as GameBody).fixed = !(_loc9_ as GameBody).fixed;
                  }
               }
         }
      }
      
      private function §_-H1A§(param1:Point) : Boolean
      {
         if(!this.§_-O20§.visible || !this.§_-V2m§(this.§_-O20§))
         {
            return false;
         }
         var _loc2_:int = getTimer();
         if(this.§_-L1r§ > 0 && _loc2_ - this.§_-L1r§ <= §_-33t§)
         {
            this.§_-L1r§ = 0;
            this.§_-o1h§();
            return true;
         }
         this.§_-L1r§ = _loc2_;
         this.§_-T2X§(param1);
         return true;
      }
      
      private function §_-T2X§(param1:Point) : void
      {
         this.dragObject = true;
         (this.map.game as §_-62b§).§_-Vb§();
         this.§_-J1J§ = false;
         this.§_-51m§ = param1;
      }
      
      private function §_-o1h§() : void
      {
         this.map.§_-W3§();
      }
      
      private function copy() : void
      {
         var _loc2_:§_-xn§ = null;
         var _loc3_:Array = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-B3S§)
         {
            if(_loc2_ is §_-3l§)
            {
               _loc1_.push([§_-f1b§.§_-q2W§(_loc2_),(_loc2_ as §_-3l§).§_-m1Y§()]);
            }
         }
         this.clear();
         for each(_loc3_ in _loc1_)
         {
            _loc2_ = new (§_-f1b§.§_-N1m§(_loc3_[0]) as Class)();
            (_loc2_ as §_-3l§).§_-o2I§(_loc3_[1]);
            this.map.add(_loc2_);
            this.add(_loc2_);
         }
      }
      
      private function §_-b2L§() : void
      {
         this.§_-q1T§.graphics.clear();
         this.§_-q1T§.graphics.beginFill(16580566,0.1);
         this.§_-q1T§.graphics.lineStyle(1,16777046);
         this.§_-q1T§.graphics.drawRect(this.§_-AW§.x,this.§_-AW§.y,this.§_-r9§.x - this.§_-AW§.x,this.§_-r9§.y - this.§_-AW§.y);
         this.§_-q1T§.graphics.lineStyle(0);
         this.§_-q1T§.graphics.endFill();
      }
      
      private function §_-c2t§() : void
      {
         this.§_-J1J§ = false;
         this.§_-AW§ = new Point();
         this.§_-r9§ = new Point();
         this.§_-b2L§();
      }
      
      private function §_-82c§(param1:§_-xn§) : Boolean
      {
         return this.§_-B3S§.indexOf(param1) > -1;
      }
      
      private function §_-5w§(param1:Point) : void
      {
         var _loc2_:§_-xn§ = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:b2Vec2 = null;
         var _loc9_:b2Vec2 = null;
         var _loc10_:Point = null;
         var _loc11_:Point = null;
         var _loc12_:Number = NaN;
         if(!this.§_-u2Y§ || !this.map || !this.map.§_-1l§)
         {
            return;
         }
         for each(_loc2_ in this.§_-B3S§)
         {
            if(_loc2_ is §_-9z§ && (_loc2_ as §_-9z§).§_-T1E§)
            {
               return;
            }
         }
         if(this.§_-k1k§ && !this.§_-51m§)
         {
            this.§_-r9§ = param1;
            this.§_-b2L§();
            return;
         }
         if(this.§_-83f§)
         {
            if(this.§_-B3S§.length == 1 && this.§_-B3S§[0] is §_-41O§ && this.§_-e26§())
            {
               _loc4_ = (this.§_-B3S§[0] as §_-aS§).globalToLocal(this.§_-z2x§);
               (this.§_-B3S§[0] as §_-41O§).size = new b2Vec2(_loc4_.x * 2 / Game.§_-12A§ / (this.map.game as §_-62b§).scale,_loc4_.y * 2 / Game.§_-12A§ / (this.map.game as §_-62b§).scale);
               this.§_-d2m§.x = (this.§_-B3S§[0] as §_-41O§).size.x * Game.§_-12A§ * 0.5 * (this.map.game as §_-62b§).scale;
               this.§_-d2m§.y = (this.§_-B3S§[0] as §_-41O§).size.y * Game.§_-12A§ * 0.5 * (this.map.game as §_-62b§).scale;
            }
            return;
         }
         if(this.§_-h2Q§)
         {
            if(this.§_-B3S§.length == 1 && this.§_-B3S§[0] is §_-41O§ && this.§_-e26§())
            {
               _loc5_ = (this.§_-B3S§[0] as §_-aS§).globalToLocal(this.§_-z2x§);
               _loc6_ = this.§_-n2J§.localToGlobal(new Point(this.§_-d2m§.x,this.§_-d2m§.y));
               _loc7_ = new Point(this.§_-d2m§.x,this.§_-d2m§.y).subtract(_loc5_);
               _loc8_ = (this.§_-B3S§[0] as §_-41O§).size.Copy();
               (this.§_-B3S§[0] as §_-41O§).size = new b2Vec2(_loc7_.x * 2 / Game.§_-12A§ / (this.map.game as §_-62b§).scale,_loc7_.y * 2 / Game.§_-12A§ / (this.map.game as §_-62b§).scale);
               _loc9_ = _loc8_.Copy();
               _loc9_.Subtract((this.§_-B3S§[0] as §_-41O§).size);
               if(_loc9_.x == 0 && _loc9_.y == 0)
               {
                  return;
               }
               _loc10_ = (this.§_-B3S§[0] as §_-aS§).parentStarling.globalToLocal(this.§_-n2J§.localToGlobal(_loc5_));
               (this.§_-B3S§[0] as §_-aS§).x = _loc10_.x;
               (this.§_-B3S§[0] as §_-aS§).y = _loc10_.y;
               this.§_-u9§ = this.§_-W1Z§;
               _loc11_ = this.§_-n2J§.localToGlobal(new Point(this.§_-d2m§.x,this.§_-d2m§.y));
               _loc5_ = _loc6_.subtract(_loc11_);
               (this.§_-B3S§[0] as §_-aS§).x += _loc5_.x / (this.map.game as §_-62b§).scale;
               (this.§_-B3S§[0] as §_-aS§).y += _loc5_.y / (this.map.game as §_-62b§).scale;
               this.§_-u9§ = this.§_-W1Z§;
            }
            return;
         }
         if(this.§_-Bj§)
         {
            this.§_-p2k§.x = param1.x;
            this.§_-p2k§.y = param1.y;
            _loc12_ = §_-iZ§.getAngle(this.§_-u9§,new Point(param1.x / (this.map.game as §_-62b§).scale,param1.y / (this.map.game as §_-62b§).scale)) - 90;
            this.rotate(_loc12_ - this.§_-B1b§);
            this.§_-B1b§ = _loc12_;
            return;
         }
         if(this.§_-51m§ == null)
         {
            return;
         }
         var _loc3_:Point = param1.subtract(this.§_-51m§);
         if(this.§_-X21§)
         {
            if(!(this.map.game as §_-62b§).§_-l2y§(this.§_-z2x§))
            {
               this.§_-51m§ = param1;
               return;
            }
            _loc3_ = new Point(_loc3_.x * (this.map.game as §_-62b§).scale,_loc3_.y * (this.map.game as §_-62b§).scale);
            this.map.game.shift = this.map.game.shift.add(_loc3_);
            return;
         }
         this.§_-51m§ = param1;
         this.§_-92w§(_loc3_);
         if(!this.§_-J1J§)
         {
            return;
         }
         this.§_-J1J§ = false;
         this.§_-AW§ = param1;
         this.§_-r9§ = param1;
         this.§_-b2L§();
      }
      
      private function §_-eG§(param1:Point) : void
      {
         var _loc2_:int = 0;
         if(this.map.§_-s6§)
         {
            return;
         }
         if(this.§_-Gl§ && !this.§_-A3S§(this.§_-z2x§))
         {
            return;
         }
         this.§_-8R§(true);
         this.§_-J1J§ = false;
         this.§_-51m§ = null;
         this.§_-k1k§ = false;
         this.§_-h2Q§ = false;
         this.§_-X21§ = false;
         this.§_-Bj§ = false;
         this.§_-83f§ = false;
         if(this.§_-Gl§)
         {
            this.§_-51m§ = param1;
            this.§_-X21§ = true;
            return;
         }
         if(this.§_-p2k§.visible && this.§_-V2m§(this.§_-p2k§))
         {
            this.§_-Bj§ = true;
            (this.map.game as §_-62b§).§_-Vb§();
            return;
         }
         if(Boolean(this.§_-d2m§.visible) && this.§_-V2m§(this.§_-d2m§))
         {
            this.§_-83f§ = true;
            this.§_-Cz§();
            return;
         }
         if(Boolean(this.§_-z1b§.visible) && this.§_-V2m§(this.§_-z1b§))
         {
            this.§_-h2Q§ = true;
            this.§_-Cz§();
            return;
         }
         if(this.§_-63P§.visible && this.§_-V2m§(this.§_-63P§))
         {
            this.§_-xu§();
            this.§_-D2D§();
            return;
         }
         if(Boolean(this.§_-l1d§.visible) && this.§_-V2m§(this.§_-l1d§))
         {
            (this.§_-B3S§[0] as §_-A§).§_-zq§(this.§_-B3S§.slice(1));
            _loc2_ = 1;
            while(_loc2_ < this.§_-B3S§.length)
            {
               (this.§_-B3S§[_loc2_] as §_-A§).§_-zq§(this.§_-B3S§.slice(0,_loc2_).concat(this.§_-B3S§.slice(_loc2_ + 1)));
               _loc2_++;
            }
            this.§_-D2D§();
            return;
         }
         if(this.§_-72§.visible && this.§_-V2m§(this.§_-72§))
         {
            this.§_-fH§(1);
            this.§_-D2D§();
            return;
         }
         if(this.§_-12R§.visible && this.§_-V2m§(this.§_-12R§))
         {
            this.§_-fH§(-1);
            this.§_-D2D§();
            return;
         }
         if(this.§_-7x§.visible && this.§_-V2m§(this.§_-7x§))
         {
            this.copy();
            this.§_-D2D§();
            return;
         }
         if(this.§_-83T§.visible && this.§_-V2m§(this.§_-83T§))
         {
            this.§_-o1h§();
            this.§_-D2D§();
            return;
         }
         if(this.§_-H1A§(param1))
         {
            return;
         }
         if((this.map.game as §_-62b§).§_-l1K§.§_-eG§(this.§_-z2x§))
         {
            this.§_-D2D§();
            return;
         }
         this.§_-x2e§ = this.map.§_-t1J§(this.§_-5b§);
         if(this.§_-x2e§ is §_-9z§ && (this.§_-x2e§ as §_-9z§).§_-qI§(this.§_-5b§))
         {
            this.§_-x2e§ = null;
            this.§_-a2N§ = true;
         }
         else
         {
            this.§_-a2N§ = false;
         }
         if(this.§_-x2e§)
         {
            this.§_-J1J§ = true;
            this.§_-51m§ = param1;
         }
         this.§_-AW§ = param1;
         this.§_-r9§ = param1;
         this.§_-k1k§ = !this.§_-J1J§;
         this.§_-b2L§();
      }
      
      private function §_-S2H§() : void
      {
         var _loc5_:* = undefined;
         var _loc6_:Array = null;
         var _loc7_:§_-xn§ = null;
         if(!this.§_-u2Y§)
         {
            return;
         }
         this.§_-8R§(false);
         if(this.§_-a2N§)
         {
            this.§_-a2N§ = false;
            this.§_-51m§ = null;
            this.§_-k1k§ = true;
            this.§_-c2t§();
            return;
         }
         var _loc1_:Boolean = this.§_-Bj§;
         var _loc2_:Boolean = this.§_-83f§ || this.§_-h2Q§;
         var _loc3_:Boolean = this.dragObject;
         var _loc4_:Boolean = this.§_-X21§;
         this.§_-51m§ = null;
         this.§_-k1k§ = true;
         this.§_-Bj§ = false;
         this.§_-h2Q§ = false;
         this.§_-83f§ = false;
         this.§_-X21§ = false;
         this.dragObject = false;
         if(_loc1_)
         {
            for(_loc5_ in this.§_-A3r§)
            {
               if(_loc5_ is §_-81a§)
               {
                  (_loc5_ as §_-51g§).rotation = (_loc5_ as §_-81a§).§_-U14§((_loc5_ as §_-51g§).rotation);
               }
            }
            this.§_-u9§ = this.§_-W1Z§;
         }
         if(_loc2_ || _loc3_ || _loc1_ || _loc4_)
         {
            if(_loc2_)
            {
               this.§_-E1o§();
               this.§_-a2N§ = true;
            }
            this.§_-c2t§();
            return;
         }
         if(this.visible && !this.map.§_-Wf§())
         {
            _loc6_ = this.map.get(§_-xn§,true);
            this.clear();
            if(this.§_-q1T§.width < 10 && this.§_-q1T§.height < 10)
            {
               if(Boolean(this.§_-x2e§) && this.§_-x2e§ is §_-xn§)
               {
                  this.add(this.§_-x2e§ as §_-xn§);
               }
               this.§_-x2e§ = null;
            }
            else
            {
               for each(_loc7_ in _loc6_)
               {
                  if(_loc7_ is §_-51g§)
                  {
                     if(this.§_-N2M§(_loc7_ as §_-aS§,this.§_-q1T§))
                     {
                        this.add(_loc7_);
                     }
                  }
               }
            }
         }
         this.§_-c2t§();
      }
      
      private function §_-P2d§(param1:§_-J1a§) : Point
      {
         this.§_-z2x§.setTo(Game.stage.mouseX,Game.stage.mouseY);
         this.§_-5b§ = param1.§_-13l§(§_-817§.instance);
         return this.map.globalToLocal(this.§_-z2x§);
      }
      
      private function §_-nN§() : void
      {
         if(!this.§_-Gl§)
         {
            return;
         }
         Mouse.cursor = this.§_-A3S§(this.§_-z2x§) ? MouseCursor.HAND : MouseCursor.AUTO;
      }
      
      private function §_-A3S§(param1:Point) : Boolean
      {
         var _loc2_:§_-62b§ = this.map.game as §_-62b§;
         return _loc2_.§_-l2y§(param1) && !_loc2_.§_-l1K§.§_-w2x§(param1);
      }
      
      private function §_-z2§(param1:MouseEvent) : void
      {
         if(this.§_-u2Y§)
         {
            return;
         }
         this.§_-z2x§.setTo(param1.stageX,param1.stageY);
         this.§_-nN§();
      }
      
      private function §_-8R§(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.§_-u2Y§)
            {
               return;
            }
            this.§_-u2Y§ = true;
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-WQ§,false,0,true);
            Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-WQ§,false,0,true);
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-WQ§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-WQ§);
         this.§_-u2Y§ = false;
      }
      
      private function §_-D2D§() : void
      {
         this.§_-8R§(false);
         this.§_-k1k§ = true;
      }
      
      private function §_-WQ§(param1:MouseEvent) : void
      {
         if(!this.§_-u2Y§)
         {
            return;
         }
         if(§_-Zy§.§_-e2k§)
         {
            if(param1.type == MouseEvent.MOUSE_UP)
            {
               this.§_-S2H§();
            }
            return;
         }
         if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            if(param1.buttonDown)
            {
               this.§_-z2x§.setTo(param1.stageX,param1.stageY);
               this.§_-5w§(this.map.globalToLocal(this.§_-z2x§));
               return;
            }
            this.§_-S2H§();
            return;
         }
         if(param1.type == MouseEvent.MOUSE_UP)
         {
            this.§_-S2H§();
         }
      }
      
      private function §_-Cz§() : void
      {
         var _loc1_:§_-aS§ = null;
         this.§_-Fv§();
         if(this.§_-B3S§.length != 1 || !(this.§_-B3S§[0] is §_-41O§))
         {
            return;
         }
         this.§_-o1n§ = this.§_-z2x§.clone();
         this.§_-xt§ = (this.§_-B3S§[0] as §_-41O§).size.Copy();
         if(this.§_-B3S§[0] is §_-aS§)
         {
            _loc1_ = this.§_-B3S§[0] as §_-aS§;
            this.§_-AX§ = new Point(_loc1_.x,_loc1_.y);
         }
      }
      
      private function §_-e26§() : Boolean
      {
         if(this.§_-2z§)
         {
            return true;
         }
         if(!this.§_-o1n§)
         {
            return false;
         }
         if(this.§_-z2x§.subtract(this.§_-o1n§).length < §_-h2O§)
         {
            return false;
         }
         this.§_-2z§ = true;
         (this.map.game as §_-62b§).§_-Vb§();
         return true;
      }
      
      private function §_-E1o§() : void
      {
         if(!this.§_-2z§ && this.§_-B3S§.length == 1 && this.§_-B3S§[0] is §_-41O§ && Boolean(this.§_-xt§))
         {
            (this.§_-B3S§[0] as §_-41O§).size = this.§_-xt§;
            if(Boolean(this.§_-AX§) && this.§_-B3S§[0] is §_-aS§)
            {
               (this.§_-B3S§[0] as §_-aS§).x = this.§_-AX§.x;
               (this.§_-B3S§[0] as §_-aS§).y = this.§_-AX§.y;
            }
            this.§_-M2V§();
            this.§_-u9§ = this.§_-W1Z§;
         }
         this.§_-Fv§();
      }
      
      private function §_-Fv§() : void
      {
         this.§_-o1n§ = null;
         this.§_-2z§ = false;
         this.§_-xt§ = null;
         this.§_-AX§ = null;
      }
      
      private function §_-V2m§(param1:DisplayObject) : Boolean
      {
         if(!param1 || !param1.visible || !param1.stage)
         {
            return false;
         }
         var _loc2_:Rectangle = param1.getBounds(param1.stage);
         if(§_-Zy§.§_-e2k§)
         {
            _loc2_.inflate(§_-w2e§,§_-w2e§);
         }
         return _loc2_.contains(this.§_-z2x§.x,this.§_-z2x§.y);
      }
      
      private function §_-N2M§(param1:*, param2:DisplayObject) : Boolean
      {
         var _loc3_:Rectangle = param2.getRect(Game.stage);
         var _loc4_:Rectangle = §_-aS§(param1).boundsStarling();
         var _loc5_:Number = (this.map.game as §_-62b§).scale;
         return _loc4_.left * _loc5_ + this.map.x >= _loc3_.left - Game.§_-q1L§.x && _loc4_.right * _loc5_ + this.map.x <= _loc3_.right - Game.§_-q1L§.x && _loc4_.top * _loc5_ + this.map.y >= _loc3_.top - Game.§_-q1L§.y && _loc4_.bottom * _loc5_ + this.map.y <= _loc3_.bottom - Game.§_-q1L§.y;
      }
      
      private function §_-92w§(param1:Point) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.§_-B3S§)
         {
            _loc2_.x += param1.x / (this.map.game as §_-62b§).scale;
            _loc2_.y += param1.y / (this.map.game as §_-62b§).scale;
         }
         this.§_-u9§ = this.§_-W1Z§;
      }
      
      private function §_-614§(param1:Number, param2:Number, param3:Boolean) : void
      {
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc4_:Array = [this.§_-p2k§,this.§_-63P§,this.§_-83T§,this.§_-7x§,this.§_-12R§,this.§_-72§];
         if(this.§_-2h§())
         {
            _loc4_.push(this.§_-l1d§);
         }
         var _loc5_:Boolean = this.§_-B3S§.length == 1 && this.§_-B3S§[0] is §_-41O§;
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
            _loc4_[_loc9_].x = param1 + Math.cos(_loc10_) * §_-jd§;
            _loc4_[_loc9_].y = param2 + Math.sin(_loc10_) * §_-jd§;
            _loc4_[_loc9_].visible = param3;
            _loc9_++;
         }
         this.§_-l1d§.visible = param3 && this.§_-2h§();
      }
      
      private function §_-2h§() : Boolean
      {
         var _loc1_:DisplayObject = null;
         if(this.§_-B3S§.length < 2)
         {
            return false;
         }
         for each(_loc1_ in this.§_-B3S§)
         {
            if(!(_loc1_ is §_-g2b§))
            {
               return this.§_-B3S§.length == 2 && (this.§_-B3S§[0] is GameBody && this.§_-B3S§[1] is §_-g2b§ || this.§_-B3S§[1] is GameBody && this.§_-B3S§[0] is §_-g2b§);
            }
         }
         return true;
      }
      
      private function §_-fH§(param1:int) : void
      {
         var _loc2_:§_-xn§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         for each(_loc2_ in this.§_-B3S§)
         {
            _loc3_ = this.map.§_-j1c§().indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               _loc4_ = _loc3_ + param1;
               if(_loc4_ > this.map.§_-j1c§().length)
               {
                  _loc4_ = int(this.map.§_-j1c§().length);
               }
               if(_loc4_ < 0)
               {
                  _loc4_ = 0;
               }
               _loc5_ = this.map.§_-j1c§()[_loc3_];
               this.map.§_-j1c§().splice(_loc3_,1);
               this.map.§_-j1c§().splice(_loc4_,0,_loc5_);
               (_loc5_ as §_-aS§).lastIndex = this.map.§_-j1c§().indexOf(_loc2_);
               this.map.§_-1l§.§_-D2f§(_loc5_ as §_-aS§,_loc4_ + 1);
            }
         }
      }
      
      private function §_-M2V§() : void
      {
         this.§_-d2m§.visible = this.§_-z1b§.visible = this.§_-B3S§.length == 1 && this.§_-B3S§[0] is §_-41O§;
         if(!this.§_-d2m§.visible)
         {
            return;
         }
         var _loc1_:b2Vec2 = (this.§_-B3S§[0] as §_-41O§).size.Copy();
         _loc1_.Multiply(0.5);
         _loc1_.Multiply(Game.§_-12A§);
         this.§_-d2m§.x = _loc1_.x * (this.map.game as §_-62b§).scale + 5;
         this.§_-d2m§.y = _loc1_.y * (this.map.game as §_-62b§).scale + 5;
         this.§_-z1b§.x = -this.§_-z1b§.width - 5;
         this.§_-z1b§.y = -this.§_-z1b§.height - 5;
         this.§_-n2J§.x = this.§_-B3S§[0].position.x * Game.§_-12A§ * (this.map.game as §_-62b§).scale;
         this.§_-n2J§.y = this.§_-B3S§[0].position.y * Game.§_-12A§ * (this.map.game as §_-62b§).scale;
         this.§_-n2J§.rotation = this.§_-B3S§[0].angle / Game.D2R;
      }
      
      private function §_-u2I§() : void
      {
         if(!this.map || this.§_-B3S§.length == 0)
         {
            this.§_-l1d§.visible = false;
            return;
         }
         var _loc1_:Number = (this.map.game as §_-62b§).scale;
         this.§_-614§(this.§_-J0§.x * _loc1_,this.§_-J0§.y * _loc1_,true);
      }
   }
}

