package §_-2V§
{
   import §_-53U§.§_-M26§;
   import dragonBones.§_-E1r§;
   
   public class §_-G1O§ extends §_-M26§
   {
      
      protected var item:§_-M26§;
      
      public function §_-G1O§(param1:§_-M26§)
      {
         super();
         this.item = param1;
      }
      
      override public function get params() : Object
      {
         return this.item.params;
      }
      
      override public function §_-83Y§(param1:§_-E1r§, param2:Boolean) : void
      {
         this.item.§_-83Y§(param1,param2);
      }
      
      override public function §_-q2v§(param1:§_-E1r§) : void
      {
         this.item.§_-q2v§(param1);
      }
   }
}

