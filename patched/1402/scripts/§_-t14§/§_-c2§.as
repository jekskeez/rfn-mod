package §_-t14§
{
   import §_-G2y§.ControllerHeroLocal;
   import §_-G2y§.ControllerHeroRemote;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   
   public class §_-c2§ extends SquirrelCollection
   {
      
      public function §_-c2§()
      {
         super();
         this.§_-71Y§ = §_-j2w§;
      }
      
      override public function add(param1:int) : void
      {
         if(param1 in super.players)
         {
            return;
         }
         §_-p2U§.add("SquirrelCollection.add: " + param1);
         this.players[param1] = new this.§_-71Y§(param1,SquirrelGame.instance.world,0,0);
         addChild(this.players[param1]);
         §_-J2J§(this.players[param1]);
         if(Game.selfId in this.players)
         {
            addChild(this.players[Game.selfId]);
            §_-J2J§(this.players[Game.selfId]);
         }
         this.§_-21b§(param1);
      }
      
      override protected function §_-21b§(param1:int) : void
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

