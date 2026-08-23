package particles
{
   import §_-OV§.§_-O1g§;
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class §_-13p§ extends §_-h2I§ implements §_-Z2g§
   {
      
      private var params:Dictionary = new Dictionary();
      
      private var §_-fW§:Array = [];
      
      public var velocity:Point = new Point(0,0);
      
      public var §_-o2F§:Number = 0;
      
      public var §_-h2G§:Number;
      
      public var §_-j2i§:Boolean = false;
      
      public function §_-13p§()
      {
         super();
      }
      
      public function §_-s2M§(param1:§_-O1g§, param2:* = null) : void
      {
         this.params[param1] = param2;
         this.§_-fW§.push(param1);
      }
      
      public function update(param1:Number) : void
      {
         if(!this.§_-j2i§)
         {
            this.§_-l8§(param1);
         }
         this.§_-23T§(param1);
         this.§_-h2G§ -= param1;
      }
      
      public function get garbage() : Boolean
      {
         return this.§_-h2G§ < 0;
      }
      
      private function §_-l8§(param1:Number) : void
      {
         this.rotation += this.§_-o2F§ * param1;
         this.x += this.velocity.x * param1;
         this.y += this.velocity.y * param1;
      }
      
      private function §_-23T§(param1:Number) : void
      {
         var _loc2_:§_-O1g§ = null;
         for each(_loc2_ in this.§_-fW§)
         {
            _loc2_.apply(this,param1,this.params[_loc2_]);
         }
      }
   }
}

