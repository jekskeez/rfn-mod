package §_-83V§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-w2n§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-Eg§;
   
   public class §_-M2K§ extends §_-R2Z§ implements §_-63Q§, §_-Tm§, §_-03u§, §_-w2n§, §_-C2x§, §_-72o§, §_-8B§
   {
      
      private static const §_-B1h§:int = 100;
      
      private var §_-R2p§:Array = null;
      
      private var §_-2n§:Array = null;
      
      private var view:§_-h2I§;
      
      private var map:GameMap = null;
      
      private var §_-H2D§:SquirrelGame;
      
      public var §_-dL§:Object = {};
      
      public var §_-O2v§:Object = {};
      
      public var §_-33J§:Array = [];
      
      public function §_-M2K§()
      {
         super();
         this.view = new §_-h2I§(new FlyWayPointView());
         §_-83v§(this.view);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         §_-w2c§();
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         §_-w2c§();
      }
      
      public function §_-40§(param1:int) : GameBody
      {
         if(param1 in this.§_-O2v§)
         {
            return this.§_-O2v§[param1];
         }
         return null;
      }
      
      public function §_-12O§(param1:int, param2:GameBody) : void
      {
         if(this.§_-33J§.indexOf(param1) == -1)
         {
            this.§_-33J§.push(param1);
         }
         this.§_-O2v§[param1] = param2;
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
         §_-w2c§();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      public function build(param1:b2World) : void
      {
         var _loc2_:GameBody = null;
         this.showDebug = false;
         this.§_-H2D§ = param1.userData as SquirrelGame;
         for each(_loc2_ in this.§_-O2v§)
         {
            if(_loc2_)
            {
               _loc2_.position = this.position;
            }
         }
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:§_-63Q§ = null;
         this.§_-R2p§ = [];
         for each(_loc1_ in this.§_-6y§)
         {
            this.§_-R2p§.push(this.map.§_-F2W§(_loc1_));
         }
         this.§_-2n§ = [];
         for each(_loc1_ in this.§_-12X§)
         {
            this.§_-2n§.push(this.map.§_-F2W§(_loc1_));
         }
         return [[this.position.x,this.position.y],this.§_-R2p§,this.§_-2n§];
      }
      
      public function §_-41M§(param1:*) : void
      {
         var _loc2_:int = 0;
         this.§_-R2p§ = [];
         this.§_-2n§ = [];
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         for each(_loc2_ in param1[1])
         {
            this.§_-R2p§.push(_loc2_);
         }
         for each(_loc2_ in param1[2])
         {
            this.§_-2n§.push(_loc2_);
         }
      }
      
      public function §_-8i§(param1:GameMap) : void
      {
         var _loc2_:int = 0;
         var _loc3_:GameBody = null;
         this.§_-6y§ = new Vector.<§_-63Q§>();
         this.§_-12X§ = new Vector.<§_-63Q§>();
         for each(_loc2_ in this.§_-R2p§)
         {
            this.§_-6y§.push(this.map.getObject(_loc2_));
         }
         for each(_loc2_ in this.§_-2n§)
         {
            _loc3_ = this.map.getObject(_loc2_) as GameBody;
            if(_loc3_ != null)
            {
               this.§_-12O§(_loc2_,_loc3_);
               this.§_-12X§.push(_loc3_);
               _loc3_.§_-6y§.push(this);
            }
         }
         §_-K2C§();
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.§_-dL§ = {};
         this.§_-O2v§ = {};
         this.§_-33J§ = [];
      }
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         this.showDebug = false;
         this.map = param1;
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.§_-C1B§ = param1;
         this.visible = param1;
         §_-w2c§();
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:int = 0;
         var _loc3_:GameBody = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         if(this.§_-6y§.length == 0)
         {
            return;
         }
         for each(_loc2_ in this.§_-33J§)
         {
            _loc3_ = this.§_-40§(_loc2_);
            if(_loc3_ != null)
            {
               if(!(_loc2_ in this.§_-dL§) || this.§_-dL§[_loc2_] == null)
               {
                  this.§_-8L§(_loc2_);
                  return;
               }
               _loc4_ = new Point(this.§_-dL§[_loc2_].x,this.§_-dL§[_loc2_].y);
               _loc5_ = _loc4_.subtract(new Point(_loc3_.x,_loc3_.y));
               if(_loc5_.length < §_-B1h§ * param1 * _loc3_.speed)
               {
                  this.§_-8L§(_loc2_);
                  return;
               }
               _loc5_.normalize(_loc5_.length < 3 * §_-B1h§ * param1 * _loc3_.speed ? int(_loc5_.length * 0.5) : §_-B1h§ * param1 * _loc3_.speed);
               _loc3_.position = new b2Vec2((_loc3_.x + _loc5_.x) / Game.§_-x2P§,(_loc3_.y + _loc5_.y) / Game.§_-x2P§);
            }
         }
      }
      
      private function §_-h2N§(param1:int) : void
      {
         this.§_-dL§[param1] = null;
         this.§_-12O§(param1,null);
         if(this.§_-33J§.length <= 1)
         {
            this.§_-33J§ = [];
            return;
         }
         var _loc2_:int = this.§_-33J§.indexOf(param1);
         this.§_-33J§.splice(_loc2_,1);
      }
      
      private function §_-8L§(param1:int) : void
      {
         if(Boolean(Hero.self) && !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc2_:§_-M2K§ = param1 in this.§_-dL§ && this.§_-dL§[param1] != null ? this.§_-dL§[param1] : this;
         var _loc3_:int = §_-Eg§.§_-j1G§(0,_loc2_.§_-6y§.length - 1);
         _loc2_.§_-dL§[param1] = _loc2_.§_-6y§[_loc3_] as §_-M2K§;
         _loc2_.§_-12O§(param1,this.§_-40§(param1));
         var _loc4_:Object = {"FlyWay":[param1,this.map.§_-F2W§(_loc2_),this.map.§_-F2W§(_loc2_.§_-dL§[param1])]};
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc4_));
         if(_loc2_ != this)
         {
            this.§_-h2N§(param1);
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
         if(this.§_-33J§.indexOf(_loc4_) == -1)
         {
            return;
         }
         var _loc5_:GameBody = this.§_-40§(_loc4_);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:§_-M2K§ = this.map.getObject(_loc3_[1]) as §_-M2K§;
         _loc6_.§_-dL§[_loc4_] = this.map.getObject(_loc3_[2]) as §_-M2K§;
         _loc6_.§_-12O§(_loc4_,_loc5_);
         _loc6_.update();
         if(_loc6_ != this)
         {
            this.§_-h2N§(_loc4_);
         }
      }
   }
}

