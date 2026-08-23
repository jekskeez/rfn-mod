package §_-Yb§
{
   import §_-D1c§.§_-11t§;
   import events.§_-63A§;
   import flash.display.Sprite;
   
   public class §_-h10§ extends Sprite
   {
      
      private static const §_-t2J§:int = 10;
      
      private var §_-LN§:*;
      
      private var §_-s5§:Vector.<§_-11t§> = new Vector.<§_-11t§>();
      
      public function §_-h10§()
      {
         super();
      }
      
      public function set inspectObject(param1:*) : void
      {
         var _loc2_:§_-11t§ = null;
         this.§_-LN§ = param1;
         for each(_loc2_ in this.§_-s5§)
         {
            _loc2_.inspectObject = param1;
         }
      }
      
      public function get inspectObject() : *
      {
         return this.§_-LN§;
      }
      
      public function get §_-7e§() : Number
      {
         var _loc2_:§_-11t§ = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this.§_-s5§)
         {
            _loc1_ += _loc2_.widgetHeight + §_-t2J§;
         }
         return _loc1_;
      }
      
      public function §_-XG§(param1:§_-11t§) : void
      {
         param1.y = this.§_-7e§;
         this.§_-s5§.push(param1);
         param1.addEventListener(§_-63A§.CHANGE,this.dispatch);
         addChild(param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-11t§ = null;
         for each(_loc1_ in this.§_-s5§)
         {
            _loc1_.removeEventListener(§_-63A§.CHANGE,this.dispatch);
            _loc1_.dispose();
         }
         this.§_-s5§ = new Vector.<§_-11t§>();
      }
      
      protected function dispatch(param1:§_-63A§) : void
      {
         dispatchEvent(new §_-63A§(§_-63A§(param1).className,param1.type));
      }
   }
}

