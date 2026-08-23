package
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-A3h§
   {
      
      public var A:Number = 0;
      
      public var B:Number = 0;
      
      public var C:Number = 0;
      
      public function §_-A3h§(param1:Number, param2:Number, param3:Number)
      {
         super();
         var _loc4_:b2Vec2 = new b2Vec2(param1,param2);
         this.A = _loc4_.x;
         this.B = -_loc4_.y;
         this.C = param3;
      }
      
      public static function §_-v1i§(param1:b2Vec2, param2:b2Vec2) : Number
      {
         var _loc3_:b2Vec2 = param1.Copy();
         _loc3_.Subtract(param2);
         var _loc4_:Number = Number(param1.Length());
         var _loc5_:Number = Number(param2.Length());
         var _loc6_:Number = Number(_loc3_.Length());
         var _loc7_:Number = (_loc4_ + _loc5_ + _loc6_) * 0.5;
         return Math.sqrt(_loc7_ * (_loc7_ - _loc4_) * (_loc7_ - _loc5_) * (_loc7_ - _loc6_)) / (_loc6_ * 0.5);
      }
      
      public static function §_-01u§(param1:b2Vec2, param2:b2Vec2) : §_-A3h§
      {
         return new §_-A3h§(param2.y - param1.y,param1.x - param2.x,-(param1.y * param2.x - param1.x * param2.y));
      }
      
      public function §_-Yd§(param1:b2Vec2) : Boolean
      {
         return this.A * param1.x + this.B * param1.y + this.C == 0;
      }
      
      public function get normal() : b2Vec2
      {
         return new b2Vec2(this.A,this.B);
      }
      
      public function get offset() : Number
      {
         var _loc1_:Number = Math.sqrt(this.A * this.A + this.B * this.B);
         return this.C / _loc1_;
      }
      
      public function get a() : Number
      {
         return -this.C / this.A;
      }
      
      public function get b() : Number
      {
         return -this.C / this.B;
      }
      
      public function get §_-V2P§() : Number
      {
         return -this.A / this.B;
      }
   }
}

