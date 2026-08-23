package §_-vK§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-b1B§.§_-q2n§;
   import protocol.§_-S2I§;
   
   public class §_-H1O§ extends §_-q4§
   {
      
      private static var bonuses:Object = {};
      
      private static var extraBonuses:Object = {};
      
      private static var §_-c29§:int = 0;
      
      private var §_-K1v§:int;
      
      public function §_-H1O§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-j1l§;
         this.§_-K1v§ = param1.id;
      }
      
      private static function §_-zk§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         for each(_loc2_ in bonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-nR§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         for each(_loc2_ in extraBonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-xz§() : int
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
         bonuses[this.§_-K1v§] = §_-Nu§();
         extraBonuses[this.§_-K1v§] = §_-OD§();
         §_-c29§ = §_-zk§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         delete bonuses[this.§_-K1v§];
         delete extraBonuses[this.§_-K1v§];
         §_-c29§ = §_-zk§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-F2m§];
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!this.hero || !this.hero.game || !this.active || §_-c29§ == 0)
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
         if(§_-xz§() != this.hero.id)
         {
            return;
         }
         --§_-c29§;
         if(!this.hero.isSelf)
         {
            return;
         }
         var _loc3_:§_-q2n§ = new §_-q2n§();
         _loc3_.angle = _loc2_.angle;
         _loc3_.lifeTime = §_-nR§() * 1000;
         _loc3_.§_-j2Y§ = this.§_-d1K§;
         var _loc4_:b2Vec2 = this.hero.§_-x2h§;
         _loc4_.Multiply(2);
         _loc3_.position = b2Math.AddVV(_loc2_.position,_loc4_);
         this.hero.game.map.§_-nA§(_loc3_,true);
      }
   }
}

