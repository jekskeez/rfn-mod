package §_-ZS§
{
   import §_-Ov§.§_-53f§;
   import §_-Ov§.§_-l21§;
   import starling.core.Starling;
   import starling.textures.Texture;
   import starling.textures.§_-a1g§;
   
   public class §_-f1G§
   {
      
      private var §_-o2f§:§_-53f§;
      
      private var §_-i28§:§_-l21§;
      
      public var §_-Y1m§:Number = 0;
      
      public function §_-f1G§(param1:*, param2:String, param3:String = null, param4:Object = null)
      {
         super();
         var _loc5_:XML = XML(param2);
         var _loc6_:XML = param3 ? XML(param3) : null;
         var _loc7_:Texture = param1 is Texture ? param1 : Texture.§_-b2K§(param1);
         this.§_-i28§ = §_-l21§.§_-s1d§(_loc5_,_loc7_,_loc6_);
         if(param4)
         {
            this.§_-i28§ = this.§_-i28§.§_-ZQ§(param4);
         }
         this.§_-o2f§ = new §_-53f§(this.§_-i28§);
         this.§_-o2f§.smoothing = §_-a1g§.NONE;
         this.§_-o2f§.touchable = false;
      }
      
      public function get view() : §_-53f§
      {
         return this.§_-o2f§;
      }
      
      public function set view(param1:§_-53f§) : void
      {
         this.§_-o2f§ = param1;
      }
      
      public function §_-z1n§() : void
      {
         this.§_-o2f§.§_-z1n§();
      }
      
      public function stop() : void
      {
         if(this.§_-o2f§)
         {
            this.§_-o2f§.stop();
            Starling.§_-A3B§.remove(this.§_-o2f§);
         }
      }
      
      public function start(param1:Number = 0) : void
      {
         if(this.§_-o2f§)
         {
            this.§_-o2f§.start(param1);
            Starling.§_-A3B§.add(this.§_-o2f§);
         }
      }
      
      public function removeFromParent(param1:Boolean = true) : void
      {
         this.stop();
         this.§_-o2f§.removeFromParent(param1);
         if(param1)
         {
            this.§_-o2f§.dispose();
            this.§_-o2f§ = null;
         }
      }
   }
}

