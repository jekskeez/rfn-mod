package §_-u1f§
{
   import §_-B1O§.§_-f24§;
   import §_-B1O§.§_-o21§;
   import §_-C1l§.§_-a2§;
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-K15§;
   import §_-Rj§.§_-y1z§;
   import §_-S1D§.§_-O1M§;
   import §_-f17§.§_-t2u§;
   import game.mainGame.SquirrelGame;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-83z§ extends §_-K15§
   {
      
      private static const §_-d2w§:Number = 0.33;
      
      private static const §_-n28§:int = 9;
      
      private static const §_-c2Z§:int = 100;
      
      private static const §_-nH§:int = 5;
      
      private static const §_-m2k§:int = 3;
      
      private static const §_-G1H§:int = 3;
      
      private static const §_-GT§:int = 8;
      
      private static const §_-D2y§:int = 0;
      
      private static const §_-d20§:int = 3;
      
      private static const §_-52M§:int = 5;
      
      private var volcanoData:Array = null;
      
      private var §_-Y1i§:Boolean = false;
      
      private var §_-l1E§:Number = 0;
      
      private var views:Vector.<§_-t2u§>;
      
      private var §_-I2d§:Sprite = null;
      
      private var §_-42v§:int = 0;
      
      private var §_-G1o§:int = 0;
      
      public function §_-83z§(param1:SquirrelGame)
      {
         var _loc3_:§_-t2u§ = null;
         this.views = new Vector.<§_-t2u§>(0);
         super(param1);
         var _loc2_:int = 0;
         while(_loc2_ < §_-n28§)
         {
            _loc3_ = new §_-t2u§();
            _loc3_.x = _loc2_ * §_-c2Z§;
            _loc3_.y = §_-a9§.§_-31m§ + 8;
            _loc3_.deactivate();
            §_-83v§(_loc3_);
            this.views.push(_loc3_);
            _loc2_++;
         }
         this.§_-I2d§ = §_-a2§.§_-A3m§(new PlatformGroundWild(),§_-a9§.§_-9o§,32);
         this.§_-I2d§.y = §_-a9§.§_-31m§ + 32;
         §_-83v§(this.§_-I2d§);
         §_-01Y§.§_-c9§(this.§_-H5§);
      }
      
      override public function dispose() : void
      {
         §_-01Y§.§_-l2K§(this.§_-H5§);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc4_:Hero = null;
         var _loc5_:§_-L1H§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         super.update(param1);
         if(this.§_-l1E§ > 0)
         {
            this.§_-l1E§ = Math.max(0,this.§_-l1E§ - param1);
            return;
         }
         if(!this.§_-Y1i§ || !(this.game as §_-A32§).squirrels)
         {
            return;
         }
         var _loc2_:Array = this.§_-A3K§;
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:Boolean = false;
         for each(_loc4_ in (this.game as §_-A32§).squirrels.players)
         {
            if(!(!(_loc4_ is §_-L1H§) || _loc4_.isDead))
            {
               _loc5_ = _loc4_ as §_-L1H§;
               _loc6_ = _loc5_.position.x * Game.§_-x2P§;
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  if(_loc2_[_loc7_] * §_-c2Z§ <= _loc6_ && _loc6_ <= §_-c2Z§ + _loc2_[_loc7_] * §_-c2Z§)
                  {
                     _loc3_ = true;
                     --_loc5_.health;
                     if(_loc5_.health == 0)
                     {
                        _loc5_.§_-h2r§();
                     }
                     break;
                  }
                  _loc7_++;
               }
            }
         }
         if(_loc3_)
         {
            this.§_-l1E§ = §_-d2w§;
         }
      }
      
      override public function §_-w1B§() : void
      {
         super.§_-w1B§();
         this.volcanoData = null;
         this.§_-l1E§ = 0;
         this.§_-Y1i§ = false;
         this.§_-G1o§ = 0;
         this.§_-42v§ = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            this.views[_loc1_].deactivate();
            _loc1_++;
         }
         this.§_-Q1o§();
      }
      
      override public function §_-z2l§() : void
      {
         this.volcanoData = null;
         this.§_-l1E§ = 0;
         this.§_-Y1i§ = false;
         this.§_-G1o§ = 0;
         this.§_-42v§ = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            this.views[_loc1_].deactivate();
            _loc1_++;
         }
         super.§_-z2l§();
      }
      
      override public function §_-WH§(param1:int, param2:int = -1) : Boolean
      {
         return §_-2S§(§_-o21§) && §_-2S§(§_-f24§);
      }
      
      override public function §_-u2E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-I23§;
      }
      
      private function §_-Q1o§() : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         this.volcanoData = [];
         var _loc1_:int = (this.game as §_-A32§).§_-v1P§.minutes * 60 + (this.game as §_-A32§).§_-v1P§.seconds;
         var _loc2_:int = Math.max(1,int((_loc1_ - §_-nH§) / §_-GT§));
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < §_-n28§)
            {
               _loc4_.push(_loc5_);
               _loc5_++;
            }
            _loc6_ = [];
            _loc7_ = Math.min(§_-n28§ - 1,§_-G1H§ + _loc3_ / §_-m2k§);
            while(_loc6_.length < _loc7_)
            {
               _loc6_.push(_loc4_.splice(int(Math.random() * _loc4_.length),1));
            }
            this.volcanoData.push(_loc6_);
            _loc3_++;
         }
      }
      
      private function get §_-A3K§() : Array
      {
         if(this.volcanoData == null)
         {
            return [];
         }
         var _loc1_:int = this.§_-G1o§ / §_-GT§;
         if(this.volcanoData.length <= _loc1_)
         {
            return [];
         }
         return this.volcanoData[_loc1_];
      }
      
      private function §_-H5§() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(!(this.game as §_-A32§).§_-uo§ || (this.game as §_-A32§).§_-Z1G§ != §_-q1p§.§_-ri§ || §_-O1M§.§_-F2g§ != §_-S2I§.ROUND_START)
         {
            return;
         }
         if(this.§_-42v§ < §_-nH§)
         {
            ++this.§_-42v§;
            return;
         }
         var _loc1_:int = this.§_-G1o§ % §_-GT§;
         switch(_loc1_)
         {
            case §_-D2y§:
               _loc2_ = this.§_-A3K§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].§_-21w§();
                  _loc3_++;
               }
               GameSounds.play("volcano_prepare");
               break;
            case §_-d20§:
               this.§_-Y1i§ = true;
               _loc2_ = this.§_-A3K§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].active();
                  _loc3_++;
               }
               GameSounds.play("volcano_active2");
               break;
            case §_-52M§:
               this.§_-Y1i§ = false;
               _loc2_ = this.§_-A3K§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].deactivate();
                  _loc3_++;
               }
         }
         ++this.§_-G1o§;
      }
   }
}

