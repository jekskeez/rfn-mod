package §_-l2f§
{
   import §_-X1k§.§_-u2n§;
   import §_-i2r§.§_-e2O§;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-I2u§ extends §_-e2O§
   {
      
      private static const §_-mx§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,8280118,false,null,null,null,null,"center");
      
      private static const §_-9H§:TextFormat = new TextFormat(§_-i5§.§_-c10§,24,16777215,true);
      
      private var seenEvents:Array;
      
      public function §_-I2u§(param1:int = 2, param2:Array = null)
      {
         super(DialogPromoHeader,gls("Больше Баллов"),gls("Только сегодня получай х{0} очков Орехового Пропуска, пока идет акция!",param1),true,false,null,false,[1,32,4,-43],null,null,[-10,5,100,15]);
         this.seenEvents = param2;
         this.init(param1);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(this.seenEvents)
         {
            §_-u2n§.§_-KQ§(this.seenEvents);
         }
         super.hide(param1);
      }
      
      private function init(param1:int) : void
      {
         var _loc2_:Sprite = new DialogPromoView();
         _loc2_.x = _loc2_.width * 0.5 - this.§_-01q§ + 5;
         _loc2_.y = 60;
         addChild(_loc2_);
         var _loc3_:Sprite = new ImageIconNuttyPass();
         _loc3_.scaleX = _loc3_.scaleY = 4;
         _loc3_.x = -_loc3_.width * 0.5;
         _loc3_.y = -_loc3_.height * 0.5 + 15;
         _loc2_.addChild(_loc3_);
         var _loc4_:Sprite = new DiscountImage();
         _loc4_.scaleX = _loc4_.scaleY = 0.75;
         _loc4_.x = _loc3_.x - _loc4_.width * 0.25;
         _loc4_.y = _loc3_.y - _loc4_.height * 0.25;
         _loc2_.addChild(_loc4_);
         var _loc5_:§_-i5§ = new §_-i5§(gls("x{0}",param1),8,16,§_-9H§,_loc4_.width * 2);
         _loc5_.rotation = -18;
         _loc4_.addChild(_loc5_);
         var _loc6_:int = this.width - this.§_-01q§ - this.§_-7N§;
         var _loc7_:§_-i5§ = new §_-i5§(gls("Акция продлится ограниченное время - спеши воспользоваться!"),0,0,§_-mx§,320);
         _loc7_.x = (_loc6_ - _loc7_.width) * 0.5;
         _loc7_.y = _loc2_.y + _loc3_.height + 25;
         addChild(_loc7_);
         var _loc8_:§_-K2G§ = new §_-K2G§(gls("Отлично!"));
         _loc8_.addEventListener(MouseEvent.CLICK,this.hide);
         _loc8_.x = (_loc6_ - _loc8_.width) * 0.5;
         _loc8_.y = _loc7_.y + _loc7_.height + 5;
         addChild(_loc8_);
         this.height = this.topOffset + this.§_-f2d§ + (_loc2_.height - _loc2_.y - 15) + _loc7_.height + _loc8_.height + 30;
         setChildIndex(_loc2_,getChildIndex(this.§_-n2m§) - 1);
      }
   }
}

