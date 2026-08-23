package §_-z2j§
{
   import §_-8I§.SquirrelEvent;
   import §_-N14§.§_-G2M§;
   import flash.geom.Point;
   
   public class §_-52E§ extends §_-33U§
   {
      
      public function §_-52E§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-Wk§ as §_-31F§).§_-62l§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         (this.hero.heroView.§_-Wk§ as §_-31F§).stomp = true;
         this.hero.isStopped = true;
         this.hero.addEventListener(SquirrelEvent.§_-z1B§,this.§_-RB§);
         §_-01Y§.§_-h1R§(this.enterFrame,2);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.hero.heroView.§_-Wk§ as §_-31F§).stomp)
         {
            return;
         }
         (this.hero.heroView.§_-Wk§ as §_-31F§).stomp = false;
         this.hero.isStopped = false;
         §_-01Y§.§_-t1s§(this.enterFrame);
      }
      
      private function enterFrame() : void
      {
         if(!this.hero)
         {
            §_-01Y§.§_-t1s§(this.enterFrame);
            return;
         }
         var _loc1_:§_-G2M§ = (this.hero.heroView.§_-Wk§ as §_-31F§).armature.animation.getState(§_-31F§.§_-i29§);
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:int = §_-t1V§.count;
         var _loc3_:Number = _loc1_.currentTime % _loc1_.§_-D2C§;
         var _loc4_:Number = _loc3_ / _loc1_.§_-D2C§;
         if(_loc4_ < 0.59 || _loc4_ > 0.66 || !this.hero.onFloor)
         {
            return;
         }
         var _loc5_:int = _loc2_ * 0.5;
         Hero.self.game.shift = Hero.self.game.shift.add(new Point(Math.random() * _loc2_ - _loc5_,Math.random() * _loc2_ - _loc5_));
      }
      
      private function §_-RB§(param1:SquirrelEvent) : void
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

