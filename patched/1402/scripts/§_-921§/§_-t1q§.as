package §_-921§
{
   import §_-O1O§.§_-H1P§;
   
   public class §_-t1q§ extends §_-H1P§ implements §_-u1h§
   {
      
      private var §_-N1f§:§_-x1c§;
      
      public function §_-t1q§(param1:Boolean = false)
      {
         super(false,param1);
         this.§_-71Y§ = §_-A25§;
         this.§_-N1f§ = new §_-x1c§(this);
      }
      
      public function get thirstController() : §_-x1c§
      {
         return this.§_-N1f§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.thirstController.update(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.thirstController.dispose();
         this.§_-N1f§ = null;
      }
   }
}

