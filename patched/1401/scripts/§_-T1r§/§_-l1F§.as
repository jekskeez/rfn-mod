package §_-T1r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8I§.CastEvent;
   import §_-8I§.SquirrelEvent;
   import §_-A2x§.§_-33A§;
   import §_-Dn§.§_-C3J§;
   import §_-T2y§.§_-92z§;
   import §_-d11§.§_-4P§;
   import §_-d11§.§_-Cj§;
   import §_-d11§.§_-UT§;
   import §_-d11§.§_-p1i§;
   import §_-d11§.§_-sS§;
   import §_-s2l§.ControllerHeroLocal;
   import chat.§_-A1n§;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-ME§;
   import game.mainGame.§_-bM§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-l1F§ extends §_-33A§ implements §_-ME§
   {
      
      private static const §_-V1W§:int = 10;
      
      private var §_-83O§:Array = [];
      
      private var §_-63J§:Array = [];
      
      private var §_-pK§:Object = {};
      
      public var achievements:§_-C3J§ = null;
      
      public function §_-l1F§()
      {
         super();
         this.§_-Y1k§ = §_-i1L§;
         this.achievements = new §_-C3J§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-j2§],1);
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         switch(param1[0])
         {
            case §_-S2I§.ROUND_START:
               if(§_-92z§.§_-32S§ != 0)
               {
                  break;
               }
               ControllerHeroLocal.§_-jL§ = true;
               SquirrelGame.instance.camera.enabled = true;
               Hero.self.§_-l2U§.add(new §_-bM§(§_-4P§,§_-bM§.§_-t2G§,§_-V1W§));
               Hero.self.§_-l2U§.add(new §_-bM§(§_-Cj§,§_-bM§.§_-t2G§,0));
               Hero.self.§_-l2U§.add(new §_-bM§(§_-p1i§,§_-bM§.§_-t2G§,0));
               Hero.self.§_-l2U§.add(new §_-bM§(§_-sS§,§_-bM§.§_-t2G§,0));
               Hero.self.§_-l2U§.add(new §_-bM§(§_-UT§,§_-bM§.§_-t2G§,0));
         }
      }
      
      public function get §_-v2G§() : Array
      {
         return this.§_-83O§;
      }
      
      public function get §_-J23§() : Array
      {
         return this.§_-63J§;
      }
      
      override protected function §_-h14§() : void
      {
      }
      
      override public function §_-U1m§(param1:Boolean = true) : void
      {
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         var _loc2_:§_-i1L§ = get(param1) as §_-i1L§;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.team = int(this.§_-pK§[param1]) || Hero.§_-JL§;
      }
      
      override public function remove(param1:int) : void
      {
         var _loc2_:int = 0;
         super.remove(param1);
         if(this.§_-83O§ != null)
         {
            _loc2_ = this.§_-83O§.indexOf(param1);
            if(_loc2_ != -1)
            {
               this.§_-83O§.splice(_loc2_,1);
            }
         }
         if(this.§_-63J§ != null)
         {
            _loc2_ = this.§_-63J§.indexOf(param1);
            if(_loc2_ != -1)
            {
               this.§_-63J§.splice(_loc2_,1);
            }
         }
         if(param1 in this.§_-pK§)
         {
            delete this.§_-pK§[param1];
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.achievements.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-j2§]);
      }
      
      override public function place() : void
      {
         var _loc5_:Vector.<b2Vec2> = null;
         var _loc6_:Hero = null;
         var _loc1_:§_-r1t§ = GameMap.instance as §_-r1t§;
         var _loc2_:Vector.<b2Vec2> = _loc1_.§_-s2t§;
         var _loc3_:Vector.<b2Vec2> = _loc1_.§_-E2f§;
         if(!this.§_-B2p§(_loc2_) || !this.§_-B2p§(_loc3_))
         {
            return;
         }
         var _loc4_:int = 0;
         for each(_loc6_ in this.players)
         {
            _loc5_ = GameMap.instance.§_-c2O§;
            if(_loc6_.team == Hero.§_-17§)
            {
               _loc5_ = _loc2_;
            }
            if(_loc6_.team == Hero.§_-114§)
            {
               _loc5_ = _loc3_;
            }
            _loc6_.position = _loc5_[_loc4_ % _loc5_.length];
            _loc4_++;
         }
      }
      
      override protected function §_-y2G§(param1:SquirrelEvent = null) : void
      {
         SquirrelGame.instance.camera.enabled = false;
         if(Hero.self.§_-I1R§ != -1)
         {
            Connection.§_-Li§(§_-h2B§.§_-F2m§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-L1A§,Hero.self.§_-I1R§);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-F2m§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-L1A§);
         }
      }
      
      override protected function §_-J1u§() : void
      {
         this.achievements.reset();
         this.§_-u2t§(this.§_-83O§,this.§_-63J§);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Hero = null;
         var _loc4_:Vector.<b2Vec2> = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-j2§:
               this.§_-I19§();
               this.§_-u2t§(param1[0],param1[1]);
               break;
            case §_-S2I§.§_-F2m§:
               super.§_-o2C§(param1);
               if(!("4" in param1))
               {
                  return;
               }
               _loc2_ = get(param1[4]);
               if(!_loc2_)
               {
                  return;
               }
               ++_loc2_.frags;
               if(param1[4] == Game.selfId)
               {
                  §_-92z§.sendMessage(param1[0],"",§_-A1n§.§_-31o§);
               }
               else if(get(param1[0]) as §_-i1L§ != null && (get(param1[0]) as §_-i1L§).§_-p21§)
               {
                  §_-92z§.sendMessage(param1[0],"",§_-A1n§.§_-IF§);
               }
               if(param1[0] == Game.selfId && Boolean(param1[4]))
               {
                  §_-92z§.sendMessage(param1[4],"",§_-A1n§.§_-z1S§);
               }
               break;
            case §_-S2I§.§_-03G§:
               _loc3_ = get(param1[1]);
               if(!_loc3_.isDead || param1[0] == §_-S2I§.§_-8n§)
               {
                  break;
               }
               _loc3_.respawn(1);
               switch(get(param1[1]).team)
               {
                  case Hero.§_-17§:
                  case Hero.§_-JL§:
                     if(param1[1] != Game.selfId)
                     {
                        break;
                     }
                     _loc4_ = (GameMap.instance as §_-r1t§).§_-s2t§;
                     _loc3_.position = _loc4_[int(Math.random() * _loc4_.length)];
                     break;
                  case Hero.§_-114§:
                     if(param1[1] != Game.selfId)
                     {
                        break;
                     }
                     _loc4_ = (GameMap.instance as §_-r1t§).§_-E2f§;
                     _loc3_.position = _loc4_[int(Math.random() * _loc4_.length)];
               }
               _loc3_.sendLocation();
               if(param1[1] != Game.selfId)
               {
                  break;
               }
               (_loc3_.game as §_-b1U§).§_-P25§();
               SquirrelGame.instance.camera.enabled = true;
               _loc3_.§_-l2U§.add(new §_-bM§(§_-4P§,§_-bM§.§_-t2G§,§_-V1W§));
               _loc3_.§_-l2U§.add(new §_-bM§(§_-Cj§,§_-bM§.§_-t2G§,0));
               _loc3_.§_-l2U§.add(new §_-bM§(§_-p1i§,§_-bM§.§_-t2G§,0));
               _loc3_.§_-l2U§.add(new §_-bM§(§_-sS§,§_-bM§.§_-t2G§,0));
               _loc3_.§_-l2U§.add(new §_-bM§(§_-UT§,§_-bM§.§_-t2G§,0));
               _loc3_.game.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-4P§));
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-B2p§(param1:Vector.<b2Vec2>) : Boolean
      {
         return param1.length + GameMap.instance.§_-c2O§.length != 0;
      }
      
      override public function §_-B1q§(param1:Array, param2:Boolean = true) : void
      {
      }
      
      override protected function §_-I19§() : void
      {
         var _loc1_:Hero = null;
         this.§_-83O§ = [];
         this.§_-63J§ = [];
         this.§_-pK§ = {};
         for each(_loc1_ in this.players)
         {
            _loc1_.team = Hero.§_-JL§;
         }
      }
      
      private function §_-u2t§(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Hero = null;
         this.§_-83O§ = param1 ? param1.concat() : [];
         this.§_-63J§ = param2 ? param2.concat() : [];
         this.§_-pK§ = {};
         for each(_loc3_ in this.§_-83O§)
         {
            this.§_-pK§[_loc3_] = Hero.§_-17§;
         }
         for each(_loc4_ in this.§_-63J§)
         {
            this.§_-pK§[_loc4_] = Hero.§_-114§;
         }
         for each(_loc5_ in this.players)
         {
            _loc5_.team = this.§_-pK§[_loc5_.id];
         }
      }
   }
}

