package §_-921§
{
   import Box2D.Common.Math.b2Vec2;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-636§;
   
   public class §_-x1c§ implements §_-F1c§
   {
      
      public static const §_-K27§:Number = 0.5;
      
      public static const §_-vU§:int = 240;
      
      public static const §_-At§:int = 150;
      
      private static const §_-H§:Number = 57600;
      
      private static const §_-N2G§:Number = Game.§_-12A§ * Game.§_-12A§;
      
      private var squirrels:SquirrelCollection;
      
      private var §_-D2B§:Boolean;
      
      private var §_-uB§:Vector.<§_-636§> = new Vector.<§_-636§>(0);
      
      private var §_-L23§:Number = 0;
      
      public function §_-x1c§(param1:SquirrelCollection, param2:Boolean = false)
      {
         super();
         this.squirrels = param1;
         this.§_-D2B§ = param2;
      }
      
      public function add(param1:§_-636§) : void
      {
         if(this.§_-uB§.indexOf(param1) == -1)
         {
            this.§_-uB§.push(param1);
         }
      }
      
      public function remove(param1:§_-636§) : void
      {
         var _loc2_:int = this.§_-uB§.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.§_-uB§.splice(_loc2_,1);
         }
      }
      
      public function §_-B1o§() : void
      {
         this.§_-uB§.length = 0;
      }
      
      public function dispose() : void
      {
         this.§_-uB§ = null;
         this.squirrels = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         this.§_-L23§ += param1;
         if(this.§_-L23§ < §_-K27§)
         {
            return;
         }
         this.§_-L23§ = 0;
         if(this.§_-D2B§)
         {
            this.§_-v3§();
         }
         else
         {
            this.§_-X1h§();
         }
      }
      
      private function §_-X1h§() : void
      {
         if(!Hero.§_-Cg§)
         {
            return;
         }
         var _loc1_:Hero = Hero.self;
         if(!(_loc1_ is §_-A25§) || _loc1_.shaman || _loc1_.isHare)
         {
            return;
         }
         this.§_-Y1l§(_loc1_ as §_-A25§,this.§_-R1u§());
      }
      
      private function §_-v3§() : void
      {
         var _loc2_:Hero = null;
         var _loc1_:§_-A25§ = this.§_-R1u§();
         for each(_loc2_ in this.squirrels.players)
         {
            if(!(!(_loc2_ is §_-A25§) || _loc2_.isDead || _loc2_.shaman || _loc2_.isHare))
            {
               this.§_-Y1l§(_loc2_ as §_-A25§,_loc1_);
            }
         }
      }
      
      private function §_-R1u§() : §_-A25§
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.squirrels.players)
         {
            if(_loc1_.shaman && _loc1_ is §_-A25§)
            {
               return _loc1_ as §_-A25§;
            }
         }
         return null;
      }
      
      private function §_-Y1l§(param1:§_-A25§, param2:§_-A25§) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:§_-636§ = null;
         var _loc10_:b2Vec2 = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:b2Vec2 = param1.position;
         if(param2 != null)
         {
            _loc7_ = _loc3_.x - param2.position.x;
            _loc8_ = _loc3_.y - param2.position.y;
            if((_loc7_ * _loc7_ + _loc8_ * _loc8_) * §_-N2G§ <= §_-H§)
            {
               param1.§_-h1G§ = false;
               return;
            }
         }
         var _loc4_:Vector.<§_-636§> = this.§_-uB§;
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc4_.length);
         while(_loc5_ < _loc6_)
         {
            _loc9_ = _loc4_[_loc5_];
            _loc10_ = _loc9_.position;
            _loc11_ = _loc3_.x - _loc10_.x;
            _loc12_ = _loc3_.y - _loc10_.y;
            _loc13_ = _loc9_.waterAuraSize;
            if((_loc11_ * _loc11_ + _loc12_ * _loc12_) * §_-N2G§ <= _loc13_ * _loc13_)
            {
               param1.§_-h1G§ = false;
               return;
            }
            _loc5_++;
         }
         param1.§_-h1G§ = true;
      }
   }
}

