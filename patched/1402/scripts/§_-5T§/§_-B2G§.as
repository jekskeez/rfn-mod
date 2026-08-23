package §_-5T§
{
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-WS§;
   import §_-wJ§.§_-227§;
   import §_-wJ§.§_-j1u§;
   import §_-wJ§.§_-q2U§;
   import flash.display.Sprite;
   import flash.events.Event;
   import tape.§_-h2f§;
   import utils.§_-Y11§;
   
   public class §_-B2G§ extends Sprite
   {
      
      private var data:§_-h2f§ = null;
      
      private var §_-St§:§_-227§ = null;
      
      private var §_-Wu§:Boolean = false;
      
      private var §_-X2B§:Boolean = false;
      
      public var §_-S2Q§:int = 1;
      
      public function §_-B2G§(param1:int)
      {
         super();
         this.§_-S2Q§ = param1;
         this.init();
      }
      
      public function setData(param1:Vector.<§_-Y11§>, param2:Vector.<§_-Y11§>) : void
      {
         this.§_-Wu§ = true;
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            (this.data.objects[_loc3_] as §_-j1u§).§_-fv§ = param1[(this.data.objects[_loc3_] as §_-j1u§).elementId];
            _loc3_++;
         }
         this.§_-St§.§_-fv§ = param2[this.§_-St§.elementId];
         this.§_-Wu§ = false;
         this.§_-9T§();
      }
      
      public function §_-5o§(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            if((this.data.objects[_loc3_] as §_-j1u§).elementId == param1)
            {
               (this.data.objects[_loc3_] as §_-j1u§).§_-h1H§ = param2;
            }
            _loc3_++;
         }
      }
      
      public function §_-g2U§(param1:Boolean) : void
      {
         this.§_-X2B§ = false;
         if(!param1 || !this.§_-L2F§())
         {
            return;
         }
         this.§_-Wu§ = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            (this.data.objects[_loc2_] as §_-j1u§).§_-3T§();
            _loc2_++;
         }
         this.§_-Wu§ = false;
         this.§_-9T§();
         this.§_-St§.§_-Z28§();
      }
      
      public function §_-L2F§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            if(!(this.data.objects[_loc1_] as §_-j1u§).§_-6p§)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      private function init() : void
      {
         var _loc3_:§_-j1u§ = null;
         this.data = new §_-h2f§();
         var _loc1_:int = 0;
         while(_loc1_ < §_-42H§.§_-V10§[this.§_-S2Q§]["set"].length)
         {
            _loc3_ = new §_-j1u§(§_-42H§.§_-V10§[this.§_-S2Q§]["set"][_loc1_]);
            _loc3_.addEventListener(Event.CHANGE,this.§_-9T§);
            this.data.§_-LF§(_loc3_);
            _loc1_++;
         }
         var _loc2_:§_-q2U§ = new §_-q2U§(3,2,0,0,3,0,60,60);
         _loc2_.y = 190;
         _loc2_.setData(this.data);
         addChild(_loc2_);
         this.§_-St§ = new §_-227§(this.§_-S2Q§);
         this.§_-St§.addEventListener(§_-227§.§_-V1G§,this.§_-3T§);
         addChild(this.§_-St§);
      }
      
      private function §_-9T§(param1:Event = null) : void
      {
         if(this.§_-Wu§)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-L2F§();
         this.§_-St§.§_-Z2s§ = _loc2_;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function §_-3T§(param1:Event) : void
      {
         if(!this.§_-L2F§())
         {
            return;
         }
         if(this.§_-X2B§)
         {
            return;
         }
         §_-WS§.§_-h1v§(this.§_-S2Q§);
         this.§_-X2B§ = true;
      }
   }
}

