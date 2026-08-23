package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-H1l§.§_-bJ§;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-U1I§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import game.mainGame.§_-3l§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-11I§;
   import utils.§_-H1o§;
   
   public class §_-L2K§ extends §_-aS§ implements §_-xn§, §_-3l§, §_-U1I§, §_-l2r§
   {
      
      private var controller:§_-bJ§;
      
      public var §_-j2K§:int = -1;
      
      public var body:GameBody;
      
      public var force:Number = 0;
      
      public var maxVelocity:Number = 100;
      
      protected var §_-D1S§:§_-51g§;
      
      public function §_-L2K§()
      {
         super();
         §_-J2J§(this.view);
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
         this.controller = new §_-bJ§();
         this.controller.§_-I0§ = this;
         param1.AddController(this.controller);
         if(this.§_-j2K§ == -1)
         {
            _loc2_ = §_-11I§.§_-016§(param1,this.position,GameBody);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc2_[_loc3_] = (_loc2_[_loc3_] as b2Body).GetUserData();
               _loc3_++;
            }
            this.body = §_-H1o§.§_-XF§(_loc2_) as GameBody;
            if(this.body == null)
            {
               return;
            }
            this.body.§_-J2J§(this);
            this.position = this.body.body.GetLocalPoint(this.position);
            this.angle -= this.body.angle;
         }
         this.view.play();
      }
      
      public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.force,this.maxVelocity];
      }
      
      public function §_-o2I§(param1:*) : void
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
            this.§_-av§(0);
         }
         if(this.controller)
         {
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller.§_-I0§ = null;
         }
         this.body = null;
         this.controller = null;
      }
      
      protected function get view() : §_-51g§
      {
         if(this.§_-D1S§)
         {
            return this.§_-D1S§;
         }
         this.§_-D1S§ = new §_-f1u§(new ArrowMovie());
         this.§_-D1S§.rotation = 180;
         this.§_-D1S§.y = this.§_-D1S§.height * 0.5;
         return this.§_-D1S§;
      }
   }
}

