package §_-us§
{
   import §_-AY§.§_-Su§;
   import dragonBones.§_-833§;
   
   public class §_-M18§ extends §_-Su§
   {
      
      protected var item:§_-Su§;
      
      public function §_-M18§(param1:§_-Su§)
      {
         super();
         this.item = param1;
      }
      
      override public function get params() : Object
      {
         return this.item.params;
      }
      
      override public function §_-N1Z§(param1:§_-833§, param2:Boolean) : void
      {
         this.item.§_-N1Z§(param1,param2);
      }
      
      override public function §_-O2O§(param1:§_-833§) : void
      {
         this.item.§_-O2O§(param1);
      }
   }
}

