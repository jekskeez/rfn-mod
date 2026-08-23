package §_-j2E§
{
   import §_-I1q§.§_-B2H§;
   import flash.display.MovieClip;
   
   public class §_-W25§ extends §_-92f§
   {
      
      private static const §_-D2e§:int = 1;
      
      private static const §_-k2§:int = 2;
      
      private static const §_-A3i§:int = 3;
      
      private static const CD:int = 60;
      
      private static const §_-51n§:int = 45;
      
      private static const §_-n1B§:int = 10;
      
      private static const §_-17§:Number = 15;
      
      private static const §_-6j§:Number = 25;
      
      private var view:MovieClip;
      
      public function §_-W25§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.view = new IceDragonCreateView();
         this.view.scaleX = this.view.scaleY = 0.5;
      }
      
      override public function get totalCooldown() : Number
      {
         if(this.§_-32l§ >= §_-D2e§)
         {
            return §_-51n§;
         }
         return CD;
      }
      
      override public function get startCooldown() : Number
      {
         if(this.§_-32l§ >= §_-A3i§)
         {
            return §_-n1B§;
         }
         if(this.§_-32l§ >= §_-D2e§)
         {
            return §_-51n§;
         }
         return CD;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-8x§ = false;
            return;
         }
         super.activate();
         (this.view as IceDragonCreateView).buttons.visible = this.hero.id == Game.selfId;
         this.hero.§_-s28§(this.view,false,false);
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc1_:§_-B2H§ = new §_-B2H§();
         _loc1_.position = this.hero.position.Copy();
         _loc1_.playerId = this.hero.id;
         _loc1_.lifeTime = this.§_-32l§ >= §_-D2e§ ? §_-6j§ : §_-17§;
         _loc1_.§_-G1p§ = this.§_-32l§ >= §_-k2§;
         this.hero.game.map.§_-TP§(_loc1_,true);
         this.hero.isStopped = true;
      }
   }
}

