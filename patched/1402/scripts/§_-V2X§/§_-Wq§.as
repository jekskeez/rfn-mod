package §_-V2X§
{
   import §_-E1v§.§_-31Y§;
   import §_-E1v§.§_-J2w§;
   import §_-E1v§.§_-R1o§;
   import §_-E1v§.§_-gC§;
   import §_-E1v§.§_-o2J§;
   import §_-bN§.Dialog;
   import flash.events.MouseEvent;
   
   public class §_-Wq§ extends Dialog
   {
      
      private var §_-82y§:§_-J2w§ = null;
      
      private var §_-m2O§:§_-o2J§ = null;
      
      public function §_-Wq§(param1:§_-J2w§)
      {
         this.§_-82y§ = param1;
         var _loc2_:String = param1.isClan ? gls("Редактор клана") : gls("Редактор игрока");
         super(_loc2_);
         this.init();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         §_-31Y§.§_-fk§(this);
         super.hide(param1);
      }
      
      public function set entity(param1:§_-J2w§) : void
      {
         this.§_-82y§ = param1;
         this.§_-m2O§.§_-v15§(param1);
      }
      
      public function get entity() : §_-J2w§
      {
         return this.§_-82y§;
      }
      
      private function init() : void
      {
         if(this.§_-82y§.isClan)
         {
            this.§_-m2O§ = new §_-R1o§();
         }
         else
         {
            this.§_-m2O§ = new §_-gC§();
         }
         this.§_-m2O§.§_-v15§(this.§_-82y§);
         addChild(this.§_-m2O§);
         place();
         this.height = this.topOffset + this.§_-m2O§.height + this.§_-f2d§;
      }
   }
}

