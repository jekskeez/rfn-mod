package §_-o1W§
{
   import §_-5P§.§_-Z1f§;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-H1k§;
   import §_-j2H§.§_-31P§;
   import §_-j2H§.§_-x2h§;
   import §_-l2u§.§_-Rp§;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-I21§ extends §_-Rp§
   {
      
      private static const §_-Vs§:int = 1000;
      
      private static const §_-53V§:Number = 1.5;
      
      private static const §_-2a§:Array = [{
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
      
      public var §_-53C§:Number = 1.5;
      
      public function §_-I21§()
      {
         super();
         this.§_-71Y§ = §_-Qz§;
      }
      
      override public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:int = 0;
         var _loc6_:Hero = null;
         var _loc7_:Boolean = false;
         var _loc8_:Array = null;
         var _loc1_:Array = GameMap.instance.get(§_-x2h§);
         var _loc2_:Array = GameMap.instance.get(§_-31P§);
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
            _loc6_.position = §_-xn§(_loc8_[(_loc5_ >> 1) % _loc8_.length]).position;
            if(_loc6_ is §_-Qz§)
            {
               (_loc6_ as §_-Qz§).§_-Gm§ = !_loc7_;
            }
            _loc5_++;
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-43M§();
      }
      
      override protected function §_-43r§(param1:SquirrelEvent = null) : void
      {
         if(§_-Z1f§.§_-q1E§ in §_-H1k§.§_-t1y§)
         {
            return;
         }
         var _loc2_:§_-Qz§ = param1 ? param1.player as §_-Qz§ : null;
         if(Boolean(_loc2_ && !_loc2_.shaman) && Boolean(!_loc2_.§_-Gm§) && _loc2_.§_-21§ <= 0)
         {
            _loc2_.first = true;
            setTimeout(this.§_-F1§,§_-Vs§,_loc2_);
         }
         super.§_-43r§(param1);
      }
      
      private function §_-43M§() : void
      {
         var _loc3_:§_-Qz§ = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.players)
         {
            _loc1_ += !_loc3_.isDead ? 1 : 0;
            _loc2_ += !_loc3_.isDead && (_loc3_.§_-Gm§ || _loc3_.§_-21§ > 0) ? 1 : 0;
         }
         if(_loc2_ == 1)
         {
            this.§_-53C§ = §_-53V§;
            return;
         }
         var _loc4_:Number = (_loc1_ + 1 - _loc2_) / _loc1_;
         var _loc5_:int = 0;
         while(_loc5_ < §_-2a§.length)
         {
            if(_loc4_ >= §_-2a§[_loc5_]["value"])
            {
               this.§_-53C§ = §_-2a§[_loc5_]["speed"];
               break;
            }
            _loc5_++;
         }
      }
      
      private function §_-F1§(param1:§_-Qz§) : void
      {
         if(!param1 || !param1.first)
         {
            return;
         }
         param1.reset();
         this.§_-43M§();
      }
   }
}

