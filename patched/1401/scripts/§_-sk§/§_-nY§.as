package §_-sk§
{
   import flash.utils.Dictionary;
   import starling.display.§_-jH§;
   import starling.textures.Texture;
   
   public class §_-nY§
   {
      
      private var §_-W1E§:Texture;
      
      private var §_-43u§:int;
      
      private var §_-72B§:Number;
      
      private var §_-f2K§:Number;
      
      private var §_-22q§:Number;
      
      private var §_-m2§:Dictionary;
      
      public function §_-nY§(param1:int, param2:Texture, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.§_-43u§ = param1;
         this.§_-W1E§ = param2;
         this.§_-72B§ = param3;
         this.§_-f2K§ = param4;
         this.§_-22q§ = param5;
         this.§_-m2§ = null;
      }
      
      public function §_-B2E§(param1:int, param2:Number) : void
      {
         if(this.§_-m2§ == null)
         {
            this.§_-m2§ = new Dictionary();
         }
         this.§_-m2§[param1] = param2;
      }
      
      public function §_-L2x§(param1:int) : Number
      {
         if(this.§_-m2§ == null || this.§_-m2§[param1] == undefined)
         {
            return 0;
         }
         return this.§_-m2§[param1];
      }
      
      public function §_-H1S§() : §_-jH§
      {
         return new §_-jH§(this.§_-W1E§);
      }
      
      public function get §_-y2n§() : int
      {
         return this.§_-43u§;
      }
      
      public function get xOffset() : Number
      {
         return this.§_-72B§;
      }
      
      public function get yOffset() : Number
      {
         return this.§_-f2K§;
      }
      
      public function get §_-Ni§() : Number
      {
         return this.§_-22q§;
      }
      
      public function get texture() : Texture
      {
         return this.§_-W1E§;
      }
      
      public function get width() : Number
      {
         return this.§_-W1E§.width;
      }
      
      public function get height() : Number
      {
         return this.§_-W1E§.height;
      }
   }
}

