package §_-q24§
{
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import utils.§_-K1Y§;
   
   public class §_-F2c§ extends §_-2n§
   {
      
      protected var image:*;
      
      protected var §_-52M§:Sprite;
      
      protected var §_-Q1w§:§_-i5§ = null;
      
      protected var §_-x1H§:Boolean = false;
      
      protected var buttonArray:Vector.<§_-K2G§> = new Vector.<§_-K2G§>(0);
      
      public function §_-F2c§(param1:int)
      {
         super(param1);
         this.buttonMode = true;
         this.§_-5N§();
         this.§_-7v§ = this.isBought;
         if(this.§_-B1a§ == 0)
         {
            return;
         }
         this.§_-82D§(this.§_-B1a§);
      }
      
      protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-c10§,16,6697728,true,null,null,null,null,"center");
      }
      
      protected function get backWidth() : int
      {
         return 210;
      }
      
      protected function get backHeight() : int
      {
         return 280;
      }
      
      protected function get cost() : int
      {
         return 0;
      }
      
      protected function get extraCost() : int
      {
         return 0;
      }
      
      protected function §_-5N§() : void
      {
         this.§_-Oh§ = new ElementPackageBackSelected();
         this.§_-Oh§.width = this.backWidth;
         this.§_-Oh§.height = this.backHeight;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageBack();
         this.back.width = this.backWidth;
         this.back.height = this.backHeight;
         addChild(this.back);
         this.§_-Q1w§ = new §_-i5§(this.title,5,10,this.titleFormat);
         this.§_-Q1w§.width = this.backWidth - 10;
         this.§_-Q1w§.wordWrap = true;
         this.§_-Q1w§.selectable = false;
         addChild(this.§_-Q1w§);
      }
      
      override public function listen(param1:Function) : void
      {
      }
      
      override public function forget(param1:Function) : void
      {
      }
      
      override public function §_-O1s§() : void
      {
         if(this.image)
         {
            this.image.cacheAsBitmap = true;
         }
      }
      
      public function set §_-7v§(param1:Boolean) : void
      {
         if(this.§_-x1H§ == param1)
         {
            return;
         }
         this.§_-x1H§ = param1;
         if(this.§_-52M§)
         {
            this.§_-52M§.visible = !param1;
         }
      }
      
      protected function get §_-B1a§() : Number
      {
         return 0;
      }
      
      protected function get isBought() : Boolean
      {
         return false;
      }
      
      protected function §_-82D§(param1:int) : void
      {
         if(this.§_-52M§)
         {
            removeChild(this.§_-52M§);
            this.§_-52M§ = null;
         }
         if(param1 == 0)
         {
            return;
         }
         this.§_-52M§ = new Sprite();
         this.§_-52M§.mouseEnabled = false;
         this.§_-52M§.mouseChildren = false;
         addChild(this.§_-52M§);
         var _loc2_:DiscountImage = new DiscountImage();
         this.§_-52M§.addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§("",0,20,new TextFormat(§_-i5§.§_-c10§,14,16777215,true));
         _loc3_.text = "-" + param1 + "%";
         _loc3_.x = int((_loc2_.width - _loc3_.width) * 0.5);
         _loc3_.rotation = -10;
         this.§_-52M§.addChild(_loc3_);
      }
      
      protected function get title() : String
      {
         return "";
      }
      
      protected function get imageClass() : Class
      {
         return null;
      }
      
      protected function addButton(param1:int, param2:Class, param3:Function) : void
      {
         var _loc4_:§_-K2G§ = new §_-K2G§(param1 + " - ",80);
         _loc4_.y = this.backHeight - int(_loc4_.height * 0.5) - 5;
         _loc4_.addEventListener(MouseEvent.CLICK,param3,false,0,true);
         addChild(_loc4_);
         §_-K1Y§.§_-P2W§(_loc4_.field,"-",param2,0.7,0.7,-_loc4_.field.x,-3,false,false);
         this.buttonArray.push(_loc4_);
         var _loc5_:int = (this.backWidth - this.buttonArray.length * (_loc4_.width + 10) + 10) * 0.5;
         var _loc6_:int = 0;
         while(_loc6_ < this.buttonArray.length)
         {
            this.buttonArray[_loc6_].x = _loc5_ + _loc6_ * (_loc4_.width + 10);
            _loc6_++;
         }
      }
   }
}

