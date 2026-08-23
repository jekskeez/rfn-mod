package §_-53r§
{
   import Box2D.Dynamics.b2World;
   import game.mainGame.§_-K1G§;
   import game.mainGame.§_-R2k§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-d10§ extends Hero implements §_-R2k§
   {
      
      public static const §_-c2Z§:int = 10;
      
      private var §_-J2Q§:uint;
      
      public function §_-d10§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this.heroView.§_-P1K§ = new §_-K1G§();
         if(!this.isSelf)
         {
            this.heroView.§_-P1K§.alpha = 0.5;
         }
         this.health = §_-c2Z§;
      }
      
      override public function show() : void
      {
         super.show();
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.visible = true;
         }
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.visible = false;
         }
      }
      
      override public function set dead(param1:Boolean) : void
      {
         this.inHollow = param1;
         super.dead = param1;
         if(param1)
         {
            this.health = 0;
         }
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.visible = param1;
         }
      }
      
      override public function sendLocation(param1:int = 0) : void
      {
         if(!(this.id == Game.selfId || this == Hero.self) || this.isDead || this.inHollow || !this.§_-vs§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-D1P§,param1,this.position.x,this.position.y,this.velocity.x,this.velocity.y,this.health);
      }
      
      override public function reset() : void
      {
         super.reset();
         this.health = §_-c2Z§;
      }
      
      override public function respawn(param1:int = 0) : void
      {
         super.respawn(param1);
         this.health = §_-c2Z§;
      }
      
      public function get health() : int
      {
         return this.§_-J2Q§;
      }
      
      public function set health(param1:int) : void
      {
         if(this.§_-G2P§.running && param1 != §_-c2Z§)
         {
            return;
         }
         if(param1 == this.health && param1 != §_-c2Z§)
         {
            return;
         }
         this.§_-J2Q§ = Math.min(Math.max(param1,0),§_-c2Z§);
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.update(this.§_-J2Q§,§_-c2Z§);
         }
         this.sendLocation();
      }
   }
}

