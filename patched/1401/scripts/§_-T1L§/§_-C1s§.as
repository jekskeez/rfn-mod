package §_-t1l§
{
   import §_-s2l§.ControllerHeroLocal;
   import §_-s2l§.ControllerHeroRemote;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   
   public class §_-C1s§ extends SquirrelCollection
   {
      
      public function §_-C1s§()
      {
         super();
         this.§_-Y1k§ = §_-Y1w§;
      }
      
      override public function add(param1:int) : void
      {
         if(param1 in super.players)
         {
            return;
         }
         §_-TQ§.add("SquirrelCollection.add: " + param1);
         this.players[param1] = new this.§_-Y1k§(param1,SquirrelGame.instance.world,0,0);
         addChild(this.players[param1]);
         §_-83v§(this.players[param1]);
         if(Game.selfId in this.players)
         {
            addChild(this.players[Game.selfId]);
            §_-83v§(this.players[Game.selfId]);
         }
         this.§_-T1T§(param1);
      }
      
      override protected function §_-T1T§(param1:int) : void
      {
         if(param1 == Game.selfId)
         {
            new ControllerHeroLocal(this.players[param1],true);
         }
         else
         {
            new ControllerHeroRemote(this.players[param1],param1);
         }
      }
   }
}

