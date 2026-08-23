package chat
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-N2t§ extends Sprite
   {
      
      public var §_-i1z§:Vector.<§_-e28§> = new Vector.<§_-e28§>();
      
      public var §_-Z0§:Vector.<§_-e28§> = new Vector.<§_-e28§>();
      
      public var §_-fW§:int = 0;
      
      public function §_-N2t§()
      {
         super();
      }
      
      public function dispose() : void
      {
         this.§_-Z0§ = new Vector.<§_-e28§>();
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-i1z§.length)
         {
            this.§_-i1z§[_loc1_].removeEventListener("MESSAGE_UPDATE",this.§_-037§);
            _loc1_++;
         }
         this.§_-i1z§ = new Vector.<§_-e28§>();
         this.§_-9x§();
      }
      
      public function §_-9x§() : void
      {
      }
      
      public function §_-pH§(param1:int) : void
      {
      }
      
      public function sendMessage(param1:String) : void
      {
      }
      
      public function §_-GH§(param1:§_-e28§, param2:Boolean = false) : void
      {
         if(param2)
         {
            param1.removeEventListener("MESSAGE_UPDATE",this.§_-037§);
            this.§_-Z0§.push(param1);
            this.§_-f9§(param1);
            return;
         }
         if(this.§_-i1z§.indexOf(param1) != -1)
         {
            return;
         }
         this.§_-i1z§.push(param1);
         param1.addEventListener("MESSAGE_UPDATE",this.§_-037§);
         this.§_-037§();
      }
      
      public function §_-O1s§() : void
      {
      }
      
      protected function §_-f9§(param1:§_-e28§) : void
      {
         if(!param1)
         {
         }
         dispatchEvent(new Event("CHANGED"));
      }
      
      private function §_-037§(param1:Event = null) : void
      {
         while(this.§_-i1z§.length != 0 && this.§_-i1z§[0].canAdd)
         {
            this.§_-GH§(this.§_-i1z§.shift(),true);
         }
      }
   }
}

