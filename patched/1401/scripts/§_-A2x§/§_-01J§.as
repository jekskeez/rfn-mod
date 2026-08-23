package §_-A2x§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-637§.§_-627§;
   import §_-637§.§_-J14§;
   import §_-637§.§_-p1L§;
   import §_-83V§.BalloonBody;
   import §_-83V§.GameBody;
   import §_-83V§.WeightBody;
   import §_-I10§.§_-X2T§;
   import §_-RI§.§_-h2I§;
   import §_-Rn§.§_-f1U§;
   import §_-vK§.§_-W22§;
   import §_-vK§.§_-qg§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-bM§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-01J§ extends Cast
   {
      
      protected var §_-q2w§:Object = {};
      
      protected var §_-OM§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-123§:int = 0;
      
      private var §_-81H§:int = -1;
      
      public function §_-01J§(param1:SquirrelGame)
      {
         super(param1);
         §_-83v§(this.§_-OM§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§,§_-S2I§.§_-82J§,§_-S2I§.§_-G20§,§_-S2I§.§_-C1c§],1);
      }
      
      override public function round(param1:Array) : void
      {
         switch(param1[0])
         {
            case §_-S2I§.ROUND_START:
               this.§_-J1L§ = §_-Cl§ * 0.5;
            case §_-S2I§.ROUND_PLAYING:
            case §_-S2I§.ROUND_STARTING:
            case §_-S2I§.ROUND_WAITING:
            case §_-S2I§.§_-RO§:
               this.clear();
               break;
            case §_-S2I§.§_-JF§:
         }
      }
      
      override public function dispose() : void
      {
         this.clear();
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§,§_-S2I§.§_-82J§,§_-S2I§.§_-G20§,§_-S2I§.§_-C1c§]);
      }
      
      override public function §_-qB§() : Boolean
      {
         if(!super.§_-qB§())
         {
            return false;
         }
         this.§_-Li§();
         return true;
      }
      
      override public function §_-PS§() : void
      {
         super.§_-PS§();
         this.§_-T13§(§_-h2B§.§_-C1c§,§_-h2B§.§_-7j§);
      }
      
      override protected function §_-23§(param1:TimerEvent = null) : void
      {
         var _loc2_:Function = null;
         this.§_-T13§(§_-h2B§.§_-C1c§,§_-h2B§.§_-W2S§);
         this.§_-82s§ = false;
         for each(_loc2_ in this.§_-81x§)
         {
            _loc2_(§_-cg§);
         }
         if(Boolean(this.castObject) && Boolean(Hero.self))
         {
            Hero.self.§_-Yn§(true);
         }
         §_-m2C§();
      }
      
      override protected function §_-D1j§(param1:Event = null) : void
      {
         this.§_-23§(null);
      }
      
      override protected function §_-CL§() : void
      {
         this.§_-Li§();
         this.§_-T13§(§_-h2B§.§_-C1c§,§_-h2B§.§_-W2S§);
      }
      
      public function §_-Li§() : void
      {
         this.§_-123§ = Hero.self.shaman ? §_-h2B§.§_-Q5§ : §_-h2B§.§_-S1J§;
         this.§_-T13§(§_-h2B§.§_-G20§);
      }
      
      protected function §_-w29§(param1:§_-S2I§) : void
      {
         var body:§_-63Q§;
         var joint:§_-f1U§;
         var data:Object = null;
         var bodyClass:Class = null;
         var packet:§_-S2I§ = param1;
         var playerId:int = int(packet[0]);
         var player:Hero = this.game.squirrels.get(playerId);
         if(!player)
         {
            return;
         }
         try
         {
            data = JSON.parse(packet[2]);
         }
         catch(e:Error)
         {
            §_-TQ§.add("CastNet->onRemoteCastBegin: " + e.message);
            return;
         }
         if(data[0][2] == §_-h2B§.§_-Q5§)
         {
            bodyClass = §_-03s§.§_-F1T§(data[1][0]);
         }
         else
         {
            bodyClass = §_-X2T§.§_-s1f§(data[1][0]);
         }
         if(bodyClass == null)
         {
            return;
         }
         if(playerId != Game.selfId)
         {
            player.§_-O2s§();
         }
         if(playerId == Game.selfId && bodyClass == §_-p1L§)
         {
            return;
         }
         if(!(playerId in this.§_-q2w§))
         {
            this.§_-q2w§[playerId] = {};
         }
         if(!("body" in this.§_-q2w§[playerId]))
         {
            this.§_-q2w§[playerId]["body"] = new bodyClass();
         }
         body = this.§_-q2w§[playerId]["body"];
         if(!(body is §_-p1L§) && !(body is §_-627§) && playerId != Game.selfId)
         {
            player.position = new b2Vec2(data[0][0],data[0][1]);
         }
         if(body is §_-J14§)
         {
            (body as §_-J14§).game = this.game;
         }
         if(body is §_-03u§)
         {
            (body as §_-03u§).§_-41M§(data[1][1]);
         }
         (body as DisplayObject).alpha = playerId == Game.selfId ? 0 : 0.5;
         if(body is §_-p1L§)
         {
            (body as §_-p1L§).§_-u1B§ = player;
            (body as §_-p1L§).alpha = 1;
         }
         this.§_-OM§.addChild(body as DisplayObject);
         if(body is §_-h2I§)
         {
            this.§_-OM§.§_-83v§(body as §_-h2I§);
         }
         if(!("2" in data))
         {
            return;
         }
         joint = new (§_-03s§.§_-F1T§(data[2][0]) as Class)() as §_-f1U§;
         joint.§_-41M§(data[2][1]);
         joint.body = body as GameBody;
         this.§_-q2w§[playerId]["joint"] = joint;
         (body as Sprite).addChild(joint);
      }
      
      protected function §_-228§(param1:*) : void
      {
         var _loc2_:int = int(param1[0]);
         if(_loc2_ == Game.selfId && param1[1] == §_-h2B§.§_-S1J§ && param1[3] == §_-h2B§.§_-W2S§)
         {
            this.§_-X2X§(param1[2]);
         }
         if(!this.§_-q2w§ || !(_loc2_ in this.§_-q2w§))
         {
            return;
         }
         if(Boolean(_loc2_ != Game.selfId && this.game) && Boolean(this.game.squirrels) && Boolean(this.game.squirrels.get(_loc2_)))
         {
            this.game.squirrels.get(_loc2_).§_-Yn§(true);
         }
         var _loc3_:Object = this.§_-q2w§[_loc2_];
         var _loc4_:* = _loc3_["body"];
         if(param1[3] == §_-h2B§.§_-W2S§ && Boolean(_loc4_))
         {
            GameSounds.§_-1g§(_loc4_);
            if(this.§_-OM§.contains(_loc4_) || this.§_-OM§.§_-ws§(_loc4_))
            {
               this.§_-OM§.removeChildStarling(_loc4_,false);
            }
            (_loc4_ as DisplayObject).alpha = 1;
            this.game.map.add(_loc4_);
            if(_loc4_ is GameBody)
            {
               (_loc4_ as GameBody).§_-123§ = param1[1];
               (_loc4_ as GameBody).playerId = _loc2_;
            }
            _loc4_.build(this.game.world);
            if("joint" in _loc3_)
            {
               this.game.map.add(_loc3_["joint"]);
               _loc3_["joint"].build(this.game.world);
            }
            if(_loc4_ is BalloonBody && _loc2_ in §_-W22§.§_-43p§)
            {
               (_loc4_ as BalloonBody).§_-y2W§ *= 1 + §_-W22§.§_-43p§[_loc2_]["power"] / 100;
               if(§_-W22§.§_-43p§[_loc2_]["doubleCast"])
               {
                  (_loc4_ as BalloonBody).§_-i2G§();
               }
            }
            if(_loc4_ is WeightBody && _loc2_ in §_-qg§.§_-a1b§)
            {
               (_loc4_ as WeightBody).mass *= 1 + §_-qg§.§_-a1b§[_loc2_]["weight"] / 100;
               if("lifeTime" in §_-qg§.§_-a1b§[_loc2_])
               {
                  (_loc4_ as WeightBody).aging = true;
                  (_loc4_ as WeightBody).lifeTime = §_-qg§.§_-a1b§[_loc2_]["lifeTime"];
               }
            }
         }
         else
         {
            if(_loc4_)
            {
               _loc4_.dispose();
            }
            if("joint" in _loc3_)
            {
               _loc3_["joint"].dispose();
            }
         }
         delete this.§_-q2w§[_loc2_];
      }
      
      protected function §_-X2X§(param1:int) : void
      {
         var _loc2_:Boolean = §_-X2T§.§_-P1d§(param1);
         if(!Hero.self || !Hero.self.§_-l2U§ || !_loc2_)
         {
            return;
         }
         Hero.self.§_-l2U§.add(new §_-bM§(§_-X2T§.§_-s1f§(param1),§_-bM§.§_-t2G§,-1));
      }
      
      protected function §_-T13§(param1:int, param2:int = 0) : void
      {
         var _loc4_:Array = null;
         var _loc3_:int = -1;
         if(!Hero.self)
         {
            _loc3_ = this.§_-81H§;
         }
         else
         {
            if(!this.castObject)
            {
               return;
            }
            if(!Hero.self.shaman)
            {
               _loc3_ = §_-X2T§.§_-X21§(this.castObject);
            }
            else
            {
               _loc3_ = §_-03s§.§_-X21§(this.castObject);
            }
         }
         switch(param1)
         {
            case §_-h2B§.§_-G20§:
               this.§_-81H§ = _loc3_;
               _loc4_ = [];
               _loc4_.push([Hero.self.position.x,Hero.self.position.y,this.§_-123§]);
               if(this.castObject is §_-03u§)
               {
                  _loc4_.push([_loc3_,(this.castObject as §_-03u§).§_-A1X§()]);
               }
               if(this.§_-5q§ is §_-03u§ && this.§_-5q§ != null)
               {
                  _loc4_.push([§_-03s§.§_-X21§(this.§_-5q§),(this.§_-5q§ as §_-03u§).§_-A1X§()]);
               }
               Connection.§_-Li§(§_-h2B§.§_-G20§,_loc3_,JSON.stringify(_loc4_));
               break;
            case §_-h2B§.§_-C1c§:
               Connection.§_-Li§(§_-h2B§.§_-C1c§,this.§_-123§,_loc3_,param2);
         }
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-F2m§:
            case §_-S2I§.§_-R28§:
               _loc2_ = [param1[0],0,0,§_-h2B§.§_-7j§];
               this.§_-228§(_loc2_);
               break;
            case §_-S2I§.§_-82J§:
               if(param1[0].indexOf(Game.selfId) != -1)
               {
                  if(Boolean(Hero.self) && Hero.self.shaman)
                  {
                     return;
                  }
                  if(this.§_-82s§)
                  {
                     this.§_-PS§();
                  }
                  §_-m2C§();
               }
               break;
            case §_-S2I§.§_-G20§:
               this.§_-w29§(param1);
               break;
            case §_-S2I§.§_-C1c§:
               this.§_-228§(param1);
         }
      }
      
      private function clear() : void
      {
         var _loc1_:String = null;
         this.castObject = null;
         for(_loc1_ in this.§_-q2w§)
         {
            if("body" in this.§_-q2w§[_loc1_])
            {
               this.§_-q2w§[_loc1_]["body"].dispose();
            }
            if("joint" in this.§_-q2w§[_loc1_])
            {
               this.§_-q2w§[_loc1_]["joint"].dispose();
            }
            delete this.§_-q2w§[_loc1_];
         }
         while(this.§_-OM§.numChildren > 0)
         {
            this.§_-OM§.§_-n2T§(0,false);
            this.§_-OM§.removeChildAt(0);
         }
      }
   }
}

