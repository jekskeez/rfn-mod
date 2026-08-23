package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-1T§.DisplayObjectManager;
   import §_-1T§.§_-02y§;
   import §_-83V§.GameBody;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-83V§.§_-o29§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-A2E§.§_-H1F§;
   import §_-B1O§.§_-M2b§;
   import §_-B1O§.§_-f24§;
   import §_-B1O§.§_-g2z§;
   import §_-B1O§.§_-rJ§;
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-Rn§.§_-I2G§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-s1i§;
   import §_-Y22§.§_-C2x§;
   import §_-ZS§.§_-93d§;
   import §_-t1l§.§_-m28§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-o1s§;
   import game.mainGame.entity.§_-p19§;
   import game.mainGame.entity.§_-w2n§;
   import particles.Explode;
   import particles.§_-Sx§;
   import starling.core.Starling;
   import starling.display.BlendMode;
   import starling.display.§_-jH§;
   import starling.display.§_-t2M§;
   import utils.§_-vS§;
   
   public class GameMap extends §_-h2I§ implements §_-Tm§, §_-C2x§, §_-03u§
   {
      
      public static var §_-q1n§:int = §_-a9§.§_-9o§;
      
      public static var §_-P1Q§:int = §_-a9§.§_-31m§;
      
      private static var _instance:GameMap = null;
      
      public var game:SquirrelGame = null;
      
      public var backgroundLayer0:§_-jH§ = null;
      
      public var backgroundLayer1:§_-jH§ = null;
      
      public var §_-gY§:§_-h2I§ = new §_-h2I§();
      
      public var §_-52P§:§_-t2M§;
      
      public var §_-u1T§:Array = [];
      
      public var portals:§_-R2L§ = new §_-R2L§();
      
      public var §_-kz§:§_-h2I§ = new §_-h2I§();
      
      public var §_-G12§:§_-h2I§ = new §_-h2I§();
      
      public var §_-l2j§:§_-Sx§ = null;
      
      public var §_-X1H§:Sprite = new Sprite();
      
      public var userUpperSprite:Sprite = new Sprite();
      
      public var §_-E7§:Boolean = false;
      
      public var elements:Object = {};
      
      public var §_-C2H§:int = 0;
      
      public var §_-ro§:b2Vec2 = null;
      
      protected var §_-Df§:Shape = new Shape();
      
      protected var objects:Array = [];
      
      protected var §_-X2k§:Array = [];
      
      protected var §_-w19§:b2Vec2 = null;
      
      protected var §_-f1d§:Array = [];
      
      protected var §_-t2R§:Boolean = false;
      
      protected var §_-O5§:Boolean = false;
      
      private var §_-Z2m§:§_-93d§ = §_-93d§.instance;
      
      private var §_-s1Y§:Point = new Point(§_-a9§.§_-9o§,§_-a9§.§_-31m§);
      
      public function GameMap(param1:SquirrelGame)
      {
         _instance = this;
         §_-TQ§.add("GameMap.GameMap");
         §_-vS§.§_-41D§(this);
         super();
         §_-TQ§.add("GameMap.GameMap init ParticleEngine");
         this.§_-l2j§ = new §_-Sx§();
         Explode.§_-rq§ = this.§_-l2j§;
         this.game = param1;
         this.§_-O5§ = this.game is §_-m28§;
         §_-TQ§.add("GameMap.GameMap init background");
         §_-s1i§.instance.addChildAt(this.§_-gY§.getStarlingView(),0);
         §_-s1i§.§_-z2D§.addChild(this.getStarlingView());
         this.§_-R5§();
         §_-TQ§.add("GameMap.GameMap adding sprites");
         this.addChild(this.§_-X1H§);
         this.§_-83v§(this.§_-kz§);
         this.addChild(this.§_-kz§);
         this.§_-83v§(this.§_-l2j§);
         this.addChild(this.userUpperSprite);
         this.§_-s2z§();
         §_-TQ§.add("GameMap.GameMap set frameRate");
         Starling.§_-y1l§.§_-gQ§.frameRate = 60;
         §_-TQ§.add("GameMap.GameMap FullScreenManager");
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         §_-TQ§.add("GameMap.GameMap Finish");
         this.§_-G12§.touchable = false;
         this.addChild(this.§_-Df§);
      }
      
      public static function get instance() : GameMap
      {
         return _instance;
      }
      
      override public function set x(param1:Number) : void
      {
         this.§_-Z2m§.§_-dW§ = param1;
         super.x = param1;
         this.§_-g1d§(this.x,this.y);
      }
      
      override public function set y(param1:Number) : void
      {
         this.§_-Z2m§.§_-d19§ = param1;
         super.y = param1;
         this.§_-g1d§(this.x,this.y);
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         if(param1 is §_-63Q§)
         {
            return this.§_-kz§.addChild(param1);
         }
         return super.addChild(param1);
      }
      
      override public function removeChildStarling(param1:*, param2:Boolean = true) : void
      {
         if(param1.parentStarling == this.§_-kz§)
         {
            this.§_-kz§.removeChildStarling(param1,param2);
         }
         if(param1.parentStarling == this)
         {
            super.removeChildStarling(param1,param2);
         }
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         if(param1 is §_-63Q§ && param1.parent == this.§_-kz§)
         {
            return this.§_-kz§.removeChild(param1);
         }
         if(param1.parent == this)
         {
            return super.removeChild(param1);
         }
         return param1;
      }
      
      override public function §_-83v§(param1:*) : *
      {
         if(param1 is §_-63Q§)
         {
            param1.parentStarling = this.§_-kz§;
            this.§_-kz§.§_-83v§(param1 as §_-h2I§);
            return param1;
         }
         return super.§_-83v§(param1);
      }
      
      public function §_-8q§() : Array
      {
         return this.objects;
      }
      
      public function round(param1:Array) : void
      {
      }
      
      public function get gravity() : b2Vec2
      {
         return this.game.gravity;
      }
      
      public function set gravity(param1:b2Vec2) : void
      {
         this.game.gravity = param1;
      }
      
      public function set shift(param1:Point) : void
      {
         this.x = int(param1.x);
         this.y = int(param1.y);
      }
      
      public function isEmpty() : Boolean
      {
         return this.objects.length == 0;
      }
      
      public function get §_-P2y§() : §_-h2I§
      {
         return this.§_-G12§;
      }
      
      public function §_-g1Z§() : void
      {
         if(this.§_-52P§)
         {
            this.§_-52P§.removeFromParent(true);
         }
         DisplayObjectManager.getInstance().remove(this.backgroundLayer0);
         if(this.backgroundLayer0)
         {
            this.backgroundLayer0.removeFromParent(true);
         }
         DisplayObjectManager.getInstance().remove(this.backgroundLayer1);
         if(this.backgroundLayer1)
         {
            this.backgroundLayer1.removeFromParent(true);
         }
         while(this.§_-gY§.numChildren > 0)
         {
            this.§_-gY§.§_-n2T§(0);
         }
         this.backgroundLayer0 = null;
         this.backgroundLayer1 = null;
         this.§_-52P§ = null;
         this.§_-R5§();
      }
      
      public function §_-v2t§(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc6_:§_-h2I§ = null;
         var _loc7_:§_-h2I§ = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:* = undefined;
         var _loc11_:Rectangle = null;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc3_:Number = -x + §_-q1n§;
         var _loc4_:Number = -y + §_-P1Q§;
         var _loc5_:Vector.<§_-h2I§> = new Vector.<§_-h2I§>(0);
         for each(_loc6_ in this.objects)
         {
            if(_loc6_)
            {
               _loc8_ = _loc6_ is §_-v2j§;
               _loc9_ = _loc6_ is §_-B35§;
               if(!(!_loc8_ && !_loc9_))
               {
                  _loc10_ = _loc6_.parentStarling;
                  if(_loc10_ != this.§_-kz§)
                  {
                     if(_loc6_.§_-C20§ <= 0)
                     {
                        _loc6_.§_-IB§();
                     }
                  }
                  else
                  {
                     _loc11_ = _loc6_.boundsStarling();
                     if(_loc11_.right < -x || _loc11_.bottom < -y || _loc11_.left > _loc3_ || _loc11_.top > _loc4_)
                     {
                        if(_loc6_.§_-C20§ > 0)
                        {
                           _loc6_.§_-gS§();
                        }
                     }
                     else
                     {
                        if(_loc6_.§_-C20§ <= 0)
                        {
                           _loc6_.§_-IB§();
                        }
                        if(_loc9_)
                        {
                           _loc5_.push(_loc6_);
                        }
                     }
                  }
               }
            }
         }
         for each(_loc7_ in _loc5_)
         {
            _loc12_ = this.§_-G12§.§_-ws§(_loc7_);
            _loc13_ = this.§_-kz§.§_-ws§(_loc7_);
            if(!param1 && !_loc12_ && !param2)
            {
               this.§_-G12§.§_-83v§(_loc7_);
            }
            else if(!_loc13_ && !_loc12_)
            {
               this.§_-kz§.§_-83v§(_loc7_);
            }
            else if(param2 && _loc12_ && !_loc13_)
            {
               this.§_-kz§.§_-83v§(_loc7_);
            }
         }
      }
      
      public function §_-nA§(param1:§_-63Q§, param2:Boolean) : void
      {
         this.add(param1);
         if(param2)
         {
            param1.build(this.game.world);
         }
      }
      
      public function §_-Qc§(param1:§_-63Q§, param2:Boolean) : void
      {
         this.remove(param1,param2);
      }
      
      public function add(param1:* = null) : void
      {
         §_-vS§.§_-41D§(param1);
         if(param1 is §_-H1F§)
         {
            this.§_-X2k§.push(param1);
         }
         else
         {
            this.objects.push(param1);
         }
         if(param1 is §_-v2j§ && param1.parentStarling == null)
         {
            (param1 as §_-h2I§).lastIndex = this.objects.length;
            this.§_-83v§(param1);
            if((param1 as §_-h2I§).§_-j2Z§())
            {
               this.addChild(param1);
            }
         }
         else if(param1 is DisplayObject && param1.parent == null)
         {
            this.addChild(param1);
         }
         if(param1 is §_-72o§)
         {
            (param1 as §_-72o§).§_-t2Q§(this);
         }
         if(param1 is §_-jP§)
         {
            this.game.§_-A3o§.§_-P2Y§(param1 as §_-jP§);
         }
         if(param1 is §_-o1s§)
         {
            (param1 as §_-o1s§).visible = false;
         }
         if(param1 is §_-p19§)
         {
            this.game.§_-i2k§.addObject(param1);
         }
      }
      
      public function §_-xL§(param1:String) : §_-63Q§
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ != null)
            {
               if(_loc2_.name == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function §_-F2W§(param1:§_-63Q§) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         return this.objects.indexOf(param1);
      }
      
      public function getObject(param1:int) : §_-63Q§
      {
         if(param1 in this.objects)
         {
            return this.objects[param1];
         }
         return null;
      }
      
      public function remove(param1:*, param2:Boolean = false) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         if(param1 == null)
         {
            return;
         }
         if(param1 is int)
         {
            if(this.objects[param1] == null)
            {
               return;
            }
            if(contains(this.objects[param1]))
            {
               this.removeChild(this.objects[param1]);
            }
            if(§_-ws§(this.objects[param1]) && this.objects[param1] is §_-v2j§)
            {
               this.removeChildStarling(this.objects[param1],param2);
            }
            _loc3_ = this.objects[param1];
            this.objects[param1] = null;
            if(_loc3_ is §_-72o§)
            {
               (_loc3_ as §_-72o§).§_-u2q§(this);
            }
            if(param2 && _loc3_ is §_-C2x§)
            {
               _loc3_.dispose();
            }
            if(_loc3_ is §_-jP§)
            {
               this.game.§_-A3o§.remove(_loc3_);
            }
            if(_loc3_ is §_-p19§)
            {
               this.game.§_-i2k§.removeObject(_loc3_);
            }
            §_-vS§.§_-324§(_loc3_);
         }
         else
         {
            for(_loc4_ in this.objects)
            {
               if(this.objects[_loc4_] == param1)
               {
                  if(contains(this.objects[_loc4_]))
                  {
                     this.removeChild(this.objects[_loc4_]);
                  }
                  else if(§_-ws§(this.objects[_loc4_]) && this.objects[_loc4_] is §_-v2j§)
                  {
                     this.removeChildStarling(this.objects[_loc4_],param2);
                  }
                  this.objects[_loc4_] = null;
                  if(param1 is §_-72o§)
                  {
                     (param1 as §_-72o§).§_-u2q§(this);
                  }
                  if(param1 is §_-jP§)
                  {
                     this.game.§_-A3o§.remove(param1);
                  }
                  if(param1 is §_-p19§)
                  {
                     this.game.§_-i2k§.removeObject(param1);
                  }
                  if(param2 && param1 is §_-C2x§)
                  {
                     param1.dispose();
                  }
                  §_-vS§.§_-324§(param1);
                  break;
               }
            }
         }
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.§_-sb§(param1);
      }
      
      public function get isBrokenWorld() : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:b2Vec2 = null;
         var _loc1_:Array = this.get(§_-Q1J§,true).concat(this.get(§_-P2o§));
         var _loc2_:int = int(_loc1_.length);
         if(_loc2_ < 2)
         {
            return false;
         }
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_ - 1)
         {
            _loc5_ = _loc4_ + 1;
            while(_loc5_ < _loc2_)
            {
               _loc6_ = (_loc1_[_loc4_] as GameBody).position.Copy();
               _loc6_.Subtract((_loc1_[_loc5_] as GameBody).position);
               _loc3_ += _loc6_.Length();
               _loc5_++;
            }
            _loc4_++;
         }
         _loc3_ /= _loc2_ * (_loc2_ - 1) * 0.5;
         §_-TQ§.add("isBrokenWorld",_loc3_);
         return isNaN(_loc3_);
      }
      
      public function §_-52K§(param1:Array) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:Class = null;
         var _loc7_:§_-63Q§ = null;
         var _loc8_:Array = null;
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         var _loc4_:int = _loc2_;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            if(_loc5_ == "")
            {
               this.add(null);
            }
            else
            {
               _loc6_ = §_-03s§.§_-F1T§(_loc5_[0]);
               if(!_loc6_)
               {
                  this.add(null);
               }
               else
               {
                  _loc7_ = new _loc6_();
                  if(_loc7_ is §_-03u§)
                  {
                     (_loc7_ as §_-03u§).§_-41M§(_loc5_[1]);
                  }
                  if(_loc7_ is §_-v2j§ && _loc5_.length == 3)
                  {
                     _loc8_ = _loc5_[2];
                     (_loc7_ as §_-v2j§).name = _loc8_[0];
                     (_loc7_ as §_-v2j§).alpha = _loc8_[1];
                  }
                  this.add(_loc7_);
                  if(_loc7_ is §_-o29§)
                  {
                     this.elements[(_loc7_ as §_-o29§).index] = _loc7_;
                  }
               }
            }
            _loc3_++;
         }
         if(§_-71o§.active is §_-92z§ && (§_-92z§.location == §_-q1p§.§_-C25§ || §_-92z§.location == §_-q1p§.§_-X1n§) || §_-71o§.active is §_-F29§)
         {
            for each(_loc7_ in this.objects)
            {
               this.§_-E7§ = _loc7_ is §_-g2z§;
               if(this.§_-E7§)
               {
                  break;
               }
            }
            this.§_-g1Z§();
         }
         else
         {
            this.§_-E7§ = false;
         }
         for each(_loc7_ in this.objects)
         {
            if(_loc7_ is §_-w2n§)
            {
               (_loc7_ as §_-w2n§).§_-8i§(this);
            }
         }
         this.§_-v2t§();
      }
      
      public function removeObject(param1:*) : void
      {
         if(param1 is §_-63Q§)
         {
            setTimeout(this.remove,0,param1,true);
         }
         else
         {
            setTimeout(this.remove,0,this.§_-xL§(String(param1)),true);
         }
      }
      
      public function addObject(param1:*, param2:Number, param3:Number, param4:Number, param5:Boolean = true) : §_-63Q§
      {
         if(param1 is Class)
         {
            param1 = §_-03s§.§_-X21§(param1);
         }
         if(param1 is String)
         {
            param1 = §_-03s§.§_-Q2w§(param1);
         }
         var _loc6_:§_-63Q§ = new (§_-03s§.§_-F1T§(param1))();
         _loc6_.position = new b2Vec2(param2 / Game.§_-x2P§,param3 / Game.§_-x2P§);
         _loc6_.angle = param4 * Game.D2R;
         this.add(_loc6_);
         if(_loc6_ is §_-Q1J§)
         {
            (_loc6_ as §_-Q1J§).game = this.game;
            (_loc6_ as §_-Q1J§).addEventListener(HollowEvent.§_-63s§,this.onHollow,false,0,true);
         }
         if(_loc6_ is §_-P2o§)
         {
            (_loc6_ as §_-P2o§).addEventListener(SquirrelEvent.§_-62z§,this.§_-92T§,false,0,true);
         }
         this.§_-O2J§(_loc6_);
         if(param5 && Boolean(_loc6_))
         {
            setTimeout(this.§_-lD§,0,_loc6_);
         }
         return _loc6_;
      }
      
      public function §_-A1X§() : *
      {
         return JSON.stringify(this.§_-931§());
      }
      
      public function get §_-c2O§() : Vector.<b2Vec2>
      {
         var _loc3_:§_-63Q§ = null;
         var _loc1_:Array = this.get(§_-f24§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
      
      public function get §_-p2U§() : Vector.<b2Vec2>
      {
         var _loc3_:§_-63Q§ = null;
         var _loc1_:Array = this.get(§_-rJ§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
      
      public function get size() : Point
      {
         return this.§_-s1Y§;
      }
      
      public function set size(param1:Point) : void
      {
         this.§_-s1Y§ = param1;
         if(this.§_-Df§)
         {
            this.§_-Df§.graphics.clear();
            this.§_-Df§.graphics.lineStyle(5,16763955,0.5);
            this.§_-Df§.graphics.drawRect(0,§_-a9§.§_-31m§,this.size.x,-this.size.y);
         }
      }
      
      public function get(param1:Class, param2:Boolean = false) : Array
      {
         var _loc4_:* = undefined;
         var _loc3_:Array = [];
         for each(_loc4_ in this.objects)
         {
            if(!param2 && getQualifiedClassName(_loc4_) == getQualifiedClassName(param1) || param2 && _loc4_ is param1)
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public function §_-2S§(param1:Class) : Boolean
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.objects)
         {
            if(getQualifiedClassName(_loc2_) == getQualifiedClassName(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-438§() : int
      {
         return this.get(§_-f24§).concat(this.get(§_-rJ§)).length;
      }
      
      public function build(param1:b2World) : void
      {
         var _loc2_:* = undefined;
         §_-TQ§.§_-V2L§("GameMap.build");
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ is §_-63Q§ && !(_loc2_ is §_-I2G§))
            {
               _loc2_.build(param1);
            }
         }
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ is §_-63Q§ && _loc2_ is §_-I2G§)
            {
               _loc2_.build(param1);
            }
            if(_loc2_ is §_-Q1J§)
            {
               _loc2_.game = this.game;
               _loc2_.addEventListener(HollowEvent.§_-63s§,this.onHollow,false,0,true);
            }
            if(_loc2_ is §_-P2o§)
            {
               _loc2_.addEventListener(SquirrelEvent.§_-62z§,this.§_-92T§,false,0,true);
               this.§_-w19§ = _loc2_.position;
            }
            if(_loc2_ is §_-M2b§)
            {
               _loc2_.addEventListener(SquirrelEvent.§_-8E§,this.§_-z2§,false,0,true);
            }
            this.§_-O2J§(_loc2_);
         }
         §_-TQ§.§_-p1§("GameMap.build");
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.objects.concat(this.§_-X2k§))
         {
            if(_loc2_ is §_-Tm§)
            {
               _loc2_.update(param1);
            }
         }
         this.§_-v2t§();
         this.portals.§_-3s§();
         this.§_-l2j§.§_-E1n§(param1);
      }
      
      public function clear() : void
      {
         var _loc1_:* = undefined;
         if(this.portals)
         {
            this.portals.reset();
         }
         this.elements = {};
         while(this.objects.length > 0)
         {
            _loc1_ = this.objects.pop();
            if(_loc1_ is §_-jP§)
            {
               this.game.§_-A3o§.remove(_loc1_);
            }
            if(_loc1_ is §_-p19§)
            {
               this.game.§_-i2k§.removeObject(_loc1_);
            }
            if(_loc1_ is §_-C2x§)
            {
               _loc1_.dispose();
            }
            §_-vS§.§_-324§(_loc1_);
         }
         while(this.§_-X2k§.length > 0)
         {
            _loc1_ = this.§_-X2k§.pop();
            if(_loc1_ is §_-C2x§)
            {
               _loc1_.dispose();
            }
         }
         while(this.§_-X1H§.numChildren > 0)
         {
            this.§_-X1H§.removeChildAt(0);
         }
         while(this.userUpperSprite.numChildren > 0)
         {
            this.userUpperSprite.removeChildAt(0);
         }
         this.objects = [];
         this.§_-ro§ = null;
         this.§_-l2j§.clear();
      }
      
      public function dispose() : void
      {
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         §_-02y§.getInstance().§_-fX§();
         §_-02y§.getInstance().§_-f2v§();
         if(this.§_-52P§)
         {
            this.§_-52P§.removeFromParent(true);
         }
         DisplayObjectManager.getInstance().remove(this.backgroundLayer0);
         if(this.backgroundLayer0)
         {
            this.backgroundLayer0.removeFromParent(true);
         }
         DisplayObjectManager.getInstance().remove(this.backgroundLayer1);
         if(this.backgroundLayer1)
         {
            this.backgroundLayer1.removeFromParent(true);
         }
         while(this.§_-kz§.numChildren > 0)
         {
            this.§_-kz§.§_-n2T§(0,true);
         }
         while(this.§_-G12§.numChildren > 0)
         {
            this.§_-G12§.§_-n2T§(0,true);
         }
         while(this.§_-X1H§.numChildren > 0)
         {
            this.§_-X1H§.removeChildAt(0);
         }
         while(this.userUpperSprite.numChildren > 0)
         {
            this.userUpperSprite.removeChildAt(0);
         }
         while(this.§_-gY§.numChildren > 0)
         {
            this.§_-gY§.§_-n2T§(0);
         }
         this.backgroundLayer0 = null;
         this.backgroundLayer1 = null;
         this.§_-52P§ = null;
         Starling.§_-y1l§.§_-gQ§.frameRate = 30;
         §_-TQ§.add("GameMap.dispose");
         §_-vS§.§_-324§(this);
         this.clear();
         this.game = null;
         this.portals = null;
         this.§_-l2j§ = null;
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         if(_instance == this)
         {
            _instance = null;
         }
      }
      
      protected function §_-O2J§(param1:*) : void
      {
      }
      
      protected function onHollow(param1:HollowEvent) : void
      {
         if(param1.target is §_-Q1J§)
         {
            return;
         }
         §_-TQ§.add("GameMap.onHollow --> e.target is not HollowBody");
      }
      
      protected function §_-92T§(param1:SquirrelEvent) : void
      {
      }
      
      protected function §_-z2§(param1:SquirrelEvent) : void
      {
         this.§_-ro§ = param1.player.position.Copy();
      }
      
      protected function get backgroundLocation() : Array
      {
         return §_-92y§.§_-q1w§(this.§_-E7§ ? §_-q1p§.§_-w2u§ : §_-92z§.location);
      }
      
      protected function §_-a1O§(param1:*) : Object
      {
         var data:* = param1;
         try
         {
            return JSON.parse(data);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Failed to parse JSON: " + e,data);
            return null;
         }
      }
      
      protected function §_-sb§(param1:*, param2:Boolean = false) : void
      {
         this.clear();
         if(!param2)
         {
            param1 = this.§_-a1O§(param1);
         }
         if(!param1)
         {
            return;
         }
         this.§_-R5§();
         var _loc3_:Array = param1[1];
         this.§_-u1T§ = 2 in param1 ? param1[2] : [];
         this.size = 3 in param1 ? new Point(param1[3][0],param1[3][1]) : new Point(§_-a9§.§_-9o§,§_-a9§.§_-31m§);
         this.gravity = 4 in param1 ? new b2Vec2(param1[4][0],param1[4][1]) : SquirrelGame.§_-h1O§;
         this.§_-C2H§ = 5 in param1 ? int(param1[5]) : 0;
         this.§_-52K§(_loc3_);
      }
      
      protected function §_-931§() : *
      {
         var _loc6_:§_-h2I§ = null;
         var _loc1_:Array = [];
         _loc1_.push(0);
         var _loc2_:Array = [];
         var _loc3_:int = int(this.objects.length);
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.objects[_loc4_];
            if(_loc6_ is §_-03u§)
            {
               _loc2_.push([§_-03s§.§_-X21§(_loc6_),(_loc6_ as §_-03u§).§_-A1X§(),_loc6_ is §_-v2j§ ? [_loc6_.name,_loc6_.alpha] : []]);
            }
            if(_loc6_ == null)
            {
               _loc2_.push("");
            }
            _loc4_++;
         }
         _loc1_.push(_loc2_);
         _loc1_.push(this.§_-u1T§);
         _loc1_.push([this.size.x,this.size.y]);
         _loc1_.push([this.gravity.x,this.gravity.y]);
         _loc1_.push(this.§_-C2H§);
         return _loc1_;
      }
      
      private function §_-g1d§(param1:Number, param2:Number) : void
      {
         if(!this.§_-52P§)
         {
            return;
         }
         this.§_-52P§.x = this.§_-52P§.width * 0.5 * (param1 / this.size.x);
         this.§_-52P§.y = this.§_-52P§.height * 0.5 * (param2 / this.size.y);
      }
      
      private function §_-R5§() : void
      {
         var _loc1_:Array = this.backgroundLocation;
         if(!this.backgroundLayer0 && Boolean(_loc1_))
         {
            if(this.§_-52P§)
            {
               this.§_-52P§.removeFromParent(true);
            }
            if(_loc1_.length > 1)
            {
               this.§_-52P§ = new §_-t2M§();
               this.backgroundLayer0 = §_-a2§.§_-i2y§(new _loc1_[0]());
               this.backgroundLayer1 = §_-a2§.§_-i2y§(new _loc1_[1]());
               this.backgroundLayer0.scaleX = Game.starling.stage.stageWidth / §_-a9§.§_-9o§;
               this.backgroundLayer0.scaleY = Game.starling.stage.stageHeight / §_-a9§.§_-31m§;
               this.backgroundLayer1.scaleX = 1;
               this.backgroundLayer1.scaleY = 1;
               this.backgroundLayer0.x = 0;
               this.backgroundLayer1.y = §_-a9§.§_-31m§ * 0.5;
               this.§_-52P§.§_-p1F§(this.backgroundLayer1);
               this.backgroundLayer1.x = §_-a9§.§_-9o§;
               this.§_-52P§.§_-p1F§(this.backgroundLayer1);
               this.§_-52P§.scaleX = this.backgroundLayer0.scaleX;
               this.§_-52P§.scaleY = this.backgroundLayer0.scaleY;
            }
         }
         if(!this.backgroundLayer0 || !this.§_-52P§)
         {
            return;
         }
         this.§_-gY§.§_-83v§(this.backgroundLayer0);
         this.§_-gY§.§_-83v§(this.§_-52P§);
         this.§_-gY§.blandMode = BlendMode.NONE;
      }
      
      private function §_-lD§(param1:§_-63Q§) : void
      {
         if(Boolean(param1 && this) && Boolean(this.game) && Boolean(this.game.world))
         {
            param1.build(this.game.world);
         }
      }
      
      private function §_-A3q§(param1:Event) : void
      {
         if(this.backgroundLayer0)
         {
            this.backgroundLayer0.scaleX = Game.starling.stage.stageWidth / §_-a9§.§_-9o§;
            this.backgroundLayer0.scaleY = Game.starling.stage.stageHeight / §_-a9§.§_-31m§;
            if(this.§_-52P§)
            {
               this.§_-52P§.scaleX = this.backgroundLayer0.scaleX;
               this.§_-52P§.scaleY = this.backgroundLayer0.scaleY;
            }
         }
      }
      
      private function §_-s2z§() : void
      {
      }
   }
}

