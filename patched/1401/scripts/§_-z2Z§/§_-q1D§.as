package §_-z2Z§
{
   import §_-68§.§_-EI§;
   import §_-A2j§.§_-g1a§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-h1f§;
   import §_-T2y§.§_-ac§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   
   public class §_-q1D§ extends §_-wP§
   {
      
      private var type:int = 0;
      
      public function §_-q1D§(param1:int)
      {
         var _loc5_:Sprite = null;
         var _loc6_:§_-22V§ = null;
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
            _loc6_ = new §_-22V§(gls("Купить"),0,-50,new TextFormat(§_-22V§.§_-pJ§,16,16075832));
            _loc6_.x = -_loc6_.textWidth * 0.5;
            _loc3_[_loc4_].addChild(_loc6_);
            _loc6_ = new §_-22V§(gls("ещё больше\nаксессуаров"),0,-30,new TextFormat(§_-22V§.§_-pJ§,10,6697728));
            _loc6_.x = -_loc6_.textWidth * 0.5;
            _loc3_[_loc4_].addChild(_loc6_);
            _loc4_++;
         }
         _loc2_ = new SimpleButton(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[2]);
         _loc2_.x = -48;
         _loc2_.y = 50;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         addChild(_loc2_);
      }
      
      override protected function §_-bX§() : void
      {
         super.§_-bX§();
         this.§_-Z2B§.x = -this.§_-Z2B§.width - 106;
         this.§_-Z2B§.y = this.§_-xx§ + (this.§_-x16§ * (this.§_-c28§ + this.offsetY) - this.offsetY) * 0.5 - this.§_-Z2B§.height * 0.5;
         this.buttonNext.x = this.§_-32v§ * 2 + this.§_-E2J§ * (this.§_-i2s§ + this.offsetX) - this.offsetX + 1;
         this.buttonNext.y = this.§_-xx§ + (this.§_-x16§ * (this.§_-c28§ + this.offsetY) - this.offsetY) * 0.5 - this.buttonNext.height * 0.5;
      }
      
      override protected function §_-x2k§(param1:§_-A3s§) : void
      {
         if(param1 == null)
         {
            return;
         }
         §_-ac§.§_-s1C§(§_-h1f§.§_-03X§,param1.id);
      }
      
      private function §_-r1S§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            §_-g1a§.§_-23H§(type);
            §_-m1L§.§_-Y1T§(§_-m1L§.§_-Z2u§);
         });
      }
   }
}

