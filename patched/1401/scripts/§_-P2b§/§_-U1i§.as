package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-b2w§;
   import flash.display.MovieClip;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-U1i§ extends §_-H2N§
   {
      
      private static const §_-I1P§:Number = 3.3;
      
      private static const §_-A2i§:Number = 2.4;
      
      private static const §_-c1F§:Number = 4.5;
      
      private static const §_-vt§:Number = 3.9;
      
      private static var §_-m2o§:Object = {};
      
      private var squirrels:Array = [];
      
      private var §_-v1H§:Object = {};
      
      private var §_-a1S§:Array = [];
      
      private var §_-r2Z§:§_-b2w§;
      
      private var view:MovieClip;
      
      public function §_-U1i§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "banshee_magic";
         this.§_-r2Z§ = new §_-b2w§(0);
      }
      
      override public function get activeTime() : Number
      {
         return §_-vt§;
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
         this.§_-r24§(param1);
         this.§_-R8§();
      }
      
      override public function dispose() : void
      {
         this.§_-v2L§();
         super.dispose();
      }
      
      override protected function activate() : void
      {
         var _loc1_:Hero = null;
         if(§_-g1M§)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         if(this.hero.behaviourController.getState(§_-b2w§) == null)
         {
            this.hero.behaviourController.§_-gz§(this.§_-r2Z§);
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
               if(!(_loc1_.isSquirrel && _loc1_.perkController.§_-e4§(this.§_-i2D§) != -1))
               {
                  this.squirrels.push(_loc1_);
               }
            }
         }
      }
      
      override protected function deactivate() : void
      {
         this.§_-v2L§();
         super.deactivate();
         if(§_-g1M§)
         {
            return;
         }
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.changeView();
         if(this.hero.behaviourController.getState(§_-b2w§) != null)
         {
            this.hero.behaviourController.removeState(this.§_-r2Z§);
         }
         this.view = null;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-Q1g§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-i2D§ || this.hero.id != param1[1])
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
                  this.§_-l1S§(_loc2_.id);
                  return;
               }
               this.§_-v1H§[_loc2_.id] = §_-vt§;
               _loc2_.runSpeed = §_-m2o§[_loc2_.id] = _loc2_.runSpeed * 0.4;
               this.§_-7W§(_loc2_);
               this.§_-a1S§.push(this.hero.runSpeed * 0.3);
               this.hero.runSpeed += this.hero.runSpeed * 0.3;
               this.§_-7W§(this.hero);
               break;
            case §_-S2I§.§_-82J§:
               super.§_-o2C§(param1);
               _loc3_ = param1[0];
               for each(_loc4_ in _loc3_)
               {
                  this.§_-l1S§(_loc4_);
               }
               break;
            case §_-S2I§.§_-Vs§:
               super.§_-o2C§(param1);
               if(param1[0] == 1)
               {
                  return;
               }
               this.§_-l1S§(param1[1]);
               break;
            case §_-S2I§.§_-F2m§:
               super.§_-o2C§(param1);
               this.§_-l1S§(param1[0]);
               break;
            case §_-S2I§.§_-R28§:
               super.§_-o2C§(param1);
               this.§_-l1S§(param1[0]);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-l1S§(param1:int) : void
      {
         §_-m2o§[param1] = false;
         if(!(param1 in this.§_-v1H§))
         {
            return;
         }
         delete this.§_-v1H§[param1];
         if(§_-g1M§)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.runSpeed /= 0.4;
         this.§_-7W§(_loc2_);
         if(this.§_-a1S§.length != 0)
         {
            this.hero.runSpeed -= this.§_-a1S§.pop();
         }
         this.§_-7W§(this.hero);
      }
      
      private function §_-R8§() : void
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
            else if(!(Boolean(§_-m2o§[_loc2_.id]) || Boolean(_loc2_.shaman) || _loc2_.isDead))
            {
               _loc3_ = this.hero.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() <= §_-c1F§)
               {
                  this.squirrels.splice(_loc1_,1);
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc2_.id,1);
               }
            }
         }
      }
      
      private function §_-r24§(param1:Number = 0) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.§_-v1H§)
         {
            this.§_-v1H§[_loc2_] -= param1;
            if(this.§_-v1H§[_loc2_] <= 0)
            {
               Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc2_,0);
            }
         }
      }
      
      private function §_-v2L§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-v1H§)
         {
            this.§_-l1S§(int(_loc1_));
         }
         this.squirrels = [];
         this.§_-v1H§ = {};
         §_-m2o§ = {};
      }
      
      private function §_-7W§(param1:Hero) : void
      {
         var _loc2_:b2Vec2 = param1.body.GetLinearVelocity();
         _loc2_.x = Math.max(-§_-I1P§,Math.min(§_-I1P§,_loc2_.x));
         _loc2_.y = Math.max(-§_-A2i§,Math.min(§_-A2i§,_loc2_.y));
         param1.body.SetLinearVelocity(_loc2_);
      }
   }
}

