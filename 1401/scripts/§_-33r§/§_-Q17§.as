package §_-33r§
{
   import Box2D.Dynamics.b2FilterData;
   import game.mainGame.§_-V§;
   
   public class §_-Q17§ extends §_-AP§
   {
      
      public function §_-Q17§(param1:Number)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.apply(this.hero,false);
         }
         else
         {
            this.apply(param1,true);
         }
         super.hero = param1;
      }
      
      protected function apply(param1:Hero, param2:Boolean) : void
      {
         var _loc3_:b2FilterData = param1.§_-b1Y§.GetFilterData();
         _loc3_.categoryBits = param2 ? uint(_loc3_.categoryBits | §_-V§.§_-sE§) : uint(_loc3_.categoryBits & ~§_-V§.§_-sE§);
         _loc3_.maskBits = param2 ? uint(_loc3_.maskBits | §_-V§.§_-54§) : uint(_loc3_.maskBits & ~§_-V§.§_-54§);
         param1.§_-b1Y§.SetFilterData(_loc3_);
         var _loc4_:b2FilterData = param1.§_-Fn§.GetFilterData();
         _loc4_.categoryBits = param2 ? uint(_loc4_.categoryBits | §_-V§.§_-sE§) : uint(_loc4_.categoryBits & ~§_-V§.§_-sE§);
         _loc4_.maskBits = param2 ? uint(_loc4_.maskBits | §_-V§.§_-54§) : uint(_loc4_.maskBits & ~§_-V§.§_-54§);
         param1.§_-Fn§.SetFilterData(_loc4_);
      }
   }
}

