package §_-u2r§
{
   import §_-83V§.*;
   import §_-ZS§.§_-93d§;
   import protocol.§_-S2I§;
   
   public class §_-mo§ extends §_-12R§
   {
      
      public function §_-mo§()
      {
         super();
         this.§_-A38§ = §_-CG§.§_-23j§(§_-93d§.§_-nj§);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
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
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.squirrels))
         {
            _loc3_ = this.§_-H2D§.squirrels.get(_loc2_["OnFire"][1]) as Hero;
            if(_loc3_)
            {
               _loc3_.§_-t25§(true,§_-93d§.§_-MA§);
            }
         }
      }
   }
}

