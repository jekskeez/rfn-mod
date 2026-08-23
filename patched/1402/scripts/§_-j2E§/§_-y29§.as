package §_-j2E§
{
   import §_-Cc§.§_-y2K§;
   
   public class §_-y29§ extends §_-92f§
   {
      
      private var state:§_-y2K§ = null;
      
      public function §_-y29§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-j2B§;
         this.§_-i1J§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-y2K§(0);
         this.hero.behaviourController.§_-W10§(this.state);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.state)
         {
            this.hero.behaviourController.removeState(this.state);
         }
         this.state = null;
      }
   }
}

