package §_-T1r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8I§.CastEvent;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-Rj§.§_-W28§;
   import §_-d11§.§_-4P§;
   import §_-d11§.§_-Cj§;
   import §_-d11§.§_-UT§;
   import §_-d11§.§_-p1i§;
   import §_-d11§.§_-sS§;
   import flash.utils.Dictionary;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-bM§;
   import game.mainGame.entity.§_-63Q§;
   import views.§_-W15§;
   
   public class §_-b2M§ extends §_-W28§
   {
      
      private static const §_-S12§:Number = 10;
      
      private static const §_-V1W§:int = 10;
      
      private var §_-sq§:Dictionary = new Dictionary();
      
      private var §_-u1e§:§_-W15§ = null;
      
      public function §_-b2M§()
      {
         super();
         this.§_-Y1k§ = §_-i1L§;
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         get(param1).addEventListener(SquirrelEvent.§_-z1B§,this.§_-Z1V§,false,0,true);
      }
      
      override public function §_-e1I§() : void
      {
      }
      
      override public function place() : void
      {
         var _loc5_:Hero = null;
         var _loc1_:Array = GameMap.instance.get(§_-S18§);
         var _loc2_:Array = GameMap.instance.get(§_-T24§);
         if(_loc1_.length == 0 || _loc2_.length == 0)
         {
            super.place();
            return;
         }
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         for each(_loc5_ in this.players)
         {
            if(!(_loc5_.shaman || !(_loc5_ is §_-i1L§)))
            {
               if(_loc5_.team == Hero.§_-17§)
               {
                  _loc5_.position = §_-63Q§(_loc1_[_loc3_++ % _loc1_.length]).position;
               }
               else if(_loc5_.team == Hero.§_-114§)
               {
                  _loc5_.position = §_-63Q§(_loc2_[_loc4_++ % _loc2_.length]).position;
               }
            }
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-mE§(param1);
         this.§_-212§();
      }
      
      override public function dispose() : void
      {
         this.§_-v1F§();
         super.dispose();
      }
      
      override public function set selfHeroId(param1:int) : void
      {
         super.selfHeroId = param1;
         if(this.self)
         {
            this.§_-lh§();
         }
      }
      
      override public function §_-z2l§() : void
      {
         this.§_-v1F§();
      }
      
      public function §_-lh§() : void
      {
         var _loc1_:§_-i1L§ = Hero.self as §_-i1L§;
         if(!_loc1_ || !§_-l26§.cast)
         {
            return;
         }
         §_-l26§.§_-91L§();
         this.§_-S1B§(_loc1_);
         §_-l26§.cast.§_-J1L§ = 0;
         §_-l26§.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-4P§));
      }
      
      public function §_-5Y§(param1:§_-i1L§) : void
      {
         var _loc3_:Vector.<b2Vec2> = null;
         if(!param1 || !param1.isDead)
         {
            return;
         }
         if(this.§_-u1e§)
         {
            this.§_-u1e§.hide();
         }
         param1.respawn(Hero.§_-F1P§);
         var _loc2_:§_-p13§ = GameMap.instance as §_-p13§;
         if(_loc2_)
         {
            _loc3_ = param1.team == Hero.§_-114§ ? _loc2_.§_-E2f§ : _loc2_.§_-s2t§;
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
            this.§_-S1B§(param1);
            param1.game.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-4P§));
         }
      }
      
      private function §_-S1B§(param1:§_-i1L§) : void
      {
         param1.§_-l2U§.add(new §_-bM§(§_-4P§,§_-bM§.§_-t2G§,§_-V1W§));
         param1.§_-l2U§.add(new §_-bM§(§_-Cj§,§_-bM§.§_-t2G§,0));
         param1.§_-l2U§.add(new §_-bM§(§_-p1i§,§_-bM§.§_-t2G§,0));
         param1.§_-l2U§.add(new §_-bM§(§_-sS§,§_-bM§.§_-t2G§,0));
         param1.§_-l2U§.add(new §_-bM§(§_-UT§,§_-bM§.§_-t2G§,0));
      }
      
      private function §_-Z1V§(param1:SquirrelEvent) : void
      {
         var _loc2_:§_-i1L§ = param1.player as §_-i1L§;
         if(!_loc2_ || _loc2_.isHare || _loc2_.isDragon || _loc2_.§_-la§)
         {
            return;
         }
         this.§_-sq§[String(_loc2_.id)] = §_-S12§;
         if(_loc2_.id == this.selfHeroId)
         {
            SquirrelGame.instance.camera.enabled = false;
         }
      }
      
      private function §_-mE§(param1:Number) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.§_-sq§)
         {
            this.§_-sq§[_loc2_] = Number(this.§_-sq§[_loc2_]) - param1;
            if(Number(this.§_-sq§[_loc2_]) <= 0)
            {
               delete this.§_-sq§[_loc2_];
               this.§_-5Y§(get(int(_loc2_)) as §_-i1L§);
            }
         }
      }
      
      private function §_-212§() : void
      {
         var _loc1_:String = String(this.selfHeroId);
         if(!(_loc1_ in this.§_-sq§))
         {
            if(this.§_-u1e§)
            {
               this.§_-u1e§.hide();
            }
            return;
         }
         var _loc2_:Number = Number(this.§_-sq§[_loc1_]);
         if(_loc2_ <= 0)
         {
            this.§_-l1X§().hide();
            return;
         }
         this.§_-l1X§().§_-cO§(Math.min(9,Math.max(1,Math.ceil(_loc2_))));
      }
      
      private function §_-l1X§() : §_-W15§
      {
         if(!this.§_-u1e§)
         {
            this.§_-u1e§ = new §_-W15§();
            Game.§_-d2t§.addChild(this.§_-u1e§);
         }
         return this.§_-u1e§;
      }
      
      private function §_-v1F§() : void
      {
         this.§_-E2D§();
         if(!this.§_-u1e§)
         {
            return;
         }
         if(Boolean(Game.§_-d2t§) && Game.§_-d2t§.contains(this.§_-u1e§))
         {
            Game.§_-d2t§.removeChild(this.§_-u1e§);
         }
         this.§_-u1e§ = null;
      }
      
      private function §_-E2D§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-sq§)
         {
            delete this.§_-sq§[_loc1_];
         }
         if(this.§_-u1e§)
         {
            this.§_-u1e§.hide();
         }
      }
   }
}

