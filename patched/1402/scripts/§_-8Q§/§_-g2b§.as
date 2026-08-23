package §_-8Q§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-l28§;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-ke§;
   
   public class §_-g2b§ extends §_-A§ implements §_-xn§, §_-F1c§, §_-3l§, §_-l28§, §_-l2r§, §_-hQ§, §_-Q2d§
   {
      
      private static const §_-x7§:int = 100;
      
      private var §_-22Z§:Array = null;
      
      private var §_-vE§:Array = null;
      
      private var view:§_-aS§;
      
      private var map:GameMap = null;
      
      private var §_-21H§:SquirrelGame;
      
      public var §_-J2V§:Object = {};
      
      public var §_-Y1B§:Object = {};
      
      public var §_-A1§:Array = [];
      
      public function §_-g2b§()
      {
         super();
         this.view = new §_-aS§(new FlyWayPointView());
         §_-J2J§(this.view);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         §_-A2O§();
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         §_-A2O§();
      }
      
      public function §_-31j§(param1:int) : GameBody
      {
         if(param1 in this.§_-Y1B§)
         {
            return this.§_-Y1B§[param1];
         }
         return null;
      }
      
      public function §_-v1l§(param1:int, param2:GameBody) : void
      {
         if(this.§_-A1§.indexOf(param1) == -1)
         {
            this.§_-A1§.push(param1);
         }
         this.§_-Y1B§[param1] = param2;
      }
      
      override public function getRect(param1:DisplayObject) : Rectangle
      {
         return this.view.getRect(param1);
      }
      
      public function get angle() : Number
      {
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 / Game.D2R;
         §_-A2O§();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function build(param1:b2World) : void
      {
         var _loc2_:GameBody = null;
         this.showDebug = false;
         this.§_-21H§ = param1.userData as SquirrelGame;
         for each(_loc2_ in this.§_-Y1B§)
         {
            if(_loc2_)
            {
               _loc2_.position = this.position;
            }
         }
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:§_-xn§ = null;
         this.§_-22Z§ = [];
         for each(_loc1_ in this.§_-v1G§)
         {
            this.§_-22Z§.push(this.map.§_-923§(_loc1_));
         }
         this.§_-vE§ = [];
         for each(_loc1_ in this.§_-YC§)
         {
            this.§_-vE§.push(this.map.§_-923§(_loc1_));
         }
         return [[this.position.x,this.position.y],this.§_-22Z§,this.§_-vE§];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         var _loc2_:int = 0;
         this.§_-22Z§ = [];
         this.§_-vE§ = [];
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         for each(_loc2_ in param1[1])
         {
            this.§_-22Z§.push(_loc2_);
         }
         for each(_loc2_ in param1[2])
         {
            this.§_-vE§.push(_loc2_);
         }
      }
      
      public function §_-i2s§(param1:GameMap) : void
      {
         var _loc2_:int = 0;
         var _loc3_:GameBody = null;
         this.§_-v1G§ = new Vector.<§_-xn§>();
         this.§_-YC§ = new Vector.<§_-xn§>();
         for each(_loc2_ in this.§_-22Z§)
         {
            this.§_-v1G§.push(this.map.getObject(_loc2_));
         }
         for each(_loc2_ in this.§_-vE§)
         {
            _loc3_ = this.map.getObject(_loc2_) as GameBody;
            if(_loc3_ != null)
            {
               this.§_-v1l§(_loc2_,_loc3_);
               this.§_-YC§.push(_loc3_);
               _loc3_.§_-v1G§.push(this);
            }
         }
         §_-p2M§();
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.§_-J2V§ = {};
         this.§_-Y1B§ = {};
         this.§_-A1§ = [];
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         this.showDebug = false;
         this.map = param1;
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.§_-m2u§ = param1;
         this.visible = param1;
         §_-A2O§();
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:int = 0;
         var _loc3_:GameBody = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         if(this.§_-v1G§.length == 0)
         {
            return;
         }
         for each(_loc2_ in this.§_-A1§)
         {
            _loc3_ = this.§_-31j§(_loc2_);
            if(_loc3_ != null)
            {
               if(!(_loc2_ in this.§_-J2V§) || this.§_-J2V§[_loc2_] == null)
               {
                  this.§_-S2R§(_loc2_);
                  return;
               }
               _loc4_ = new Point(this.§_-J2V§[_loc2_].x,this.§_-J2V§[_loc2_].y);
               _loc5_ = _loc4_.subtract(new Point(_loc3_.x,_loc3_.y));
               if(_loc5_.length < §_-x7§ * param1 * _loc3_.speed)
               {
                  this.§_-S2R§(_loc2_);
                  return;
               }
               _loc5_.normalize(_loc5_.length < 3 * §_-x7§ * param1 * _loc3_.speed ? int(_loc5_.length * 0.5) : §_-x7§ * param1 * _loc3_.speed);
               _loc3_.position = new b2Vec2((_loc3_.x + _loc5_.x) / Game.§_-12A§,(_loc3_.y + _loc5_.y) / Game.§_-12A§);
            }
         }
      }
      
      private function §_-71d§(param1:int) : void
      {
         this.§_-J2V§[param1] = null;
         this.§_-v1l§(param1,null);
         if(this.§_-A1§.length <= 1)
         {
            this.§_-A1§ = [];
            return;
         }
         var _loc2_:int = this.§_-A1§.indexOf(param1);
         this.§_-A1§.splice(_loc2_,1);
      }
      
      private function §_-S2R§(param1:int) : void
      {
         if(Boolean(Hero.self) && !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc2_:§_-g2b§ = param1 in this.§_-J2V§ && this.§_-J2V§[param1] != null ? this.§_-J2V§[param1] : this;
         var _loc3_:int = §_-ke§.§_-D1d§(0,_loc2_.§_-v1G§.length - 1);
         _loc2_.§_-J2V§[param1] = _loc2_.§_-v1G§[_loc3_] as §_-g2b§;
         _loc2_.§_-v1l§(param1,this.§_-31j§(param1));
         var _loc4_:Object = {"FlyWay":[param1,this.map.§_-923§(_loc2_),this.map.§_-923§(_loc2_.§_-J2V§[param1])]};
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc4_));
         if(_loc2_ != this)
         {
            this.§_-71d§(param1);
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("FlyWay" in _loc2_))
         {
            return;
         }
         var _loc3_:Array = _loc2_["FlyWay"];
         if(!SquirrelCollection.instance)
         {
            return;
         }
         if(Boolean(Hero.self) && SquirrelCollection.instance.isSynchronizing)
         {
            return;
         }
         var _loc4_:int = int(_loc3_[0]);
         if(this.§_-A1§.indexOf(_loc4_) == -1)
         {
            return;
         }
         var _loc5_:GameBody = this.§_-31j§(_loc4_);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:§_-g2b§ = this.map.getObject(_loc3_[1]) as §_-g2b§;
         _loc6_.§_-J2V§[_loc4_] = this.map.getObject(_loc3_[2]) as §_-g2b§;
         _loc6_.§_-v1l§(_loc4_,_loc5_);
         _loc6_.update();
         if(_loc6_ != this)
         {
            this.§_-71d§(_loc4_);
         }
      }
   }
}

