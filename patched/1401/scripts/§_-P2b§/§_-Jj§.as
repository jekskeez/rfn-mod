package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-V2Z§;
   import §_-33r§.§_-hu§;
   import §_-I10§.§_-g2W§;
   import §_-T2y§.§_-92z§;
   import flash.utils.Dictionary;
   import protocol.§_-S2I§;
   
   public class §_-Jj§ extends §_-H2N§
   {
      
      private static const §_-c1F§:Number = 10;
      
      private static const §_-B27§:int = 2;
      
      private static const §_-A33§:int = 30;
      
      private var §_-62w§:Dictionary = null;
      
      private var §_-u2a§:Boolean = false;
      
      public function §_-Jj§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "perkScarecrowFire";
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
            if(!this.§_-qu§(_loc3_))
            {
               _loc4_ = this.hero.position.Copy();
               _loc4_.Subtract(_loc3_.position);
               if(!(_loc4_.Length() > §_-c1F§ || _loc2_ > §_-B27§))
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
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Hero = null;
         var _loc5_:§_-hu§ = null;
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
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if(param1[2] == §_-S2I§.§_-EY§)
               {
                  this.§_-62w§ = new Dictionary();
                  for each(_loc2_ in param1[5])
                  {
                     _loc3_ = _loc2_ == this.hero.id;
                     _loc4_ = _loc3_ ? this.hero : this.hero.game.squirrels.get(_loc2_);
                     if(!(!_loc4_ || _loc4_.isDead))
                     {
                        _loc5_ = new §_-hu§(_loc3_ && this.§_-u2a§ ? 0 : §_-A33§,_loc3_);
                        this.§_-62w§[_loc4_] = _loc5_;
                        _loc4_.behaviourController.§_-gz§(_loc5_);
                     }
                  }
                  this.active = true;
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         if(!this.hero || !this.hero.player || !("worn_packages" in this.hero.player))
         {
            return;
         }
         this.§_-u2a§ = this.hero.player["worn_packages"].indexOf(§_-g2W§.§_-bo§) != -1;
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return param1.isSelf || param1.isDead || param1.inHollow || param1.shaman || param1.immortal || param1.armadillo || param1.perkController.§_-e4§(this.§_-i2D§) != -1 || param1.behaviourController.getState(§_-V2Z§) != null || param1.behaviourController.getState(§_-hu§) != null;
      }
      
      override public function get available() : Boolean
      {
         return super.available && §_-92z§.mode != §_-q1p§.§_-w1Y§ && §_-92z§.location != §_-q1p§.§_-k2B§;
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:§_-hu§ = null;
         super.deactivate();
         if(!this.§_-62w§)
         {
            return;
         }
         for(_loc1_ in this.§_-62w§)
         {
            _loc2_ = this.§_-62w§[_loc1_];
            if(!(!_loc1_ || !_loc2_))
            {
               _loc1_.behaviourController.removeState(_loc2_);
            }
         }
         this.§_-62w§ = null;
      }
   }
}

