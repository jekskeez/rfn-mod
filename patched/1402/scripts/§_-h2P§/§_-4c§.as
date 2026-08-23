package §_-h2P§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import game.mainGame.entity.§_-L1q§;
   
   public class §_-4c§ implements §_-sE§
   {
      
      private var §_-n2x§:int = -1;
      
      private var body:GameBody = null;
      
      public function §_-4c§(param1:GameBody)
      {
         super();
         this.body = param1;
         this.body.syncObject = this;
      }
      
      public function get id() : int
      {
         return this.body.id;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-n2x§ = param1;
      }
      
      public function get position() : b2Vec2
      {
         return this.body.position;
      }
      
      public function set position(param1:b2Vec2) : void
      {
         if(isNaN(param1.x) || isNaN(param1.y))
         {
            return;
         }
         this.body.position = param1;
      }
      
      public function get angle() : Number
      {
         return this.body.angle;
      }
      
      public function set angle(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         this.body.angle = param1;
      }
      
      public function get linearVelocity() : b2Vec2
      {
         if(this.body.body == null)
         {
            return new b2Vec2(0,0);
         }
         return this.body.body.GetLinearVelocity();
      }
      
      public function set linearVelocity(param1:b2Vec2) : void
      {
         if(isNaN(param1.x) || isNaN(param1.y))
         {
            return;
         }
         if(this.body.body == null)
         {
            return;
         }
         this.body.body.SetLinearVelocity(param1);
      }
      
      public function get angularVelocity() : Number
      {
         if(this.body.body == null)
         {
            return 0;
         }
         return this.body.body.GetAngularVelocity();
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         if(this.body.body == null)
         {
            return;
         }
         this.body.body.SetAngularVelocity(param1);
      }
      
      public function get personalId() : int
      {
         if(this.body == null || !(this.body is §_-L1q§))
         {
            return 0;
         }
         return (this.body as §_-L1q§).personalId;
      }
      
      public function dispose() : void
      {
         this.body = null;
      }
      
      public function §_-s1c§(param1:§_-sE§) : void
      {
         this.angle = param1.angle;
         this.angularVelocity = param1.angularVelocity;
         this.linearVelocity = param1.linearVelocity;
         this.position = param1.position;
      }
   }
}

