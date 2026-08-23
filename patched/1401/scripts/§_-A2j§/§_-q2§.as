package §_-A2j§
{
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import tape.§_-A3s§;
   import utils.§_-jB§;
   
   public class §_-q2§ extends §_-A3s§
   {
      
      protected var image:*;
      
      protected var §_-t2j§:Sprite;
      
      protected var §_-T1j§:§_-22V§ = null;
      
      protected var §_-KW§:Boolean = false;
      
      protected var buttonArray:Vector.<§_-j18§> = new Vector.<§_-j18§>(0);
      
      public function §_-q2§(param1:int)
      {
         super(param1);
         this.buttonMode = true;
         this.§_-Cr§();
         this.§_-V1A§ = this.isBought;
         if(this.§_-32r§ == 0)
         {
            return;
         }
         this.§_-n2G§(this.§_-32r§);
      }
      
      protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-F2z§,16,6697728,true,null,null,null,null,"center");
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
      
      protected function §_-Cr§() : void
      {
         this.§_-Nh§ = new ElementPackageBackSelected();
         this.§_-Nh§.width = this.backWidth;
         this.§_-Nh§.height = this.backHeight;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageBack();
         this.back.width = this.backWidth;
         this.back.height = this.backHeight;
         addChild(this.back);
         this.§_-T1j§ = new §_-22V§(this.title,5,10,this.titleFormat);
         this.§_-T1j§.width = this.backWidth - 10;
         this.§_-T1j§.wordWrap = true;
         this.§_-T1j§.selectable = false;
         addChild(this.§_-T1j§);
      }
      
      override public function listen(param1:Function) : void
      {
      }
      
      override public function forget(param1:Function) : void
      {
      }
      
      override public function §_-027§() : void
      {
         if(this.image)
         {
            this.image.cacheAsBitmap = true;
         }
      }
      
      public function set §_-V1A§(param1:Boolean) : void
      {
         if(this.§_-KW§ == param1)
         {
            return;
         }
         this.§_-KW§ = param1;
         if(this.§_-t2j§)
         {
            this.§_-t2j§.visible = !param1;
         }
      }
      
      protected function get §_-32r§() : Number
      {
         return 0;
      }
      
      protected function get isBought() : Boolean
      {
         return false;
      }
      
      protected function §_-n2G§(param1:int) : void
      {
         if(this.§_-t2j§)
         {
            removeChild(this.§_-t2j§);
            this.§_-t2j§ = null;
         }
         if(param1 == 0)
         {
            return;
         }
         this.§_-t2j§ = new Sprite();
         this.§_-t2j§.mouseEnabled = false;
         this.§_-t2j§.mouseChildren = false;
         addChild(this.§_-t2j§);
         var _loc2_:DiscountImage = new DiscountImage();
         this.§_-t2j§.addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§("",0,20,new TextFormat(§_-22V§.§_-F2z§,14,16777215,true));
         _loc3_.text = "-" + param1 + "%";
         _loc3_.x = int((_loc2_.width - _loc3_.width) * 0.5);
         _loc3_.rotation = -10;
         this.§_-t2j§.addChild(_loc3_);
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
         var _loc4_:§_-j18§ = new §_-j18§(param1 + " - ",80);
         _loc4_.y = this.backHeight - int(_loc4_.height * 0.5) - 5;
         _loc4_.addEventListener(MouseEvent.CLICK,param3,false,0,true);
         addChild(_loc4_);
         §_-jB§.§_-fG§(_loc4_.field,"-",param2,0.7,0.7,-_loc4_.field.x,-3,false,false);
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

