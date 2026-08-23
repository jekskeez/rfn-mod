package §_-Cc§
{
   import Box2D.Dynamics.b2FilterData;
   import game.mainGame.§_-q2c§;
   
   public class §_-r21§ extends §_-pp§
   {
      
      public function §_-r21§(param1:Number)
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
         var _loc3_:b2FilterData = param1.§_-s2i§.GetFilterData();
         _loc3_.categoryBits = param2 ? uint(_loc3_.categoryBits | §_-q2c§.§_-c2P§) : uint(_loc3_.categoryBits & ~§_-q2c§.§_-c2P§);
         _loc3_.maskBits = param2 ? uint(_loc3_.maskBits | §_-q2c§.§_-G1w§) : uint(_loc3_.maskBits & ~§_-q2c§.§_-G1w§);
         param1.§_-s2i§.SetFilterData(_loc3_);
         var _loc4_:b2FilterData = param1.§_-L1G§.GetFilterData();
         _loc4_.categoryBits = param2 ? uint(_loc4_.categoryBits | §_-q2c§.§_-c2P§) : uint(_loc4_.categoryBits & ~§_-q2c§.§_-c2P§);
         _loc4_.maskBits = param2 ? uint(_loc4_.maskBits | §_-q2c§.§_-G1w§) : uint(_loc4_.maskBits & ~§_-q2c§.§_-G1w§);
         param1.§_-L1G§.SetFilterData(_loc4_);
      }
   }
}

