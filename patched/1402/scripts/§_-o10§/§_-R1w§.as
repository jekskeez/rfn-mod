package §_-o10§
{
   import §_-8Q§.§_-O2k§;
   
   public class §_-R1w§ extends §_-Vd§
   {
      
      private static var bonuses:Object = {};
      
      private static var §_-Sm§:Number = 1;
      
      private var acorns:Array = null;
      
      private var §_-F2U§:int;
      
      public function §_-R1w§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-C2i§;
         this.§_-F2U§ = param1.id;
      }
      
      private static function §_-311§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = §_-Sm§;
         for each(_loc2_ in bonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         §_-Sm§ = 1;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.acorns = this.hero.game.map.get(§_-O2k§);
         bonuses[this.§_-F2U§] = 1 + §_-bx§() / 100;
         this.§_-dc§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-53U§)
         {
            §_-Sm§ = bonuses[this.§_-F2U§];
         }
         delete bonuses[this.§_-F2U§];
         this.§_-dc§();
      }
      
      private function §_-dc§() : void
      {
         var _loc2_:§_-O2k§ = null;
         if(!this.acorns)
         {
            return;
         }
         var _loc1_:Number = §_-311§();
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

