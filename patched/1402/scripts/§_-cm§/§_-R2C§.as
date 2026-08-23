package §_-cm§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-X2V§.CastEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-g16§.§_-713§;
   import §_-g16§.§_-CM§;
   import §_-g16§.§_-L1n§;
   import §_-g16§.§_-j1C§;
   import §_-g16§.§_-w3§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import §_-l2u§.§_-Rp§;
   import flash.utils.Dictionary;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-v1N§;
   import game.mainGame.entity.§_-xn§;
   import views.§_-Y2g§;
   
   public class §_-R2C§ extends §_-Rp§
   {
      
      private static const §_-t5§:Number = 10;
      
      private static const §_-z2N§:int = 10;
      
      private var §_-qt§:Dictionary = new Dictionary();
      
      private var §_-r2q§:§_-Y2g§ = null;
      
      public function §_-R2C§()
      {
         super();
         this.§_-71Y§ = §_-V1t§;
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         get(param1).addEventListener(SquirrelEvent.§_-E25§,this.§_-l2l§,false,0,true);
      }
      
      override public function §_-V25§() : void
      {
      }
      
      override public function place() : void
      {
         var _loc5_:Hero = null;
         var _loc1_:Array = GameMap.instance.get(§_-Y2n§);
         var _loc2_:Array = GameMap.instance.get(§_-Jb§);
         if(_loc1_.length == 0 || _loc2_.length == 0)
         {
            super.place();
            return;
         }
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         for each(_loc5_ in this.players)
         {
            if(!(_loc5_.shaman || !(_loc5_ is §_-V1t§)))
            {
               if(_loc5_.team == Hero.§_-l1B§)
               {
                  _loc5_.position = §_-xn§(_loc1_[_loc3_++ % _loc1_.length]).position;
               }
               else if(_loc5_.team == Hero.§_-i1Y§)
               {
                  _loc5_.position = §_-xn§(_loc2_[_loc4_++ % _loc2_.length]).position;
               }
            }
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-wT§(param1);
         this.§_-W2W§();
      }
      
      override public function dispose() : void
      {
         this.§_-bV§();
         super.dispose();
      }
      
      override public function set selfHeroId(param1:int) : void
      {
         super.selfHeroId = param1;
         if(this.self)
         {
            this.§_-r2K§();
         }
      }
      
      override public function §_-y1S§() : void
      {
         this.§_-bV§();
      }
      
      public function §_-r2K§() : void
      {
         var _loc1_:§_-V1t§ = Hero.self as §_-V1t§;
         if(!_loc1_ || !§_-E1v§.cast)
         {
            return;
         }
         §_-E1v§.§_-526§();
         this.§_-g1v§(_loc1_);
         §_-E1v§.cast.§_-L1R§ = 0;
         §_-E1v§.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-w3§));
      }
      
      public function §_-r1Q§(param1:§_-V1t§) : void
      {
         var _loc3_:Vector.<b2Vec2> = null;
         if(!param1 || !param1.isDead)
         {
            return;
         }
         if(this.§_-r2q§)
         {
            this.§_-r2q§.hide();
         }
         param1.respawn(Hero.§_-629§);
         var _loc2_:§_-Q22§ = GameMap.instance as §_-Q22§;
         if(_loc2_)
         {
            _loc3_ = param1.team == Hero.§_-i1Y§ ? _loc2_.§_-nM§ : _loc2_.§_-839§;
            if(Boolean(_loc3_) && _loc3_.length > 0)
            {
               param1.position = _loc3_[int(Math.random() * _loc3_.length)];
            }
         }
         param1.heroView.alpha = 1;
         param1.heroView.visible = true;
         param1.show();
         if(param1 == Hero.self)
         {
            param1.sendLocation();
            SquirrelGame.instance.camera.enabled = true;
            this.§_-g1v§(param1);
            param1.game.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-w3§));
         }
      }
      
      private function §_-g1v§(param1:§_-V1t§) : void
      {
         param1.§_-h1z§.add(new §_-v1N§(§_-w3§,§_-v1N§.§_-W29§,§_-z2N§));
         param1.§_-h1z§.add(new §_-v1N§(§_-713§,§_-v1N§.§_-W29§,0));
         param1.§_-h1z§.add(new §_-v1N§(§_-CM§,§_-v1N§.§_-W29§,0));
         param1.§_-h1z§.add(new §_-v1N§(§_-L1n§,§_-v1N§.§_-W29§,0));
         param1.§_-h1z§.add(new §_-v1N§(§_-j1C§,§_-v1N§.§_-W29§,0));
      }
      
      private function §_-l2l§(param1:SquirrelEvent) : void
      {
         var _loc2_:§_-V1t§ = param1.player as §_-V1t§;
         if(!_loc2_ || _loc2_.isHare || _loc2_.isDragon || _loc2_.§_-Ha§)
         {
            return;
         }
         this.§_-qt§[String(_loc2_.id)] = §_-t5§;
         if(_loc2_.id == this.selfHeroId)
         {
            SquirrelGame.instance.camera.enabled = false;
         }
      }
      
      private function §_-wT§(param1:Number) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.§_-qt§)
         {
            this.§_-qt§[_loc2_] = Number(this.§_-qt§[_loc2_]) - param1;
            if(Number(this.§_-qt§[_loc2_]) <= 0)
            {
               delete this.§_-qt§[_loc2_];
               this.§_-r1Q§(get(int(_loc2_)) as §_-V1t§);
            }
         }
      }
      
      private function §_-W2W§() : void
      {
         var _loc1_:String = String(this.selfHeroId);
         if(!(_loc1_ in this.§_-qt§))
         {
            if(this.§_-r2q§)
            {
               this.§_-r2q§.hide();
            }
            return;
         }
         var _loc2_:Number = Number(this.§_-qt§[_loc1_]);
         if(_loc2_ <= 0)
         {
            this.§_-A9§().hide();
            return;
         }
         this.§_-A9§().§_-l21§(Math.min(9,Math.max(1,Math.ceil(_loc2_))));
      }
      
      private function §_-A9§() : §_-Y2g§
      {
         if(!this.§_-r2q§)
         {
            this.§_-r2q§ = new §_-Y2g§();
            Game.§_-q1L§.addChild(this.§_-r2q§);
         }
         return this.§_-r2q§;
      }
      
      private function §_-bV§() : void
      {
         this.§_-J8§();
         if(!this.§_-r2q§)
         {
            return;
         }
         if(Boolean(Game.§_-q1L§) && Game.§_-q1L§.contains(this.§_-r2q§))
         {
            Game.§_-q1L§.removeChild(this.§_-r2q§);
         }
         this.§_-r2q§ = null;
      }
      
      private function §_-J8§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-qt§)
         {
            delete this.§_-qt§[_loc1_];
         }
         if(this.§_-r2q§)
         {
            this.§_-r2q§.hide();
         }
      }
   }
}

