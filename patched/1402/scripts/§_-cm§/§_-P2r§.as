package §_-cm§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-J1i§.§_-k1U§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import §_-td§.GameMapNet;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-P2r§ extends GameMapNet
   {
      
      public function §_-P2r§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      public function §_-42e§(param1:Class) : Vector.<b2Vec2>
      {
         var _loc4_:§_-xn§ = null;
         var _loc2_:Array = get(param1);
         var _loc3_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(_loc4_.position);
         }
         return _loc3_;
      }
      
      public function get §_-839§() : Vector.<b2Vec2>
      {
         return this.§_-42e§(§_-Y2n§);
      }
      
      public function get §_-nM§() : Vector.<b2Vec2>
      {
         return this.§_-42e§(§_-Jb§);
      }
      
      override protected function §_-qv§() : *
      {
         var _loc3_:Hero = null;
         var _loc1_:Object = super.§_-qv§();
         var _loc2_:Array = [];
         for each(_loc3_ in this.game.squirrels.players)
         {
            _loc2_.push([_loc3_.id,_loc3_.frags]);
         }
         _loc1_.push({"frags":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-a2f§(param1:*, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Hero = null;
         param1 = §_-m1v§(param1);
         var _loc3_:Object = param1.pop();
         super.§_-a2f§(param1,true);
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
         §_-k1U§.§_-W2T§(_loc3_["frags"]);
      }
   }
}

