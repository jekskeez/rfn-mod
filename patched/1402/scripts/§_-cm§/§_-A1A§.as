package §_-cm§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-G2y§.ControllerHeroLocal;
   import §_-X2V§.CastEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-u24§;
   import §_-g16§.§_-713§;
   import §_-g16§.§_-CM§;
   import §_-g16§.§_-L1n§;
   import §_-g16§.§_-j1C§;
   import §_-g16§.§_-w3§;
   import §_-td§.§_-N2w§;
   import §_-y1V§.§_-B2M§;
   import chat.§_-g1j§;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-43R§;
   import game.mainGame.§_-v1N§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-A1A§ extends §_-N2w§ implements §_-43R§
   {
      
      private static const §_-z2N§:int = 10;
      
      private var §_-22A§:Array = [];
      
      private var §_-b2x§:Array = [];
      
      private var §_-c2b§:Object = {};
      
      public var achievements:§_-B2M§ = null;
      
      public function §_-A1A§()
      {
         super();
         this.§_-71Y§ = §_-V1t§;
         this.achievements = new §_-B2M§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C2w§],1);
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         switch(param1[0])
         {
            case §_-s2l§.ROUND_START:
               if(§_-u24§.§_-j2T§ != 0)
               {
                  break;
               }
               ControllerHeroLocal.§_-T16§ = true;
               SquirrelGame.instance.camera.enabled = true;
               Hero.self.§_-h1z§.add(new §_-v1N§(§_-w3§,§_-v1N§.§_-W29§,§_-z2N§));
               Hero.self.§_-h1z§.add(new §_-v1N§(§_-713§,§_-v1N§.§_-W29§,0));
               Hero.self.§_-h1z§.add(new §_-v1N§(§_-CM§,§_-v1N§.§_-W29§,0));
               Hero.self.§_-h1z§.add(new §_-v1N§(§_-L1n§,§_-v1N§.§_-W29§,0));
               Hero.self.§_-h1z§.add(new §_-v1N§(§_-j1C§,§_-v1N§.§_-W29§,0));
         }
      }
      
      public function get §_-WO§() : Array
      {
         return this.§_-22A§;
      }
      
      public function get §_-Z2D§() : Array
      {
         return this.§_-b2x§;
      }
      
      override protected function §_-g5§() : void
      {
      }
      
      override public function §_-I26§(param1:Boolean = true) : void
      {
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         var _loc2_:§_-V1t§ = get(param1) as §_-V1t§;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.team = int(this.§_-c2b§[param1]) || Hero.§_-PM§;
      }
      
      override public function remove(param1:int) : void
      {
         var _loc2_:int = 0;
         super.remove(param1);
         if(this.§_-22A§ != null)
         {
            _loc2_ = this.§_-22A§.indexOf(param1);
            if(_loc2_ != -1)
            {
               this.§_-22A§.splice(_loc2_,1);
            }
         }
         if(this.§_-b2x§ != null)
         {
            _loc2_ = this.§_-b2x§.indexOf(param1);
            if(_loc2_ != -1)
            {
               this.§_-b2x§.splice(_loc2_,1);
            }
         }
         if(param1 in this.§_-c2b§)
         {
            delete this.§_-c2b§[param1];
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.achievements.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C2w§]);
      }
      
      override public function place() : void
      {
         var _loc5_:Vector.<b2Vec2> = null;
         var _loc6_:Hero = null;
         var _loc1_:§_-P2r§ = GameMap.instance as §_-P2r§;
         var _loc2_:Vector.<b2Vec2> = _loc1_.§_-839§;
         var _loc3_:Vector.<b2Vec2> = _loc1_.§_-nM§;
         if(!this.§_-L16§(_loc2_) || !this.§_-L16§(_loc3_))
         {
            return;
         }
         var _loc4_:int = 0;
         for each(_loc6_ in this.players)
         {
            _loc5_ = GameMap.instance.§_-q2L§;
            if(_loc6_.team == Hero.§_-l1B§)
            {
               _loc5_ = _loc2_;
            }
            if(_loc6_.team == Hero.§_-i1Y§)
            {
               _loc5_ = _loc3_;
            }
            _loc6_.position = _loc5_[_loc4_ % _loc5_.length];
            _loc4_++;
         }
      }
      
      override protected function §_-43r§(param1:SquirrelEvent = null) : void
      {
         SquirrelGame.instance.camera.enabled = false;
         if(Hero.self.§_-43c§ != -1)
         {
            Connection.§_-e2T§(§_-u1O§.§_-v1r§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-b2d§,Hero.self.§_-43c§);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-v1r§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-b2d§);
         }
      }
      
      override protected function §_-uK§() : void
      {
         this.achievements.reset();
         this.§_-RB§(this.§_-22A§,this.§_-b2x§);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Hero = null;
         var _loc4_:Vector.<b2Vec2> = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-C2w§:
               this.§_-b1s§();
               this.§_-RB§(param1[0],param1[1]);
               break;
            case §_-s2l§.§_-v1r§:
               super.§_-x2f§(param1);
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
                  §_-u24§.sendMessage(param1[0],"",§_-g1j§.§_-m2Z§);
               }
               else if(get(param1[0]) as §_-V1t§ != null && (get(param1[0]) as §_-V1t§).§_-N2N§)
               {
                  §_-u24§.sendMessage(param1[0],"",§_-g1j§.§_-21C§);
               }
               if(param1[0] == Game.selfId && Boolean(param1[4]))
               {
                  §_-u24§.sendMessage(param1[4],"",§_-g1j§.§_-c2E§);
               }
               break;
            case §_-s2l§.§_-N1Y§:
               _loc3_ = get(param1[1]);
               if(!_loc3_.isDead || param1[0] == §_-s2l§.§_-Y2§)
               {
                  break;
               }
               _loc3_.respawn(1);
               switch(get(param1[1]).team)
               {
                  case Hero.§_-l1B§:
                  case Hero.§_-PM§:
                     if(param1[1] != Game.selfId)
                     {
                        break;
                     }
                     _loc4_ = (GameMap.instance as §_-P2r§).§_-839§;
                     _loc3_.position = _loc4_[int(Math.random() * _loc4_.length)];
                     break;
                  case Hero.§_-i1Y§:
                     if(param1[1] != Game.selfId)
                     {
                        break;
                     }
                     _loc4_ = (GameMap.instance as §_-P2r§).§_-nM§;
                     _loc3_.position = _loc4_[int(Math.random() * _loc4_.length)];
               }
               _loc3_.sendLocation();
               if(param1[1] != Game.selfId)
               {
                  break;
               }
               (_loc3_.game as §_-cV§).§_-2p§();
               SquirrelGame.instance.camera.enabled = true;
               _loc3_.§_-h1z§.add(new §_-v1N§(§_-w3§,§_-v1N§.§_-W29§,§_-z2N§));
               _loc3_.§_-h1z§.add(new §_-v1N§(§_-713§,§_-v1N§.§_-W29§,0));
               _loc3_.§_-h1z§.add(new §_-v1N§(§_-CM§,§_-v1N§.§_-W29§,0));
               _loc3_.§_-h1z§.add(new §_-v1N§(§_-L1n§,§_-v1N§.§_-W29§,0));
               _loc3_.§_-h1z§.add(new §_-v1N§(§_-j1C§,§_-v1N§.§_-W29§,0));
               _loc3_.game.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-w3§));
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-L16§(param1:Vector.<b2Vec2>) : Boolean
      {
         return param1.length + GameMap.instance.§_-q2L§.length != 0;
      }
      
      override public function §_-J1N§(param1:Array, param2:Boolean = true) : void
      {
      }
      
      override protected function §_-b1s§() : void
      {
         var _loc1_:Hero = null;
         this.§_-22A§ = [];
         this.§_-b2x§ = [];
         this.§_-c2b§ = {};
         for each(_loc1_ in this.players)
         {
            _loc1_.team = Hero.§_-PM§;
         }
      }
      
      private function §_-RB§(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Hero = null;
         this.§_-22A§ = param1 ? param1.concat() : [];
         this.§_-b2x§ = param2 ? param2.concat() : [];
         this.§_-c2b§ = {};
         for each(_loc3_ in this.§_-22A§)
         {
            this.§_-c2b§[_loc3_] = Hero.§_-l1B§;
         }
         for each(_loc4_ in this.§_-b2x§)
         {
            this.§_-c2b§[_loc4_] = Hero.§_-i1Y§;
         }
         for each(_loc5_ in this.players)
         {
            _loc5_.team = this.§_-c2b§[_loc5_.id];
         }
      }
   }
}

