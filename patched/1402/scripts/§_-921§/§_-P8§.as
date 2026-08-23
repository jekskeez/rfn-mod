package §_-921§
{
   import §_-l2u§.§_-Rp§;
   
   public class §_-P8§ extends §_-Rp§ implements §_-u1h§
   {
      
      private var §_-N1f§:§_-x1c§;
      
      public function §_-P8§()
      {
         super();
         this.§_-71Y§ = §_-A25§;
         this.§_-N1f§ = new §_-x1c§(this,true);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-N1f§.update(param1);
      }
      
      override public function dispose() : void
      {
         this.§_-N1f§.dispose();
         this.§_-N1f§ = null;
         super.dispose();
      }
      
      public function get thirstController() : §_-x1c§
      {
         return this.§_-N1f§;
      }
   }
}

