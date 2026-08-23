package §_-O1O§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-M16§.§_-D1A§;
   import §_-td§.§_-N2w§;
   import game.mainGame.GameMap;
   
   public class §_-H1P§ extends §_-N2w§
   {
      
      private var §_-I2f§:Boolean;
      
      private var §_-635§:Boolean;
      
      public var §_-Hh§:Array;
      
      public function §_-H1P§(param1:Boolean = false, param2:Boolean = true)
      {
         super();
         this.§_-I2f§ = param1;
         this.§_-635§ = param2;
      }
      
      override public function place() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:Vector.<b2Vec2> = null;
         var _loc3_:* = 0;
         if(!this.§_-635§)
         {
            super.place();
            return;
         }
         for each(_loc1_ in this.players)
         {
            if(!_loc1_.shaman)
            {
               if(GameMap.instance.§_-q2L§.length > 0)
               {
                  _loc1_.position = GameMap.instance.§_-q2L§[0];
               }
            }
         }
         _loc2_ = GameMap.instance.§_-02q§;
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
         this.§_-t2f§();
      }
      
      private function §_-t2f§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:int = 0;
         this.§_-Hh§ = [];
         var _loc1_:Array = [];
         for each(_loc2_ in this.players)
         {
            if(!_loc2_.shaman)
            {
               _loc1_.push(_loc2_.id);
            }
         }
         _loc1_.sort(Array.NUMERIC);
         if(this.§_-I2f§)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               if(GameMap.instance.§_-q2L§.length == 0)
               {
                  break;
               }
               get(_loc1_[_loc3_]).position = GameMap.instance.§_-q2L§[0];
               if(_loc3_ + 1 < _loc1_.length)
               {
                  this.§_-CA§(_loc1_[_loc3_],_loc1_[_loc3_ + 1]);
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
               this.§_-CA§(_loc1_[_loc3_],_loc1_[_loc3_ + 1]);
               if(GameMap.instance.§_-q2L§.length >= 2)
               {
                  get(_loc1_[_loc3_ + 1]).position = GameMap.instance.§_-q2L§[1];
               }
               _loc3_ += 2;
            }
         }
      }
      
      private function §_-CA§(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(!get(param1) || !get(param2))
         {
            return;
         }
         var _loc4_:§_-D1A§ = new §_-D1A§(param1 == Game.selfId || param2 == Game.selfId);
         if(param1 == Game.selfId)
         {
            _loc3_ = this.getChildIndex(get(param1)) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            this.setChildIndex(get(param2),_loc3_);
            this.§_-Hh§.push(param2);
         }
         if(param2 == Game.selfId)
         {
            _loc3_ = this.getChildIndex(get(param2)) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            this.setChildIndex(get(param1),_loc3_);
            this.§_-Hh§.push(param1);
         }
         _loc4_.hero0 = get(param1);
         _loc4_.hero1 = get(param2);
         GameMap.instance.add(_loc4_);
      }
   }
}

