package §_-u1f§
{
   import Box2D.Dynamics.b2World;
   import game.mainGame.§_-YI§;
   import game.mainGame.§_-v0§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-L1H§ extends Hero implements §_-v0§
   {
      
      public static const §_-V6§:int = 10;
      
      private var §_-J2b§:uint;
      
      public function §_-L1H§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this.heroView.§_-E2U§ = new §_-YI§();
         if(!this.isSelf)
         {
            this.heroView.§_-E2U§.alpha = 0.5;
         }
         this.health = §_-V6§;
      }
      
      override public function show() : void
      {
         super.show();
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.visible = true;
         }
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.visible = false;
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
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.visible = param1;
         }
      }
      
      override public function sendLocation(param1:int = 0) : void
      {
         if(!(this.id == Game.selfId || this == Hero.self) || this.isDead || this.inHollow || !this.§_-HQ§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-325§,param1,this.position.x,this.position.y,this.velocity.x,this.velocity.y,this.health);
      }
      
      override public function reset() : void
      {
         super.reset();
         this.health = §_-V6§;
      }
      
      override public function respawn(param1:int = 0) : void
      {
         super.respawn(param1);
         this.health = §_-V6§;
      }
      
      public function get health() : int
      {
         return this.§_-J2b§;
      }
      
      public function set health(param1:int) : void
      {
         if(this.§_-12l§.running && param1 != §_-V6§)
         {
            return;
         }
         if(param1 == this.health && param1 != §_-V6§)
         {
            return;
         }
         this.§_-J2b§ = Math.min(Math.max(param1,0),§_-V6§);
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.update(this.§_-J2b§,§_-V6§);
         }
         this.sendLocation();
      }
   }
}

