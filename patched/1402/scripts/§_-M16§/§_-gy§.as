package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import game.mainGame.GameMap;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-gy§ extends §_-aS§ implements §_-xn§, §_-l2r§, §_-hQ§
   {
      
      private var removed:Boolean = false;
      
      protected var view:§_-aS§ = new §_-aS§(new PinLimited());
      
      public var §_-8n§:§_-xn§ = null;
      
      public var §_-W2M§:Boolean = true;
      
      public function §_-gy§(param1:§_-xn§, param2:§_-aS§ = null)
      {
         super();
         this.§_-8n§ = param1;
         if(param2 != null)
         {
            this.view.removeFromParent();
            this.view = param2;
         }
         this.view.§_-i18§();
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
      
      override public function get y() : Number
      {
         return super.y;
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         if(this.§_-8n§ is §_-F1c§ && this.§_-W2M§)
         {
            (this.§_-8n§ as §_-F1c§).update();
         }
      }
      
      override public function get x() : Number
      {
         return super.x;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         if(this.§_-8n§ is §_-F1c§ && this.§_-W2M§)
         {
            (this.§_-8n§ as §_-F1c§).update();
         }
      }
      
      public function get angle() : Number
      {
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 / Game.D2R;
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function dispose() : void
      {
         this.view.removeFromParent();
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         this.removeFromParent();
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
         if(this.removed)
         {
            return;
         }
         this.removed = true;
         param1.remove(this.§_-8n§);
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
      }
   }
}

