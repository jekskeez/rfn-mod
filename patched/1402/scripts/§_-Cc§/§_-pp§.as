package §_-Cc§
{
   public class §_-pp§
   {
      
      protected var §_-J1Z§:Number = 0;
      
      protected var §_-qM§:Boolean = false;
      
      protected var §_-k1D§:Hero = null;
      
      public function §_-pp§(param1:Number)
      {
         super();
         this.§_-J1Z§ = param1;
         this.§_-qM§ = this.time == 0;
      }
      
      public function get time() : Number
      {
         return this.§_-J1Z§;
      }
      
      public function get ended() : Boolean
      {
         return this.§_-J1Z§ <= 0 && !this.§_-qM§;
      }
      
      public function §_-k20§(param1:Number) : void
      {
      }
      
      public function update(param1:Number) : void
      {
         if(!this.§_-qM§)
         {
            this.§_-J1Z§ -= param1;
         }
      }
      
      public function set hero(param1:Hero) : void
      {
         this.§_-k1D§ = param1;
      }
      
      public function get hero() : Hero
      {
         return this.§_-k1D§;
      }
   }
}

