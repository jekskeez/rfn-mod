package tape
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-P1Y§;
   import com.api.Player;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-DO§ extends §_-y1x§
   {
      
      public static const §_-12F§:uint = §_-hF§.§_-P13§ | §_-hF§.§_-B3k§ | §_-hF§.§_-71A§;
      
      private var §_-O2r§:Timer = new Timer(15 * 60 * 1000);
      
      private var §_-t1u§:Array = [];
      
      private var §_-lV§:Vector.<§_-K2k§> = new Vector.<§_-K2k§>();
      
      private var top:Array = [];
      
      public function §_-DO§()
      {
         super();
         this.§_-vE§ = §_-12F§;
         Game.§_-Y2s§(GameEvent.ADD_FRIEND,this.§_-R1Z§);
         Game.§_-Y2s§(GameEvent.REMOVE_FRIEND,this.§_-l1y§);
         this.§_-O2r§.addEventListener(TimerEvent.TIMER,this.§_-A1b§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-42o§]);
      }
      
      override protected function §_-Y1n§() : void
      {
         if(Boolean(Game.self) && this.§_-t1u§.indexOf(Game.selfId) < 0)
         {
            this.§_-t1u§.push(Game.selfId);
            add(new TapePlayer(Game.selfId,TapePlayer.§_-839§));
         }
         this.objects.sort(this.§_-E1f§);
         this.§_-lV§ = this.objects.slice();
         this.§_-lV§.sort(this.§_-F14§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-lV§.length)
         {
            if(!(this.§_-lV§[_loc1_] is §_-m17§))
            {
               (this.§_-lV§[_loc1_] as TapePlayer).§_-C2v§ = _loc1_ + 1;
            }
            _loc1_++;
         }
         this.§_-wD§();
      }
      
      override protected function §_-P9§(param1:Player) : void
      {
         super.§_-P9§(param1);
         if("is_gone" in param1 && Boolean(param1["is_gone"]))
         {
            §_-bN§.§_-x2V§(param1.id);
         }
      }
      
      private function §_-wD§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.top.length)
         {
            (this.top[_loc1_] as TapePlayer).§_-7m§(-1);
            _loc1_++;
         }
         this.top.splice(0);
         var _loc2_:Vector.<§_-K2k§> = this.§_-lV§.slice(0,3);
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(!(_loc2_[_loc1_] is §_-m17§))
            {
               this.top.push(_loc2_[_loc1_]);
               (_loc2_[_loc1_] as TapePlayer).§_-7m§(_loc1_ + 1);
            }
            _loc1_++;
         }
      }
      
      private function §_-E1f§(param1:§_-K2k§, param2:§_-K2k§) : int
      {
         if(param1 is §_-m17§)
         {
            return 1;
         }
         if(param2 is §_-m17§)
         {
            return -1;
         }
         var _loc3_:TapePlayer = param1 as TapePlayer;
         var _loc4_:TapePlayer = param2 as TapePlayer;
         if(Boolean(_loc3_.player["online"]) && !_loc4_.player["online"])
         {
            return -1;
         }
         if(!_loc3_.player["online"] && Boolean(_loc4_.player["online"]))
         {
            return 1;
         }
         return this.§_-F14§(param1,param2);
      }
      
      private function §_-F14§(param1:§_-K2k§, param2:§_-K2k§) : int
      {
         if(param1 is §_-m17§)
         {
            return 1;
         }
         if(param2 is §_-m17§)
         {
            return -1;
         }
         var _loc3_:TapePlayer = param1 as TapePlayer;
         var _loc4_:TapePlayer = param2 as TapePlayer;
         if(_loc3_.player["exp"] == _loc4_.player["exp"])
         {
            return _loc3_.playerId < _loc4_.playerId ? 1 : -1;
         }
         if(_loc3_.player["exp"] < _loc4_.player["exp"])
         {
            return 1;
         }
         return -1;
      }
      
      private function §_-A1b§(param1:TimerEvent) : void
      {
         if(§_-71o§.active is §_-92z§ || §_-71o§.active is §_-P1Y§)
         {
            this.§_-O2r§.stop();
            §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-Lz§);
            return;
         }
         §_-k2k§(this.§_-t1u§);
      }
      
      private function §_-Lz§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-92z§ || param1.screen is §_-P1Y§)
         {
            return;
         }
         §_-71o§.instance.removeEventListener(ScreenEvent.SHOW,this.§_-Lz§);
         §_-k2k§(this.§_-t1u§);
         this.§_-O2r§.reset();
         this.§_-O2r§.start();
      }
      
      private function §_-R1Z§(param1:Event) : void
      {
         var _loc3_:String = null;
         if(!Game.friends)
         {
            return;
         }
         var _loc2_:Array = [];
         for(_loc3_ in Game.friends)
         {
            if(this.§_-t1u§.indexOf(int(_loc3_)) <= -1)
            {
               this.§_-t1u§.push(int(_loc3_));
               _loc2_.push(new TapePlayer(int(_loc3_),TapePlayer.§_-839§));
            }
         }
         this.§_-m1a§(_loc2_.length);
         set(_loc2_);
      }
      
      private function §_-l1y§(param1:Event) : void
      {
         var _loc2_:§_-K2k§ = null;
         var _loc3_:int = 0;
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ is TapePlayer)
            {
               _loc3_ = (_loc2_ as TapePlayer).playerId;
               if(!(Game.§_-aC§(_loc3_) || _loc3_ == Game.selfId))
               {
                  this.remove(_loc3_);
               }
            }
         }
         sort();
      }
      
      private function remove(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            if(!(!(this.objects[_loc2_] is TapePlayer) || (this.objects[_loc2_] as TapePlayer).playerId != param1))
            {
               this.objects[_loc2_].forget(§_-YC§);
               this.objects.splice(_loc2_,1);
               this.§_-dh§();
               break;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§_-t1u§.length)
         {
            if(this.§_-t1u§[_loc2_] == param1)
            {
               this.§_-t1u§.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1[0].length)
         {
            if(param1[0][_loc3_ + 1] != 1)
            {
               _loc2_.push(new TapePlayer(param1[0][_loc3_],TapePlayer.§_-839§));
               this.§_-t1u§.push(param1[0][_loc3_]);
            }
            _loc3_ += 2;
         }
         if(this.objects.length == 0)
         {
            if(Game.self)
            {
               _loc2_.push(new TapePlayer(Game.selfId,TapePlayer.§_-839§));
               this.§_-t1u§.push(Game.selfId);
            }
            this.§_-O2r§.start();
         }
         set(_loc2_);
         this.§_-dh§();
         sort();
         dispatchEvent(new GameEvent(GameEvent.FRIENDS_UPDATE));
      }
      
      private function §_-dh§() : void
      {
         var _loc1_:int = this.count < §_-Q9§.§_-Ec§ ? int(§_-Q9§.§_-Ec§ - this.count) : 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            addObject(new §_-m17§());
            _loc2_++;
         }
      }
      
      private function §_-m1a§(param1:int) : void
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.count)
         {
            if(this.objects[_loc2_] is §_-m17§)
            {
               if(param1-- == 0)
               {
                  break;
               }
               this.objects.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
      }
   }
}

