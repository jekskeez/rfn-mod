package §_-j2H§
{
   import §_-TK§.§_-aS§;
   import utils.§_-A10§;
   
   public class §_-pE§ extends §_-52m§
   {
      
      public function §_-pE§()
      {
         super();
      }
      
      override public function set message(param1:String) : void
      {
         if(this.§_-i2w§)
         {
            this.§_-i2w§.removeFromParent();
         }
         §_-q14§ = param1;
         if(!param1 || param1 == "")
         {
            return;
         }
         this.§_-i2w§ = new §_-aS§(new §_-A10§(param1),true);
         this.§_-i2w§.x = -this.§_-i2w§.width + 5;
         this.§_-i2w§.y = -this.§_-i2w§.height - 35;
         §_-J2J§(this.§_-i2w§);
      }
      
      override protected function init() : void
      {
         var _loc1_:§_-aS§ = new §_-aS§(new ShamanIcon());
         _loc1_.y = -_loc1_.height + 21;
         _loc1_.x = -_loc1_.width * 0.5;
         §_-J2J§(_loc1_);
      }
   }
}

