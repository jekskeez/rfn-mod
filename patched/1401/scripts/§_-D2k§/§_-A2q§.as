package §_-D2k§
{
   import §_-1§.§_-tY§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-F29§;
   import events.§_-Wh§;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import protocol.§_-S2I§;
   
   public class §_-A2q§ extends SquirrelGame
   {
      
      public function §_-A2q§()
      {
         this.init();
         super();
      }
      
      override public function dispose() : void
      {
         if(Hero.self)
         {
            Hero.self.removeEventListener(§_-Wh§.§_-63w§,this.§_-H1L§);
         }
         super.dispose();
      }
      
      public function start() : void
      {
         this.§_-j1L§ = false;
         if(Hero.self)
         {
            Hero.self.removeEventListener(§_-Wh§.§_-63w§,this.§_-H1L§);
         }
         this.squirrels.clear();
         this.squirrels.add(Game.selfId);
         Hero.self.addEventListener(§_-Wh§.§_-63w§,this.§_-H1L§,false,0,true);
         this.squirrels.reset();
         this.squirrels.§_-B1q§(§_-F29§.type == §_-F29§.§_-S2i§ ? [Game.selfId] : []);
         this.squirrels.place();
         this.squirrels.show();
         §_-O1M§.§_-F2g§ = §_-S2I§.ROUND_START;
         §_-O1M§.hero = Hero.self;
         this.§_-j1L§ = true;
      }
      
      protected function init() : void
      {
         this.map = new §_-t2w§(this);
         this.cast = new Cast(this);
         this.squirrels = new SquirrelCollection();
      }
      
      private function §_-H1L§(param1:§_-Wh§) : void
      {
         if(this.squirrels.§_-I2R§ > 0 && §_-tY§.§_-Yi§ in §_-F29§.§_-Vx§)
         {
            return;
         }
         §_-F29§.§_-g15§();
      }
   }
}

