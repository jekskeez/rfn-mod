package views
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-D2z§ extends Sprite
   {
      
      private var §_-k2A§:Class = null;
      
      public function §_-D2z§(param1:Class)
      {
         super();
         this.§_-k2A§ = param1;
         this.init();
      }
      
      protected function init() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc1_:int = 0;
         while(_loc1_ < 40)
         {
            _loc2_ = new partGo();
            _loc2_.rotation = Math.random() * 360;
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",this.§_-tZ§);
            addChild(_loc2_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = new this.§_-k2A§();
            _loc2_.rotation = Math.random() * 360;
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",this.§_-tZ§);
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      protected function §_-tZ§(param1:Event) : void
      {
         param1.target.removeEventListener("Complete",this.§_-tZ§);
         if(this.contains(param1.target as DisplayObject))
         {
            this.removeChild(param1.target as DisplayObject);
         }
         if(this.numChildren != 0 && parent != null && parent.contains(this))
         {
            parent.removeChild(this);
         }
      }
   }
}

