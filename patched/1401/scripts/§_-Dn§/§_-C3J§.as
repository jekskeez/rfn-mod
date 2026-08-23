package §_-Dn§
{
   import §_-T1r§.§_-b1U§;
   import §_-Y22§.§_-C2x§;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-xe§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-C3J§
   {
      
      public static const §_-st§:int = 1;
      
      public static const §_-d21§:int = 2;
      
      public static const §_-017§:int = 3;
      
      public static const §_-Q2a§:int = 4;
      
      public static const §_-93J§:int = 5;
      
      public static const §_-D21§:int = 6;
      
      public static const §_-A2l§:int = 7;
      
      public static const §_-71m§:int = 8;
      
      public static const §_-4S§:int = 9;
      
      private var achievements:Vector.<§_-C2x§> = new Vector.<§_-C2x§>();
      
      private var §_-E18§:Vector.<int> = new Vector.<int>();
      
      private var §_-P2U§:Timer = new Timer(650,1);
      
      public function §_-C3J§()
      {
         super();
         this.init();
      }
      
      public function dispose() : void
      {
         this.§_-P2U§.stop();
         while(this.achievements.length != 0)
         {
            this.achievements.pop().dispose();
         }
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.achievements.length)
         {
            if(this.achievements[_loc1_] is §_-xe§)
            {
               (this.achievements[_loc1_] as §_-xe§).reset();
            }
            _loc1_++;
         }
      }
      
      private function init() : void
      {
         this.§_-P2U§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-C2u§);
         var _loc1_:§_-sQ§ = new §_-sQ§(this.§_-g6§);
         this.achievements.push(_loc1_);
         var _loc2_:§_-n1A§ = new §_-n1A§(SquirrelGame.instance as §_-b1U§,this.§_-g6§);
         this.achievements.push(_loc2_);
         var _loc3_:§_-LC§ = new §_-LC§(this.§_-g6§);
         this.achievements.push(_loc3_);
         var _loc4_:§_-bO§ = new §_-bO§(this.§_-g6§);
         this.achievements.push(_loc4_);
         var _loc5_:§_-u1y§ = new §_-u1y§(SquirrelGame.instance,this.§_-g6§);
         this.achievements.push(_loc5_);
         var _loc6_:§_-h19§ = new §_-h19§(SquirrelGame.instance,this.§_-g6§);
         this.achievements.push(_loc6_);
      }
      
      private function §_-g6§(param1:int) : void
      {
         if(Hero.self.isDead)
         {
            if(this.§_-E18§.length != 0)
            {
               this.§_-E18§ = new Vector.<int>();
            }
            return;
         }
         this.§_-E18§.push(param1);
         if(this.§_-P2U§.running)
         {
            return;
         }
         this.§_-C2u§();
      }
      
      private function §_-C2u§(param1:TimerEvent = null) : void
      {
         if(this.§_-E18§.length == 0)
         {
            return;
         }
         this.§_-21f§(this.§_-E18§.shift());
         this.§_-P2U§.reset();
         this.§_-P2U§.start();
      }
      
      private function §_-21f§(param1:int) : void
      {
         if(!Hero.§_-6g§ || !SquirrelCollection.instance)
         {
            return;
         }
         var _loc2_:Point = new Point(Hero.self.x + 15,Hero.self.y - 42);
         switch(param1)
         {
            case §_-st§:
               new §_-a2C§(gls("ДВОЙНОЕ УБИЙСТВО"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-st§,1);
               break;
            case §_-d21§:
               new §_-a2C§(gls("ТРОЙНОЕ УБИЙСТВО"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-d21§,1);
               break;
            case §_-017§:
               new §_-a2C§(gls("МЕГА ВЫСТРЕЛ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-017§,1);
               break;
            case §_-Q2a§:
               new §_-a2C§(gls("ПЕРВАЯ КРОВЬ!"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-Q2a§,1);
               break;
            case §_-93J§:
               new §_-a2C§(gls("НЕУБИВАЕМЫЙ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-93J§,1);
               break;
            case §_-D21§:
               new §_-a2C§(gls("РЭМБО"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-D21§,1);
               break;
            case §_-A2l§:
               new §_-a2C§(gls("ВОЗВРАЩЕНИЕ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-A2l§,1);
               break;
            case §_-71m§:
               new §_-a2C§(gls("МЕСТЬ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-71m§,1);
               break;
            case §_-4S§:
               new §_-a2C§(gls("СНАЙПЕР"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-4S§,1);
         }
      }
   }
}

