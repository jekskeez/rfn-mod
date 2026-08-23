package §_-T1r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.GameMapNet;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-e2w§.§_-52p§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-r1t§ extends GameMapNet
   {
      
      public function §_-r1t§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      public function §_-fw§(param1:Class) : Vector.<b2Vec2>
      {
         var _loc4_:§_-63Q§ = null;
         var _loc2_:Array = get(param1);
         var _loc3_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(_loc4_.position);
         }
         return _loc3_;
      }
      
      public function get §_-s2t§() : Vector.<b2Vec2>
      {
         return this.§_-fw§(§_-S18§);
      }
      
      public function get §_-E2f§() : Vector.<b2Vec2>
      {
         return this.§_-fw§(§_-T24§);
      }
      
      override protected function §_-931§() : *
      {
         var _loc3_:Hero = null;
         var _loc1_:Object = super.§_-931§();
         var _loc2_:Array = [];
         for each(_loc3_ in this.game.squirrels.players)
         {
            _loc2_.push([_loc3_.id,_loc3_.frags]);
         }
         _loc1_.push({"frags":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-sb§(param1:*, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Hero = null;
         param1 = §_-a1O§(param1);
         var _loc3_:Object = param1.pop();
         super.§_-sb§(param1,true);
         if(!("frags" in _loc3_))
         {
            return;
         }
         for each(_loc4_ in _loc3_["frags"])
         {
            _loc5_ = game.squirrels.get(_loc4_[0]);
            if(_loc5_)
            {
               _loc5_.frags = _loc4_[1];
            }
         }
         §_-52p§.§_-U2e§(_loc3_["frags"]);
      }
   }
}

