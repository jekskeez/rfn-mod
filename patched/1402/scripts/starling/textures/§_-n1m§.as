package starling.textures
{
   import starling.core.Starling;
   
   public class §_-n1m§
   {
      
      private var §_-p1i§:Number;
      
      private var §_-P2O§:String;
      
      private var §_-FE§:Boolean;
      
      private var §_-p2Y§:Boolean = false;
      
      private var §_-4t§:Function = null;
      
      private var §_-HD§:Boolean = false;
      
      public function §_-n1m§(param1:Number = 1, param2:Boolean = false, param3:String = "bgra", param4:Boolean = false)
      {
         super();
         this.§_-p1i§ = param1;
         this.§_-P2O§ = param3;
         this.§_-FE§ = param2;
         this.§_-HD§ = param4;
      }
      
      public function clone() : §_-n1m§
      {
         var _loc1_:§_-n1m§ = new §_-n1m§(this.§_-p1i§,this.§_-FE§,this.§_-P2O§,this.§_-HD§);
         _loc1_.§_-p2Y§ = this.§_-p2Y§;
         _loc1_.§_-4t§ = this.§_-4t§;
         return _loc1_;
      }
      
      public function get scale() : Number
      {
         return this.§_-p1i§;
      }
      
      public function set scale(param1:Number) : void
      {
         this.§_-p1i§ = param1 > 0 ? param1 : Starling.§_-Cj§;
      }
      
      public function get format() : String
      {
         return this.§_-P2O§;
      }
      
      public function set format(param1:String) : void
      {
         this.§_-P2O§ = param1;
      }
      
      public function get mipMapping() : Boolean
      {
         return this.§_-FE§;
      }
      
      public function set mipMapping(param1:Boolean) : void
      {
         this.§_-FE§ = param1;
      }
      
      public function get optimizeForRenderToTexture() : Boolean
      {
         return this.§_-p2Y§;
      }
      
      public function set optimizeForRenderToTexture(param1:Boolean) : void
      {
         this.§_-p2Y§ = param1;
      }
      
      public function get repeat() : Boolean
      {
         return this.§_-HD§;
      }
      
      public function set repeat(param1:Boolean) : void
      {
         this.§_-HD§ = param1;
      }
      
      public function get §_-s1u§() : Function
      {
         return this.§_-4t§;
      }
      
      public function set §_-s1u§(param1:Function) : void
      {
         this.§_-4t§ = param1;
      }
   }
}

