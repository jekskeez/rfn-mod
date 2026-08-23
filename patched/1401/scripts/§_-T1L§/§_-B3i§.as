package §_-T1L§
{
   import §_-k1c§.Dialog;
   import §_-l26§.§_-MZ§;
   import §_-l26§.§_-bI§;
   import §_-l26§.§_-e2k§;
   import §_-l26§.§_-n20§;
   import §_-l26§.§_-s18§;
   import flash.events.MouseEvent;
   
   public class §_-B3i§ extends Dialog
   {
      
      private var §_-B1A§:§_-s18§ = null;
      
      private var §_-Pw§:§_-e2k§ = null;
      
      public function §_-B3i§(param1:§_-s18§)
      {
         this.§_-B1A§ = param1;
         var _loc2_:String = param1.isClan ? gls("Редактор клана") : gls("Редактор игрока");
         super(_loc2_);
         this.init();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         §_-MZ§.§_-834§(this);
         super.hide(param1);
      }
      
      public function set entity(param1:§_-s18§) : void
      {
         this.§_-B1A§ = param1;
         this.§_-Pw§.§_-V2M§(param1);
      }
      
      public function get entity() : §_-s18§
      {
         return this.§_-B1A§;
      }
      
      private function init() : void
      {
         if(this.§_-B1A§.isClan)
         {
            this.§_-Pw§ = new §_-bI§();
         }
         else
         {
            this.§_-Pw§ = new §_-n20§();
         }
         this.§_-Pw§.§_-V2M§(this.§_-B1A§);
         addChild(this.§_-Pw§);
         place();
         this.height = this.topOffset + this.§_-Pw§.height + this.§_-JZ§;
      }
   }
}

