package views
{
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-NG§ extends Sprite
   {
      
      public var callback:Function = null;
      
      protected var value:int = 0;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var arrow:PackageComboBoxArrow = null;
      
      private var §_-41x§:Sprite = new Sprite();
      
      private var sprite:Sprite = new Sprite();
      
      private var §_-W2d§:§_-i5§ = null;
      
      private var §_-r1Y§:§_-i5§ = null;
      
      private var §_-93E§:§_-i5§ = null;
      
      private var §_-D1e§:DisplayObject = null;
      
      public function §_-NG§()
      {
         super();
         this.init();
      }
      
      public function set §_-am§(param1:Boolean) : void
      {
         this.sprite.y = param1 ? int(4 - this.sprite.height) : 25;
      }
      
      protected function buy(param1:MouseEvent) : void
      {
         if(this.callback != null)
         {
            this.callback.apply();
         }
      }
      
      protected function §_-J2d§(param1:int) : int
      {
         return 0;
      }
      
      protected function get names() : Array
      {
         return [];
      }
      
      protected function get discounts() : Array
      {
         return [];
      }
      
      private function init() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:ComboBoxDiscountImage = null;
         this.buttonBuy = new §_-K2G§(gls("Купить"),80);
         this.buttonBuy.x = 130;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(this.buttonBuy);
         this.§_-41x§.graphics.beginFill(16777215);
         this.§_-41x§.graphics.lineStyle(1,14865081);
         this.§_-41x§.graphics.drawRoundRectComplex(0,3,105,22,4,0,4,0);
         addChild(this.§_-41x§);
         this.§_-W2d§ = new §_-i5§("",45,5,new TextFormat(null,12,10382680,true));
         this.§_-41x§.addChild(this.§_-W2d§);
         this.§_-D1e§ = new ComboBoxDiscountImage();
         this.§_-D1e§.x = 72;
         this.§_-D1e§.y = 6;
         this.§_-41x§.addChild(this.§_-D1e§);
         this.§_-93E§ = new §_-i5§("",73,6,new TextFormat(§_-i5§.§_-p1s§,11,16777215,true));
         this.§_-41x§.addChild(this.§_-93E§);
         var _loc1_:ImageIconCoins = new ImageIconCoins();
         _loc1_.x = 5;
         _loc1_.y = 5;
         _loc1_.scaleX = _loc1_.scaleY = 0.7;
         this.§_-41x§.addChild(_loc1_);
         this.§_-r1Y§ = new §_-i5§("",20,5,new TextFormat(null,12,6109224,true));
         this.§_-41x§.addChild(this.§_-r1Y§);
         this.arrow = new PackageComboBoxArrow();
         this.arrow.x = 105;
         this.arrow.scaleY = -1;
         this.arrow.y = int(3 + this.arrow.height);
         this.arrow.buttonMode = true;
         this.§_-41x§.addChild(this.arrow);
         this.§_-41x§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-937§);
         this.sprite.y = 25;
         this.sprite.graphics.beginFill(16777215);
         this.sprite.graphics.lineStyle(1,14865081);
         this.sprite.graphics.drawRoundRectComplex(0,0,106,this.names.length * 25,4,4,4,4);
         this.sprite.visible = false;
         addChild(this.sprite);
         var _loc2_:int = 0;
         while(_loc2_ < this.names.length)
         {
            if(_loc2_ != 0)
            {
               this.sprite.graphics.moveTo(0,25 * _loc2_);
               this.sprite.graphics.lineTo(106,25 * _loc2_);
            }
            _loc3_ = new Sprite();
            _loc3_.mouseChildren = false;
            _loc3_.graphics.beginFill(16777215,0);
            _loc3_.graphics.drawRect(0,0,106,25);
            _loc3_.addChild(new §_-i5§(this.names[_loc2_],45,5,new TextFormat(null,12,10382680,true)));
            _loc1_ = new ImageIconCoins();
            _loc1_.x = 5;
            _loc1_.y = 5;
            _loc1_.scaleX = _loc1_.scaleY = 0.7;
            _loc3_.addChild(_loc1_);
            _loc3_.addChild(new §_-i5§(this.§_-J2d§(_loc2_).toString(),20,5,new TextFormat(null,12,6109224,true)));
            _loc3_.name = _loc2_.toString();
            if(this.discounts[_loc2_] != 0)
            {
               _loc4_ = new ComboBoxDiscountImage();
               _loc4_.x = 72;
               _loc4_.y = 5;
               _loc3_.addChild(_loc4_);
               _loc3_.addChild(new §_-i5§("-" + this.discounts[_loc2_] + "%",72,5,new TextFormat(§_-i5§.§_-p1s§,11,16777215,true)));
            }
            _loc3_.y = 25 * _loc2_;
            this.sprite.addChild(_loc3_);
            _loc3_.buttonMode = true;
            _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.select);
            _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this.over);
            _loc3_.addEventListener(MouseEvent.MOUSE_OUT,this.§_-y1n§);
            _loc2_++;
         }
         this.§_-w1T§();
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-n2F§);
      }
      
      private function §_-n2F§(param1:MouseEvent) : void
      {
         if(this.sprite.visible)
         {
            this.§_-937§();
         }
      }
      
      private function §_-y1n§(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(16777215,0);
         _loc2_.graphics.drawRect(0,0,106,25);
      }
      
      private function over(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(16768116,0.2);
         _loc2_.graphics.drawRoundRectComplex(0,0,106,25,2,2,2,2);
      }
      
      private function select(param1:MouseEvent) : void
      {
         this.value = int(param1.currentTarget.name);
         this.§_-w1T§();
         this.§_-937§();
      }
      
      private function §_-937§(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            param1.stopImmediatePropagation();
         }
         this.sprite.visible = !this.sprite.visible;
         this.arrow.scaleY *= -1;
         this.arrow.y = int(this.arrow.scaleY > 0 ? 3 : 3 + this.arrow.height);
      }
      
      private function §_-w1T§() : void
      {
         this.§_-W2d§.text = this.names[this.value];
         this.§_-r1Y§.text = this.§_-J2d§(this.value).toString();
         this.§_-93E§.text = this.discounts[this.value] != 0 ? "-" + this.discounts[this.value] + "%" : "";
         this.§_-D1e§.visible = this.discounts[this.value] != 0;
      }
   }
}

