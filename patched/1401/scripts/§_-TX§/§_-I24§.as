package §_-TX§
{
   import §_-1§.§_-tY§;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.§_-F2A§;
   import §_-B1O§.§_-f24§;
   import §_-Rj§.§_-W28§;
   import §_-T2y§.§_-P1Y§;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-I24§ extends §_-W28§
   {
      
      private static const §_-6J§:int = 1000;
      
      private static const §_-D1p§:Number = 1.5;
      
      private static const §_-4D§:Array = [{
         "value":0.8,
         "speed":1.25
      },{
         "value":0.6,
         "speed":1
      },{
         "value":0.4,
         "speed":0.9
      },{
         "value":0.3,
         "speed":0.8
      }];
      
      public var §_-D2Y§:Number = 1.5;
      
      public function §_-I24§()
      {
         super();
         this.§_-Y1k§ = §_-LR§;
      }
      
      override public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:int = 0;
         var _loc6_:Hero = null;
         var _loc7_:Boolean = false;
         var _loc8_:Array = null;
         var _loc1_:Array = GameMap.instance.get(§_-f24§);
         var _loc2_:Array = GameMap.instance.get(§_-F2A§);
         if(_loc1_.length == 0 || _loc2_.length == 0)
         {
            super.place();
            return;
         }
         var _loc3_:Array = [];
         for each(_loc4_ in this.players)
         {
            if(!_loc4_.shaman)
            {
               _loc3_.push(_loc4_);
            }
         }
         _loc3_.sortOn("id",Array.NUMERIC | Array.DESCENDING);
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = _loc5_ % 2 == 0;
            _loc8_ = _loc7_ ? _loc1_ : _loc2_;
            _loc6_.position = §_-63Q§(_loc8_[(_loc5_ >> 1) % _loc8_.length]).position;
            if(_loc6_ is §_-LR§)
            {
               (_loc6_ as §_-LR§).§_-uT§ = !_loc7_;
            }
            _loc5_++;
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-Z2C§();
      }
      
      override protected function §_-y2G§(param1:SquirrelEvent = null) : void
      {
         if(§_-tY§.§_-Yi§ in §_-P1Y§.§_-Vx§)
         {
            return;
         }
         var _loc2_:§_-LR§ = param1 ? param1.player as §_-LR§ : null;
         if(Boolean(_loc2_ && !_loc2_.shaman) && Boolean(!_loc2_.§_-uT§) && _loc2_.§_-DE§ <= 0)
         {
            _loc2_.first = true;
            setTimeout(this.§_-z21§,§_-6J§,_loc2_);
         }
         super.§_-y2G§(param1);
      }
      
      private function §_-Z2C§() : void
      {
         var _loc3_:§_-LR§ = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.players)
         {
            _loc1_ += !_loc3_.isDead ? 1 : 0;
            _loc2_ += !_loc3_.isDead && (_loc3_.§_-uT§ || _loc3_.§_-DE§ > 0) ? 1 : 0;
         }
         if(_loc2_ == 1)
         {
            this.§_-D2Y§ = §_-D1p§;
            return;
         }
         var _loc4_:Number = (_loc1_ + 1 - _loc2_) / _loc1_;
         var _loc5_:int = 0;
         while(_loc5_ < §_-4D§.length)
         {
            if(_loc4_ >= §_-4D§[_loc5_]["value"])
            {
               this.§_-D2Y§ = §_-4D§[_loc5_]["speed"];
               break;
            }
            _loc5_++;
         }
      }
      
      private function §_-z21§(param1:§_-LR§) : void
      {
         if(!param1 || !param1.first)
         {
            return;
         }
         param1.reset();
         this.§_-Z2C§();
      }
   }
}

