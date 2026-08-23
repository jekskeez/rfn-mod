package tape
{
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import com.api.Player;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-z1W§ extends §_-j2a§
   {
      
      public static const §_-TW§:uint = §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-W1l§ | §_-Y2E§.§_-82Q§;
      
      private var §_-Z1i§:Timer = new Timer(15 * 60 * 1000);
      
      private var §_-82§:Array = [];
      
      private var §_-E2V§:Vector.<§_-QN§> = new Vector.<§_-QN§>();
      
      private var top:Array = [];
      
      public function §_-z1W§()
      {
         super();
         this.§_-hI§ = §_-TW§;
         Game.§_-53O§(GameEvent.ADD_FRIEND,this.§_-43§);
         Game.§_-53O§(GameEvent.REMOVE_FRIEND,this.§_-xM§);
         this.§_-Z1i§.addEventListener(TimerEvent.TIMER,this.§_-62z§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C2J§]);
      }
      
      override protected function §_-J2c§() : void
      {
         if(Boolean(Game.self) && this.§_-82§.indexOf(Game.selfId) < 0)
         {
            this.§_-82§.push(Game.selfId);
            add(new TapePlayer(Game.selfId,TapePlayer.§_-ka§));
         }
         this.objects.sort(this.§_-F2y§);
         this.§_-E2V§ = this.objects.slice();
         this.§_-E2V§.sort(this.§_-v29§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-E2V§.length)
         {
            if(!(this.§_-E2V§[_loc1_] is §_-v2v§))
            {
               (this.§_-E2V§[_loc1_] as TapePlayer).§_-nE§ = _loc1_ + 1;
            }
            _loc1_++;
         }
         this.§_-MD§();
      }
      
      override protected function §_-Y16§(param1:Player) : void
      {
         super.§_-Y16§(param1);
         if("is_gone" in param1 && Boolean(param1["is_gone"]))
         {
            §_-ST§.§_-J14§(param1.id);
         }
      }
      
      private function §_-MD§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.top.length)
         {
            (this.top[_loc1_] as TapePlayer).§_-gN§(-1);
            _loc1_++;
         }
         this.top.splice(0);
         var _loc2_:Vector.<§_-QN§> = this.§_-E2V§.slice(0,3);
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(!(_loc2_[_loc1_] is §_-v2v§))
            {
               this.top.push(_loc2_[_loc1_]);
               (_loc2_[_loc1_] as TapePlayer).§_-gN§(_loc1_ + 1);
            }
            _loc1_++;
         }
      }
      
      private function §_-F2y§(param1:§_-QN§, param2:§_-QN§) : int
      {
         if(param1 is §_-v2v§)
         {
            return 1;
         }
         if(param2 is §_-v2v§)
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
         return this.§_-v29§(param1,param2);
      }
      
      private function §_-v29§(param1:§_-QN§, param2:§_-QN§) : int
      {
         if(param1 is §_-v2v§)
         {
            return 1;
         }
         if(param2 is §_-v2v§)
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
      
      private function §_-62z§(param1:TimerEvent) : void
      {
         if(§_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-H1k§)
         {
            this.§_-Z1i§.stop();
            §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-j2t§);
            return;
         }
         §_-SQ§(this.§_-82§);
      }
      
      private function §_-j2t§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-u24§ || param1.screen is §_-H1k§)
         {
            return;
         }
         §_-t2c§.instance.removeEventListener(ScreenEvent.SHOW,this.§_-j2t§);
         §_-SQ§(this.§_-82§);
         this.§_-Z1i§.reset();
         this.§_-Z1i§.start();
      }
      
      private function §_-43§(param1:Event) : void
      {
         var _loc3_:String = null;
         if(!Game.friends)
         {
            return;
         }
         var _loc2_:Array = [];
         for(_loc3_ in Game.friends)
         {
            if(this.§_-82§.indexOf(int(_loc3_)) <= -1)
            {
               this.§_-82§.push(int(_loc3_));
               _loc2_.push(new TapePlayer(int(_loc3_),TapePlayer.§_-ka§));
            }
         }
         this.§_-u1Y§(_loc2_.length);
         set(_loc2_);
      }
      
      private function §_-xM§(param1:Event) : void
      {
         var _loc2_:§_-QN§ = null;
         var _loc3_:int = 0;
         for each(_loc2_ in this.objects)
         {
            if(_loc2_ is TapePlayer)
            {
               _loc3_ = (_loc2_ as TapePlayer).playerId;
               if(!(Game.§_-t2I§(_loc3_) || _loc3_ == Game.selfId))
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
               this.objects[_loc2_].forget(§_-Z1P§);
               this.objects.splice(_loc2_,1);
               this.§_-836§();
               break;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§_-82§.length)
         {
            if(this.§_-82§[_loc2_] == param1)
            {
               this.§_-82§.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1[0].length)
         {
            if(param1[0][_loc3_ + 1] != 1)
            {
               _loc2_.push(new TapePlayer(param1[0][_loc3_],TapePlayer.§_-ka§));
               this.§_-82§.push(param1[0][_loc3_]);
            }
            _loc3_ += 2;
         }
         if(this.objects.length == 0)
         {
            if(Game.self)
            {
               _loc2_.push(new TapePlayer(Game.selfId,TapePlayer.§_-ka§));
               this.§_-82§.push(Game.selfId);
            }
            this.§_-Z1i§.start();
         }
         set(_loc2_);
         this.§_-836§();
         sort();
         dispatchEvent(new GameEvent(GameEvent.FRIENDS_UPDATE));
      }
      
      private function §_-836§() : void
      {
         var _loc1_:int = this.count < §_-E2i§.§_-J2A§ ? int(§_-E2i§.§_-J2A§ - this.count) : 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            addObject(new §_-v2v§());
            _loc2_++;
         }
      }
      
      private function §_-u1Y§(param1:int) : void
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.count)
         {
            if(this.objects[_loc2_] is §_-v2v§)
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

