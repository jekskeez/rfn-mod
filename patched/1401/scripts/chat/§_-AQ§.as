package chat
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-AQ§ extends Sprite
   {
      
      public var §_-Z2F§:Vector.<§_-dd§> = new Vector.<§_-dd§>();
      
      public var §_-03P§:Vector.<§_-dd§> = new Vector.<§_-dd§>();
      
      public var §_-Z1w§:int = 0;
      
      public function §_-AQ§()
      {
         super();
      }
      
      public function dispose() : void
      {
         this.§_-03P§ = new Vector.<§_-dd§>();
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-Z2F§.length)
         {
            this.§_-Z2F§[_loc1_].removeEventListener("MESSAGE_UPDATE",this.§_-L2C§);
            _loc1_++;
         }
         this.§_-Z2F§ = new Vector.<§_-dd§>();
         this.§_-D1L§();
      }
      
      public function §_-D1L§() : void
      {
      }
      
      public function §_-7M§(param1:int) : void
      {
      }
      
      public function sendMessage(param1:String) : void
      {
      }
      
      public function §_-72y§(param1:§_-dd§, param2:Boolean = false) : void
      {
         if(param2)
         {
            param1.removeEventListener("MESSAGE_UPDATE",this.§_-L2C§);
            this.§_-03P§.push(param1);
            this.§_-Mw§(param1);
            return;
         }
         if(this.§_-Z2F§.indexOf(param1) != -1)
         {
            return;
         }
         this.§_-Z2F§.push(param1);
         param1.addEventListener("MESSAGE_UPDATE",this.§_-L2C§);
         this.§_-L2C§();
      }
      
      public function §_-027§() : void
      {
      }
      
      protected function §_-Mw§(param1:§_-dd§) : void
      {
         if(!param1)
         {
         }
         dispatchEvent(new Event("CHANGED"));
      }
      
      private function §_-L2C§(param1:Event = null) : void
      {
         while(this.§_-Z2F§.length != 0 && this.§_-Z2F§[0].canAdd)
         {
            this.§_-72y§(this.§_-Z2F§.shift(),true);
         }
      }
   }
}

