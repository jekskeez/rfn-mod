package §_-F19§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.§_-33A§;
   import §_-Rn§.§_-P1w§;
   import game.mainGame.GameMap;
   
   public class §_-p2§ extends §_-33A§
   {
      
      private var §_-72G§:Boolean;
      
      private var §_-H1z§:Boolean;
      
      public var §_-12z§:Array;
      
      public function §_-p2§(param1:Boolean = false, param2:Boolean = true)
      {
         super();
         this.§_-72G§ = param1;
         this.§_-H1z§ = param2;
      }
      
      override public function place() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:Vector.<b2Vec2> = null;
         var _loc3_:* = 0;
         if(!this.§_-H1z§)
         {
            super.place();
            return;
         }
         for each(_loc1_ in this.players)
         {
            if(!_loc1_.shaman)
            {
               if(GameMap.instance.§_-c2O§.length > 0)
               {
                  _loc1_.position = GameMap.instance.§_-c2O§[0];
               }
            }
         }
         _loc2_ = GameMap.instance.§_-p2U§;
         _loc3_ = 0;
         if(_loc2_.length != 0)
         {
            for each(_loc1_ in this.players)
            {
               if(_loc1_.shaman)
               {
                  _loc1_.position = _loc2_[_loc3_++];
                  if(_loc3_ == _loc2_.length)
                  {
                     _loc3_ = 0;
                  }
               }
            }
         }
         this.§_-32U§();
      }
      
      private function §_-32U§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:int = 0;
         this.§_-12z§ = [];
         var _loc1_:Array = [];
         for each(_loc2_ in this.players)
         {
            if(!_loc2_.shaman)
            {
               _loc1_.push(_loc2_.id);
            }
         }
         _loc1_.sort(Array.NUMERIC);
         if(this.§_-72G§)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               if(GameMap.instance.§_-c2O§.length == 0)
               {
                  break;
               }
               get(_loc1_[_loc3_]).position = GameMap.instance.§_-c2O§[0];
               if(_loc3_ + 1 < _loc1_.length)
               {
                  this.§_-41y§(_loc1_[_loc3_],_loc1_[_loc3_ + 1]);
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               if(_loc3_ + 1 >= _loc1_.length)
               {
                  break;
               }
               this.§_-41y§(_loc1_[_loc3_],_loc1_[_loc3_ + 1]);
               if(GameMap.instance.§_-c2O§.length >= 2)
               {
                  get(_loc1_[_loc3_ + 1]).position = GameMap.instance.§_-c2O§[1];
               }
               _loc3_ += 2;
            }
         }
      }
      
      private function §_-41y§(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(!get(param1) || !get(param2))
         {
            return;
         }
         var _loc4_:§_-P1w§ = new §_-P1w§(param1 == Game.selfId || param2 == Game.selfId);
         if(param1 == Game.selfId)
         {
            _loc3_ = this.getChildIndex(get(param1)) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            this.setChildIndex(get(param2),_loc3_);
            this.§_-12z§.push(param2);
         }
         if(param2 == Game.selfId)
         {
            _loc3_ = this.getChildIndex(get(param2)) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            this.setChildIndex(get(param1),_loc3_);
            this.§_-12z§.push(param1);
         }
         _loc4_.hero0 = get(param1);
         _loc4_.hero1 = get(param2);
         GameMap.instance.add(_loc4_);
      }
   }
}

