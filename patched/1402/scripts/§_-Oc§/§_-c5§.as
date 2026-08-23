package §_-Oc§
{
   import §_-Vu§.§_-tW§;
   import §_-X2V§.SquirrelEvent;
   import flash.geom.Point;
   
   public class §_-c5§ extends §_-WE§
   {
      
      public function §_-c5§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-t2V§ as §_-23o§).§_-b2J§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         (this.hero.heroView.§_-t2V§ as §_-23o§).stomp = true;
         this.hero.isStopped = true;
         this.hero.addEventListener(SquirrelEvent.§_-E25§,this.§_-tw§);
         §_-p1V§.§_-A3z§(this.enterFrame,2);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.hero.heroView.§_-t2V§ as §_-23o§).stomp)
         {
            return;
         }
         (this.hero.heroView.§_-t2V§ as §_-23o§).stomp = false;
         this.hero.isStopped = false;
         §_-p1V§.§_-DO§(this.enterFrame);
      }
      
      private function enterFrame() : void
      {
         if(!this.hero)
         {
            §_-p1V§.§_-DO§(this.enterFrame);
            return;
         }
         var _loc1_:§_-tW§ = (this.hero.heroView.§_-t2V§ as §_-23o§).armature.animation.getState(§_-23o§.§_-g24§);
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:int = §_-Mf§.count;
         var _loc3_:Number = _loc1_.currentTime % _loc1_.§_-R1Z§;
         var _loc4_:Number = _loc3_ / _loc1_.§_-R1Z§;
         if(_loc4_ < 0.59 || _loc4_ > 0.66 || !this.hero.onFloor)
         {
            return;
         }
         var _loc5_:int = _loc2_ * 0.5;
         Hero.self.game.shift = Hero.self.game.shift.add(new Point(Math.random() * _loc2_ - _loc5_,Math.random() * _loc2_ - _loc5_));
      }
      
      private function §_-tw§(param1:SquirrelEvent) : void
      {
         onComplete();
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
   }
}

