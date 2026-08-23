package §_-M1h§
{
   import §_-5P§.§_-Z1f§;
   import §_-61C§.§_-a2p§;
   import §_-c2C§.§_-S2E§;
   import events.§_-Um§;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import protocol.§_-s2l§;
   
   public class §_-Vk§ extends SquirrelGame
   {
      
      public function §_-Vk§()
      {
         this.init();
         super();
      }
      
      override public function dispose() : void
      {
         if(Hero.self)
         {
            Hero.self.removeEventListener(§_-Um§.§_-9q§,this.§_-WB§);
         }
         super.dispose();
      }
      
      public function start() : void
      {
         this.§_-d§ = false;
         if(Hero.self)
         {
            Hero.self.removeEventListener(§_-Um§.§_-9q§,this.§_-WB§);
         }
         this.squirrels.clear();
         this.squirrels.add(Game.selfId);
         Hero.self.addEventListener(§_-Um§.§_-9q§,this.§_-WB§,false,0,true);
         this.squirrels.reset();
         this.squirrels.§_-J1N§(§_-S2E§.type == §_-S2E§.§_-Z2N§ ? [Game.selfId] : []);
         this.squirrels.place();
         this.squirrels.show();
         §_-a2p§.§_-j2F§ = §_-s2l§.ROUND_START;
         §_-a2p§.hero = Hero.self;
         this.§_-d§ = true;
      }
      
      protected function init() : void
      {
         this.map = new §_-Y2j§(this);
         this.cast = new Cast(this);
         this.squirrels = new SquirrelCollection();
      }
      
      private function §_-WB§(param1:§_-Um§) : void
      {
         if(this.squirrels.§_-q2q§ > 0 && §_-Z1f§.§_-q1E§ in §_-S2E§.§_-t1y§)
         {
            return;
         }
         §_-S2E§.§_-k1i§();
      }
   }
}

