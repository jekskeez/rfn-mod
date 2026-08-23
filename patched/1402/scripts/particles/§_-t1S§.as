package particles
{
   import §_-Pt§.§_-g2T§;
   import §_-TK§.§_-aS§;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class §_-t1S§ extends §_-aS§ implements §_-X2o§
   {
      
      private var params:Dictionary = new Dictionary();
      
      private var §_-02d§:Array = [];
      
      public var velocity:Point = new Point(0,0);
      
      public var §_-W2X§:Number = 0;
      
      public var §_-eq§:Number;
      
      public var §_-424§:Boolean = false;
      
      public function §_-t1S§()
      {
         super();
      }
      
      public function §_-r2n§(param1:§_-g2T§, param2:* = null) : void
      {
         this.params[param1] = param2;
         this.§_-02d§.push(param1);
      }
      
      public function update(param1:Number) : void
      {
         if(!this.§_-424§)
         {
            this.§_-3Q§(param1);
         }
         this.§_-V2y§(param1);
         this.§_-eq§ -= param1;
      }
      
      public function get garbage() : Boolean
      {
         return this.§_-eq§ < 0;
      }
      
      private function §_-3Q§(param1:Number) : void
      {
         this.rotation += this.§_-W2X§ * param1;
         this.x += this.velocity.x * param1;
         this.y += this.velocity.y * param1;
      }
      
      private function §_-V2y§(param1:Number) : void
      {
         var _loc2_:§_-g2T§ = null;
         for each(_loc2_ in this.§_-02d§)
         {
            _loc2_.apply(this,param1,this.params[_loc2_]);
         }
      }
   }
}

