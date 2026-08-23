package §_-u2r§
{
   import §_-I10§.§_-428§;
   import §_-P2b§.§_-6L§;
   import §_-RI§.§_-h2I§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import utils.§_-r2N§;
   
   public class §_-R1J§ extends §_-R1r§ implements §_-jP§
   {
      
      private var §_-Q2t§:Boolean = false;
      
      public function §_-R1J§()
      {
         this.§_-WN§ = §_-6L§.§_-H1h§;
         this.§_-pV§ = §_-A1n§.§_-y2Z§;
         super();
      }
      
      override protected function get animation() : MovieClip
      {
         var _loc1_:CocktailView = new CocktailView();
         _loc1_.mouseChildren = false;
         return _loc1_;
      }
      
      override protected function get beginAnimation() : MovieClip
      {
         var _loc1_:CocktailBegin = new CocktailBegin();
         _loc1_.x = 2;
         _loc1_.y = 32;
         return _loc1_;
      }
      
      override protected function showAward() : void
      {
         §_-r2N§.§_-81V§(this.x + this.§_-H2D§.shift.x,this.y + this.§_-H2D§.shift.y,EnergyNurseBonus,§_-428§.§_-61Q§);
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-F2F§,§_-1s§.§_-r1v§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
   }
}

