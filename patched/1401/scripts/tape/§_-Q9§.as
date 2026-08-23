package tape
{
   import buttons.§_-wc§;
   
   public class §_-Q9§ extends §_-3l§
   {
      
      public static const §_-Ec§:int = 12;
      
      public function §_-Q9§()
      {
         super(0,1,115,7,8,0,55,60);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-H2O§ = param1;
         if(this.data != null)
         {
            this.§_-H2O§ = Math.min(this.§_-H2O§,this.data.objects.length - §_-Ec§);
         }
         this.§_-H2O§ = Math.max(this.§_-H2O§,0);
         update();
      }
      
      override protected function §_-bX§() : void
      {
         this.§_-Z2B§ = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.§_-F1m§ = new §_-wc§(new ButtonRewindLeftDouble(),new ButtonRewindLeftDoubleInactive());
         this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-s19§ = new §_-wc§(new ButtonRewindRightDouble(),new ButtonRewindRightDoubleInactive());
         this.§_-Z2B§.setState(true);
         this.§_-F1m§.setState(true);
         this.buttonNext.setState(true);
         this.§_-s19§.setState(true);
         this.§_-Z2B§.x = 85;
         this.§_-Z2B§.y = 7;
         this.§_-F1m§.x = 85;
         this.§_-F1m§.y = 38;
         this.buttonNext.x = 870;
         this.buttonNext.y = 7;
         this.§_-s19§.x = 870;
         this.§_-s19§.y = 38;
         super.§_-bX§();
      }
      
      override protected function §_-X2w§() : int
      {
         return §_-Ec§;
      }
      
      override protected function §_-83H§() : void
      {
         var _loc2_:§_-K2k§ = null;
         if(this.data == null)
         {
            return;
         }
         §_-81T§();
         var _loc1_:int = this.offset;
         while(_loc1_ < this.offset + §_-Ec§)
         {
            if(_loc1_ > this.data.objects.length - 1)
            {
               return;
            }
            _loc2_ = this.data.objects[_loc1_];
            _loc2_.x = (this.§_-i2s§ + this.offsetX) * (_loc1_ - this.offset);
            _loc2_.y = 0;
            this.sprite.addChild(_loc2_);
            _loc1_++;
         }
      }
   }
}

