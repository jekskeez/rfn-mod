package §_-b5§
{
   import flash.utils.Dictionary;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   
   public class §_-mT§
   {
      
      private var §_-A1m§:Texture;
      
      private var §_-R2R§:int;
      
      private var §_-l2U§:Number;
      
      private var §_-91X§:Number;
      
      private var §_-V1i§:Number;
      
      private var §_-e7§:Dictionary;
      
      public function §_-mT§(param1:int, param2:Texture, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.§_-R2R§ = param1;
         this.§_-A1m§ = param2;
         this.§_-l2U§ = param3;
         this.§_-91X§ = param4;
         this.§_-V1i§ = param5;
         this.§_-e7§ = null;
      }
      
      public function §_-K18§(param1:int, param2:Number) : void
      {
         if(this.§_-e7§ == null)
         {
            this.§_-e7§ = new Dictionary();
         }
         this.§_-e7§[param1] = param2;
      }
      
      public function §_-N1e§(param1:int) : Number
      {
         if(this.§_-e7§ == null || this.§_-e7§[param1] == undefined)
         {
            return 0;
         }
         return this.§_-e7§[param1];
      }
      
      public function §_-XQ§() : §_-I2q§
      {
         return new §_-I2q§(this.§_-A1m§);
      }
      
      public function get §_-Q1E§() : int
      {
         return this.§_-R2R§;
      }
      
      public function get xOffset() : Number
      {
         return this.§_-l2U§;
      }
      
      public function get yOffset() : Number
      {
         return this.§_-91X§;
      }
      
      public function get §_-I2n§() : Number
      {
         return this.§_-V1i§;
      }
      
      public function get texture() : Texture
      {
         return this.§_-A1m§;
      }
      
      public function get width() : Number
      {
         return this.§_-A1m§.width;
      }
      
      public function get height() : Number
      {
         return this.§_-A1m§.height;
      }
   }
}

