package §_-j2E§
{
   import §_-Cc§.§_-bj§;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   import starling.filters.ColorMatrixFilter;
   
   public class §_-O1E§ extends §_-92f§
   {
      
      private static var _enabled:int = 0;
      
      public function §_-O1E§(param1:Hero)
      {
         super(param1);
      }
      
      private static function §_-yr§() : ColorMatrixFilter
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter();
         _loc1_.§_-M2U§(-0.6);
         _loc1_.§_-9I§(-0.15);
         return _loc1_;
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
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
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
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
                  _loc2_ = param1[5];
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     this.hero.game.squirrels.get(_loc2_[_loc3_]).behaviourController.§_-W10§(new §_-bj§(this.activeTime,0.15));
                     _loc3_++;
                  }
               }
               break;
            default:
               super.§_-x2f§(param1);
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
         SquirrelCollection.instance.filters = this.enabled ? [§_-yr§()] : [];
         GameMap.instance.filters = this.enabled ? [§_-yr§()] : [];
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

