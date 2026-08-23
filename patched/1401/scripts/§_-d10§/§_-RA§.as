package §_-d10§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-RA§ extends Sprite
   {
      
      public static const §_-BO§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,24,16777215);
      
      private var §_-aA§:§_-22V§ = null;
      
      public function §_-RA§(param1:String = "", param2:Array = null)
      {
         super();
         this.rotation = -15;
         var _loc3_:DisplayObject = new DiscountImage();
         _loc3_.scaleX = _loc3_.scaleY = 2;
         _loc3_.rotation = 15;
         if(param2 != null)
         {
            _loc3_.filters = param2;
         }
         addChild(_loc3_);
         var _loc4_:§_-22V§ = new §_-22V§(param1 == "" ? gls("Выгода") : param1,0,40,new TextFormat(§_-22V§.§_-pJ§,16,16777215));
         _loc4_.x = int((_loc3_.width - _loc4_.textWidth) * 0.5) - 5;
         addChild(_loc4_);
         this.§_-aA§ = new §_-22V§("",0,60,§_-BO§);
         addChild(this.§_-aA§);
      }
      
      public function set §_-t2j§(param1:int) : void
      {
         this.§_-aA§.text = param1 + "%";
         this.§_-aA§.x = (param1 > 999 ? 39 : 43) - int(this.§_-aA§.textWidth * 0.5);
      }
   }
}

