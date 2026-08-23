package §_-j2E§
{
   import §_-Cc§.§_-x1W§;
   
   public class §_-835§ extends §_-92f§
   {
      
      private var state:§_-x1W§ = null;
      
      public function §_-835§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-x1W§(0);
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

