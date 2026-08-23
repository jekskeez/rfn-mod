package §_-82h§
{
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Point;
   import utils.§_-O1T§;
   import utils.§_-iZ§;
   
   public class §_-B3e§ extends §_-aS§
   {
      
      private var §_-L1§:Point = new Point();
      
      private var §_-Z5§:Point = new Point();
      
      private var §_-c2o§:BitmapData;
      
      public function §_-B3e§()
      {
         super();
         this.§_-c2o§ = §_-O1T§.getBitmapData(new Steel());
      }
      
      public function set start(param1:Point) : void
      {
         this.§_-L1§ = param1;
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function set end(param1:Point) : void
      {
         if(this.§_-Z5§.equals(param1))
         {
            return;
         }
         this.§_-Z5§ = param1;
         this.§_-le§();
         this.draw();
      }
      
      public function get length() : Number
      {
         return this.§_-L1§.clone().subtract(this.§_-Z5§).length;
      }
      
      private function §_-le§() : void
      {
         this.rotation = §_-iZ§.getAngle(this.§_-L1§,this.§_-Z5§) - 90;
      }
      
      private function draw() : void
      {
         while(numChildren > 0)
         {
            §_-av§(0);
         }
         if(!this.length || !this.§_-c2o§.height)
         {
            return;
         }
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginBitmapFill(this.§_-c2o§,null,true,false);
         _loc1_.graphics.drawRect(0,0,this.length,this.§_-c2o§.height);
         _loc1_.graphics.endFill();
         var _loc2_:§_-aS§ = new §_-aS§(_loc1_);
         this.pivotY = this.§_-c2o§.height * 0.5;
         §_-J2J§(_loc2_);
      }
   }
}

