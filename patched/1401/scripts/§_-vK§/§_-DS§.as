package §_-vK§
{
   import §_-83V§.§_-P2o§;
   
   public class §_-DS§ extends §_-q4§
   {
      
      private static var bonuses:Object = {};
      
      private static var §_-PV§:Number = 1;
      
      private var acorns:Array = null;
      
      private var §_-K1v§:int;
      
      public function §_-DS§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-9V§;
         this.§_-K1v§ = param1.id;
      }
      
      private static function §_-zk§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = §_-PV§;
         for each(_loc2_ in bonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         §_-PV§ = 1;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.acorns = this.hero.game.map.get(§_-P2o§);
         bonuses[this.§_-K1v§] = 1 + §_-Nu§() / 100;
         this.§_-S10§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-41W§)
         {
            §_-PV§ = bonuses[this.§_-K1v§];
         }
         delete bonuses[this.§_-K1v§];
         this.§_-S10§();
      }
      
      private function §_-S10§() : void
      {
         var _loc2_:§_-P2o§ = null;
         if(!this.acorns)
         {
            return;
         }
         var _loc1_:Number = §_-zk§();
         for each(_loc2_ in this.acorns)
         {
            if(_loc2_)
            {
               _loc2_.scale = _loc1_;
            }
         }
      }
   }
}

