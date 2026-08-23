package utils
{
   import flash.geom.Point;
   
   public class §_-23z§
   {
      
      private var target:Object;
      
      private var offset:Number;
      
      private var point:Point;
      
      private var §_-d2F§:Number;
      
      public function §_-23z§(param1:Object, param2:Point = null)
      {
         super();
         this.set(param1,param2);
      }
      
      public function set(param1:Object, param2:Point = null) : void
      {
         this.target = param1;
         this.§_-31h§(param2);
      }
      
      public function §_-31h§(param1:Point = null) : void
      {
         if(param1 == null)
         {
            this.point = new Point(this.target.x,this.target.y);
         }
         else
         {
            this.point = param1;
         }
         var _loc2_:Number = this.point.x - this.target.x;
         var _loc3_:Number = this.point.y - this.target.y;
         var _loc4_:Number = Math.atan2(_loc3_,_loc2_) * Game.R2D;
         this.§_-d2F§ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
         this.offset = 180 - _loc4_ + this.target.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         var _loc2_:Number = (param1 - this.offset) * Game.D2R;
         this.target.x = this.point.x + Math.cos(_loc2_) * this.§_-d2F§;
         this.target.y = this.point.y + Math.sin(_loc2_) * this.§_-d2F§;
         this.target.rotation = param1;
      }
      
      public function get rotation() : Number
      {
         return this.target.rotation;
      }
      
      public function §_-84§(param1:Number) : void
      {
         var _loc2_:Number = (this.target.rotation + param1 - this.offset) * Game.D2R;
         this.target.x = this.point.x + Math.cos(_loc2_) * this.§_-d2F§;
         this.target.y = this.point.y + Math.sin(_loc2_) * this.§_-d2F§;
         this.target.rotation += param1;
      }
   }
}

