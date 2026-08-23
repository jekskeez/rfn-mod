package §_-53r§
{
   import §_-61C§.§_-a2p§;
   import §_-82h§.§_-81Y§;
   import §_-hd§.§_-01M§;
   import §_-j2H§.§_-x2h§;
   import §_-j2H§.§_-z27§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-62b§;
   import §_-l2u§.§_-CD§;
   import game.mainGame.SquirrelGame;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-33N§ extends §_-53A§
   {
      
      private static const §_-X12§:Number = 0.33;
      
      private static const §_-b1E§:int = 9;
      
      private static const §_-H2m§:int = 100;
      
      private static const §_-C3F§:int = 5;
      
      private static const §_-O1e§:int = 3;
      
      private static const §_-Q1Q§:int = 3;
      
      private static const §_-Cw§:int = 8;
      
      private static const §_-v16§:int = 0;
      
      private static const §_-uL§:int = 3;
      
      private static const §_-n2r§:int = 5;
      
      private var volcanoData:Array = null;
      
      private var §_-k2i§:Boolean = false;
      
      private var §_-i2b§:Number = 0;
      
      private var views:Vector.<§_-81Y§>;
      
      private var §_-W2s§:Sprite = null;
      
      private var §_-a1m§:int = 0;
      
      private var §_-03q§:int = 0;
      
      public function §_-33N§(param1:SquirrelGame)
      {
         var _loc3_:§_-81Y§ = null;
         this.views = new Vector.<§_-81Y§>(0);
         super(param1);
         var _loc2_:int = 0;
         while(_loc2_ < §_-b1E§)
         {
            _loc3_ = new §_-81Y§();
            _loc3_.x = _loc2_ * §_-H2m§;
            _loc3_.y = §_-Zy§.§_-02T§ + 8;
            _loc3_.deactivate();
            §_-J2J§(_loc3_);
            this.views.push(_loc3_);
            _loc2_++;
         }
         this.§_-W2s§ = §_-01M§.§_-D1J§(new PlatformGroundWild(),§_-Zy§.§_-21V§,32);
         this.§_-W2s§.y = §_-Zy§.§_-02T§ + 32;
         §_-J2J§(this.§_-W2s§);
         §_-p1V§.§_-63T§(this.§_-t29§);
      }
      
      override public function dispose() : void
      {
         §_-p1V§.§_-B3x§(this.§_-t29§);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc4_:Hero = null;
         var _loc5_:§_-d10§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         super.update(param1);
         if(this.§_-i2b§ > 0)
         {
            this.§_-i2b§ = Math.max(0,this.§_-i2b§ - param1);
            return;
         }
         if(!this.§_-k2i§ || !(this.game as §_-62b§).squirrels)
         {
            return;
         }
         var _loc2_:Array = this.§_-33a§;
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:Boolean = false;
         for each(_loc4_ in (this.game as §_-62b§).squirrels.players)
         {
            if(!(!(_loc4_ is §_-d10§) || _loc4_.isDead))
            {
               _loc5_ = _loc4_ as §_-d10§;
               _loc6_ = _loc5_.position.x * Game.§_-12A§;
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  if(_loc2_[_loc7_] * §_-H2m§ <= _loc6_ && _loc6_ <= §_-H2m§ + _loc2_[_loc7_] * §_-H2m§)
                  {
                     _loc3_ = true;
                     --_loc5_.health;
                     if(_loc5_.health == 0)
                     {
                        _loc5_.§_-kl§();
                     }
                     break;
                  }
                  _loc7_++;
               }
            }
         }
         if(_loc3_)
         {
            this.§_-i2b§ = §_-X12§;
         }
      }
      
      override public function §_-Q1J§() : void
      {
         super.§_-Q1J§();
         this.volcanoData = null;
         this.§_-i2b§ = 0;
         this.§_-k2i§ = false;
         this.§_-03q§ = 0;
         this.§_-a1m§ = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            this.views[_loc1_].deactivate();
            _loc1_++;
         }
         this.§_-h1O§();
      }
      
      override public function §_-y1S§() : void
      {
         this.volcanoData = null;
         this.§_-i2b§ = 0;
         this.§_-k2i§ = false;
         this.§_-03q§ = 0;
         this.§_-a1m§ = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            this.views[_loc1_].deactivate();
            _loc1_++;
         }
         super.§_-y1S§();
      }
      
      override public function §_-538§(param1:int, param2:int = -1) : Boolean
      {
         return §_-FS§(§_-z27§) && §_-FS§(§_-x2h§);
      }
      
      override public function §_-h2S§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-T1i§;
      }
      
      private function §_-h1O§() : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         this.volcanoData = [];
         var _loc1_:int = (this.game as §_-62b§).§_-63x§.minutes * 60 + (this.game as §_-62b§).§_-63x§.seconds;
         var _loc2_:int = Math.max(1,int((_loc1_ - §_-C3F§) / §_-Cw§));
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < §_-b1E§)
            {
               _loc4_.push(_loc5_);
               _loc5_++;
            }
            _loc6_ = [];
            _loc7_ = Math.min(§_-b1E§ - 1,§_-Q1Q§ + _loc3_ / §_-O1e§);
            while(_loc6_.length < _loc7_)
            {
               _loc6_.push(_loc4_.splice(int(Math.random() * _loc4_.length),1));
            }
            this.volcanoData.push(_loc6_);
            _loc3_++;
         }
      }
      
      private function get §_-33a§() : Array
      {
         if(this.volcanoData == null)
         {
            return [];
         }
         var _loc1_:int = this.§_-03q§ / §_-Cw§;
         if(this.volcanoData.length <= _loc1_)
         {
            return [];
         }
         return this.volcanoData[_loc1_];
      }
      
      private function §_-t29§() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(!(this.game as §_-62b§).§_-nW§ || (this.game as §_-62b§).§_-H2E§ != §_-at§.§_-r1j§ || §_-a2p§.§_-j2F§ != §_-s2l§.ROUND_START)
         {
            return;
         }
         if(this.§_-a1m§ < §_-C3F§)
         {
            ++this.§_-a1m§;
            return;
         }
         var _loc1_:int = this.§_-03q§ % §_-Cw§;
         switch(_loc1_)
         {
            case §_-v16§:
               _loc2_ = this.§_-33a§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].§_-C1M§();
                  _loc3_++;
               }
               GameSounds.play("volcano_prepare");
               break;
            case §_-uL§:
               this.§_-k2i§ = true;
               _loc2_ = this.§_-33a§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].active();
                  _loc3_++;
               }
               GameSounds.play("volcano_active2");
               break;
            case §_-n2r§:
               this.§_-k2i§ = false;
               _loc2_ = this.§_-33a§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].deactivate();
                  _loc3_++;
               }
         }
         ++this.§_-03q§;
      }
   }
}

