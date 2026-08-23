package views
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-038§ extends Sprite
   {
      
      private var §_-g2h§:Class = null;
      
      public function §_-038§(param1:Class)
      {
         super();
         this.§_-g2h§ = param1;
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
            _loc2_.addEventListener("Complete",this.§_-f1R§);
            addChild(_loc2_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = new this.§_-g2h§();
            _loc2_.rotation = Math.random() * 360;
            _loc2_.scaleX = _loc2_.scaleY = 1 + Math.random() * 3;
            _loc2_.addEventListener("Complete",this.§_-f1R§);
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      protected function §_-f1R§(param1:Event) : void
      {
         param1.target.removeEventListener("Complete",this.§_-f1R§);
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

