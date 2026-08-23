package §_-Cc§
{
   public class §_-f1M§ extends §_-pp§
   {
      
      protected var §_-H1f§:Number = 0;
      
      protected var bonus:Number = 0;
      
      public function §_-f1M§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.jumpVelocity -= this.§_-H1f§;
         }
         else
         {
            this.§_-H1f§ = param1.runSpeed * this.bonus;
            param1.jumpVelocity += this.§_-H1f§;
         }
         super.hero = param1;
      }
   }
}

