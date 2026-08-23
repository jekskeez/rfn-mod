package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.utils.getDefinitionByName;
   
   public class §_-J2y§ extends §_-S2w§
   {
      
      private static const §_-T26§:Number = 15;
      
      public function §_-J2y§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-o26§;
      }
      
      override public function get available() : Boolean
      {
         return super.available && (!(this.hero.heroView.running || this.hero.heroView.§_-52A§) && !this.§_-53U§ || this.§_-53U§);
      }
      
      override public function get maxCountUse() : int
      {
         return §_-bx§();
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         var _loc1_:b2Vec2 = new b2Vec2((this.hero.heroView.direction ? -1 : 1) * §_-T26§,0);
         _loc1_.MulM(this.hero.body.GetTransform().R);
         _loc1_.Add(this.hero.position.Copy());
         this.hero.§_-r1C§(_loc1_);
         this.hero.heroView.§_-k1I§();
         this.hero.heroView.§_-v2L§(new §_-pl§.perkData[this.§_-T2a§]["buttonClass"](),1);
         this.active = false;
      }
   }
}

