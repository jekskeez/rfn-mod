package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-S1G§ extends §_-21O§
   {
      
      private static const §_-c1F§:Number = 10;
      
      private var §_-xP§:Object = {};
      
      public function §_-S1G§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-82p§;
      }
      
      override protected function activate() : void
      {
         var _loc2_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         var _loc1_:Number = this.hero.runSpeed * §_-Nu§() / 100;
         this.§_-xP§[this.hero.id] = _loc1_;
         this.hero.runSpeed += _loc1_;
         if(!this.buff)
         {
            this.buff = §_-T1G§(0.5);
         }
         this.hero.§_-Aj§(this.buff);
         this.hero.heroView.§_-S2O§();
         if(!this.§_-41W§)
         {
            return;
         }
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(!this.§_-qu§(_loc2_) || !this.§_-w1q§(_loc2_)))
            {
               _loc1_ = _loc2_.runSpeed * §_-Nu§() / 100;
               this.§_-xP§[_loc2_.id] = _loc1_;
               _loc2_.runSpeed += _loc1_;
               _loc2_.§_-Aj§(this.buff);
               _loc2_.heroView.§_-S2O§();
            }
         }
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeBuff(this.buff);
         this.hero.runSpeed -= this.§_-xP§[this.hero.id];
         delete this.§_-xP§[this.hero.id];
         if(!this.§_-41W§)
         {
            return;
         }
         if(!this.hero.game)
         {
            return;
         }
         for(_loc1_ in this.§_-xP§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.runSpeed -= this.§_-xP§[_loc1_];
               _loc2_.removeBuff(this.buff);
               delete this.§_-xP§[_loc2_.id];
            }
         }
         this.§_-xP§ = {};
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-k2W§ && !param1.isDead && !param1.inHollow && !param1.isHare && !param1.isDragon && param1.id != this.hero.id;
      }
      
      private function §_-w1q§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1.position);
         return _loc2_.Length() <= §_-c1F§;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
   }
}

