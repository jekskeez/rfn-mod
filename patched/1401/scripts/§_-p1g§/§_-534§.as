package §_-p1g§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-B1O§.§_-W2J§;
   import §_-B1O§.§_-rJ§;
   import flash.utils.setTimeout;
   
   public class §_-534§ extends Hero
   {
      
      public function §_-534§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function set dead(param1:Boolean) : void
      {
         if(param1 && this.shaman)
         {
            setTimeout(this.§_-d1w§,0);
            return;
         }
         super.dead = param1;
      }
      
      override public function set shaman(param1:Boolean) : void
      {
         if(this.shaman == param1)
         {
            return;
         }
         this.§_-d1w§();
         if(!param1)
         {
            this.team = §_-JL§;
         }
         super.shaman = param1;
      }
      
      private function §_-d1w§() : void
      {
         switch(this.team)
         {
            case Hero.§_-114§:
               this.teleportTo(this.game.map.get(§_-rJ§).length > 0 ? this.game.map.get(§_-rJ§)[0].position : null);
               break;
            case Hero.§_-17§:
               this.teleportTo(this.game.map.get(§_-W2J§).length > 0 ? this.game.map.get(§_-W2J§)[0].position : null);
         }
      }
   }
}

