package §_-y1V§
{
   import §_-I2Y§.§_-l2r§;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-T1G§ implements §_-l2r§
   {
      
      private static const §_-Mv§:int = 10000;
      
      private var §_-fv§:int = 0;
      
      private var §_-Y2Y§:int = 0;
      
      private var callback:Function = null;
      
      public function §_-T1G§(param1:Function)
      {
         super();
         this.callback = param1;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function dispose() : void
      {
         this.callback = null;
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function §_-kl§() : void
      {
         var _loc1_:int = getTimer();
         if(_loc1_ - this.§_-Y2Y§ < §_-Mv§)
         {
            ++this.§_-fv§;
            this.§_-Y2Y§ = _loc1_;
            switch(this.§_-fv§)
            {
               case 2:
                  this.callback(§_-B2M§.§_-gb§);
                  break;
               case 3:
                  this.callback(§_-B2M§.§_-n2A§);
                  break;
               case 4:
                  this.callback(§_-B2M§.§_-k1s§);
            }
            return;
         }
         this.§_-fv§ = 1;
         this.§_-Y2Y§ = _loc1_;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!("4" in param1))
         {
            return;
         }
         if(param1[4] != Game.selfId)
         {
            return;
         }
         this.§_-kl§();
      }
   }
}

