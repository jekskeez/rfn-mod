package views
{
   import flash.display.DisplayObject;
   
   public class §_-22C§ extends §_-D2z§
   {
      
      private var §_-119§:Number;
      
      private var §_-6F§:Number;
      
      public function §_-22C§(param1:Number, param2:Number)
      {
         this.§_-119§ = param1;
         this.§_-6F§ = param2;
         super(null);
      }
      
      override protected function init() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc1_:int = 0;
         while(_loc1_ < 1)
         {
            _loc2_ = new LavaParticle1();
            _loc2_.rotation = this.§_-119§ + this.§_-6F§ * (Math.random() * 2 - 1);
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",§_-tZ§);
            addChild(_loc2_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 1)
         {
            _loc2_ = new LavaParticle2();
            _loc2_.rotation = this.§_-119§ + this.§_-6F§ * (Math.random() * 2 - 1);
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",§_-tZ§);
            addChild(_loc2_);
            _loc1_++;
         }
      }
   }
}

