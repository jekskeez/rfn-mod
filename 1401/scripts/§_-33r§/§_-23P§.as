package §_-33r§
{
   import Box2D.Common.Math.b2Mat22;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import dragonBones.§_-TH§;
   
   public class §_-23P§ extends §_-AP§ implements §_-i8§
   {
      
      private var power:Number = 0;
      
      private var §_-c1w§:Boolean = false;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-23P§(param1:Number, param2:Number)
      {
         super(param1);
         this.power = param2;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 == this.§_-c1w§)
         {
            return;
         }
         this.§_-c1w§ = param1;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:Vector.<§_-TH§> = null;
         var _loc3_:int = 0;
         if(param1 == null && this.hero != null)
         {
            this.active = false;
            _loc2_ = this.hero.heroView.armature.getBones();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(!(_loc2_[_loc3_].name == "Head" || _loc2_[_loc3_].name == "Cap"))
               {
                  _loc2_[_loc3_].visible = true;
               }
               _loc3_++;
            }
            this.hero.disableEffect(§_-93d§.§_-c15§);
            this.§_-A38§ = null;
         }
         else
         {
            _loc2_ = param1.heroView.armature.getBones();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(!(_loc2_[_loc3_].name == "Head" || _loc2_[_loc3_].name == "Cap"))
               {
                  _loc2_[_loc3_].visible = false;
               }
               _loc3_++;
            }
            this.§_-A38§ = param1.applyEffect(§_-93d§.§_-c15§);
            this.§_-A38§.§_-Y1m§ = Math.PI * 0.5;
         }
         super.hero = param1;
      }
      
      public function get active() : Boolean
      {
         return this.§_-c1w§;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.active)
         {
            return;
         }
         this.hero.velocity.MulM(this.hero.body.GetTransform().R.GetInverse(new b2Mat22()));
         this.hero.velocity.y = -this.power;
         this.hero.velocity.MulM(this.hero.body.GetTransform().R);
         this.hero.body.SetLinearVelocity(this.hero.velocity);
      }
   }
}

