package §_-v2M§
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
   import §_-td§.§_-z2w§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-f1C§ extends §_-z2w§
   {
      
      public function §_-f1C§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override protected function §_-i2p§(param1:§_-s2l§) : void
      {
         var _loc5_:Class = null;
         var _loc2_:int = int(param1[0]);
         var _loc3_:Hero = this.game.squirrels.get(_loc2_);
         var _loc4_:Object = JSON.parse(param1[2]);
         if(_loc4_[0][2] == §_-u1O§.§_-eu§ || this.game.squirrels.get(_loc2_).shaman)
         {
            _loc5_ = §_-f1b§.§_-N1m§(_loc4_[1][0]) as Class;
         }
         else
         {
            _loc5_ = §_-n1C§.§_-71N§(_loc4_[1][0]);
         }
         if(_loc2_ != Game.selfId)
         {
            _loc3_.§_-Ed§();
         }
         if(_loc5_ == §_-63c§)
         {
            return;
         }
         if(!(_loc2_ in this.§_-7F§))
         {
            this.§_-7F§[_loc2_] = {};
         }
         if(!("body" in this.§_-7F§[_loc2_]))
         {
            this.§_-7F§[_loc2_]["body"] = new _loc5_();
         }
         var _loc6_:§_-xn§ = this.§_-7F§[_loc2_]["body"];
         if(!(_loc6_ is §_-63c§) && !(_loc6_ is §_-k2D§))
         {
            _loc3_.position = new b2Vec2(_loc4_[0][0],_loc4_[0][1]);
         }
         if(_loc6_ is §_-Q1r§)
         {
            (_loc6_ as §_-Q1r§).game = this.game;
         }
         if(_loc6_ is §_-3l§)
         {
            (_loc6_ as §_-3l§).§_-o2I§(_loc4_[1][1]);
         }
         (_loc6_ as DisplayObject).alpha = _loc2_ == Game.selfId ? 0 : 0.5;
         if(_loc6_ is §_-63c§)
         {
            (_loc6_ as §_-63c§).§_-P1X§ = _loc3_;
            (_loc6_ as §_-63c§).alpha = 1;
         }
         this.§_-q12§.addChild(_loc6_ as DisplayObject);
         if(_loc6_ is §_-aS§)
         {
            this.§_-q12§.§_-J2J§(_loc6_ as §_-aS§);
         }
         if(!("2" in _loc4_))
         {
            return;
         }
         var _loc7_:§_-X1G§ = new (§_-f1b§.§_-N1m§(_loc4_[2][0]) as Class)() as §_-X1G§;
         _loc7_.§_-o2I§(_loc4_[2][1]);
         _loc7_.body = _loc6_ as GameBody;
         this.§_-7F§[_loc2_]["joint"] = _loc7_;
         (_loc6_ as Sprite).addChild(_loc7_);
      }
      
      override protected function §_-SB§(param1:*) : void
      {
         var _loc2_:int = int(param1[0]);
         if(!(_loc2_ in this.§_-7F§))
         {
            return;
         }
         if(_loc2_ != Game.selfId)
         {
            this.game.squirrels.get(_loc2_).§_-C2u§(true);
         }
         if(param1[3] == §_-u1O§.§_-3q§)
         {
            GameSounds.§_-C1K§(this.§_-7F§[_loc2_]["body"]);
            if(this.§_-q12§.contains(this.§_-7F§[_loc2_]["body"]))
            {
               this.§_-q12§.removeChildStarling(this.§_-7F§[_loc2_]["body"],false);
            }
            if(this.§_-q12§.§_-U2E§(this.§_-7F§[_loc2_]["body"]))
            {
               this.§_-q12§.removeChildStarling(this.§_-7F§[_loc2_]["body"],false);
            }
            (this.§_-7F§[_loc2_]["body"] as DisplayObject).alpha = 1;
            this.game.map.add(this.§_-7F§[_loc2_]["body"]);
            if(this.§_-7F§[_loc2_]["body"] is GameBody)
            {
               (this.§_-7F§[_loc2_]["body"] as GameBody).§_-t2F§ = param1[1];
               (this.§_-7F§[_loc2_]["body"] as GameBody).playerId = _loc2_;
            }
            this.§_-7F§[_loc2_]["body"].build(this.game.world);
            if("joint" in this.§_-7F§[_loc2_])
            {
               this.game.map.add(this.§_-7F§[_loc2_]["joint"]);
               this.§_-7F§[_loc2_]["joint"].build(this.game.world);
            }
            if(this.§_-7F§[_loc2_]["body"] is BalloonBody && _loc2_ in §_-B2x§.§_-oJ§)
            {
               (this.§_-7F§[_loc2_]["body"] as BalloonBody).§_-x22§ *= 1 + §_-B2x§.§_-oJ§[_loc2_]["power"] / 100;
               if(§_-B2x§.§_-oJ§[_loc2_]["doubleCast"])
               {
                  (this.§_-7F§[_loc2_]["body"] as BalloonBody).§_-43i§();
               }
            }
            if(this.§_-7F§[_loc2_]["body"] is WeightBody && _loc2_ in §_-v10§.§_-73u§)
            {
               (this.§_-7F§[_loc2_]["body"] as WeightBody).mass *= 1 + §_-v10§.§_-73u§[_loc2_]["weight"] / 100;
               if("lifeTime" in §_-v10§.§_-73u§[_loc2_])
               {
                  (this.§_-7F§[_loc2_]["body"] as WeightBody).aging = true;
                  (this.§_-7F§[_loc2_]["body"] as WeightBody).lifeTime = §_-v10§.§_-73u§[_loc2_]["lifeTime"];
               }
            }
         }
         else
         {
            this.§_-7F§[_loc2_]["body"].dispose();
            if("joint" in this.§_-7F§[_loc2_])
            {
               this.§_-7F§[_loc2_]["joint"].dispose();
            }
         }
         delete this.§_-7F§[_loc2_];
      }
   }
}

