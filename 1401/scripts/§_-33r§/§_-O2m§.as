package §_-33r§
{
   import §_-68§.§_-M10§;
   import §_-N14§.§_-i2C§;
   import §_-N14§.§_-w2t§;
   import §_-P2b§.§_-73X§;
   import dragonBones.§_-TH§;
   
   public class §_-O2m§ extends §_-AP§
   {
      
      private static const §_-y1J§:Number = 1.05;
      
      private static const §_-mz§:String = "cast";
      
      public function §_-O2m§(param1:Number)
      {
         super(param1);
      }
      
      public function §_-12b§() : void
      {
         var _loc2_:§_-TH§ = null;
         if(this.§_-733§)
         {
            return;
         }
         var _loc1_:§_-TH§ = (this.hero.heroView.viewAlternative as §_-73X§).armature.§_-M1s§("Head");
         for each(_loc2_ in _loc1_.childArmature.getBones())
         {
            _loc2_.§_-r2q§ = §_-mz§;
         }
         _loc1_.childArmature.animation.gotoAndPlay(§_-mz§,-1,-1,NaN,0,§_-mz§,§_-i2C§.§_-511§);
         _loc1_.armature.§_-V1S§();
         §_-w2t§.§_-R2J§.§_-ld§(§_-01Y§.delay);
      }
      
      public function §_-W2g§() : void
      {
         var _loc2_:§_-TH§ = null;
         if(this.§_-733§)
         {
            return;
         }
         var _loc1_:§_-TH§ = (this.hero.heroView.viewAlternative as §_-73X§).armature.§_-M1s§("Head");
         for each(_loc2_ in _loc1_.childArmature.getBones())
         {
            _loc2_.§_-r2q§ = null;
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-73X§ = null;
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed /= §_-y1J§;
         }
         else
         {
            param1.runSpeed *= §_-y1J§;
            _loc2_ = new §_-73X§(§_-M10§.§_-R2l§);
            _loc2_.name = "SnowLeopard";
            param1.changeView(_loc2_);
         }
         super.hero = param1;
      }
      
      private function get §_-733§() : Boolean
      {
         return !this.hero || !this.hero.heroView.viewAlternative || !(this.hero.heroView.viewAlternative is §_-73X§) || !(this.hero.heroView.viewAlternative as §_-73X§).armature;
      }
   }
}

