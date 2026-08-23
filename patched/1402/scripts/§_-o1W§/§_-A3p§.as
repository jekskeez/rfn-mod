package §_-o1W§
{
   import §_-X1k§.§_-P2x§;
   
   public class §_-A3p§ extends §_-c2W§
   {
      
      private var §_-53m§:Boolean = false;
      
      public function §_-A3p§(param1:int)
      {
         super(param1);
      }
      
      override public function setClothing(param1:Array, param2:Array = null) : void
      {
         if(this.§_-Gm§)
         {
            param1 = [§_-P2x§.§_-CB§];
            param2 = [];
         }
         super.setClothing(param1,param2);
      }
      
      public function set §_-Gm§(param1:Boolean) : void
      {
         if(param1 == this.§_-Gm§)
         {
            return;
         }
         this.§_-53m§ = param1;
         if(param1)
         {
            this.setClothing([§_-P2x§.§_-CB§]);
         }
      }
      
      public function get §_-Gm§() : Boolean
      {
         return this.§_-53m§;
      }
   }
}

