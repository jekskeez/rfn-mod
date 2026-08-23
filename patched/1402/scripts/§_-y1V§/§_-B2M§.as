package §_-y1V§
{
   import §_-I2Y§.§_-l2r§;
   import §_-cm§.§_-cV§;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-T17§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-B2M§
   {
      
      public static const §_-gb§:int = 1;
      
      public static const §_-n2A§:int = 2;
      
      public static const §_-k1s§:int = 3;
      
      public static const §_-u2T§:int = 4;
      
      public static const §_-Z2u§:int = 5;
      
      public static const §_-6s§:int = 6;
      
      public static const §_-k1Z§:int = 7;
      
      public static const §_-YS§:int = 8;
      
      public static const §_-f2V§:int = 9;
      
      private var achievements:Vector.<§_-l2r§> = new Vector.<§_-l2r§>();
      
      private var §_-V20§:Vector.<int> = new Vector.<int>();
      
      private var §_-w2c§:Timer = new Timer(650,1);
      
      public function §_-B2M§()
      {
         super();
         this.init();
      }
      
      public function dispose() : void
      {
         this.§_-w2c§.stop();
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
            if(this.achievements[_loc1_] is §_-T17§)
            {
               (this.achievements[_loc1_] as §_-T17§).reset();
            }
            _loc1_++;
         }
      }
      
      private function init() : void
      {
         this.§_-w2c§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-120§);
         var _loc1_:§_-T1G§ = new §_-T1G§(this.§_-yZ§);
         this.achievements.push(_loc1_);
         var _loc2_:§_-B2V§ = new §_-B2V§(SquirrelGame.instance as §_-cV§,this.§_-yZ§);
         this.achievements.push(_loc2_);
         var _loc3_:§_-Y2L§ = new §_-Y2L§(this.§_-yZ§);
         this.achievements.push(_loc3_);
         var _loc4_:§_-OM§ = new §_-OM§(this.§_-yZ§);
         this.achievements.push(_loc4_);
         var _loc5_:§_-71Q§ = new §_-71Q§(SquirrelGame.instance,this.§_-yZ§);
         this.achievements.push(_loc5_);
         var _loc6_:§_-l1b§ = new §_-l1b§(SquirrelGame.instance,this.§_-yZ§);
         this.achievements.push(_loc6_);
      }
      
      private function §_-yZ§(param1:int) : void
      {
         if(Hero.self.isDead)
         {
            if(this.§_-V20§.length != 0)
            {
               this.§_-V20§ = new Vector.<int>();
            }
            return;
         }
         this.§_-V20§.push(param1);
         if(this.§_-w2c§.running)
         {
            return;
         }
         this.§_-120§();
      }
      
      private function §_-120§(param1:TimerEvent = null) : void
      {
         if(this.§_-V20§.length == 0)
         {
            return;
         }
         this.§_-T2J§(this.§_-V20§.shift());
         this.§_-w2c§.reset();
         this.§_-w2c§.start();
      }
      
      private function §_-T2J§(param1:int) : void
      {
         if(!Hero.§_-Cg§ || !SquirrelCollection.instance)
         {
            return;
         }
         var _loc2_:Point = new Point(Hero.self.x + 15,Hero.self.y - 42);
         switch(param1)
         {
            case §_-gb§:
               new §_-W12§(gls("ДВОЙНОЕ УБИЙСТВО"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-gb§,1);
               break;
            case §_-n2A§:
               new §_-W12§(gls("ТРОЙНОЕ УБИЙСТВО"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-n2A§,1);
               break;
            case §_-k1s§:
               new §_-W12§(gls("МЕГА ВЫСТРЕЛ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-k1s§,1);
               break;
            case §_-u2T§:
               new §_-W12§(gls("ПЕРВАЯ КРОВЬ!"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-u2T§,1);
               break;
            case §_-Z2u§:
               new §_-W12§(gls("НЕУБИВАЕМЫЙ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-Z2u§,1);
               break;
            case §_-6s§:
               new §_-W12§(gls("РЭМБО"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-6s§,1);
               break;
            case §_-k1Z§:
               new §_-W12§(gls("ВОЗВРАЩЕНИЕ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-k1Z§,1);
               break;
            case §_-YS§:
               new §_-W12§(gls("МЕСТЬ"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-YS§,1);
               break;
            case §_-f2V§:
               new §_-W12§(gls("СНАЙПЕР"),SquirrelCollection.instance,_loc2_.x,_loc2_.y);
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-f2V§,1);
         }
      }
   }
}

