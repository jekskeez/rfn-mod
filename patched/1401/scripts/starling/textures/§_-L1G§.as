package starling.textures
{
   import starling.core.Starling;
   
   public class §_-L1G§
   {
      
      private var §_-n2q§:Number;
      
      private var §_-GW§:String;
      
      private var §_-j2M§:Boolean;
      
      private var §_-6I§:Boolean = false;
      
      private var §_-e1w§:Function = null;
      
      private var §_-iO§:Boolean = false;
      
      public function §_-L1G§(param1:Number = 1, param2:Boolean = false, param3:String = "bgra", param4:Boolean = false)
      {
         super();
         this.§_-n2q§ = param1;
         this.§_-GW§ = param3;
         this.§_-j2M§ = param2;
         this.§_-iO§ = param4;
      }
      
      public function clone() : §_-L1G§
      {
         var _loc1_:§_-L1G§ = new §_-L1G§(this.§_-n2q§,this.§_-j2M§,this.§_-GW§,this.§_-iO§);
         _loc1_.§_-6I§ = this.§_-6I§;
         _loc1_.§_-e1w§ = this.§_-e1w§;
         return _loc1_;
      }
      
      public function get scale() : Number
      {
         return this.§_-n2q§;
      }
      
      public function set scale(param1:Number) : void
      {
         this.§_-n2q§ = param1 > 0 ? param1 : Starling.§_-61w§;
      }
      
      public function get format() : String
      {
         return this.§_-GW§;
      }
      
      public function set format(param1:String) : void
      {
         this.§_-GW§ = param1;
      }
      
      public function get mipMapping() : Boolean
      {
         return this.§_-j2M§;
      }
      
      public function set mipMapping(param1:Boolean) : void
      {
         this.§_-j2M§ = param1;
      }
      
      public function get optimizeForRenderToTexture() : Boolean
      {
         return this.§_-6I§;
      }
      
      public function set optimizeForRenderToTexture(param1:Boolean) : void
      {
         this.§_-6I§ = param1;
      }
      
      public function get repeat() : Boolean
      {
         return this.§_-iO§;
      }
      
      public function set repeat(param1:Boolean) : void
      {
         this.§_-iO§ = param1;
      }
      
      public function get §_-I1i§() : Function
      {
         return this.§_-e1w§;
      }
      
      public function set §_-I1i§(param1:Function) : void
      {
         this.§_-e1w§ = param1;
      }
   }
}

