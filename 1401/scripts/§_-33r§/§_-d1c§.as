package §_-33r§
{
   public class §_-d1c§ extends §_-AP§
   {
      
      protected var §_-c3§:Number = 0;
      
      protected var bonus:Number = 0;
      
      public function §_-d1c§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.jumpVelocity -= this.§_-c3§;
         }
         else
         {
            this.§_-c3§ = param1.runSpeed * this.bonus;
            param1.jumpVelocity += this.§_-c3§;
         }
         super.hero = param1;
      }
   }
}

