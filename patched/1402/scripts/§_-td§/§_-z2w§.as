package §_-td§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.BalloonBody;
   import §_-8Q§.GameBody;
   import §_-8Q§.WeightBody;
   import §_-F5§.§_-63c§;
   import §_-F5§.§_-Q1r§;
   import §_-F5§.§_-k2D§;
   import §_-M16§.§_-X1G§;
   import §_-TK§.§_-aS§;
   import §_-X1k§.§_-n1C§;
   import §_-o10§.§_-B2x§;
   import §_-o10§.§_-v10§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-v1N§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-z2w§ extends Cast
   {
      
      protected var §_-7F§:Object = {};
      
      protected var §_-q12§:§_-aS§ = new §_-aS§();
      
      protected var §_-t2F§:int = 0;
      
      private var §_-x1Z§:int = -1;
      
      public function §_-z2w§(param1:SquirrelGame)
      {
         super(param1);
         §_-J2J§(this.§_-q12§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§,§_-s2l§.§_-Yi§,§_-s2l§.§_-P24§,§_-s2l§.§_-gQ§],1);
      }
      
      override public function round(param1:Array) : void
      {
         switch(param1[0])
         {
            case §_-s2l§.ROUND_START:
               this.§_-L1R§ = §_-LB§ * 0.5;
            case §_-s2l§.ROUND_PLAYING:
            case §_-s2l§.ROUND_STARTING:
            case §_-s2l§.ROUND_WAITING:
            case §_-s2l§.§_-02x§:
               this.clear();
               break;
            case §_-s2l§.§_-F2f§:
         }
      }
      
      override public function dispose() : void
      {
         this.clear();
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§,§_-s2l§.§_-Yi§,§_-s2l§.§_-P24§,§_-s2l§.§_-gQ§]);
      }
      
      override public function §_-03o§() : Boolean
      {
         if(!super.§_-03o§())
         {
            return false;
         }
         this.§_-e2T§();
         return true;
      }
      
      override public function §_-t2Q§() : void
      {
         super.§_-t2Q§();
         this.§_-tT§(§_-u1O§.§_-gQ§,§_-u1O§.§_-01I§);
      }
      
      override protected function §_-Va§(param1:TimerEvent = null) : void
      {
         var _loc2_:Function = null;
         this.§_-tT§(§_-u1O§.§_-gQ§,§_-u1O§.§_-3q§);
         this.§_-Q25§ = false;
         for each(_loc2_ in this.§_-H2A§)
         {
            _loc2_(§_-Ar§);
         }
         if(Boolean(this.castObject) && Boolean(Hero.self))
         {
            Hero.self.§_-C2u§(true);
         }
         §_-A1k§();
      }
      
      override protected function §_-d1H§(param1:Event = null) : void
      {
         this.§_-Va§(null);
      }
      
      override protected function §_-P0§() : void
      {
         this.§_-e2T§();
         this.§_-tT§(§_-u1O§.§_-gQ§,§_-u1O§.§_-3q§);
      }
      
      public function §_-e2T§() : void
      {
         this.§_-t2F§ = Hero.self.shaman ? §_-u1O§.§_-eu§ : §_-u1O§.§_-Ag§;
         this.§_-tT§(§_-u1O§.§_-P24§);
      }
      
      protected function §_-i2p§(param1:§_-s2l§) : void
      {
         var body:§_-xn§;
         var joint:§_-X1G§;
         var data:Object = null;
         var bodyClass:Class = null;
         var packet:§_-s2l§ = param1;
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
            §_-p2U§.add("CastNet->onRemoteCastBegin: " + e.message);
            return;
         }
         if(data[0][2] == §_-u1O§.§_-eu§)
         {
            bodyClass = §_-f1b§.§_-N1m§(data[1][0]);
         }
         else
         {
            bodyClass = §_-n1C§.§_-71N§(data[1][0]);
         }
         if(bodyClass == null)
         {
            return;
         }
         if(playerId != Game.selfId)
         {
            player.§_-Ed§();
         }
         if(playerId == Game.selfId && bodyClass == §_-63c§)
         {
            return;
         }
         if(!(playerId in this.§_-7F§))
         {
            this.§_-7F§[playerId] = {};
         }
         if(!("body" in this.§_-7F§[playerId]))
         {
            this.§_-7F§[playerId]["body"] = new bodyClass();
         }
         body = this.§_-7F§[playerId]["body"];
         if(!(body is §_-63c§) && !(body is §_-k2D§) && playerId != Game.selfId)
         {
            player.position = new b2Vec2(data[0][0],data[0][1]);
         }
         if(body is §_-Q1r§)
         {
            (body as §_-Q1r§).game = this.game;
         }
         if(body is §_-3l§)
         {
            (body as §_-3l§).§_-o2I§(data[1][1]);
         }
         (body as DisplayObject).alpha = playerId == Game.selfId ? 0 : 0.5;
         if(body is §_-63c§)
         {
            (body as §_-63c§).§_-P1X§ = player;
            (body as §_-63c§).alpha = 1;
         }
         this.§_-q12§.addChild(body as DisplayObject);
         if(body is §_-aS§)
         {
            this.§_-q12§.§_-J2J§(body as §_-aS§);
         }
         if(!("2" in data))
         {
            return;
         }
         joint = new (§_-f1b§.§_-N1m§(data[2][0]) as Class)() as §_-X1G§;
         joint.§_-o2I§(data[2][1]);
         joint.body = body as GameBody;
         this.§_-7F§[playerId]["joint"] = joint;
         (body as Sprite).addChild(joint);
      }
      
      protected function §_-SB§(param1:*) : void
      {
         var _loc2_:int = int(param1[0]);
         if(_loc2_ == Game.selfId && param1[1] == §_-u1O§.§_-Ag§ && param1[3] == §_-u1O§.§_-3q§)
         {
            this.§_-x1r§(param1[2]);
         }
         if(!this.§_-7F§ || !(_loc2_ in this.§_-7F§))
         {
            return;
         }
         if(Boolean(_loc2_ != Game.selfId && this.game) && Boolean(this.game.squirrels) && Boolean(this.game.squirrels.get(_loc2_)))
         {
            this.game.squirrels.get(_loc2_).§_-C2u§(true);
         }
         var _loc3_:Object = this.§_-7F§[_loc2_];
         var _loc4_:* = _loc3_["body"];
         if(param1[3] == §_-u1O§.§_-3q§ && Boolean(_loc4_))
         {
            GameSounds.§_-C1K§(_loc4_);
            if(this.§_-q12§.contains(_loc4_) || this.§_-q12§.§_-U2E§(_loc4_))
            {
               this.§_-q12§.removeChildStarling(_loc4_,false);
            }
            (_loc4_ as DisplayObject).alpha = 1;
            this.game.map.add(_loc4_);
            if(_loc4_ is GameBody)
            {
               (_loc4_ as GameBody).§_-t2F§ = param1[1];
               (_loc4_ as GameBody).playerId = _loc2_;
            }
            _loc4_.build(this.game.world);
            if("joint" in _loc3_)
            {
               this.game.map.add(_loc3_["joint"]);
               _loc3_["joint"].build(this.game.world);
            }
            if(_loc4_ is BalloonBody && _loc2_ in §_-B2x§.§_-oJ§)
            {
               (_loc4_ as BalloonBody).§_-x22§ *= 1 + §_-B2x§.§_-oJ§[_loc2_]["power"] / 100;
               if(§_-B2x§.§_-oJ§[_loc2_]["doubleCast"])
               {
                  (_loc4_ as BalloonBody).§_-43i§();
               }
            }
            if(_loc4_ is WeightBody && _loc2_ in §_-v10§.§_-73u§)
            {
               (_loc4_ as WeightBody).mass *= 1 + §_-v10§.§_-73u§[_loc2_]["weight"] / 100;
               if("lifeTime" in §_-v10§.§_-73u§[_loc2_])
               {
                  (_loc4_ as WeightBody).aging = true;
                  (_loc4_ as WeightBody).lifeTime = §_-v10§.§_-73u§[_loc2_]["lifeTime"];
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
         delete this.§_-7F§[_loc2_];
      }
      
      protected function §_-x1r§(param1:int) : void
      {
         var _loc2_:Boolean = §_-n1C§.§_-52K§(param1);
         if(!Hero.self || !Hero.self.§_-h1z§ || !_loc2_)
         {
            return;
         }
         Hero.self.§_-h1z§.add(new §_-v1N§(§_-n1C§.§_-71N§(param1),§_-v1N§.§_-W29§,-1));
      }
      
      protected function §_-tT§(param1:int, param2:int = 0) : void
      {
         var _loc4_:Array = null;
         var _loc3_:int = -1;
         if(!Hero.self)
         {
            _loc3_ = this.§_-x1Z§;
         }
         else
         {
            if(!this.castObject)
            {
               return;
            }
            if(!Hero.self.shaman)
            {
               _loc3_ = §_-n1C§.§_-q2W§(this.castObject);
            }
            else
            {
               _loc3_ = §_-f1b§.§_-q2W§(this.castObject);
            }
         }
         switch(param1)
         {
            case §_-u1O§.§_-P24§:
               this.§_-x1Z§ = _loc3_;
               _loc4_ = [];
               _loc4_.push([Hero.self.position.x,Hero.self.position.y,this.§_-t2F§]);
               if(this.castObject is §_-3l§)
               {
                  _loc4_.push([_loc3_,(this.castObject as §_-3l§).§_-m1Y§()]);
               }
               if(this.§_-03t§ is §_-3l§ && this.§_-03t§ != null)
               {
                  _loc4_.push([§_-f1b§.§_-q2W§(this.§_-03t§),(this.§_-03t§ as §_-3l§).§_-m1Y§()]);
               }
               Connection.§_-e2T§(§_-u1O§.§_-P24§,_loc3_,JSON.stringify(_loc4_));
               break;
            case §_-u1O§.§_-gQ§:
               Connection.§_-e2T§(§_-u1O§.§_-gQ§,this.§_-t2F§,_loc3_,param2);
         }
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-v1r§:
            case §_-s2l§.§_-V1b§:
               _loc2_ = [param1[0],0,0,§_-u1O§.§_-01I§];
               this.§_-SB§(_loc2_);
               break;
            case §_-s2l§.§_-Yi§:
               if(param1[0].indexOf(Game.selfId) != -1)
               {
                  if(Boolean(Hero.self) && Hero.self.shaman)
                  {
                     return;
                  }
                  if(this.§_-Q25§)
                  {
                     this.§_-t2Q§();
                  }
                  §_-A1k§();
               }
               break;
            case §_-s2l§.§_-P24§:
               this.§_-i2p§(param1);
               break;
            case §_-s2l§.§_-gQ§:
               this.§_-SB§(param1);
         }
      }
      
      private function clear() : void
      {
         var _loc1_:String = null;
         this.castObject = null;
         for(_loc1_ in this.§_-7F§)
         {
            if("body" in this.§_-7F§[_loc1_])
            {
               this.§_-7F§[_loc1_]["body"].dispose();
            }
            if("joint" in this.§_-7F§[_loc1_])
            {
               this.§_-7F§[_loc1_]["joint"].dispose();
            }
            delete this.§_-7F§[_loc1_];
         }
         while(this.§_-q12§.numChildren > 0)
         {
            this.§_-q12§.§_-av§(0,false);
            this.§_-q12§.removeChildAt(0);
         }
      }
   }
}

