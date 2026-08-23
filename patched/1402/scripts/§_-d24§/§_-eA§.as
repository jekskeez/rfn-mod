package §_-d24§
{
   import §_-42I§.§_-w1Y§;
   import events.§_-F2k§;
   import flash.display.Sprite;
   
   public class §_-eA§ extends Sprite
   {
      
      private static const §_-p1C§:int = 10;
      
      private var §_-ay§:*;
      
      private var §_-41J§:Vector.<§_-w1Y§> = new Vector.<§_-w1Y§>();
      
      public function §_-eA§()
      {
         super();
      }
      
      public function set inspectObject(param1:*) : void
      {
         var _loc2_:§_-w1Y§ = null;
         this.§_-ay§ = param1;
         for each(_loc2_ in this.§_-41J§)
         {
            _loc2_.inspectObject = param1;
         }
      }
      
      public function get inspectObject() : *
      {
         return this.§_-ay§;
      }
      
      public function get §_-52t§() : Number
      {
         var _loc2_:§_-w1Y§ = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this.§_-41J§)
         {
            _loc1_ += _loc2_.widgetHeight + §_-p1C§;
         }
         return _loc1_;
      }
      
      public function §_-X2r§(param1:§_-w1Y§) : void
      {
         param1.y = this.§_-52t§;
         this.§_-41J§.push(param1);
         param1.addEventListener(§_-F2k§.CHANGE,this.dispatch);
         addChild(param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-w1Y§ = null;
         for each(_loc1_ in this.§_-41J§)
         {
            _loc1_.removeEventListener(§_-F2k§.CHANGE,this.dispatch);
            _loc1_.dispose();
         }
         this.§_-41J§ = new Vector.<§_-w1Y§>();
      }
      
      protected function dispatch(param1:§_-F2k§) : void
      {
         dispatchEvent(new §_-F2k§(§_-F2k§(param1).className,param1.type));
      }
   }
}

