package dragonBones.objects
{
   public class DBTransform
   {
      
      public var x:Number;
      
      public var y:Number;
      
      public var skewX:Number;
      
      public var skewY:Number;
      
      public var scaleX:Number;
      
      public var scaleY:Number;
      
      public function DBTransform()
      {
         super();
         this.x = 0;
         this.y = 0;
         this.skewX = 0;
         this.skewY = 0;
         this.scaleX = 1;
         this.scaleY = 1;
      }
      
      public function get rotation() : Number
      {
         return this.skewX;
      }
      
      public function set rotation(param1:Number) : void
      {
         this.skewX = this.skewY = param1;
      }
      
      public function copy(param1:DBTransform) : void
      {
         this.x = param1.x;
         this.y = param1.y;
         this.skewX = param1.skewX;
         this.skewY = param1.skewY;
         this.scaleX = param1.scaleX;
         this.scaleY = param1.scaleY;
      }
      
      public function toString() : String
      {
         return "x:" + this.x + " y:" + this.y + " skewX:" + this.skewX + " skewY:" + this.skewY + " scaleX:" + this.scaleX + " scaleY:" + this.scaleY;
      }
   }
}

