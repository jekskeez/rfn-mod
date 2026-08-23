package §_-Qy§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-x2d§ extends Sprite
   {
      
      public static const §_-9H§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,24,16777215);
      
      private var §_-t3§:§_-i5§ = null;
      
      public function §_-x2d§(param1:String = "", param2:Array = null)
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
         var _loc4_:§_-i5§ = new §_-i5§(param1 == "" ? gls("Выгода") : param1,0,40,new TextFormat(§_-i5§.§_-p1s§,16,16777215));
         _loc4_.x = int((_loc3_.width - _loc4_.textWidth) * 0.5) - 5;
         addChild(_loc4_);
         this.§_-t3§ = new §_-i5§("",0,60,§_-9H§);
         addChild(this.§_-t3§);
      }
      
      public function set §_-52M§(param1:int) : void
      {
         this.§_-t3§.text = param1 + "%";
         this.§_-t3§.x = (param1 > 999 ? 39 : 43) - int(this.§_-t3§.textWidth * 0.5);
      }
   }
}

