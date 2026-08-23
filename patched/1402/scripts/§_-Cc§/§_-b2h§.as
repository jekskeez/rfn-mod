package §_-Cc§
{
   import §_-cm§.§_-Q2h§;
   import §_-j2E§.§_-A11§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-b2h§ extends §_-pp§
   {
      
      public static const §_-o1E§:Number = 0.1;
      
      protected var §_-X11§:Number = 0;
      
      protected var main:Boolean = false;
      
      protected var buff:§_-Q2h§ = null;
      
      public function §_-b2h§(param1:Number, param2:Boolean = false)
      {
         super(param1);
         this.main = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-X11§;
            this.hero.removeBuff(this.buff);
            if(this.main)
            {
               Connection.forget(this.§_-x2f§,[§_-s2l§.§_-u22§]);
            }
         }
         else
         {
            this.§_-X11§ = param1.runSpeed * §_-o1E§;
            param1.runSpeed += this.§_-X11§;
            if(!this.buff)
            {
               this.buff = new §_-Q2h§(new IconPerkBanana(),0.9,0,gls("Скорость увеличена"),18,18);
            }
            param1.§_-W1T§(this.buff);
            if(this.main)
            {
               Connection.listen(this.§_-x2f§,[§_-s2l§.§_-u22§]);
            }
         }
         super.hero = param1;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != §_-A11§.§_-g2h§)
         {
            return;
         }
         if(!this.hero || this.hero.id != param1[2])
         {
            return;
         }
         this.hero.runSpeed -= this.§_-X11§;
         this.§_-X11§ += this.hero.runSpeed * §_-o1E§;
         this.hero.runSpeed += this.§_-X11§;
      }
   }
}

