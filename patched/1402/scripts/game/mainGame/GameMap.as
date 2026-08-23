package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-t20§;
   import §_-8Q§.§_-u1i§;
   import §_-A1G§.§_-w10§;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-U1I§;
   import §_-Mq§.DisplayObjectManager;
   import §_-Mq§.§_-23h§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-817§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-hd§.§_-01M§;
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-Tu§;
   import §_-j2H§.§_-d1j§;
   import §_-j2H§.§_-x2h§;
   import §_-q0§.§_-H1L§;
   import §_-t14§.§_-62O§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-l28§;
   import game.mainGame.entity.§_-p1Z§;
   import game.mainGame.entity.§_-p2r§;
   import game.mainGame.entity.§_-xn§;
   import particles.Explode;
   import particles.§_-22L§;
   import starling.core.Starling;
   import starling.display.BlendMode;
   import starling.display.§_-81s§;
   import starling.display.§_-I2q§;
   import utils.§_-d1t§;
   
   public class GameMap extends §_-aS§ implements §_-F1c§, §_-l2r§, §_-3l§
   {
      
      public static var §_-O19§:int = §_-Zy§.§_-21V§;
      
      public static var §_-Gd§:int = §_-Zy§.§_-02T§;
      
      private static var _instance:GameMap = null;
      
      public var game:SquirrelGame = null;
      
      public var backgroundLayer0:§_-I2q§ = null;
      
      public var backgroundLayer1:§_-I2q§ = null;
      
      public var §_-92x§:§_-aS§ = new §_-aS§();
      
      public var §_-62R§:§_-81s§;
      
      public var §_-d14§:Array = [];
      
      public var portals:§_-g1f§ = new §_-g1f§();
      
      public var §_-1l§:§_-aS§ = new §_-aS§();
      
      public var §_-h2T§:§_-aS§ = new §_-aS§();
      
      public var §_-Ox§:§_-22L§ = null;
      
      public var §_-o1i§:Sprite = new Sprite();
      
      public var userUpperSprite:Sprite = new Sprite();
      
      public var §_-uZ§:Boolean = false;
      
      public var elements:Object = {};
      
      public var §_-FX§:int = 0;
      
      public var §_-K2H§:b2Vec2 = null;
      
      protected var §_-o1c§:Shape = new Shape();
      
      protected var objects:Array = [];
      
      protected var §_-v1Y§:Array = [];
      
      protected var §_-A35§:b2Vec2 = null;
      
      protected var §_-l2p§:Array = [];
      
      protected var §_-B36§:Boolean = false;
      
      protected var §_-i2G§:Boolean = false;
      
      private var §_-V17§:§_-w10§ = §_-w10§.instance;
      
      private var §_-y1d§:Point = new Point(§_-Zy§.§_-21V§,§_-Zy§.§_-02T§);
      
      public function GameMap(param1:SquirrelGame)
      {
         _instance = this;
         §_-p2U§.add("GameMap.GameMap");
         §_-d1t§.§_-B12§(this);
         super();
         §_-p2U§.add("GameMap.GameMap init ParticleEngine");
         this.§_-Ox§ = new §_-22L§();
         Explode.§_-CG§ = this.§_-Ox§;
         this.game = param1;
         this.§_-i2G§ = this.game is §_-62O§;
         §_-p2U§.add("GameMap.GameMap init background");
         §_-817§.instance.addChildAt(this.§_-92x§.getStarlingView(),0);
         §_-817§.§_-Z2U§.addChild(this.getStarlingView());
         this.§_-110§();
         §_-p2U§.add("GameMap.GameMap adding sprites");
         this.addChild(this.§_-o1i§);
         this.§_-J2J§(this.§_-1l§);
         this.addChild(this.§_-1l§);
         this.§_-J2J§(this.§_-Ox§);
         this.addChild(this.userUpperSprite);
         this.§_-W2D§();
         §_-p2U§.add("GameMap.GameMap set frameRate");
         Starling.§_-n1s§.§_-93k§.frameRate = 60;
         §_-p2U§.add("GameMap.GameMap FullScreenManager");
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         §_-p2U§.add("GameMap.GameMap Finish");
         this.§_-h2T§.touchable = false;
         this.addChild(this.§_-o1c§);
      }
      
      public static function get instance() : GameMap
      {
         return _instance;
      }
      
      override public function set x(param1:Number) : void
      {
         this.§_-V17§.§_-v2n§ = param1;
         super.x = param1;
         this.§_-912§(this.x,this.y);
      }
      
      override public function set y(param1:Number) : void
      {
         this.§_-V17§.§_-E2j§ = param1;
         super.y = param1;
         this.§_-912§(this.x,this.y);
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         if(param1 is §_-xn§)
         {
            return this.§_-1l§.addChild(param1);
         }
         return super.addChild(param1);
      }
      
      override public function removeChildStarling(param1:*, param2:Boolean = true) : void
      {
         if(param1.parentStarling == this.§_-1l§)
         {
            this.§_-1l§.removeChildStarling(param1,param2);
         }
         if(param1.parentStarling == this)
         {
            super.removeChildStarling(param1,param2);
         }
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         if(param1 is §_-xn§ && param1.parent == this.§_-1l§)
         {
            return this.§_-1l§.removeChild(param1);
         }
         if(param1.parent == this)
         {
            return super.removeChild(param1);
         }
         return param1;
      }
      
      override public function §_-J2J§(param1:*) : *
      {
         if(param1 is §_-xn§)
         {
            param1.parentStarling = this.§_-1l§;
            this.§_-1l§.§_-J2J§(param1 as §_-aS§);
            return param1;
         }
         return super.§_-J2J§(param1);
      }
      
      public function §_-j1c§() : Array
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
      
      public function get §_-n2B§() : §_-aS§
      {
         return this.§_-h2T§;
      }
      
      public function §_-U1S§() : void
      {
         if(this.§_-62R§)
         {
            this.§_-62R§.removeFromParent(true);
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
         while(this.§_-92x§.numChildren > 0)
         {
            this.§_-92x§.§_-av§(0);
         }
         this.backgroundLayer0 = null;
         this.backgroundLayer1 = null;
         this.§_-62R§ = null;
         this.§_-110§();
      }
      
      public function §_-S19§(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc6_:§_-aS§ = null;
         var _loc7_:§_-aS§ = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:* = undefined;
         var _loc11_:Rectangle = null;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc3_:Number = -x + §_-O19§;
         var _loc4_:Number = -y + §_-Gd§;
         var _loc5_:Vector.<§_-aS§> = new Vector.<§_-aS§>(0);
         for each(_loc6_ in this.objects)
         {
            if(_loc6_)
            {
               _loc8_ = _loc6_ is §_-51g§;
               _loc9_ = _loc6_ is §_-n1d§;
               if(!(!_loc8_ && !_loc9_))
               {
                  _loc10_ = _loc6_.parentStarling;
                  if(_loc10_ != this.§_-1l§)
                  {
                     if(_loc6_.§_-43E§ <= 0)
                     {
                        _loc6_.§_-w2o§();
                     }
                  }
                  else
                  {
                     _loc11_ = _loc6_.boundsStarling();
                     if(_loc11_.right < -x || _loc11_.bottom < -y || _loc11_.left > _loc3_ || _loc11_.top > _loc4_)
                     {
                        if(_loc6_.§_-43E§ > 0)
                        {
                           _loc6_.§_-vb§();
                        }
                     }
                     else
                     {
                        if(_loc6_.§_-43E§ <= 0)
                        {
                           _loc6_.§_-w2o§();
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
            _loc12_ = this.§_-h2T§.§_-U2E§(_loc7_);
            _loc13_ = this.§_-1l§.§_-U2E§(_loc7_);
            if(!param1 && !_loc12_ && !param2)
            {
               this.§_-h2T§.§_-J2J§(_loc7_);
            }
            else if(!_loc13_ && !_loc12_)
            {
               this.§_-1l§.§_-J2J§(_loc7_);
            }
            else if(param2 && _loc12_ && !_loc13_)
            {
               this.§_-1l§.§_-J2J§(_loc7_);
            }
         }
      }
      
      public function §_-TP§(param1:§_-xn§, param2:Boolean) : void
      {
         this.add(param1);
         if(param2)
         {
            param1.build(this.game.world);
         }
      }
      
      public function §_-Y1E§(param1:§_-xn§, param2:Boolean) : void
      {
         this.remove(param1,param2);
      }
      
      public function add(param1:* = null) : void
      {
         §_-d1t§.§_-B12§(param1);
         if(param1 is §_-H1L§)
         {
            this.§_-v1Y§.push(param1);
         }
         else
         {
            this.objects.push(param1);
         }
         if(param1 is §_-51g§ && param1.parentStarling == null)
         {
            (param1 as §_-aS§).lastIndex = this.objects.length;
            this.§_-J2J§(param1);
            if((param1 as §_-aS§).§_-Hr§())
            {
               this.addChild(param1);
            }
         }
         else if(param1 is DisplayObject && param1.parent == null)
         {
            this.addChild(param1);
         }
         if(param1 is §_-hQ§)
         {
            (param1 as §_-hQ§).§_-x26§(this);
         }
         if(param1 is §_-jC§)
         {
            this.game.§_-Qd§.§_-a1K§(param1 as §_-jC§);
         }
         if(param1 is §_-p1Z§)
         {
            (param1 as §_-p1Z§).visible = false;
         }
         if(param1 is §_-p2r§)
         {
            this.game.§_-O1C§.addObject(param1);
         }
      }
      
      public function §_-br§(param1:String) : §_-xn§
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
      
      public function §_-923§(param1:§_-xn§) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         return this.objects.indexOf(param1);
      }
      
      public function getObject(param1:int) : §_-xn§
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
            if(§_-U2E§(this.objects[param1]) && this.objects[param1] is §_-51g§)
            {
               this.removeChildStarling(this.objects[param1],param2);
            }
            _loc3_ = this.objects[param1];
            this.objects[param1] = null;
            if(_loc3_ is §_-hQ§)
            {
               (_loc3_ as §_-hQ§).§_-A3v§(this);
            }
            if(param2 && _loc3_ is §_-l2r§)
            {
               _loc3_.dispose();
            }
            if(_loc3_ is §_-jC§)
            {
               this.game.§_-Qd§.remove(_loc3_);
            }
            if(_loc3_ is §_-p2r§)
            {
               this.game.§_-O1C§.removeObject(_loc3_);
            }
            §_-d1t§.§_-xx§(_loc3_);
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
                  else if(§_-U2E§(this.objects[_loc4_]) && this.objects[_loc4_] is §_-51g§)
                  {
                     this.removeChildStarling(this.objects[_loc4_],param2);
                  }
                  this.objects[_loc4_] = null;
                  if(param1 is §_-hQ§)
                  {
                     (param1 as §_-hQ§).§_-A3v§(this);
                  }
                  if(param1 is §_-jC§)
                  {
                     this.game.§_-Qd§.remove(param1);
                  }
                  if(param1 is §_-p2r§)
                  {
                     this.game.§_-O1C§.removeObject(param1);
                  }
                  if(param2 && param1 is §_-l2r§)
                  {
                     param1.dispose();
                  }
                  §_-d1t§.§_-xx§(param1);
                  break;
               }
            }
         }
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.§_-a2f§(param1);
      }
      
      public function get isBrokenWorld() : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:b2Vec2 = null;
         var _loc1_:Array = this.get(§_-t20§,true).concat(this.get(§_-O2k§));
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
         §_-p2U§.add("isBrokenWorld",_loc3_);
         return isNaN(_loc3_);
      }
      
      public function §_-618§(param1:Array) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:Class = null;
         var _loc7_:§_-xn§ = null;
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
               _loc6_ = §_-f1b§.§_-N1m§(_loc5_[0]);
               if(!_loc6_)
               {
                  this.add(null);
               }
               else
               {
                  _loc7_ = new _loc6_();
                  if(_loc7_ is §_-3l§)
                  {
                     (_loc7_ as §_-3l§).§_-o2I§(_loc5_[1]);
                  }
                  if(_loc7_ is §_-51g§ && _loc5_.length == 3)
                  {
                     _loc8_ = _loc5_[2];
                     (_loc7_ as §_-51g§).name = _loc8_[0];
                     (_loc7_ as §_-51g§).alpha = _loc8_[1];
                  }
                  this.add(_loc7_);
                  if(_loc7_ is §_-u1i§)
                  {
                     this.elements[(_loc7_ as §_-u1i§).index] = _loc7_;
                  }
               }
            }
            _loc3_++;
         }
         if(§_-t2c§.active is §_-u24§ && (§_-u24§.location == §_-at§.§_-I6§ || §_-u24§.location == §_-at§.§_-B2t§) || §_-t2c§.active is §_-S2E§)
         {
            for each(_loc7_ in this.objects)
            {
               this.§_-uZ§ = _loc7_ is §_-Tu§;
               if(this.§_-uZ§)
               {
                  break;
               }
            }
            this.§_-U1S§();
         }
         else
         {
            this.§_-uZ§ = false;
         }
         for each(_loc7_ in this.objects)
         {
            if(_loc7_ is §_-l28§)
            {
               (_loc7_ as §_-l28§).§_-i2s§(this);
            }
         }
         this.§_-S19§();
      }
      
      public function removeObject(param1:*) : void
      {
         if(param1 is §_-xn§)
         {
            setTimeout(this.remove,0,param1,true);
         }
         else
         {
            setTimeout(this.remove,0,this.§_-br§(String(param1)),true);
         }
      }
      
      public function addObject(param1:*, param2:Number, param3:Number, param4:Number, param5:Boolean = true) : §_-xn§
      {
         if(param1 is Class)
         {
            param1 = §_-f1b§.§_-q2W§(param1);
         }
         if(param1 is String)
         {
            param1 = §_-f1b§.§_-W1H§(param1);
         }
         var _loc6_:§_-xn§ = new (§_-f1b§.§_-N1m§(param1))();
         _loc6_.position = new b2Vec2(param2 / Game.§_-12A§,param3 / Game.§_-12A§);
         _loc6_.angle = param4 * Game.D2R;
         this.add(_loc6_);
         if(_loc6_ is §_-t20§)
         {
            (_loc6_ as §_-t20§).game = this.game;
            (_loc6_ as §_-t20§).addEventListener(HollowEvent.§_-h1g§,this.onHollow,false,0,true);
         }
         if(_loc6_ is §_-O2k§)
         {
            (_loc6_ as §_-O2k§).addEventListener(SquirrelEvent.§_-Xw§,this.§_-R2p§,false,0,true);
         }
         this.§_-71U§(_loc6_);
         if(param5 && Boolean(_loc6_))
         {
            setTimeout(this.§_-VR§,0,_loc6_);
         }
         return _loc6_;
      }
      
      public function §_-m1Y§() : *
      {
         return JSON.stringify(this.§_-qv§());
      }
      
      public function get §_-q2L§() : Vector.<b2Vec2>
      {
         var _loc3_:§_-xn§ = null;
         var _loc1_:Array = this.get(§_-x2h§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
      
      public function get §_-02q§() : Vector.<b2Vec2>
      {
         var _loc3_:§_-xn§ = null;
         var _loc1_:Array = this.get(§_-62Y§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
      
      public function get size() : Point
      {
         return this.§_-y1d§;
      }
      
      public function set size(param1:Point) : void
      {
         this.§_-y1d§ = param1;
         if(this.§_-o1c§)
         {
            this.§_-o1c§.graphics.clear();
            this.§_-o1c§.graphics.lineStyle(5,16763955,0.5);
            this.§_-o1c§.graphics.drawRect(0,§_-Zy§.§_-02T§,this.size.x,-this.size.y);
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
      
      public function §_-FS§(param1:Class) : Boolean
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
      
      public function §_-13U§() : int
      {
         return this.get(§_-x2h§).concat(this.get(§_-62Y§)).length;
      }
      
      public function build(param1:b2World) : void
      {
         var _loc2_:* = undefined;
         §_-p2U§.§_-g2F§("GameMap.build");
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ is §_-xn§ && !(_loc2_ is §_-U1I§))
            {
               _loc2_.build(param1);
            }
         }
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ is §_-xn§ && _loc2_ is §_-U1I§)
            {
               _loc2_.build(param1);
            }
            if(_loc2_ is §_-t20§)
            {
               _loc2_.game = this.game;
               _loc2_.addEventListener(HollowEvent.§_-h1g§,this.onHollow,false,0,true);
            }
            if(_loc2_ is §_-O2k§)
            {
               _loc2_.addEventListener(SquirrelEvent.§_-Xw§,this.§_-R2p§,false,0,true);
               this.§_-A35§ = _loc2_.position;
            }
            if(_loc2_ is §_-d1j§)
            {
               _loc2_.addEventListener(SquirrelEvent.§_-L5§,this.§_-b1X§,false,0,true);
            }
            this.§_-71U§(_loc2_);
         }
         §_-p2U§.§_-43A§("GameMap.build");
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.objects.concat(this.§_-v1Y§))
         {
            if(_loc2_ is §_-F1c§)
            {
               _loc2_.update(param1);
            }
         }
         this.§_-S19§();
         this.portals.§_-vp§();
         this.§_-Ox§.§_-v3§(param1);
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
            if(_loc1_ is §_-jC§)
            {
               this.game.§_-Qd§.remove(_loc1_);
            }
            if(_loc1_ is §_-p2r§)
            {
               this.game.§_-O1C§.removeObject(_loc1_);
            }
            if(_loc1_ is §_-l2r§)
            {
               _loc1_.dispose();
            }
            §_-d1t§.§_-xx§(_loc1_);
         }
         while(this.§_-v1Y§.length > 0)
         {
            _loc1_ = this.§_-v1Y§.pop();
            if(_loc1_ is §_-l2r§)
            {
               _loc1_.dispose();
            }
         }
         while(this.§_-o1i§.numChildren > 0)
         {
            this.§_-o1i§.removeChildAt(0);
         }
         while(this.userUpperSprite.numChildren > 0)
         {
            this.userUpperSprite.removeChildAt(0);
         }
         this.objects = [];
         this.§_-K2H§ = null;
         this.§_-Ox§.clear();
      }
      
      public function dispose() : void
      {
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         §_-23h§.getInstance().§_-V1a§();
         §_-23h§.getInstance().§_-h18§();
         if(this.§_-62R§)
         {
            this.§_-62R§.removeFromParent(true);
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
         while(this.§_-1l§.numChildren > 0)
         {
            this.§_-1l§.§_-av§(0,true);
         }
         while(this.§_-h2T§.numChildren > 0)
         {
            this.§_-h2T§.§_-av§(0,true);
         }
         while(this.§_-o1i§.numChildren > 0)
         {
            this.§_-o1i§.removeChildAt(0);
         }
         while(this.userUpperSprite.numChildren > 0)
         {
            this.userUpperSprite.removeChildAt(0);
         }
         while(this.§_-92x§.numChildren > 0)
         {
            this.§_-92x§.§_-av§(0);
         }
         this.backgroundLayer0 = null;
         this.backgroundLayer1 = null;
         this.§_-62R§ = null;
         Starling.§_-n1s§.§_-93k§.frameRate = 30;
         §_-p2U§.add("GameMap.dispose");
         §_-d1t§.§_-xx§(this);
         this.clear();
         this.game = null;
         this.portals = null;
         this.§_-Ox§ = null;
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         if(_instance == this)
         {
            _instance = null;
         }
      }
      
      protected function §_-71U§(param1:*) : void
      {
      }
      
      protected function onHollow(param1:HollowEvent) : void
      {
         if(param1.target is §_-t20§)
         {
            return;
         }
         §_-p2U§.add("GameMap.onHollow --> e.target is not HollowBody");
      }
      
      protected function §_-R2p§(param1:SquirrelEvent) : void
      {
      }
      
      protected function §_-b1X§(param1:SquirrelEvent) : void
      {
         this.§_-K2H§ = param1.player.position.Copy();
      }
      
      protected function get backgroundLocation() : Array
      {
         return §_-C3G§.§_-Gp§(this.§_-uZ§ ? §_-at§.§_-vr§ : §_-u24§.location);
      }
      
      protected function §_-m1v§(param1:*) : Object
      {
         var data:* = param1;
         try
         {
            return JSON.parse(data);
         }
         catch(e:Error)
         {
            §_-p2U§.add("Failed to parse JSON: " + e,data);
            return null;
         }
      }
      
      protected function §_-a2f§(param1:*, param2:Boolean = false) : void
      {
         this.clear();
         if(!param2)
         {
            param1 = this.§_-m1v§(param1);
         }
         if(!param1)
         {
            return;
         }
         this.§_-110§();
         var _loc3_:Array = param1[1];
         this.§_-d14§ = 2 in param1 ? param1[2] : [];
         this.size = 3 in param1 ? new Point(param1[3][0],param1[3][1]) : new Point(§_-Zy§.§_-21V§,§_-Zy§.§_-02T§);
         this.gravity = 4 in param1 ? new b2Vec2(param1[4][0],param1[4][1]) : SquirrelGame.§_-fM§;
         this.§_-FX§ = 5 in param1 ? int(param1[5]) : 0;
         this.§_-618§(_loc3_);
      }
      
      protected function §_-qv§() : *
      {
         var _loc6_:§_-aS§ = null;
         var _loc1_:Array = [];
         _loc1_.push(0);
         var _loc2_:Array = [];
         var _loc3_:int = int(this.objects.length);
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.objects[_loc4_];
            if(_loc6_ is §_-3l§)
            {
               _loc2_.push([§_-f1b§.§_-q2W§(_loc6_),(_loc6_ as §_-3l§).§_-m1Y§(),_loc6_ is §_-51g§ ? [_loc6_.name,_loc6_.alpha] : []]);
            }
            if(_loc6_ == null)
            {
               _loc2_.push("");
            }
            _loc4_++;
         }
         _loc1_.push(_loc2_);
         _loc1_.push(this.§_-d14§);
         _loc1_.push([this.size.x,this.size.y]);
         _loc1_.push([this.gravity.x,this.gravity.y]);
         _loc1_.push(this.§_-FX§);
         return _loc1_;
      }
      
      private function §_-912§(param1:Number, param2:Number) : void
      {
         if(!this.§_-62R§)
         {
            return;
         }
         this.§_-62R§.x = this.§_-62R§.width * 0.5 * (param1 / this.size.x);
         this.§_-62R§.y = this.§_-62R§.height * 0.5 * (param2 / this.size.y);
      }
      
      private function §_-110§() : void
      {
         var _loc1_:Array = this.backgroundLocation;
         if(!this.backgroundLayer0 && Boolean(_loc1_))
         {
            if(this.§_-62R§)
            {
               this.§_-62R§.removeFromParent(true);
            }
            if(_loc1_.length > 1)
            {
               this.§_-62R§ = new §_-81s§();
               this.backgroundLayer0 = §_-01M§.§_-Z1V§(new _loc1_[0]());
               this.backgroundLayer1 = §_-01M§.§_-Z1V§(new _loc1_[1]());
               this.backgroundLayer0.scaleX = Game.starling.stage.stageWidth / §_-Zy§.§_-21V§;
               this.backgroundLayer0.scaleY = Game.starling.stage.stageHeight / §_-Zy§.§_-02T§;
               this.backgroundLayer1.scaleX = 1;
               this.backgroundLayer1.scaleY = 1;
               this.backgroundLayer0.x = 0;
               this.backgroundLayer1.y = §_-Zy§.§_-02T§ * 0.5;
               this.§_-62R§.§_-bQ§(this.backgroundLayer1);
               this.backgroundLayer1.x = §_-Zy§.§_-21V§;
               this.§_-62R§.§_-bQ§(this.backgroundLayer1);
               this.§_-62R§.scaleX = this.backgroundLayer0.scaleX;
               this.§_-62R§.scaleY = this.backgroundLayer0.scaleY;
            }
         }
         if(!this.backgroundLayer0 || !this.§_-62R§)
         {
            return;
         }
         this.§_-92x§.§_-J2J§(this.backgroundLayer0);
         this.§_-92x§.§_-J2J§(this.§_-62R§);
         this.§_-92x§.blandMode = BlendMode.NONE;
      }
      
      private function §_-VR§(param1:§_-xn§) : void
      {
         if(Boolean(param1 && this) && Boolean(this.game) && Boolean(this.game.world))
         {
            param1.build(this.game.world);
         }
      }
      
      private function §_-W1N§(param1:Event) : void
      {
         if(this.backgroundLayer0)
         {
            this.backgroundLayer0.scaleX = Game.starling.stage.stageWidth / §_-Zy§.§_-21V§;
            this.backgroundLayer0.scaleY = Game.starling.stage.stageHeight / §_-Zy§.§_-02T§;
            if(this.§_-62R§)
            {
               this.§_-62R§.scaleX = this.backgroundLayer0.scaleX;
               this.§_-62R§.scaleY = this.backgroundLayer0.scaleY;
            }
         }
      }
      
      private function §_-W2D§() : void
      {
      }
   }
}

