package §_-f17§
{
   import §_-RI§.§_-h2I§;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Point;
   import utils.§_-93C§;
   import utils.§_-Z1S§;
   
   public class §_-K2m§ extends §_-h2I§
   {
      
      private var §_-q2a§:Point = new Point();
      
      private var §_-93u§:Point = new Point();
      
      private var §_-81L§:BitmapData;
      
      public function §_-K2m§()
      {
         super();
         this.§_-81L§ = §_-93C§.getBitmapData(new Steel());
      }
      
      public function set start(param1:Point) : void
      {
         this.§_-q2a§ = param1;
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function set end(param1:Point) : void
      {
         if(this.§_-93u§.equals(param1))
         {
            return;
         }
         this.§_-93u§ = param1;
         this.§_-D11§();
         this.draw();
      }
      
      public function get length() : Number
      {
         return this.§_-q2a§.clone().subtract(this.§_-93u§).length;
      }
      
      private function §_-D11§() : void
      {
         this.rotation = §_-Z1S§.getAngle(this.§_-q2a§,this.§_-93u§) - 90;
      }
      
      private function draw() : void
      {
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
         if(!this.length || !this.§_-81L§.height)
         {
            return;
         }
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginBitmapFill(this.§_-81L§,null,true,false);
         _loc1_.graphics.drawRect(0,0,this.length,this.§_-81L§.height);
         _loc1_.graphics.endFill();
         var _loc2_:§_-h2I§ = new §_-h2I§(_loc1_);
         this.pivotY = this.§_-81L§.height * 0.5;
         §_-83v§(_loc2_);
      }
   }
}

