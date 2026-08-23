package §_-f1x§
{
   import §_-I10§.§_-8S§;
   import §_-r16§.§_-22v§;
   import §_-r16§.§_-x2q§;
   import flash.display.Sprite;
   import flash.events.Event;
   import tape.§_-xc§;
   import utils.§_-Y25§;
   
   public class §_-SJ§ extends Sprite
   {
      
      public var §_-j1K§:int = 0;
      
      private var data:§_-xc§ = null;
      
      public function §_-SJ§(param1:int)
      {
         super();
         this.§_-j1K§ = param1;
         this.init();
      }
      
      public function §_-31O§(param1:Boolean) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            (this.data.objects[_loc2_] as §_-x2q§).§_-L1x§();
            _loc2_++;
         }
      }
      
      public function setData(param1:Vector.<§_-Y25§>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            (this.data.objects[_loc2_] as §_-x2q§).§_-93Y§ = param1[(this.data.objects[_loc2_] as §_-x2q§).elementId];
            _loc2_++;
         }
      }
      
      public function §_-O1i§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            if(!(this.data.objects[_loc1_] as §_-x2q§).§_-2B§)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      private function init() : void
      {
         var _loc4_:§_-x2q§ = null;
         this.data = new §_-xc§();
         var _loc1_:Array = §_-8S§.§_-Sr§(this.§_-j1K§);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc4_ = new §_-x2q§(_loc1_[_loc2_]);
            _loc4_.addEventListener(Event.CHANGE,this.update);
            this.data.§_-yA§(_loc4_);
            _loc2_++;
         }
         var _loc3_:§_-22v§ = new §_-22v§(14,1,0,3,4,4,45,45,false,false);
         _loc3_.setData(this.data);
         addChild(_loc3_);
      }
      
      private function update(param1:Event) : void
      {
         dispatchEvent(param1);
      }
   }
}

