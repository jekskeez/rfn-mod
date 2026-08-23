package §_-Cc§
{
   import Box2D.Common.Math.b2Mat22;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import dragonBones.§_-83b§;
   
   public class §_-hs§ extends §_-pp§ implements §_-B3z§
   {
      
      private var power:Number = 0;
      
      private var §_-8x§:Boolean = false;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-hs§(param1:Number, param2:Number)
      {
         super(param1);
         this.power = param2;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 == this.§_-8x§)
         {
            return;
         }
         this.§_-8x§ = param1;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:Vector.<§_-83b§> = null;
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
            this.hero.disableEffect(§_-w10§.§_-Cl§);
            this.§_-W1u§ = null;
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
            this.§_-W1u§ = param1.applyEffect(§_-w10§.§_-Cl§);
            this.§_-W1u§.§_-q22§ = Math.PI * 0.5;
         }
         super.hero = param1;
      }
      
      public function get active() : Boolean
      {
         return this.§_-8x§;
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

