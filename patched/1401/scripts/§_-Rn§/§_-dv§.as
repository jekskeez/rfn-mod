package §_-Rn§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.GameMap;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   
   public class §_-dv§ extends §_-h2I§ implements §_-63Q§, §_-C2x§, §_-72o§
   {
      
      private var removed:Boolean = false;
      
      protected var view:§_-h2I§ = new §_-h2I§(new PinLimited());
      
      public var §_-tu§:§_-63Q§ = null;
      
      public var §_-B3K§:Boolean = true;
      
      public function §_-dv§(param1:§_-63Q§, param2:§_-h2I§ = null)
      {
         super();
         this.§_-tu§ = param1;
         if(param2 != null)
         {
            this.view.removeFromParent();
            this.view = param2;
         }
         this.view.§_-x2x§();
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
      
      override public function get y() : Number
      {
         return super.y;
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         if(this.§_-tu§ is §_-Tm§ && this.§_-B3K§)
         {
            (this.§_-tu§ as §_-Tm§).update();
         }
      }
      
      override public function get x() : Number
      {
         return super.x;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         if(this.§_-tu§ is §_-Tm§ && this.§_-B3K§)
         {
            (this.§_-tu§ as §_-Tm§).update();
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
            this.§_-n2T§(0);
         }
         this.removeFromParent();
      }
      
      public function §_-t2Q§(param1:GameMap) : void
      {
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
         if(this.removed)
         {
            return;
         }
         this.removed = true;
         param1.remove(this.§_-tu§);
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
      }
   }
}

