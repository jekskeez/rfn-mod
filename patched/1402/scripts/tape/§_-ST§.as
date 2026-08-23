package tape
{
   import §_-X1k§.NotificationManager;
   import §_-a11§.TapeDataEvent;
   import events.GameEvent;
   import flash.events.Event;
   
   public class §_-ST§ extends §_-j2a§
   {
      
      private static var _instance:§_-ST§;
      
      private static var ids:Array = [];
      
      private var §_-82§:Array = [];
      
      public function §_-ST§()
      {
         super();
         _instance = this;
         while(ids.length > 0)
         {
            this.§_-z2I§(ids.pop());
         }
         Game.§_-53O§(GameEvent.REMOVE_FRIEND,this.§_-xM§);
      }
      
      public static function §_-J14§(param1:int) : void
      {
         if(!_instance)
         {
            ids.push(param1);
            return;
         }
         _instance.§_-z2I§(param1);
         §_-L1H§.show(NotificationManager.§_-53c§);
      }
      
      public function §_-W1L§(param1:Boolean) : void
      {
         var _loc2_:TapePlayer = null;
         for each(_loc2_ in this.objects)
         {
            (_loc2_ as §_-k2m§).selected = param1;
         }
      }
      
      public function §_-93r§(param1:Array) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = int(param1.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = int(this.objects.length - 1);
            while(_loc3_ >= 0)
            {
               if(param1[_loc2_] == (this.objects[_loc3_] as §_-k2m§).playerId)
               {
                  (this.objects[_loc3_] as §_-k2m§).forget(§_-Z1P§);
                  this.objects.splice(_loc3_,1);
                  break;
               }
               _loc3_--;
            }
            _loc2_--;
         }
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-z2I§(param1:int) : void
      {
         if(this.§_-82§.indexOf(param1) != -1)
         {
            return;
         }
         this.§_-82§.push(param1);
         var _loc2_:§_-k2m§ = new §_-k2m§(param1);
         _loc2_.selected = true;
         add(_loc2_);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-xM§(param1:Event) : void
      {
         var _loc3_:§_-QN§ = null;
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         for each(_loc3_ in this.objects)
         {
            _loc4_ = (_loc3_ as TapePlayer).playerId;
            if(!(Game.§_-t2I§(_loc4_) || _loc4_ == Game.selfId))
            {
               _loc2_.push(_loc4_);
            }
         }
         this.§_-93r§(_loc2_);
      }
   }
}

