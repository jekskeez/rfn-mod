package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-S2w§ extends §_-p1B§
   {
      
      public function §_-S2w§(param1:Hero, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.§_-h1§ > 0)
         {
            this.§_-h1§ -= param1;
            if(this.buff)
            {
               this.buff.update(100 - 100 * (this.§_-h1§ / this.activeTime));
            }
            if(this.§_-h1§ <= 0)
            {
               this.onComplete();
            }
         }
         if(!this.isSelf)
         {
            return;
         }
         if(this.§_-G27§ > 0)
         {
            this.§_-G27§ = Math.max(0,this.§_-G27§ - param1);
         }
         if(this.§_-E2q§ != this.available || this.§_-G27§ > 0 || this.§_-h1§ > 0)
         {
            §_-O25§();
         }
         this.§_-E2q§ = this.available;
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-C1i§];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[2] == §_-s2l§.§_-j2o§)
         {
            return;
         }
         if(!this.hero || param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
         {
            return;
         }
         this.active = param1[2] == §_-s2l§.§_-x2Y§;
      }
      
      override protected function §_-BS§(param1:SquirrelEvent) : void
      {
         this.update();
      }
      
      override public function §_-V1z§() : void
      {
         if(!Game.toggle)
         {
            if(this is §_-s2O§)
            {
               if(this.active)
               {
                  this.§_-B3M§ = true;
                  Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,false);
                  Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,true);
                  return;
               }
            }
         }
         this.§_-B3M§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,!this.active);
      }
      
      override protected function onComplete() : void
      {
         if(this.isSelf)
         {
            Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,!this.active);
         }
         this.active = false;
      }
   }
}

