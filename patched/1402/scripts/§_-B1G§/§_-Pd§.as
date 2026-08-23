package §_-B1G§
{
   import §_-22D§.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import utils.§_-p1r§;
   
   public class §_-Pd§ extends Sprite
   {
      
      public static const §_-Z1F§:int = 0;
      
      public static const §_-K4§:int = 1;
      
      private static const §_-91M§:int = 5;
      
      private static const §_-k2k§:uint = 10539232;
      
      private static const §_-vB§:uint = 39372;
      
      public var §_-7e§:SimpleButton;
      
      public var §_-432§:SimpleButton;
      
      public var §_-IV§:int = 0;
      
      private var §_-j2Z§:Sprite;
      
      private var §_-JZ§:int = -1;
      
      private var §_-gd§:uint = 0;
      
      private var §_-k1A§:uint = 0;
      
      private var §_-v1L§:int = 0;
      
      private var callback:Function = null;
      
      private var §_-b2V§:int = 0;
      
      private var §_-E1G§:uint = 0;
      
      public function §_-Pd§(param1:int, param2:int = 300, param3:uint = 10539232, param4:uint = 39372)
      {
         var _loc7_:Sprite = null;
         this.§_-7e§ = new ButtonRewindLeft();
         this.§_-432§ = new ButtonRewindRight();
         this.§_-j2Z§ = new Sprite();
         super();
         this.§_-gd§ = param3;
         this.§_-k1A§ = param4;
         this.§_-IV§ = param1;
         this.§_-v1L§ = param2;
         this.§_-7e§.scaleX = this.§_-7e§.scaleY = 0.8;
         this.§_-432§.scaleX = this.§_-432§.scaleY = 0.8;
         var _loc5_:§_-p1r§ = new §_-p1r§();
         _loc5_.§_-xC§(0,0,0,70);
         var _loc6_:ColorMatrixFilter = new ColorMatrixFilter(_loc5_);
         this.§_-7e§.filters = [_loc6_];
         this.§_-432§.filters = [_loc6_];
         this.addChild(this.§_-7e§);
         this.addChild(this.§_-432§);
         this.addChild(this.§_-j2Z§);
         this.§_-7e§.addEventListener(MouseEvent.CLICK,this.§_-X2c§);
         this.§_-432§.addEventListener(MouseEvent.CLICK,this.§_-X2c§);
         var _loc8_:int = (param2 - this.§_-7e§.width - this.§_-432§.width) / this.§_-IV§ - §_-91M§ * 0.5;
         var _loc9_:int = 0;
         while(_loc9_ < this.§_-IV§)
         {
            _loc7_ = new Sprite();
            _loc7_.buttonMode = true;
            _loc7_.useHandCursor = true;
            _loc7_.addEventListener(MouseEvent.CLICK,this.§_-31n§);
            this.§_-82F§(_loc7_,false);
            _loc7_.x = _loc8_ * _loc9_;
            this.§_-j2Z§.addChild(_loc7_);
            _loc9_++;
         }
         this.§_-j2Z§.x = param2 * 0.5 - this.§_-j2Z§.width * 0.5 + this.§_-7e§.width * 0.5;
         this.§_-j2Z§.y = this.§_-7e§.y + this.§_-7e§.height * 0.5;
         this.§_-432§.x = param2 - this.§_-432§.width * 0.5;
      }
      
      public function §_-Gy§(param1:int) : void
      {
         var _loc4_:Sprite = null;
         this.§_-IV§ = param1;
         while(this.§_-j2Z§.numChildren > 0)
         {
            this.§_-j2Z§.removeChild(this.§_-j2Z§.getChildAt(0)).removeEventListener(MouseEvent.CLICK,this.§_-31n§);
         }
         var _loc2_:int = (this.§_-v1L§ - this.§_-7e§.width - this.§_-432§.width) / this.§_-IV§ - §_-91M§ * 0.5;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-IV§)
         {
            _loc4_ = new Sprite();
            _loc4_.buttonMode = true;
            _loc4_.useHandCursor = true;
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-31n§);
            this.§_-82F§(_loc4_,false);
            _loc4_.x = _loc2_ * _loc3_;
            this.§_-j2Z§.addChild(_loc4_);
            _loc3_++;
         }
         this.§_-j2Z§.x = this.§_-v1L§ * 0.5 - this.§_-j2Z§.width * 0.5 + this.§_-7e§.width * 0.5;
         this.§_-j2Z§.y = this.§_-7e§.y + this.§_-7e§.height * 0.5;
      }
      
      public function §_-s27§(param1:Number, param2:int) : void
      {
         if(this.§_-E1G§)
         {
            clearInterval(this.§_-E1G§);
         }
         this.§_-E1G§ = setInterval(this.§_-lX§,param1,param2);
      }
      
      public function §_-R1T§() : void
      {
         if(this.§_-E1G§ != 0)
         {
            clearInterval(this.§_-E1G§);
         }
         this.§_-E1G§ = 0;
      }
      
      public function §_-E2B§(param1:Function) : void
      {
         this.callback = param1;
      }
      
      public function §_-l1Y§(param1:int) : void
      {
         var _loc2_:Sprite = null;
         if(this.§_-JZ§ == param1 || param1 < 0 || param1 >= this.§_-j2Z§.numChildren)
         {
            return;
         }
         if(this.§_-JZ§ > -1)
         {
            _loc2_ = this.§_-j2Z§.getChildAt(this.§_-JZ§) as Sprite;
            this.§_-82F§(_loc2_,false);
         }
         this.§_-JZ§ = param1;
         _loc2_ = this.§_-j2Z§.getChildAt(this.§_-JZ§) as Sprite;
         this.§_-82F§(_loc2_,true);
         if(this.callback != null)
         {
            this.callback(this.§_-JZ§,this.§_-b2V§);
         }
      }
      
      public function dispose() : void
      {
         this.§_-7e§.removeEventListener(MouseEvent.CLICK,this.§_-X2c§);
         this.§_-432§.removeEventListener(MouseEvent.CLICK,this.§_-X2c§);
         while(this.§_-j2Z§.numChildren > 0)
         {
            this.§_-j2Z§.removeChild(this.§_-j2Z§.getChildAt(0)).removeEventListener(MouseEvent.CLICK,this.§_-31n§);
         }
         removeChild(this.§_-j2Z§);
         this.§_-j2Z§ = null;
         removeChild(this.§_-432§);
         removeChild(this.§_-7e§);
         this.§_-432§ = null;
         this.§_-7e§ = null;
      }
      
      public function §_-X2c§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.§_-JZ§ + (param1.currentTarget == this.§_-7e§ ? -1 : 1);
         this.§_-b2V§ = param1.currentTarget == this.§_-7e§ ? §_-Z1F§ : §_-K4§;
         this.§_-R1T§();
         this.§_-l1Y§(this.§_-G1b§(_loc2_));
      }
      
      private function §_-lX§(param1:int) : void
      {
         var _loc2_:int = this.§_-JZ§ + (param1 == §_-Z1F§ ? -1 : 1);
         this.§_-b2V§ = param1;
         this.§_-l1Y§(this.§_-G1b§(_loc2_));
      }
      
      private function §_-82F§(param1:Sprite, param2:Boolean) : void
      {
         var _loc3_:uint = param2 ? this.§_-k1A§ : this.§_-gd§;
         param1.scaleX = param1.scaleY = param2 ? 0 : 1;
         param1.graphics.clear();
         param1.graphics.beginFill(_loc3_,1);
         param1.graphics.drawCircle(0,0,§_-91M§);
         param1.graphics.endFill();
         TweenMax.to(param1,0.2,{
            "scaleX":1,
            "scaleY":1
         });
      }
      
      private function §_-G1b§(param1:int) : int
      {
         if(param1 >= this.§_-IV§)
         {
            param1 = 0;
         }
         else if(param1 < 0)
         {
            param1 = this.§_-IV§ - 1;
         }
         return param1;
      }
      
      private function §_-31n§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.§_-j2Z§.getChildIndex(param1.currentTarget as DisplayObject);
         this.§_-b2V§ = _loc2_ < this.§_-JZ§ ? §_-Z1F§ : §_-K4§;
         this.§_-R1T§();
         this.§_-l1Y§(_loc2_);
      }
   }
}

