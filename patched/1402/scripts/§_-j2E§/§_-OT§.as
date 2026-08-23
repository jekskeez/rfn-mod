package §_-j2E§
{
   import §_-81P§.§_-61P§;
   import §_-81P§.§_-f1D§;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-b2F§.§_-3i§;
   import starling.core.Starling;
   import starling.textures.§_-RS§;
   
   public class §_-OT§ extends §_-92f§
   {
      
      private var §_-Mj§:§_-w10§;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-OT§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-t1§;
         this.§_-i1J§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero)
         {
            return;
         }
         this.§_-Mj§ = §_-w10§.instance;
         if(this.§_-W1u§)
         {
            this.§_-Mj§.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = this.§_-Mj§.§_-d1y§(§_-w10§.§_-XK§,{"sortFunction":this.§_-G11§});
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.smoothing = §_-RS§.§_-ww§;
         this.§_-W1u§.view.§_-L2Z§ = this.hero.x;
         this.§_-W1u§.view.§_-2F§ = this.hero.y;
         this.§_-W1u§.view.§_-xy§ = 650;
         this.§_-W1u§.view.§_-ey§ = 650;
         this.§_-W1u§.start();
         this.hero.game.map.§_-h2T§.§_-J2J§(this.§_-W1u§.view);
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:§_-f1D§ = null;
         super.deactivate();
         if(this.§_-W1u§)
         {
            _loc1_ = new §_-f1D§(this.§_-W1u§.view,2,§_-61P§.§_-fq§);
            _loc1_.§_-02Q§("alpha",0);
            _loc1_.onComplete = this.§_-L1c§;
            Starling.§_-zb§.add(_loc1_);
         }
      }
      
      private function §_-G11§(param1:§_-3i§, param2:§_-3i§) : Number
      {
         if(param1.active && param2.active)
         {
            if(param1.currentTime < param2.currentTime)
            {
               return 1;
            }
            if(param1.currentTime > param2.currentTime)
            {
               return -1;
            }
         }
         else
         {
            if(param1.active && !param2.active)
            {
               return -1;
            }
            if(!param1.active && param2.active)
            {
               return 1;
            }
         }
         return 0;
      }
      
      private function §_-L1c§() : void
      {
         if(!this.§_-W1u§)
         {
            return;
         }
         this.§_-W1u§.stop();
         this.§_-Mj§.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
   }
}

