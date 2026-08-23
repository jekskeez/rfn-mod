package §_-p1g§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.§_-33A§;
   import game.mainGame.GameMap;
   
   public class §_-31x§ extends §_-33A§
   {
      
      public function §_-31x§()
      {
         super();
         this.§_-Y1k§ = §_-534§;
      }
      
      override public function place() : void
      {
         var _loc3_:Hero = null;
         if(!GameMap.instance)
         {
            return;
         }
         var _loc1_:Vector.<b2Vec2> = GameMap.instance.§_-c2O§;
         var _loc2_:* = 0;
         if(_loc1_.length > 0)
         {
            for each(_loc3_ in this.players)
            {
               if(!(!(_loc3_ is Hero) || _loc3_.shaman))
               {
                  _loc3_.position = _loc1_[_loc2_++];
                  if(_loc2_ == _loc1_.length)
                  {
                     _loc2_ = 0;
                  }
               }
            }
         }
         if(Boolean(this.§_-Ex§) && this.§_-Ex§.length > 0)
         {
            _loc1_ = (GameMap.instance as §_-y2r§).redShamansPosition;
            if(Boolean(_loc1_) && _loc1_.length > 0)
            {
               this.players[this.§_-Ex§[0]].position = _loc1_[0];
            }
            _loc1_ = (GameMap.instance as §_-y2r§).blueShamansPosition;
            if(Boolean(_loc1_) && Boolean(_loc1_.length > 0) && this.§_-Ex§.length > 1)
            {
               this.players[this.§_-Ex§[1]].position = _loc1_[0];
            }
         }
      }
      
      override public function §_-33L§(param1:int, param2:int) : b2Vec2
      {
         var _loc4_:int = 0;
         var _loc3_:Array = this.§_-Ex§.slice();
         while(_loc3_.length > 0)
         {
            _loc4_ = Math.random() * _loc3_.length;
            if(Boolean(get(_loc3_[_loc4_])) && Boolean(!get(_loc3_[_loc4_]).isDead) && !§_-B1y§(get(_loc3_[_loc4_])))
            {
               return get(_loc3_[_loc4_]).position;
            }
            _loc3_.splice(_loc4_,1);
         }
         return GameMap.instance.§_-c2O§[0];
      }
      
      override protected function §_-s2r§() : void
      {
      }
   }
}

