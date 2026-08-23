package §_-33r§
{
   public class §_-AP§
   {
      
      protected var §_-l20§:Number = 0;
      
      protected var §_-x2n§:Boolean = false;
      
      protected var §_-sB§:Hero = null;
      
      public function §_-AP§(param1:Number)
      {
         super();
         this.§_-l20§ = param1;
         this.§_-x2n§ = this.time == 0;
      }
      
      public function get time() : Number
      {
         return this.§_-l20§;
      }
      
      public function get ended() : Boolean
      {
         return this.§_-l20§ <= 0 && !this.§_-x2n§;
      }
      
      public function §_-g1A§(param1:Number) : void
      {
      }
      
      public function update(param1:Number) : void
      {
         if(!this.§_-x2n§)
         {
            this.§_-l20§ -= param1;
         }
      }
      
      public function set hero(param1:Hero) : void
      {
         this.§_-sB§ = param1;
      }
      
      public function get hero() : Hero
      {
         return this.§_-sB§;
      }
   }
}

