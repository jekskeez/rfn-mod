package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.utils.getDefinitionByName;
   
   public class §_-1D§ extends §_-21O§
   {
      
      private static const §_-O2E§:Number = 15;
      
      public function §_-1D§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-33a§;
      }
      
      override public function get available() : Boolean
      {
         return super.available && (!(this.hero.heroView.running || this.hero.heroView.§_-k2P§) && !this.§_-41W§ || this.§_-41W§);
      }
      
      override public function get maxCountUse() : int
      {
         return §_-Nu§();
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         var _loc1_:b2Vec2 = new b2Vec2((this.hero.heroView.direction ? -1 : 1) * §_-O2E§,0);
         _loc1_.MulM(this.hero.body.GetTransform().R);
         _loc1_.Add(this.hero.position.Copy());
         this.hero.§_-s1§(_loc1_);
         this.hero.heroView.§_-S2O§();
         this.hero.heroView.§_-A2O§(new §_-QC§.perkData[this.§_-i2D§]["buttonClass"](),1);
         this.active = false;
      }
   }
}

