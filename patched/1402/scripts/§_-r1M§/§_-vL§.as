package §_-r1M§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-td§.§_-N2w§;
   import game.mainGame.GameMap;
   
   public class §_-vL§ extends §_-N2w§
   {
      
      public function §_-vL§()
      {
         super();
         this.§_-71Y§ = §_-l2C§;
      }
      
      override public function place() : void
      {
         var _loc3_:Hero = null;
         if(!GameMap.instance)
         {
            return;
         }
         var _loc1_:Vector.<b2Vec2> = GameMap.instance.§_-q2L§;
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
         if(Boolean(this.§_-M2K§) && this.§_-M2K§.length > 0)
         {
            _loc1_ = (GameMap.instance as §_-b13§).redShamansPosition;
            if(Boolean(_loc1_) && _loc1_.length > 0)
            {
               this.players[this.§_-M2K§[0]].position = _loc1_[0];
            }
            _loc1_ = (GameMap.instance as §_-b13§).blueShamansPosition;
            if(Boolean(_loc1_) && Boolean(_loc1_.length > 0) && this.§_-M2K§.length > 1)
            {
               this.players[this.§_-M2K§[1]].position = _loc1_[0];
            }
         }
      }
      
      override public function §_-u12§(param1:int, param2:int) : b2Vec2
      {
         var _loc4_:int = 0;
         var _loc3_:Array = this.§_-M2K§.slice();
         while(_loc3_.length > 0)
         {
            _loc4_ = Math.random() * _loc3_.length;
            if(Boolean(get(_loc3_[_loc4_])) && Boolean(!get(_loc3_[_loc4_]).isDead) && !§_-n22§(get(_loc3_[_loc4_])))
            {
               return get(_loc3_[_loc4_]).position;
            }
            _loc3_.splice(_loc4_,1);
         }
         return GameMap.instance.§_-q2L§[0];
      }
      
      override protected function §_-U1z§() : void
      {
      }
   }
}

