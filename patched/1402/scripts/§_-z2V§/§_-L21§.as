package §_-z2V§
{
   import §_-J19§.§_-534§;
   import §_-X1k§.§_-L1o§;
   import §_-c2C§.§_-x2y§;
   import §_-q24§.§_-Uu§;
   import §_-s2e§.§_-U2d§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   
   public class §_-L21§ extends §_-S1M§
   {
      
      private var type:int = 0;
      
      public function §_-L21§(param1:int)
      {
         var _loc5_:Sprite = null;
         var _loc6_:§_-i5§ = null;
         super(7,1,10,0,10,0,95,100);
         this.type = param1;
         var _loc2_:SimpleButton = new ButtonWardrobeBuyClothes();
         var _loc3_:Array = [_loc2_.upState,_loc2_.overState,_loc2_.downState];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = new Sprite();
            _loc5_.addChild(_loc3_[_loc4_]);
            _loc3_[_loc4_] = _loc5_;
            _loc6_ = new §_-i5§(gls("Купить"),0,-50,new TextFormat(§_-i5§.§_-p1s§,16,16075832));
            _loc6_.x = -_loc6_.textWidth * 0.5;
            _loc3_[_loc4_].addChild(_loc6_);
            _loc6_ = new §_-i5§(gls("ещё больше\nаксессуаров"),0,-30,new TextFormat(§_-i5§.§_-p1s§,10,6697728));
            _loc6_.x = -_loc6_.textWidth * 0.5;
            _loc3_[_loc4_].addChild(_loc6_);
            _loc4_++;
         }
         _loc2_ = new SimpleButton(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[2]);
         _loc2_.x = -48;
         _loc2_.y = 50;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         addChild(_loc2_);
      }
      
      override protected function §_-j2y§() : void
      {
         super.§_-j2y§();
         this.§_-T1X§.x = -this.§_-T1X§.width - 106;
         this.§_-T1X§.y = this.§_-y2b§ + (this.§_-w1q§ * (this.§_-g6§ + this.offsetY) - this.offsetY) * 0.5 - this.§_-T1X§.height * 0.5;
         this.buttonNext.x = this.§_-230§ * 2 + this.§_-A1Z§ * (this.§_-13r§ + this.offsetX) - this.offsetX + 1;
         this.buttonNext.y = this.§_-y2b§ + (this.§_-w1q§ * (this.§_-g6§ + this.offsetY) - this.offsetY) * 0.5 - this.buttonNext.height * 0.5;
      }
      
      override protected function §_-11q§(param1:§_-2n§) : void
      {
         if(param1 == null)
         {
            return;
         }
         §_-x2y§.§_-R2f§(§_-L1o§.§_-d1W§,param1.id);
      }
      
      private function §_-G2T§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            §_-Uu§.§_-B3L§(type);
            §_-534§.§_-R2X§(§_-534§.§_-l1s§);
         });
      }
   }
}

