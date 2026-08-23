package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-M16§.§_-6Q§;
   import §_-TK§.§_-f1u§;
   import flash.events.Event;
   import protocol.§_-s2l§;
   
   public class §_-V1A§ extends §_-l2A§
   {
      
      public static const §_-1V§:int = 15;
      
      public static const §_-Bs§:Number = 500;
      
      protected var §_-1§:Array = [];
      
      protected var §_-c19§:§_-f1u§ = null;
      
      protected var §_-j8§:§_-f1u§ = null;
      
      public function §_-V1A§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-32l§ == 0 ? 20 : 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.§_-c19§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.§_-c19§)
         {
            return;
         }
         if(this.§_-1§.length == 0)
         {
            this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-c19§);
            this.§_-c19§ = null;
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(this.§_-1§[0]);
         if(_loc2_.isDead || _loc2_.inHollow)
         {
            this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-c19§);
            this.§_-c19§ = null;
            this.§_-1§ = [];
            return;
         }
         var _loc3_:b2Vec2 = new b2Vec2(this.§_-c19§.x,this.§_-c19§.y);
         _loc3_.Subtract(new b2Vec2(_loc2_.x,_loc2_.y));
         _loc3_.NegativeSelf();
         if(_loc3_.Length() > §_-Bs§ * param1)
         {
            this.§_-c19§.rotation = Math.atan2(_loc3_.y,_loc3_.x) * Game.R2D;
            _loc3_.Normalize();
            this.§_-c19§.x += §_-Bs§ * param1 * _loc3_.x;
            this.§_-c19§.y += §_-Bs§ * param1 * _loc3_.y;
            return;
         }
         this.§_-d2x§();
         this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-c19§);
         this.§_-c19§ = null;
         this.§_-1§ = [];
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         if(this.§_-c19§)
         {
            this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-c19§);
         }
         this.§_-c19§ = null;
         this.§_-1§ = [];
         if(this.§_-j8§)
         {
            this.§_-j8§.stop();
            this.§_-j8§.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
            this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-j8§);
            this.§_-j8§ = null;
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
               if(this.§_-3M§(_loc5_))
               {
                  _loc6_ = _loc5_.position.Copy();
                  _loc6_.Subtract(_loc2_.position);
                  if(_loc6_.Length() <= §_-1V§)
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
         if(this.§_-c19§)
         {
            this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-c19§);
         }
         this.§_-c19§ = new §_-f1u§(new AmurShotView());
         this.§_-c19§.loop = true;
         this.§_-c19§.play();
         this.§_-c19§.x = this.hero.x;
         this.§_-c19§.y = this.hero.y;
         this.hero.game.map.§_-h2T§.§_-J2J§(this.§_-c19§);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-s2l§.§_-x2Y§)
               {
                  this.§_-1§ = [];
                  this.§_-1§.push(param1[4]);
                  if(param1[5]["id"] != 0)
                  {
                     this.§_-1§.push(param1[5]["id"]);
                  }
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
         }
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.isDead && !param1.inHollow;
      }
      
      protected function §_-d2x§() : void
      {
         var _loc2_:Hero = null;
         if(this.§_-1§.length < 2)
         {
            if(this.§_-1§.length == 1)
            {
               _loc2_ = this.hero.game.squirrels.get(this.§_-1§[0]);
               this.§_-j8§ = new §_-f1u§(new AmurHitView());
               this.§_-j8§.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
               this.§_-j8§.play();
               this.§_-j8§.x = _loc2_.x;
               this.§_-j8§.y = _loc2_.y + 20;
               this.hero.game.map.§_-h2T§.§_-J2J§(this.§_-j8§);
            }
            return;
         }
         var _loc1_:§_-6Q§ = new §_-6Q§();
         _loc1_.damping = 0;
         _loc1_.frequency = 5;
         _loc1_.hero0 = this.hero.game.squirrels.get(this.§_-1§[0]);
         _loc1_.hero1 = this.hero.game.squirrels.get(this.§_-1§[1]);
         this.hero.game.map.add(_loc1_);
         _loc1_.build(this.hero.game.world);
      }
      
      private function §_-52w§(param1:Event) : void
      {
         if(!this.hero || !this.hero.game || !this.hero.game.map)
         {
            return;
         }
         if(!this.§_-j8§)
         {
            return;
         }
         if(this.§_-j8§.currentFrame < this.§_-j8§.totalFrames - 1)
         {
            return;
         }
         this.§_-j8§.stop();
         this.§_-j8§.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.hero.game.map.§_-h2T§.removeChildStarling(this.§_-j8§);
         this.§_-j8§ = null;
      }
   }
}

