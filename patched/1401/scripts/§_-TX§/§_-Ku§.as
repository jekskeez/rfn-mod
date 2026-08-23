package §_-TX§
{
   import §_-I10§.§_-g2W§;
   
   public class §_-Ku§ extends §_-01R§
   {
      
      private var §_-45§:Boolean = false;
      
      public function §_-Ku§(param1:int)
      {
         super(param1);
      }
      
      override public function setClothing(param1:Array, param2:Array = null) : void
      {
         if(this.§_-uT§)
         {
            param1 = [§_-g2W§.§_-X2L§];
            param2 = [];
         }
         super.setClothing(param1,param2);
      }
      
      public function set §_-uT§(param1:Boolean) : void
      {
         if(param1 == this.§_-uT§)
         {
            return;
         }
         this.§_-45§ = param1;
         if(param1)
         {
            this.setClothing([§_-g2W§.§_-X2L§]);
         }
      }
      
      public function get §_-uT§() : Boolean
      {
         return this.§_-45§;
      }
   }
}

