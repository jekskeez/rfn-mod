package §_-P2b§
{
   import §_-Ov§.§_-a29§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-m1z§.§_-529§;
   import §_-m1z§.§_-Mk§;
   import starling.core.Starling;
   import starling.textures.§_-a1g§;
   
   public class §_-r2a§ extends §_-H2N§
   {
      
      private var §_-CG§:§_-93d§;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-r2a§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-F1N§;
         this.§_-mw§ = true;
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
         this.§_-CG§ = §_-93d§.instance;
         if(this.§_-A38§)
         {
            this.§_-CG§.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = this.§_-CG§.§_-23j§(§_-93d§.§_-73k§,{"sortFunction":this.§_-A1q§});
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.smoothing = §_-a1g§.§_-C2m§;
         this.§_-A38§.view.§_-M2F§ = this.hero.x;
         this.§_-A38§.view.§_-Cg§ = this.hero.y;
         this.§_-A38§.view.§_-IA§ = 650;
         this.§_-A38§.view.§_-jW§ = 650;
         this.§_-A38§.start();
         this.hero.game.map.§_-G12§.§_-83v§(this.§_-A38§.view);
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:§_-529§ = null;
         super.deactivate();
         if(this.§_-A38§)
         {
            _loc1_ = new §_-529§(this.§_-A38§.view,2,§_-Mk§.§_-Y16§);
            _loc1_.§_-42i§("alpha",0);
            _loc1_.onComplete = this.§_-ms§;
            Starling.§_-A3B§.add(_loc1_);
         }
      }
      
      private function §_-A1q§(param1:§_-a29§, param2:§_-a29§) : Number
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
      
      private function §_-ms§() : void
      {
         if(!this.§_-A38§)
         {
            return;
         }
         this.§_-A38§.stop();
         this.§_-CG§.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}

