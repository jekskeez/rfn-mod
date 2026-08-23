package §_-em§
{
   import §_-I10§.§_-82N§;
   import §_-I1s§.§_-rt§;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-I1p§ extends §_-rt§
   {
      
      private static const §_-H1y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,8280118,false,null,null,null,null,"center");
      
      private static const §_-BO§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,24,16777215,true);
      
      private var seenEvents:Array;
      
      public function §_-I1p§(param1:int = 2, param2:Array = null)
      {
         super(DialogPromoHeader,gls("Больше Баллов"),gls("Только сегодня получай х{0} очков Орехового Пропуска, пока идет акция!",param1),true,false,null,false,[1,32,4,-43],null,null,[-10,5,100,15]);
         this.seenEvents = param2;
         this.init(param1);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(this.seenEvents)
         {
            §_-82N§.§_-s1o§(this.seenEvents);
         }
         super.hide(param1);
      }
      
      private function init(param1:int) : void
      {
         var _loc2_:Sprite = new DialogPromoView();
         _loc2_.x = _loc2_.width * 0.5 - this.§_-R1Y§ + 5;
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
         var _loc5_:§_-22V§ = new §_-22V§(gls("x{0}",param1),8,16,§_-BO§,_loc4_.width * 2);
         _loc5_.rotation = -18;
         _loc4_.addChild(_loc5_);
         var _loc6_:int = this.width - this.§_-R1Y§ - this.§_-4n§;
         var _loc7_:§_-22V§ = new §_-22V§(gls("Акция продлится ограниченное время - спеши воспользоваться!"),0,0,§_-H1y§,320);
         _loc7_.x = (_loc6_ - _loc7_.width) * 0.5;
         _loc7_.y = _loc2_.y + _loc3_.height + 25;
         addChild(_loc7_);
         var _loc8_:§_-j18§ = new §_-j18§(gls("Отлично!"));
         _loc8_.addEventListener(MouseEvent.CLICK,this.hide);
         _loc8_.x = (_loc6_ - _loc8_.width) * 0.5;
         _loc8_.y = _loc7_.y + _loc7_.height + 5;
         addChild(_loc8_);
         this.height = this.topOffset + this.§_-JZ§ + (_loc2_.height - _loc2_.y - 15) + _loc7_.height + _loc8_.height + 30;
         setChildIndex(_loc2_,getChildIndex(this.§_-hd§) - 1);
      }
   }
}

