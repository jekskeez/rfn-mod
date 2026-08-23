package §_-j2E§
{
   import §_-Cc§.§_-Uo§;
   
   public class §_-01w§ extends §_-92f§
   {
      
      private var state:§_-Uo§ = null;
      
      public function §_-01w§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-Uo§(0,50);
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

