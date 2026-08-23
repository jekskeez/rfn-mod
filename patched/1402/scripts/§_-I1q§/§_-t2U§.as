package §_-I1q§
{
   import §_-TK§.§_-aS§;
   import §_-X1k§.§_-A3y§;
   import §_-j2E§.§_-A11§;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import utils.§_-o1Q§;
   
   public class §_-t2U§ extends §_-Z2G§ implements §_-jC§
   {
      
      private var §_-Z2g§:Boolean = false;
      
      public function §_-t2U§()
      {
         this.§_-o1r§ = §_-A11§.§_-y2m§;
         this.§_-i1D§ = §_-g1j§.§_-821§;
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
         §_-o1Q§.§_-r1u§(this.x + this.§_-21H§.shift.x,this.y + this.§_-21H§.shift.y,EnergyNurseBonus,§_-A3y§.§_-W27§);
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-S27§,§_-D1m§.§_-73O§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
   }
}

