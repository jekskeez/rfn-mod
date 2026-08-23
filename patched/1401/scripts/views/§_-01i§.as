package views
{
   import flash.display.DisplayObject;
   
   public class §_-01i§ extends §_-038§
   {
      
      private var §_-sN§:Number;
      
      private var §_-A3d§:Number;
      
      public function §_-01i§(param1:Number, param2:Number)
      {
         this.§_-sN§ = param1;
         this.§_-A3d§ = param2;
         super(null);
      }
      
      override protected function init() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc1_:int = 0;
         while(_loc1_ < 1)
         {
            _loc2_ = new LavaParticle1();
            _loc2_.rotation = this.§_-sN§ + this.§_-A3d§ * (Math.random() * 2 - 1);
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",§_-f1R§);
            addChild(_loc2_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 1)
         {
            _loc2_ = new LavaParticle2();
            _loc2_.rotation = this.§_-sN§ + this.§_-A3d§ * (Math.random() * 2 - 1);
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",§_-f1R§);
            addChild(_loc2_);
            _loc1_++;
         }
      }
   }
}

