package §_-33r§
{
   import §_-P2b§.§_-6L§;
   import §_-T1r§.§_-03i§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-B1c§ extends §_-AP§
   {
      
      public static const §_-R2V§:Number = 0.1;
      
      protected var §_-h2K§:Number = 0;
      
      protected var main:Boolean = false;
      
      protected var buff:§_-03i§ = null;
      
      public function §_-B1c§(param1:Number, param2:Boolean = false)
      {
         super(param1);
         this.main = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-h2K§;
            this.hero.removeBuff(this.buff);
            if(this.main)
            {
               Connection.forget(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
            }
         }
         else
         {
            this.§_-h2K§ = param1.runSpeed * §_-R2V§;
            param1.runSpeed += this.§_-h2K§;
            if(!this.buff)
            {
               this.buff = new §_-03i§(new IconPerkBanana(),0.9,0,gls("Скорость увеличена"),18,18);
            }
            param1.§_-Aj§(this.buff);
            if(this.main)
            {
               Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
            }
         }
         super.hero = param1;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != §_-6L§.§_-U2d§)
         {
            return;
         }
         if(!this.hero || this.hero.id != param1[2])
         {
            return;
         }
         this.hero.runSpeed -= this.§_-h2K§;
         this.§_-h2K§ += this.hero.runSpeed * §_-R2V§;
         this.hero.runSpeed += this.§_-h2K§;
      }
   }
}

