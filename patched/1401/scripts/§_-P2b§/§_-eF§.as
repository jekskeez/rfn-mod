package §_-P2b§
{
   import §_-33r§.§_-M2g§;
   
   public class §_-eF§ extends §_-H2N§
   {
      
      private static const §_-63m§:Number = 0.5;
      
      private var state:§_-M2g§ = null;
      
      public function §_-eF§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "bubble";
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
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-M2g§(0,§_-63m§,false);
         this.hero.behaviourController.§_-gz§(this.state);
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

