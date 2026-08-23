package §_-O1O§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-M16§.§_-D1A§;
   import §_-ZL§.§_-g2m§;
   import §_-l2u§.§_-Rp§;
   import game.mainGame.GameMap;
   
   public class §_-eQ§ extends §_-Rp§
   {
      
      private static const §_-83r§:int = 3;
      
      private var §_-xK§:Boolean = false;
      
      public function §_-eQ§()
      {
         super();
      }
      
      override public function §_-R10§(param1:int, param2:§_-g2m§) : void
      {
         this.§_-xK§ = param1 == §_-at§.§_-dH§;
         if(param1 == §_-at§.§_-n1O§ && param2.§_-e1W§ < §_-83r§)
         {
            param2.§_-e1W§ = §_-83r§;
         }
      }
      
      override public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:§_-D1A§ = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<b2Vec2> = GameMap.instance.§_-q2L§;
         var _loc3_:b2Vec2 = _loc2_.length == 0 ? §_-iX§() : null;
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
         _loc2_ = GameMap.instance.§_-02q§;
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
         if(this.§_-xK§)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc1_.length)
            {
               if(_loc6_ + 1 < _loc1_.length)
               {
                  _loc7_ = new §_-D1A§();
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
               _loc7_ = new §_-D1A§();
               _loc7_.hero0 = get(_loc1_[_loc6_]);
               _loc7_.hero1 = get(_loc1_[_loc6_ + 1]);
               GameMap.instance.add(_loc7_);
               if(GameMap.instance.§_-q2L§.length >= 2)
               {
                  get(_loc1_[_loc6_ + 1]).position = GameMap.instance.§_-q2L§[1];
               }
               _loc6_ += 2;
            }
         }
      }
   }
}

