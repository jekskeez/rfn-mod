package §_-j2E§
{
   import §_-Cc§.§_-F13§;
   
   public class §_-hS§ extends §_-92f§
   {
      
      private static const §_-F2Z§:Number = 0.5;
      
      private var state:§_-F13§ = null;
      
      public function §_-hS§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "bubble";
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
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-F13§(0,§_-F2Z§,false);
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

