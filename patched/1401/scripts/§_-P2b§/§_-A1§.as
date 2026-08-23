package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-d2d§;
   import §_-Rn§.§_-dS§;
   import flash.events.Event;
   import protocol.§_-S2I§;
   
   public class §_-A1§ extends §_-71e§
   {
      
      public static const §_-eO§:int = 15;
      
      public static const §_-01b§:Number = 500;
      
      protected var §_-IJ§:Array = [];
      
      protected var §_-Ol§:§_-d2d§ = null;
      
      protected var §_-b3§:§_-d2d§ = null;
      
      public function §_-A1§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-j2Y§ == 0 ? 20 : 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.§_-Ol§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.§_-Ol§)
         {
            return;
         }
         if(this.§_-IJ§.length == 0)
         {
            this.hero.game.map.§_-G12§.removeChildStarling(this.§_-Ol§);
            this.§_-Ol§ = null;
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(this.§_-IJ§[0]);
         if(_loc2_.isDead || _loc2_.inHollow)
         {
            this.hero.game.map.§_-G12§.removeChildStarling(this.§_-Ol§);
            this.§_-Ol§ = null;
            this.§_-IJ§ = [];
            return;
         }
         var _loc3_:b2Vec2 = new b2Vec2(this.§_-Ol§.x,this.§_-Ol§.y);
         _loc3_.Subtract(new b2Vec2(_loc2_.x,_loc2_.y));
         _loc3_.NegativeSelf();
         if(_loc3_.Length() > §_-01b§ * param1)
         {
            this.§_-Ol§.rotation = Math.atan2(_loc3_.y,_loc3_.x) * Game.R2D;
            _loc3_.Normalize();
            this.§_-Ol§.x += §_-01b§ * param1 * _loc3_.x;
            this.§_-Ol§.y += §_-01b§ * param1 * _loc3_.y;
            return;
         }
         this.§_-w6§();
         this.hero.game.map.§_-G12§.removeChildStarling(this.§_-Ol§);
         this.§_-Ol§ = null;
         this.§_-IJ§ = [];
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         if(this.§_-Ol§)
         {
            this.hero.game.map.§_-G12§.removeChildStarling(this.§_-Ol§);
         }
         this.§_-Ol§ = null;
         this.§_-IJ§ = [];
         if(this.§_-b3§)
         {
            this.§_-b3§.stop();
            this.§_-b3§.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
            this.hero.game.map.§_-G12§.removeChildStarling(this.§_-b3§);
            this.§_-b3§ = null;
         }
      }
      
      override public function get json() : String
      {
         var _loc5_:Hero = null;
         var _loc6_:b2Vec2 = null;
         var _loc1_:Object = this.hero.game.squirrels.players;
         var _loc2_:Hero = this.hero.game.squirrels.get(this.target);
         var _loc3_:int = 0;
         var _loc4_:Number = 0;
         for each(_loc5_ in _loc1_)
         {
            if(_loc5_.id != this.target)
            {
               if(this.§_-qu§(_loc5_))
               {
                  _loc6_ = _loc5_.position.Copy();
                  _loc6_.Subtract(_loc2_.position);
                  if(_loc6_.Length() <= §_-eO§)
                  {
                     if(!(_loc3_ != 0 && _loc6_.Length() > _loc4_))
                     {
                        _loc3_ = _loc5_.id;
                        _loc4_ = Number(_loc6_.Length());
                     }
                  }
               }
            }
         }
         return JSON.stringify({"id":_loc3_});
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-Ol§)
         {
            this.hero.game.map.§_-G12§.removeChildStarling(this.§_-Ol§);
         }
         this.§_-Ol§ = new §_-d2d§(new AmurShotView());
         this.§_-Ol§.loop = true;
         this.§_-Ol§.play();
         this.§_-Ol§.x = this.hero.x;
         this.§_-Ol§.y = this.hero.y;
         this.hero.game.map.§_-G12§.§_-83v§(this.§_-Ol§);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-S2I§.§_-EY§)
               {
                  this.§_-IJ§ = [];
                  this.§_-IJ§.push(param1[4]);
                  if(param1[5]["id"] != 0)
                  {
                     this.§_-IJ§.push(param1[5]["id"]);
                  }
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
         }
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.isDead && !param1.inHollow;
      }
      
      protected function §_-w6§() : void
      {
         var _loc2_:Hero = null;
         if(this.§_-IJ§.length < 2)
         {
            if(this.§_-IJ§.length == 1)
            {
               _loc2_ = this.hero.game.squirrels.get(this.§_-IJ§[0]);
               this.§_-b3§ = new §_-d2d§(new AmurHitView());
               this.§_-b3§.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
               this.§_-b3§.play();
               this.§_-b3§.x = _loc2_.x;
               this.§_-b3§.y = _loc2_.y + 20;
               this.hero.game.map.§_-G12§.§_-83v§(this.§_-b3§);
            }
            return;
         }
         var _loc1_:§_-dS§ = new §_-dS§();
         _loc1_.damping = 0;
         _loc1_.frequency = 5;
         _loc1_.hero0 = this.hero.game.squirrels.get(this.§_-IJ§[0]);
         _loc1_.hero1 = this.hero.game.squirrels.get(this.§_-IJ§[1]);
         this.hero.game.map.add(_loc1_);
         _loc1_.build(this.hero.game.world);
      }
      
      private function §_-r5§(param1:Event) : void
      {
         if(!this.hero || !this.hero.game || !this.hero.game.map)
         {
            return;
         }
         if(!this.§_-b3§)
         {
            return;
         }
         if(this.§_-b3§.currentFrame < this.§_-b3§.totalFrames - 1)
         {
            return;
         }
         this.§_-b3§.stop();
         this.§_-b3§.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.hero.game.map.§_-G12§.removeChildStarling(this.§_-b3§);
         this.§_-b3§ = null;
      }
   }
}

