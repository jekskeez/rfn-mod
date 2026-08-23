package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-81N§.§_-626§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-Rn§.§_-I2G§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.§_-03u§;
   import game.mainGame.entity.§_-63Q§;
   import utils.§_-41A§;
   import utils.§_-X2Z§;
   
   public class §_-J1X§ extends §_-h2I§ implements §_-63Q§, §_-03u§, §_-I2G§, §_-C2x§
   {
      
      private var controller:§_-626§;
      
      public var §_-o5§:int = -1;
      
      public var body:GameBody;
      
      public var force:Number = 0;
      
      public var maxVelocity:Number = 100;
      
      protected var §_-l2w§:§_-v2j§;
      
      public function §_-J1X§()
      {
         super();
         §_-83v§(this.view);
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
      
      public function get angle() : Number
      {
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 * Game.R2D;
      }
      
      public function build(param1:b2World) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         this.controller = new §_-626§();
         this.controller.§_-u2z§ = this;
         param1.AddController(this.controller);
         if(this.§_-o5§ == -1)
         {
            _loc2_ = §_-41A§.§_-D4§(param1,this.position,GameBody);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc2_[_loc3_] = (_loc2_[_loc3_] as b2Body).GetUserData();
               _loc3_++;
            }
            this.body = §_-X2Z§.§_-C16§(_loc2_) as GameBody;
            if(this.body == null)
            {
               return;
            }
            this.body.§_-83v§(this);
            this.position = this.body.body.GetLocalPoint(this.position);
            this.angle -= this.body.angle;
         }
         this.view.play();
      }
      
      public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.force,this.maxVelocity];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         this.force = param1[2];
         this.maxVelocity = param1[3];
      }
      
      public function dispose() : void
      {
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         if(this.controller)
         {
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller.§_-u2z§ = null;
         }
         this.body = null;
         this.controller = null;
      }
      
      protected function get view() : §_-v2j§
      {
         if(this.§_-l2w§)
         {
            return this.§_-l2w§;
         }
         this.§_-l2w§ = new §_-d2d§(new ArrowMovie());
         this.§_-l2w§.rotation = 180;
         this.§_-l2w§.y = this.§_-l2w§.height * 0.5;
         return this.§_-l2w§;
      }
   }
}

