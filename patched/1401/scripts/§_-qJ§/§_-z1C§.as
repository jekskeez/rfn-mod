package §_-qJ§
{
   import Box2D.Common.Math.b2Vec2;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-1j§;
   
   public class §_-z1C§ implements §_-Tm§
   {
      
      public static const §_-n2L§:Number = 0.5;
      
      public static const §_-r18§:int = 240;
      
      public static const §_-BI§:int = 150;
      
      private static const §_-T1c§:Number = 57600;
      
      private static const §_-53y§:Number = Game.§_-x2P§ * Game.§_-x2P§;
      
      private var squirrels:SquirrelCollection;
      
      private var §_-A4§:Boolean;
      
      private var §_-Q1§:Vector.<§_-1j§> = new Vector.<§_-1j§>(0);
      
      private var §_-I9§:Number = 0;
      
      public function §_-z1C§(param1:SquirrelCollection, param2:Boolean = false)
      {
         super();
         this.squirrels = param1;
         this.§_-A4§ = param2;
      }
      
      public function add(param1:§_-1j§) : void
      {
         if(this.§_-Q1§.indexOf(param1) == -1)
         {
            this.§_-Q1§.push(param1);
         }
      }
      
      public function remove(param1:§_-1j§) : void
      {
         var _loc2_:int = this.§_-Q1§.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.§_-Q1§.splice(_loc2_,1);
         }
      }
      
      public function §_-Pm§() : void
      {
         this.§_-Q1§.length = 0;
      }
      
      public function dispose() : void
      {
         this.§_-Q1§ = null;
         this.squirrels = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         this.§_-I9§ += param1;
         if(this.§_-I9§ < §_-n2L§)
         {
            return;
         }
         this.§_-I9§ = 0;
         if(this.§_-A4§)
         {
            this.§_-E1n§();
         }
         else
         {
            this.§_-1h§();
         }
      }
      
      private function §_-1h§() : void
      {
         if(!Hero.§_-6g§)
         {
            return;
         }
         var _loc1_:Hero = Hero.self;
         if(!(_loc1_ is §_-w1I§) || _loc1_.shaman || _loc1_.isHare)
         {
            return;
         }
         this.§_-4h§(_loc1_ as §_-w1I§,this.§_-K1j§());
      }
      
      private function §_-E1n§() : void
      {
         var _loc2_:Hero = null;
         var _loc1_:§_-w1I§ = this.§_-K1j§();
         for each(_loc2_ in this.squirrels.players)
         {
            if(!(!(_loc2_ is §_-w1I§) || _loc2_.isDead || _loc2_.shaman || _loc2_.isHare))
            {
               this.§_-4h§(_loc2_ as §_-w1I§,_loc1_);
            }
         }
      }
      
      private function §_-K1j§() : §_-w1I§
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.squirrels.players)
         {
            if(_loc1_.shaman && _loc1_ is §_-w1I§)
            {
               return _loc1_ as §_-w1I§;
            }
         }
         return null;
      }
      
      private function §_-4h§(param1:§_-w1I§, param2:§_-w1I§) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:§_-1j§ = null;
         var _loc10_:b2Vec2 = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:b2Vec2 = param1.position;
         if(param2 != null)
         {
            _loc7_ = _loc3_.x - param2.position.x;
            _loc8_ = _loc3_.y - param2.position.y;
            if((_loc7_ * _loc7_ + _loc8_ * _loc8_) * §_-53y§ <= §_-T1c§)
            {
               param1.§_-j2T§ = false;
               return;
            }
         }
         var _loc4_:Vector.<§_-1j§> = this.§_-Q1§;
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc4_.length);
         while(_loc5_ < _loc6_)
         {
            _loc9_ = _loc4_[_loc5_];
            _loc10_ = _loc9_.position;
            _loc11_ = _loc3_.x - _loc10_.x;
            _loc12_ = _loc3_.y - _loc10_.y;
            _loc13_ = _loc9_.waterAuraSize;
            if((_loc11_ * _loc11_ + _loc12_ * _loc12_) * §_-53y§ <= _loc13_ * _loc13_)
            {
               param1.§_-j2T§ = false;
               return;
            }
            _loc5_++;
         }
         param1.§_-j2T§ = true;
      }
   }
}

