package §_-j2H§
{
   import §_-TK§.§_-aS§;
   import §_-hd§.§_-01M§;
   import flash.display.Sprite;
   import starling.display.Sprite;
   import starling.display.§_-81s§;
   
   public class §_-Eg§ extends §_-01b§
   {
      
      private var §_-32D§:flash.display.Sprite = null;
      
      private var §_-R23§:§_-81s§;
      
      public function §_-Eg§()
      {
         super();
      }
      
      override public function §_-P20§(param1:§_-Y1t§) : void
      {
      }
      
      override public function get landSound() : String
      {
         return "land_grass";
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new PlatformHerb());
      }
      
      protected function get herbClass() : Class
      {
         return Herb;
      }
      
      override protected function draw() : void
      {
         super.draw();
         if(this.§_-32D§ == null)
         {
            this.§_-32D§ = new this.herbClass();
         }
         if(this.§_-R23§)
         {
            if(this.§_-R23§.texture)
            {
               this.§_-R23§.texture.dispose();
            }
            this.§_-R23§.reset();
            this.§_-R23§.dispose();
            this.§_-R23§.removeFromParent();
         }
         var _loc1_:starling.display.Sprite = §_-01M§.§_-D1J§(this.§_-32D§,this._width,this.§_-32D§.height);
         this.§_-J2J§(_loc1_);
      }
   }
}

