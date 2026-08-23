package §_-I1q§
{
   import §_-8Q§.*;
   import §_-A1G§.§_-w10§;
   import protocol.§_-s2l§;
   
   public class §_-N2K§ extends §_-A1d§
   {
      
      public function §_-N2K§()
      {
         super();
         this.§_-W1u§ = §_-Mj§.§_-d1y§(§_-w10§.§_-Pc§);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc3_:Hero = null;
         var _loc2_:Object = param1[1];
         if(!("OnFire" in _loc2_))
         {
            return;
         }
         if(_loc2_["OnFire"][0] != this.id)
         {
            return;
         }
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.squirrels))
         {
            _loc3_ = this.§_-21H§.squirrels.get(_loc2_["OnFire"][1]) as Hero;
            if(_loc3_)
            {
               _loc3_.§_-X1O§(true,§_-w10§.§_-e2i§);
            }
         }
      }
   }
}

