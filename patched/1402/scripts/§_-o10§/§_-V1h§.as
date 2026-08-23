package §_-o10§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-Q2§.§_-l2K§;
   import protocol.§_-s2l§;
   
   public class §_-V1h§ extends §_-Vd§
   {
      
      private static var bonuses:Object = {};
      
      private static var extraBonuses:Object = {};
      
      private static var §_-gD§:int = 0;
      
      private var §_-F2U§:int;
      
      public function §_-V1h§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-n14§;
         this.§_-F2U§ = param1.id;
      }
      
      private static function §_-311§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         for each(_loc2_ in bonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-X2G§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         for each(_loc2_ in extraBonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-N2O§() : int
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:Number = 0;
         for(_loc3_ in bonuses)
         {
            if(bonuses[_loc3_] > _loc1_)
            {
               _loc1_ = Number(bonuses[_loc3_]);
               _loc2_ = int(_loc3_);
            }
         }
         return _loc2_;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         bonuses[this.§_-F2U§] = §_-bx§();
         extraBonuses[this.§_-F2U§] = §_-s2t§();
         §_-gD§ = §_-311§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         delete bonuses[this.§_-F2U§];
         delete extraBonuses[this.§_-F2U§];
         §_-gD§ = §_-311§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-v1r§];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!this.hero || !this.hero.game || !this.active || §_-gD§ == 0)
         {
            return;
         }
         if(param1[0] == this.hero.id)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1[0]);
         if(!_loc2_ || _loc2_.isHare || _loc2_.shaman)
         {
            return;
         }
         if(§_-N2O§() != this.hero.id)
         {
            return;
         }
         --§_-gD§;
         if(!this.hero.isSelf)
         {
            return;
         }
         var _loc3_:§_-l2K§ = new §_-l2K§();
         _loc3_.angle = _loc2_.angle;
         _loc3_.lifeTime = §_-X2G§() * 1000;
         _loc3_.§_-32l§ = this.§_-41Z§;
         var _loc4_:b2Vec2 = this.hero.§_-d2u§;
         _loc4_.Multiply(2);
         _loc3_.position = b2Math.AddVV(_loc2_.position,_loc4_);
         this.hero.game.map.§_-TP§(_loc3_,true);
      }
   }
}

