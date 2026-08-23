package §_-F1E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-637§.§_-627§;
   import §_-637§.§_-J14§;
   import §_-637§.§_-p1L§;
   import §_-83V§.BalloonBody;
   import §_-83V§.GameBody;
   import §_-83V§.WeightBody;
   import §_-A2x§.§_-01J§;
   import §_-I10§.§_-X2T§;
   import §_-RI§.§_-h2I§;
   import §_-Rn§.§_-f1U§;
   import §_-vK§.§_-W22§;
   import §_-vK§.§_-qg§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-P1i§ extends §_-01J§
   {
      
      public function §_-P1i§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override protected function §_-w29§(param1:§_-S2I§) : void
      {
         var _loc5_:Class = null;
         var _loc2_:int = int(param1[0]);
         var _loc3_:Hero = this.game.squirrels.get(_loc2_);
         var _loc4_:Object = JSON.parse(param1[2]);
         if(_loc4_[0][2] == §_-h2B§.§_-Q5§ || this.game.squirrels.get(_loc2_).shaman)
         {
            _loc5_ = §_-03s§.§_-F1T§(_loc4_[1][0]) as Class;
         }
         else
         {
            _loc5_ = §_-X2T§.§_-s1f§(_loc4_[1][0]);
         }
         if(_loc2_ != Game.selfId)
         {
            _loc3_.§_-O2s§();
         }
         if(_loc5_ == §_-p1L§)
         {
            return;
         }
         if(!(_loc2_ in this.§_-q2w§))
         {
            this.§_-q2w§[_loc2_] = {};
         }
         if(!("body" in this.§_-q2w§[_loc2_]))
         {
            this.§_-q2w§[_loc2_]["body"] = new _loc5_();
         }
         var _loc6_:§_-63Q§ = this.§_-q2w§[_loc2_]["body"];
         if(!(_loc6_ is §_-p1L§) && !(_loc6_ is §_-627§))
         {
            _loc3_.position = new b2Vec2(_loc4_[0][0],_loc4_[0][1]);
         }
         if(_loc6_ is §_-J14§)
         {
            (_loc6_ as §_-J14§).game = this.game;
         }
         if(_loc6_ is §_-03u§)
         {
            (_loc6_ as §_-03u§).§_-41M§(_loc4_[1][1]);
         }
         (_loc6_ as DisplayObject).alpha = _loc2_ == Game.selfId ? 0 : 0.5;
         if(_loc6_ is §_-p1L§)
         {
            (_loc6_ as §_-p1L§).§_-u1B§ = _loc3_;
            (_loc6_ as §_-p1L§).alpha = 1;
         }
         this.§_-OM§.addChild(_loc6_ as DisplayObject);
         if(_loc6_ is §_-h2I§)
         {
            this.§_-OM§.§_-83v§(_loc6_ as §_-h2I§);
         }
         if(!("2" in _loc4_))
         {
            return;
         }
         var _loc7_:§_-f1U§ = new (§_-03s§.§_-F1T§(_loc4_[2][0]) as Class)() as §_-f1U§;
         _loc7_.§_-41M§(_loc4_[2][1]);
         _loc7_.body = _loc6_ as GameBody;
         this.§_-q2w§[_loc2_]["joint"] = _loc7_;
         (_loc6_ as Sprite).addChild(_loc7_);
      }
      
      override protected function §_-228§(param1:*) : void
      {
         var _loc2_:int = int(param1[0]);
         if(!(_loc2_ in this.§_-q2w§))
         {
            return;
         }
         if(_loc2_ != Game.selfId)
         {
            this.game.squirrels.get(_loc2_).§_-Yn§(true);
         }
         if(param1[3] == §_-h2B§.§_-W2S§)
         {
            GameSounds.§_-1g§(this.§_-q2w§[_loc2_]["body"]);
            if(this.§_-OM§.contains(this.§_-q2w§[_loc2_]["body"]))
            {
               this.§_-OM§.removeChildStarling(this.§_-q2w§[_loc2_]["body"],false);
            }
            if(this.§_-OM§.§_-ws§(this.§_-q2w§[_loc2_]["body"]))
            {
               this.§_-OM§.removeChildStarling(this.§_-q2w§[_loc2_]["body"],false);
            }
            (this.§_-q2w§[_loc2_]["body"] as DisplayObject).alpha = 1;
            this.game.map.add(this.§_-q2w§[_loc2_]["body"]);
            if(this.§_-q2w§[_loc2_]["body"] is GameBody)
            {
               (this.§_-q2w§[_loc2_]["body"] as GameBody).§_-123§ = param1[1];
               (this.§_-q2w§[_loc2_]["body"] as GameBody).playerId = _loc2_;
            }
            this.§_-q2w§[_loc2_]["body"].build(this.game.world);
            if("joint" in this.§_-q2w§[_loc2_])
            {
               this.game.map.add(this.§_-q2w§[_loc2_]["joint"]);
               this.§_-q2w§[_loc2_]["joint"].build(this.game.world);
            }
            if(this.§_-q2w§[_loc2_]["body"] is BalloonBody && _loc2_ in §_-W22§.§_-43p§)
            {
               (this.§_-q2w§[_loc2_]["body"] as BalloonBody).§_-y2W§ *= 1 + §_-W22§.§_-43p§[_loc2_]["power"] / 100;
               if(§_-W22§.§_-43p§[_loc2_]["doubleCast"])
               {
                  (this.§_-q2w§[_loc2_]["body"] as BalloonBody).§_-i2G§();
               }
            }
            if(this.§_-q2w§[_loc2_]["body"] is WeightBody && _loc2_ in §_-qg§.§_-a1b§)
            {
               (this.§_-q2w§[_loc2_]["body"] as WeightBody).mass *= 1 + §_-qg§.§_-a1b§[_loc2_]["weight"] / 100;
               if("lifeTime" in §_-qg§.§_-a1b§[_loc2_])
               {
                  (this.§_-q2w§[_loc2_]["body"] as WeightBody).aging = true;
                  (this.§_-q2w§[_loc2_]["body"] as WeightBody).lifeTime = §_-qg§.§_-a1b§[_loc2_]["lifeTime"];
               }
            }
         }
         else
         {
            this.§_-q2w§[_loc2_]["body"].dispose();
            if("joint" in this.§_-q2w§[_loc2_])
            {
               this.§_-q2w§[_loc2_]["joint"].dispose();
            }
         }
         delete this.§_-q2w§[_loc2_];
      }
   }
}

