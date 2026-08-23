package §_-Kr§
{
   import §_-42B§.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import utils.§_-nO§;
   
   public class §_-Q2o§ extends Sprite
   {
      
      public static const §_-52S§:int = 0;
      
      public static const §_-82U§:int = 1;
      
      private static const §_-I2k§:int = 5;
      
      private static const §_-t2A§:uint = 10539232;
      
      private static const §_-h2F§:uint = 39372;
      
      public var §_-Q1A§:SimpleButton;
      
      public var §_-NT§:SimpleButton;
      
      public var §_-31§:int = 0;
      
      private var §_-IV§:Sprite;
      
      private var §_-Uf§:int = -1;
      
      private var §_-DZ§:uint = 0;
      
      private var §_-624§:uint = 0;
      
      private var §_-4M§:int = 0;
      
      private var callback:Function = null;
      
      private var §_-wp§:int = 0;
      
      private var §_-43R§:uint = 0;
      
      public function §_-Q2o§(param1:int, param2:int = 300, param3:uint = 10539232, param4:uint = 39372)
      {
         var _loc7_:Sprite = null;
         this.§_-Q1A§ = new ButtonRewindLeft();
         this.§_-NT§ = new ButtonRewindRight();
         this.§_-IV§ = new Sprite();
         super();
         this.§_-DZ§ = param3;
         this.§_-624§ = param4;
         this.§_-31§ = param1;
         this.§_-4M§ = param2;
         this.§_-Q1A§.scaleX = this.§_-Q1A§.scaleY = 0.8;
         this.§_-NT§.scaleX = this.§_-NT§.scaleY = 0.8;
         var _loc5_:§_-nO§ = new §_-nO§();
         _loc5_.§_-bb§(0,0,0,70);
         var _loc6_:ColorMatrixFilter = new ColorMatrixFilter(_loc5_);
         this.§_-Q1A§.filters = [_loc6_];
         this.§_-NT§.filters = [_loc6_];
         this.addChild(this.§_-Q1A§);
         this.addChild(this.§_-NT§);
         this.addChild(this.§_-IV§);
         this.§_-Q1A§.addEventListener(MouseEvent.CLICK,this.§_-yb§);
         this.§_-NT§.addEventListener(MouseEvent.CLICK,this.§_-yb§);
         var _loc8_:int = (param2 - this.§_-Q1A§.width - this.§_-NT§.width) / this.§_-31§ - §_-I2k§ * 0.5;
         var _loc9_:int = 0;
         while(_loc9_ < this.§_-31§)
         {
            _loc7_ = new Sprite();
            _loc7_.buttonMode = true;
            _loc7_.useHandCursor = true;
            _loc7_.addEventListener(MouseEvent.CLICK,this.§_-41j§);
            this.§_-W2n§(_loc7_,false);
            _loc7_.x = _loc8_ * _loc9_;
            this.§_-IV§.addChild(_loc7_);
            _loc9_++;
         }
         this.§_-IV§.x = param2 * 0.5 - this.§_-IV§.width * 0.5 + this.§_-Q1A§.width * 0.5;
         this.§_-IV§.y = this.§_-Q1A§.y + this.§_-Q1A§.height * 0.5;
         this.§_-NT§.x = param2 - this.§_-NT§.width * 0.5;
      }
      
      public function §_-c1m§(param1:int) : void
      {
         var _loc4_:Sprite = null;
         this.§_-31§ = param1;
         while(this.§_-IV§.numChildren > 0)
         {
            this.§_-IV§.removeChild(this.§_-IV§.getChildAt(0)).removeEventListener(MouseEvent.CLICK,this.§_-41j§);
         }
         var _loc2_:int = (this.§_-4M§ - this.§_-Q1A§.width - this.§_-NT§.width) / this.§_-31§ - §_-I2k§ * 0.5;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-31§)
         {
            _loc4_ = new Sprite();
            _loc4_.buttonMode = true;
            _loc4_.useHandCursor = true;
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-41j§);
            this.§_-W2n§(_loc4_,false);
            _loc4_.x = _loc2_ * _loc3_;
            this.§_-IV§.addChild(_loc4_);
            _loc3_++;
         }
         this.§_-IV§.x = this.§_-4M§ * 0.5 - this.§_-IV§.width * 0.5 + this.§_-Q1A§.width * 0.5;
         this.§_-IV§.y = this.§_-Q1A§.y + this.§_-Q1A§.height * 0.5;
      }
      
      public function §_-7I§(param1:Number, param2:int) : void
      {
         if(this.§_-43R§)
         {
            clearInterval(this.§_-43R§);
         }
         this.§_-43R§ = setInterval(this.§_-910§,param1,param2);
      }
      
      public function §_-HE§() : void
      {
         if(this.§_-43R§ != 0)
         {
            clearInterval(this.§_-43R§);
         }
         this.§_-43R§ = 0;
      }
      
      public function §_-G0§(param1:Function) : void
      {
         this.callback = param1;
      }
      
      public function §_-32c§(param1:int) : void
      {
         var _loc2_:Sprite = null;
         if(this.§_-Uf§ == param1 || param1 < 0 || param1 >= this.§_-IV§.numChildren)
         {
            return;
         }
         if(this.§_-Uf§ > -1)
         {
            _loc2_ = this.§_-IV§.getChildAt(this.§_-Uf§) as Sprite;
            this.§_-W2n§(_loc2_,false);
         }
         this.§_-Uf§ = param1;
         _loc2_ = this.§_-IV§.getChildAt(this.§_-Uf§) as Sprite;
         this.§_-W2n§(_loc2_,true);
         if(this.callback != null)
         {
            this.callback(this.§_-Uf§,this.§_-wp§);
         }
      }
      
      public function dispose() : void
      {
         this.§_-Q1A§.removeEventListener(MouseEvent.CLICK,this.§_-yb§);
         this.§_-NT§.removeEventListener(MouseEvent.CLICK,this.§_-yb§);
         while(this.§_-IV§.numChildren > 0)
         {
            this.§_-IV§.removeChild(this.§_-IV§.getChildAt(0)).removeEventListener(MouseEvent.CLICK,this.§_-41j§);
         }
         removeChild(this.§_-IV§);
         this.§_-IV§ = null;
         removeChild(this.§_-NT§);
         removeChild(this.§_-Q1A§);
         this.§_-NT§ = null;
         this.§_-Q1A§ = null;
      }
      
      public function §_-yb§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.§_-Uf§ + (param1.currentTarget == this.§_-Q1A§ ? -1 : 1);
         this.§_-wp§ = param1.currentTarget == this.§_-Q1A§ ? §_-52S§ : §_-82U§;
         this.§_-HE§();
         this.§_-32c§(this.§_-Nd§(_loc2_));
      }
      
      private function §_-910§(param1:int) : void
      {
         var _loc2_:int = this.§_-Uf§ + (param1 == §_-52S§ ? -1 : 1);
         this.§_-wp§ = param1;
         this.§_-32c§(this.§_-Nd§(_loc2_));
      }
      
      private function §_-W2n§(param1:Sprite, param2:Boolean) : void
      {
         var _loc3_:uint = param2 ? this.§_-624§ : this.§_-DZ§;
         param1.scaleX = param1.scaleY = param2 ? 0 : 1;
         param1.graphics.clear();
         param1.graphics.beginFill(_loc3_,1);
         param1.graphics.drawCircle(0,0,§_-I2k§);
         param1.graphics.endFill();
         TweenMax.to(param1,0.2,{
            "scaleX":1,
            "scaleY":1
         });
      }
      
      private function §_-Nd§(param1:int) : int
      {
         if(param1 >= this.§_-31§)
         {
            param1 = 0;
         }
         else if(param1 < 0)
         {
            param1 = this.§_-31§ - 1;
         }
         return param1;
      }
      
      private function §_-41j§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.§_-IV§.getChildIndex(param1.currentTarget as DisplayObject);
         this.§_-wp§ = _loc2_ < this.§_-Uf§ ? §_-52S§ : §_-82U§;
         this.§_-HE§();
         this.§_-32c§(_loc2_);
      }
   }
}

