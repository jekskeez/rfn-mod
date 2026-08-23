package §_-P2b§
{
   import §_-33r§.§_-Ah§;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   import starling.filters.ColorMatrixFilter;
   
   public class §_-qe§ extends §_-H2N§
   {
      
      private static var _enabled:int = 0;
      
      public function §_-qe§(param1:Hero)
      {
         super(param1);
      }
      
      private static function §_-939§() : ColorMatrixFilter
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter();
         _loc1_.§_-K2N§(-0.6);
         _loc1_.§_-X2F§(-0.15);
         return _loc1_;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         _enabled = 0;
         if(!SquirrelCollection.instance || !GameMap.instance)
         {
            return;
         }
         SquirrelCollection.instance.filters = [];
         GameMap.instance.filters = [];
      }
      
      override public function get json() : String
      {
         var _loc2_:Hero = null;
         if(this.active)
         {
            return "";
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(_loc2_.isDead || _loc2_.inHollow || _loc2_.shaman || _loc2_.isHare || _loc2_.isDragon))
            {
               _loc1_.push(_loc2_.id);
            }
         }
         return JSON.stringify(_loc1_);
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.enabled;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.enabled = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.enabled = false;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
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
                  _loc2_ = param1[5];
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     this.hero.game.squirrels.get(_loc2_[_loc3_]).behaviourController.§_-gz§(new §_-Ah§(this.activeTime,0.15));
                     _loc3_++;
                  }
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function set enabled(param1:Boolean) : void
      {
         var _loc2_:Boolean = this.enabled;
         _enabled += param1 ? 1 : -1;
         if(_loc2_ == this.enabled)
         {
            return;
         }
         if(!SquirrelCollection.instance || !GameMap.instance)
         {
            return;
         }
         SquirrelCollection.instance.filters = this.enabled ? [§_-939§()] : [];
         GameMap.instance.filters = this.enabled ? [§_-939§()] : [];
         if(this.enabled)
         {
            GameSounds.play("PerkMysticSuccessor");
         }
      }
      
      private function get enabled() : Boolean
      {
         return _enabled > 0;
      }
   }
}

