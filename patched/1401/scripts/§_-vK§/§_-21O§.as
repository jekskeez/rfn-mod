package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-21O§ extends §_-qC§
   {
      
      public function §_-21O§(param1:Hero, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.§_-f1z§ > 0)
         {
            this.§_-f1z§ -= param1;
            if(this.buff)
            {
               this.buff.update(100 - 100 * (this.§_-f1z§ / this.activeTime));
            }
            if(this.§_-f1z§ <= 0)
            {
               this.onComplete();
            }
         }
         if(!this.isSelf)
         {
            return;
         }
         if(this.§_-3V§ > 0)
         {
            this.§_-3V§ = Math.max(0,this.§_-3V§ - param1);
         }
         if(this.§_-dj§ != this.available || this.§_-3V§ > 0 || this.§_-f1z§ > 0)
         {
            §_-Py§();
         }
         this.§_-dj§ = this.available;
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-w1R§];
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[2] == §_-S2I§.§_-L2G§)
         {
            return;
         }
         if(!this.hero || param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
         {
            return;
         }
         this.active = param1[2] == §_-S2I§.§_-EY§;
      }
      
      override protected function §_-S2Z§(param1:SquirrelEvent) : void
      {
         this.update();
      }
      
      override public function §_-7J§() : void
      {
         if(!Game.toggle)
         {
            if(this is §_-o1d§)
            {
               if(this.active)
               {
                  this.§_-03R§ = true;
                  Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,false);
                  Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,true);
                  return;
               }
            }
         }
         this.§_-03R§ = true;
         Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,!this.active);
      }
      
      override protected function onComplete() : void
      {
         if(this.isSelf)
         {
            Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,!this.active);
         }
         this.active = false;
      }
   }
}

