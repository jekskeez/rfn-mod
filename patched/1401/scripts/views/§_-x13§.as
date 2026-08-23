package views
{
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-x13§ extends Sprite
   {
      
      public var callback:Function = null;
      
      protected var value:int = 0;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var arrow:PackageComboBoxArrow = null;
      
      private var §_-O19§:Sprite = new Sprite();
      
      private var sprite:Sprite = new Sprite();
      
      private var §_-j2N§:§_-22V§ = null;
      
      private var §_-410§:§_-22V§ = null;
      
      private var §_-B1R§:§_-22V§ = null;
      
      private var §_-K1B§:DisplayObject = null;
      
      public function §_-x13§()
      {
         super();
         this.init();
      }
      
      public function set §_-56§(param1:Boolean) : void
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
      
      protected function §_-G2v§(param1:int) : int
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
         this.buttonBuy = new §_-j18§(gls("Купить"),80);
         this.buttonBuy.x = 130;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(this.buttonBuy);
         this.§_-O19§.graphics.beginFill(16777215);
         this.§_-O19§.graphics.lineStyle(1,14865081);
         this.§_-O19§.graphics.drawRoundRectComplex(0,3,105,22,4,0,4,0);
         addChild(this.§_-O19§);
         this.§_-j2N§ = new §_-22V§("",45,5,new TextFormat(null,12,10382680,true));
         this.§_-O19§.addChild(this.§_-j2N§);
         this.§_-K1B§ = new ComboBoxDiscountImage();
         this.§_-K1B§.x = 72;
         this.§_-K1B§.y = 6;
         this.§_-O19§.addChild(this.§_-K1B§);
         this.§_-B1R§ = new §_-22V§("",73,6,new TextFormat(§_-22V§.§_-pJ§,11,16777215,true));
         this.§_-O19§.addChild(this.§_-B1R§);
         var _loc1_:ImageIconCoins = new ImageIconCoins();
         _loc1_.x = 5;
         _loc1_.y = 5;
         _loc1_.scaleX = _loc1_.scaleY = 0.7;
         this.§_-O19§.addChild(_loc1_);
         this.§_-410§ = new §_-22V§("",20,5,new TextFormat(null,12,6109224,true));
         this.§_-O19§.addChild(this.§_-410§);
         this.arrow = new PackageComboBoxArrow();
         this.arrow.x = 105;
         this.arrow.scaleY = -1;
         this.arrow.y = int(3 + this.arrow.height);
         this.arrow.buttonMode = true;
         this.§_-O19§.addChild(this.arrow);
         this.§_-O19§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-J2E§);
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
            _loc3_.addChild(new §_-22V§(this.names[_loc2_],45,5,new TextFormat(null,12,10382680,true)));
            _loc1_ = new ImageIconCoins();
            _loc1_.x = 5;
            _loc1_.y = 5;
            _loc1_.scaleX = _loc1_.scaleY = 0.7;
            _loc3_.addChild(_loc1_);
            _loc3_.addChild(new §_-22V§(this.§_-G2v§(_loc2_).toString(),20,5,new TextFormat(null,12,6109224,true)));
            _loc3_.name = _loc2_.toString();
            if(this.discounts[_loc2_] != 0)
            {
               _loc4_ = new ComboBoxDiscountImage();
               _loc4_.x = 72;
               _loc4_.y = 5;
               _loc3_.addChild(_loc4_);
               _loc3_.addChild(new §_-22V§("-" + this.discounts[_loc2_] + "%",72,5,new TextFormat(§_-22V§.§_-pJ§,11,16777215,true)));
            }
            _loc3_.y = 25 * _loc2_;
            this.sprite.addChild(_loc3_);
            _loc3_.buttonMode = true;
            _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.select);
            _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this.over);
            _loc3_.addEventListener(MouseEvent.MOUSE_OUT,this.§_-51G§);
            _loc2_++;
         }
         this.§_-Hp§();
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-G1G§);
      }
      
      private function §_-G1G§(param1:MouseEvent) : void
      {
         if(this.sprite.visible)
         {
            this.§_-J2E§();
         }
      }
      
      private function §_-51G§(param1:MouseEvent) : void
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
         this.§_-Hp§();
         this.§_-J2E§();
      }
      
      private function §_-J2E§(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            param1.stopImmediatePropagation();
         }
         this.sprite.visible = !this.sprite.visible;
         this.arrow.scaleY *= -1;
         this.arrow.y = int(this.arrow.scaleY > 0 ? 3 : 3 + this.arrow.height);
      }
      
      private function §_-Hp§() : void
      {
         this.§_-j2N§.text = this.names[this.value];
         this.§_-410§.text = this.§_-G2v§(this.value).toString();
         this.§_-B1R§.text = this.discounts[this.value] != 0 ? "-" + this.discounts[this.value] + "%" : "";
         this.§_-K1B§.visible = this.discounts[this.value] != 0;
      }
   }
}

