package §_-F19§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Q1P§.§_-zW§;
   import §_-Rj§.§_-W28§;
   import §_-Rn§.§_-P1w§;
   import game.mainGame.GameMap;
   
   public class §_-u12§ extends §_-W28§
   {
      
      private static const §_-z1F§:int = 3;
      
      private var §_-133§:Boolean = false;
      
      public function §_-u12§()
      {
         super();
      }
      
      override public function §_-Qa§(param1:int, param2:§_-zW§) : void
      {
         this.§_-133§ = param1 == §_-q1p§.§_-3F§;
         if(param1 == §_-q1p§.§_-h2d§ && param2.§_-I1y§ < §_-z1F§)
         {
            param2.§_-I1y§ = §_-z1F§;
         }
      }
      
      override public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:§_-P1w§ = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<b2Vec2> = GameMap.instance.§_-c2O§;
         var _loc3_:b2Vec2 = _loc2_.length == 0 ? §_-u1O§() : null;
         for each(_loc4_ in this.players)
         {
            if(!_loc4_.shaman)
            {
               if(_loc2_.length != 0)
               {
                  _loc4_.position = _loc2_[0];
               }
               else if(_loc3_)
               {
                  _loc4_.position = _loc3_;
               }
               _loc1_.push(_loc4_.id);
            }
         }
         _loc2_ = GameMap.instance.§_-p2U§;
         _loc5_ = 0;
         if(_loc2_.length != 0)
         {
            for each(_loc4_ in this.players)
            {
               if(_loc4_.shaman)
               {
                  _loc4_.position = _loc2_[_loc5_++];
                  if(_loc5_ == _loc2_.length)
                  {
                     _loc5_ = 0;
                  }
               }
            }
         }
         if(this.§_-133§)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc1_.length)
            {
               if(_loc6_ + 1 < _loc1_.length)
               {
                  _loc7_ = new §_-P1w§();
                  _loc7_.hero0 = get(_loc1_[_loc6_]);
                  _loc7_.hero1 = get(_loc1_[_loc6_ + 1]);
                  GameMap.instance.add(_loc7_);
               }
               _loc6_++;
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < _loc1_.length)
            {
               if(_loc6_ + 1 >= _loc1_.length)
               {
                  break;
               }
               _loc7_ = new §_-P1w§();
               _loc7_.hero0 = get(_loc1_[_loc6_]);
               _loc7_.hero1 = get(_loc1_[_loc6_ + 1]);
               GameMap.instance.add(_loc7_);
               if(GameMap.instance.§_-c2O§.length >= 2)
               {
                  get(_loc1_[_loc6_ + 1]).position = GameMap.instance.§_-c2O§[1];
               }
               _loc6_ += 2;
            }
         }
      }
   }
}

