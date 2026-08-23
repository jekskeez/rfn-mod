package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-f6§;
   import flash.display.MovieClip;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-81w§ extends §_-92f§
   {
      
      private static const §_-I2i§:Number = 3.3;
      
      private static const §_-3Z§:Number = 2.4;
      
      private static const §_-A2L§:Number = 4.5;
      
      private static const §_-Q1U§:Number = 3.9;
      
      private static var §_-NJ§:Object = {};
      
      private var squirrels:Array = [];
      
      private var §_-fN§:Object = {};
      
      private var §_-W1X§:Array = [];
      
      private var §_-ET§:§_-f6§;
      
      private var view:MovieClip;
      
      public function §_-81w§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "banshee_magic";
         this.§_-ET§ = new §_-f6§(0);
      }
      
      override public function get activeTime() : Number
      {
         return §_-Q1U§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return true;
      }
      
      override public function get startCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 8;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 35;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.active || this.hero.id != Game.selfId)
         {
            return;
         }
         this.§_-h3§(param1);
         this.§_-n1n§();
      }
      
      override public function dispose() : void
      {
         this.§_-j17§();
         super.dispose();
      }
      
      override protected function activate() : void
      {
         var _loc1_:Hero = null;
         if(§_-x2b§)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         if(this.hero.behaviourController.getState(§_-f6§) == null)
         {
            this.hero.behaviourController.§_-W10§(this.§_-ET§);
         }
         this.view = new ReaperMagicView();
         this.view.alpha = this.hero.id != Game.selfId ? 0.1 : 1;
         this.hero.changeView(this.view);
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.isSelf || _loc1_.isHare || _loc1_.isDragon || _loc1_.inHollow))
            {
               if(!(_loc1_.isSquirrel && _loc1_.perkController.§_-S1Q§(this.§_-T2a§) != -1))
               {
                  this.squirrels.push(_loc1_);
               }
            }
         }
      }
      
      override protected function deactivate() : void
      {
         this.§_-j17§();
         super.deactivate();
         if(§_-x2b§)
         {
            return;
         }
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.changeView();
         if(this.hero.behaviourController.getState(§_-f6§) != null)
         {
            this.hero.behaviourController.removeState(this.§_-ET§);
         }
         this.view = null;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-T2a§ || this.hero.id != param1[1])
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.get(param1[2]);
               if(!_loc2_)
               {
                  return;
               }
               if(param1[3] == 0 || _loc2_.shaman || _loc2_.isDead || _loc2_.inHollow)
               {
                  this.§_-cq§(_loc2_.id);
                  return;
               }
               this.§_-fN§[_loc2_.id] = §_-Q1U§;
               _loc2_.runSpeed = §_-NJ§[_loc2_.id] = _loc2_.runSpeed * 0.4;
               this.§_-Yk§(_loc2_);
               this.§_-W1X§.push(this.hero.runSpeed * 0.3);
               this.hero.runSpeed += this.hero.runSpeed * 0.3;
               this.§_-Yk§(this.hero);
               break;
            case §_-s2l§.§_-Yi§:
               super.§_-x2f§(param1);
               _loc3_ = param1[0];
               for each(_loc4_ in _loc3_)
               {
                  this.§_-cq§(_loc4_);
               }
               break;
            case §_-s2l§.§_-n1f§:
               super.§_-x2f§(param1);
               if(param1[0] == 1)
               {
                  return;
               }
               this.§_-cq§(param1[1]);
               break;
            case §_-s2l§.§_-v1r§:
               super.§_-x2f§(param1);
               this.§_-cq§(param1[0]);
               break;
            case §_-s2l§.§_-V1b§:
               super.§_-x2f§(param1);
               this.§_-cq§(param1[0]);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-cq§(param1:int) : void
      {
         §_-NJ§[param1] = false;
         if(!(param1 in this.§_-fN§))
         {
            return;
         }
         delete this.§_-fN§[param1];
         if(§_-x2b§)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.runSpeed /= 0.4;
         this.§_-Yk§(_loc2_);
         if(this.§_-W1X§.length != 0)
         {
            this.hero.runSpeed -= this.§_-W1X§.pop();
         }
         this.§_-Yk§(this.hero);
      }
      
      private function §_-n1n§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         var _loc1_:* = int(this.squirrels.length);
         while(_loc1_--)
         {
            _loc2_ = this.squirrels[_loc1_];
            if(_loc2_.inHollow)
            {
               this.squirrels.splice(_loc1_,1);
            }
            else if(!(Boolean(§_-NJ§[_loc2_.id]) || Boolean(_loc2_.shaman) || _loc2_.isDead))
            {
               _loc3_ = this.hero.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() <= §_-A2L§)
               {
                  this.squirrels.splice(_loc1_,1);
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc2_.id,1);
               }
            }
         }
      }
      
      private function §_-h3§(param1:Number = 0) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.§_-fN§)
         {
            this.§_-fN§[_loc2_] -= param1;
            if(this.§_-fN§[_loc2_] <= 0)
            {
               Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc2_,0);
            }
         }
      }
      
      private function §_-j17§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-fN§)
         {
            this.§_-cq§(int(_loc1_));
         }
         this.squirrels = [];
         this.§_-fN§ = {};
         §_-NJ§ = {};
      }
      
      private function §_-Yk§(param1:Hero) : void
      {
         var _loc2_:b2Vec2 = param1.body.GetLinearVelocity();
         _loc2_.x = Math.max(-§_-I2i§,Math.min(§_-I2i§,_loc2_.x));
         _loc2_.y = Math.max(-§_-3Z§,Math.min(§_-3Z§,_loc2_.y));
         param1.body.SetLinearVelocity(_loc2_);
      }
   }
}

