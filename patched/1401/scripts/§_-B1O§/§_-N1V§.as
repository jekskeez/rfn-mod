package §_-B1O§
{
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import flash.display.Sprite;
   import starling.display.Sprite;
   import starling.display.§_-t2M§;
   
   public class §_-N1V§ extends §_-A1f§
   {
      
      private var §_-b2k§:flash.display.Sprite = null;
      
      private var §_-x1J§:§_-t2M§;
      
      public function §_-N1V§()
      {
         super();
      }
      
      override public function §_-sH§(param1:§_-K2R§) : void
      {
      }
      
      override public function get landSound() : String
      {
         return "land_grass";
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new PlatformHerb());
      }
      
      protected function get herbClass() : Class
      {
         return Herb;
      }
      
      override protected function draw() : void
      {
         super.draw();
         if(this.§_-b2k§ == null)
         {
            this.§_-b2k§ = new this.herbClass();
         }
         if(this.§_-x1J§)
         {
            if(this.§_-x1J§.texture)
            {
               this.§_-x1J§.texture.dispose();
            }
            this.§_-x1J§.reset();
            this.§_-x1J§.dispose();
            this.§_-x1J§.removeFromParent();
         }
         var _loc1_:starling.display.Sprite = §_-a2§.§_-A3m§(this.§_-b2k§,this._width,this.§_-b2k§.height);
         this.§_-83v§(_loc1_);
      }
   }
}

