package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-73t§;
   import §_-Cc§.§_-x1W§;
   import §_-X1k§.§_-P2x§;
   import §_-c2C§.§_-u24§;
   import flash.utils.Dictionary;
   import protocol.§_-s2l§;
   
   public class §_-r1N§ extends §_-92f§
   {
      
      private static const §_-A2L§:Number = 10;
      
      private static const §_-f2i§:int = 2;
      
      private static const §_-LE§:int = 30;
      
      private var §_-R1t§:Dictionary = null;
      
      private var §_-HS§:Boolean = false;
      
      public function §_-r1N§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "perkScarecrowFire";
      }
      
      override public function get json() : String
      {
         var _loc3_:Hero = null;
         var _loc4_:b2Vec2 = null;
         if(this.active)
         {
            return "";
         }
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(!this.§_-3M§(_loc3_))
            {
               _loc4_ = this.hero.position.Copy();
               _loc4_.Subtract(_loc3_.position);
               if(!(_loc4_.Length() > §_-A2L§ || _loc2_ > §_-f2i§))
               {
                  _loc1_.push(_loc3_.id);
                  _loc2_++;
               }
            }
         }
         _loc1_.push(this.hero.id);
         return JSON.stringify(_loc1_);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.removeBuff(this.buff);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Hero = null;
         var _loc5_:§_-73t§ = null;
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
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if(param1[2] == §_-s2l§.§_-x2Y§)
               {
                  this.§_-R1t§ = new Dictionary();
                  for each(_loc2_ in param1[5])
                  {
                     _loc3_ = _loc2_ == this.hero.id;
                     _loc4_ = _loc3_ ? this.hero : this.hero.game.squirrels.get(_loc2_);
                     if(!(!_loc4_ || _loc4_.isDead))
                     {
                        _loc5_ = new §_-73t§(_loc3_ && this.§_-HS§ ? 0 : §_-LE§,_loc3_);
                        this.§_-R1t§[_loc4_] = _loc5_;
                        _loc4_.behaviourController.§_-W10§(_loc5_);
                     }
                  }
                  this.active = true;
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         if(!this.hero || !this.hero.player || !("worn_packages" in this.hero.player))
         {
            return;
         }
         this.§_-HS§ = this.hero.player["worn_packages"].indexOf(§_-P2x§.§_-FC§) != -1;
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return param1.isSelf || param1.isDead || param1.inHollow || param1.shaman || param1.immortal || param1.armadillo || param1.perkController.§_-S1Q§(this.§_-T2a§) != -1 || param1.behaviourController.getState(§_-x1W§) != null || param1.behaviourController.getState(§_-73t§) != null;
      }
      
      override public function get available() : Boolean
      {
         return super.available && §_-u24§.mode != §_-at§.§_-F15§ && §_-u24§.location != §_-at§.§_-G1K§;
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:§_-73t§ = null;
         super.deactivate();
         if(!this.§_-R1t§)
         {
            return;
         }
         for(_loc1_ in this.§_-R1t§)
         {
            _loc2_ = this.§_-R1t§[_loc1_];
            if(!(!_loc1_ || !_loc2_))
            {
               _loc1_.behaviourController.removeState(_loc2_);
            }
         }
         this.§_-R1t§ = null;
      }
   }
}

