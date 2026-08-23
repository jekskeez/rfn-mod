package tape
{
   import buttons.§_-613§;
   
   public class §_-E2i§ extends §_-L2v§
   {
      
      public static const §_-J2A§:int = 12;
      
      public function §_-E2i§()
      {
         super(0,1,115,7,8,0,55,60);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-J1c§ = param1;
         if(this.data != null)
         {
            this.§_-J1c§ = Math.min(this.§_-J1c§,this.data.objects.length - §_-J2A§);
         }
         this.§_-J1c§ = Math.max(this.§_-J1c§,0);
         update();
      }
      
      override protected function §_-j2y§() : void
      {
         this.§_-T1X§ = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.§_-42u§ = new §_-613§(new ButtonRewindLeftDouble(),new ButtonRewindLeftDoubleInactive());
         this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-025§ = new §_-613§(new ButtonRewindRightDouble(),new ButtonRewindRightDoubleInactive());
         this.§_-T1X§.setState(true);
         this.§_-42u§.setState(true);
         this.buttonNext.setState(true);
         this.§_-025§.setState(true);
         this.§_-T1X§.x = 85;
         this.§_-T1X§.y = 7;
         this.§_-42u§.x = 85;
         this.§_-42u§.y = 38;
         this.buttonNext.x = 870;
         this.buttonNext.y = 7;
         this.§_-025§.x = 870;
         this.§_-025§.y = 38;
         super.§_-j2y§();
      }
      
      override protected function §_-p2w§() : int
      {
         return §_-J2A§;
      }
      
      override protected function §_-nZ§() : void
      {
         var _loc2_:§_-QN§ = null;
         if(this.data == null)
         {
            return;
         }
         §_-S1q§();
         var _loc1_:int = this.offset;
         while(_loc1_ < this.offset + §_-J2A§)
         {
            if(_loc1_ > this.data.objects.length - 1)
            {
               return;
            }
            _loc2_ = this.data.objects[_loc1_];
            _loc2_.x = (this.§_-13r§ + this.offsetX) * (_loc1_ - this.offset);
            _loc2_.y = 0;
            this.sprite.addChild(_loc2_);
            _loc1_++;
         }
      }
   }
}

