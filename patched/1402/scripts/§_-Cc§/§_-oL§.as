package §_-Cc§
{
   import §_-Vu§.§_-h25§;
   import §_-Vu§.§_-p4§;
   import §_-j2E§.§_-W2i§;
   import §_-s2e§.§_-O1h§;
   import dragonBones.§_-83b§;
   
   public class §_-oL§ extends §_-pp§
   {
      
      private static const §_-D26§:Number = 1.05;
      
      private static const §_-32V§:String = "cast";
      
      public function §_-oL§(param1:Number)
      {
         super(param1);
      }
      
      public function §_-m2a§() : void
      {
         var _loc2_:§_-83b§ = null;
         if(this.§_-XS§)
         {
            return;
         }
         var _loc1_:§_-83b§ = (this.hero.heroView.viewAlternative as §_-W2i§).armature.§_-i2v§("Head");
         for each(_loc2_ in _loc1_.childArmature.getBones())
         {
            _loc2_.§_-M1A§ = §_-32V§;
         }
         _loc1_.childArmature.animation.gotoAndPlay(§_-32V§,-1,-1,NaN,0,§_-32V§,§_-h25§.§_-fX§);
         _loc1_.armature.§_-j2c§();
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p1V§.delay);
      }
      
      public function §_-KJ§() : void
      {
         var _loc2_:§_-83b§ = null;
         if(this.§_-XS§)
         {
            return;
         }
         var _loc1_:§_-83b§ = (this.hero.heroView.viewAlternative as §_-W2i§).armature.§_-i2v§("Head");
         for each(_loc2_ in _loc1_.childArmature.getBones())
         {
            _loc2_.§_-M1A§ = null;
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-W2i§ = null;
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed /= §_-D26§;
         }
         else
         {
            param1.runSpeed *= §_-D26§;
            _loc2_ = new §_-W2i§(§_-O1h§.§_-fo§);
            _loc2_.name = "SnowLeopard";
            param1.changeView(_loc2_);
         }
         super.hero = param1;
      }
      
      private function get §_-XS§() : Boolean
      {
         return !this.hero || !this.hero.heroView.viewAlternative || !(this.hero.heroView.viewAlternative is §_-W2i§) || !(this.hero.heroView.viewAlternative as §_-W2i§).armature;
      }
   }
}

