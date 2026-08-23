package §_-A1G§
{
   import §_-b2F§.§_-C1T§;
   import §_-b2F§.§_-iC§;
   import starling.core.Starling;
   import starling.textures.Texture;
   import starling.textures.§_-RS§;
   
   public class §_-11u§
   {
      
      private var §_-X1f§:§_-iC§;
      
      private var §_-de§:§_-C1T§;
      
      public var §_-q22§:Number = 0;
      
      public function §_-11u§(param1:*, param2:String, param3:String = null, param4:Object = null)
      {
         super();
         var _loc5_:XML = XML(param2);
         var _loc6_:XML = param3 ? XML(param3) : null;
         var _loc7_:Texture = param1 is Texture ? param1 : Texture.§_-h2H§(param1);
         this.§_-de§ = §_-C1T§.§_-n2u§(_loc5_,_loc7_,_loc6_);
         if(param4)
         {
            this.§_-de§ = this.§_-de§.§_-a2F§(param4);
         }
         this.§_-X1f§ = new §_-iC§(this.§_-de§);
         this.§_-X1f§.smoothing = §_-RS§.NONE;
         this.§_-X1f§.touchable = false;
      }
      
      public function get view() : §_-iC§
      {
         return this.§_-X1f§;
      }
      
      public function set view(param1:§_-iC§) : void
      {
         this.§_-X1f§ = param1;
      }
      
      public function §_-Hb§() : void
      {
         this.§_-X1f§.§_-Hb§();
      }
      
      public function stop() : void
      {
         if(this.§_-X1f§)
         {
            this.§_-X1f§.stop();
            Starling.§_-zb§.remove(this.§_-X1f§);
         }
      }
      
      public function start(param1:Number = 0) : void
      {
         if(this.§_-X1f§)
         {
            this.§_-X1f§.start(param1);
            Starling.§_-zb§.add(this.§_-X1f§);
         }
      }
      
      public function removeFromParent(param1:Boolean = true) : void
      {
         this.stop();
         this.§_-X1f§.removeFromParent(param1);
         if(param1)
         {
            this.§_-X1f§.dispose();
            this.§_-X1f§ = null;
         }
      }
   }
}

