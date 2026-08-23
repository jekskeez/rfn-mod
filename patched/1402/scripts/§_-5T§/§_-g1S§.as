package §_-5T§
{
   import §_-X1k§.§_-93H§;
   import §_-wJ§.§_-X18§;
   import §_-wJ§.§_-q2U§;
   import flash.display.Sprite;
   import flash.events.Event;
   import tape.§_-h2f§;
   import utils.§_-Y11§;
   
   public class §_-g1S§ extends Sprite
   {
      
      public var §_-t1f§:int = 0;
      
      private var data:§_-h2f§ = null;
      
      public function §_-g1S§(param1:int)
      {
         super();
         this.§_-t1f§ = param1;
         this.init();
      }
      
      public function §_-g2U§(param1:Boolean) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            (this.data.objects[_loc2_] as §_-X18§).§_-E7§();
            _loc2_++;
         }
      }
      
      public function setData(param1:Vector.<§_-Y11§>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            (this.data.objects[_loc2_] as §_-X18§).§_-fv§ = param1[(this.data.objects[_loc2_] as §_-X18§).elementId];
            _loc2_++;
         }
      }
      
      public function §_-L2F§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            if(!(this.data.objects[_loc1_] as §_-X18§).§_-6p§)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      private function init() : void
      {
         var _loc4_:§_-X18§ = null;
         this.data = new §_-h2f§();
         var _loc1_:Array = §_-93H§.§_-i1o§(this.§_-t1f§);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc4_ = new §_-X18§(_loc1_[_loc2_]);
            _loc4_.addEventListener(Event.CHANGE,this.update);
            this.data.§_-LF§(_loc4_);
            _loc2_++;
         }
         var _loc3_:§_-q2U§ = new §_-q2U§(14,1,0,3,4,4,45,45,false,false);
         _loc3_.setData(this.data);
         addChild(_loc3_);
      }
      
      private function update(param1:Event) : void
      {
         dispatchEvent(param1);
      }
   }
}

