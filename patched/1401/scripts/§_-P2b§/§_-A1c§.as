package §_-P2b§
{
   import §_-u2r§.§_-G1D§;
   import flash.display.MovieClip;
   
   public class §_-A1c§ extends §_-H2N§
   {
      
      private static const §_-5s§:int = 1;
      
      private static const §_-b2Q§:int = 2;
      
      private static const §_-2o§:int = 3;
      
      private static const CD:int = 60;
      
      private static const §_-DV§:int = 45;
      
      private static const §_-v2v§:int = 10;
      
      private static const §_-p2O§:Number = 15;
      
      private static const §_-s1p§:Number = 25;
      
      private var view:MovieClip;
      
      public function §_-A1c§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.view = new IceDragonCreateView();
         this.view.scaleX = this.view.scaleY = 0.5;
      }
      
      override public function get totalCooldown() : Number
      {
         if(this.§_-j2Y§ >= §_-5s§)
         {
            return §_-DV§;
         }
         return CD;
      }
      
      override public function get startCooldown() : Number
      {
         if(this.§_-j2Y§ >= §_-2o§)
         {
            return §_-v2v§;
         }
         if(this.§_-j2Y§ >= §_-5s§)
         {
            return §_-DV§;
         }
         return CD;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-c1w§ = false;
            return;
         }
         super.activate();
         (this.view as IceDragonCreateView).buttons.visible = this.hero.id == Game.selfId;
         this.hero.§_-72F§(this.view,false,false);
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc1_:§_-G1D§ = new §_-G1D§();
         _loc1_.position = this.hero.position.Copy();
         _loc1_.playerId = this.hero.id;
         _loc1_.lifeTime = this.§_-j2Y§ >= §_-5s§ ? §_-s1p§ : §_-p2O§;
         _loc1_.§_-V1D§ = this.§_-j2Y§ >= §_-b2Q§;
         this.hero.game.map.§_-nA§(_loc1_,true);
         this.hero.isStopped = true;
      }
   }
}

