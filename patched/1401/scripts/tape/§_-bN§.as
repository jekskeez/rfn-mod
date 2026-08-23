package tape
{
   import §_-I10§.NotificationManager;
   import §_-r2Y§.TapeDataEvent;
   import events.GameEvent;
   import flash.events.Event;
   
   public class §_-bN§ extends §_-y1x§
   {
      
      private static var _instance:§_-bN§;
      
      private static var ids:Array = [];
      
      private var §_-t1u§:Array = [];
      
      public function §_-bN§()
      {
         super();
         _instance = this;
         while(ids.length > 0)
         {
            this.§_-R1m§(ids.pop());
         }
         Game.§_-Y2s§(GameEvent.REMOVE_FRIEND,this.§_-l1y§);
      }
      
      public static function §_-x2V§(param1:int) : void
      {
         if(!_instance)
         {
            ids.push(param1);
            return;
         }
         _instance.§_-R1m§(param1);
         §_-fO§.show(NotificationManager.§_-C2F§);
      }
      
      public function §_-WG§(param1:Boolean) : void
      {
         var _loc2_:TapePlayer = null;
         for each(_loc2_ in this.objects)
         {
            (_loc2_ as §_-G1Q§).selected = param1;
         }
      }
      
      public function §_-C2N§(param1:Array) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = int(param1.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = int(this.objects.length - 1);
            while(_loc3_ >= 0)
            {
               if(param1[_loc2_] == (this.objects[_loc3_] as §_-G1Q§).playerId)
               {
                  (this.objects[_loc3_] as §_-G1Q§).forget(§_-YC§);
                  this.objects.splice(_loc3_,1);
                  break;
               }
               _loc3_--;
            }
            _loc2_--;
         }
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-R1m§(param1:int) : void
      {
         if(this.§_-t1u§.indexOf(param1) != -1)
         {
            return;
         }
         this.§_-t1u§.push(param1);
         var _loc2_:§_-G1Q§ = new §_-G1Q§(param1);
         _loc2_.selected = true;
         add(_loc2_);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-l1y§(param1:Event) : void
      {
         var _loc3_:§_-K2k§ = null;
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         for each(_loc3_ in this.objects)
         {
            _loc4_ = (_loc3_ as TapePlayer).playerId;
            if(!(Game.§_-aC§(_loc4_) || _loc4_ == Game.selfId))
            {
               _loc2_.push(_loc4_);
            }
         }
         this.§_-C2N§(_loc2_);
      }
   }
}

