package §_-bN§
{
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-LD§ extends Dialog
   {
      
      private static var _instance:§_-LD§;
      
      public function §_-LD§()
      {
         super(gls("Монеты за друга!"));
         var _loc1_:CoinsForFriendImage = new CoinsForFriendImage();
         _loc1_.x = -48;
         addChild(_loc1_);
         var _loc2_:TextFormat = new TextFormat(null,12,4858895,true);
         _loc2_.align = TextFormatAlign.CENTER;
         var _loc3_:§_-i5§ = new §_-i5§(gls("Твой друг принял приглашение в игру.\nТвоё вознаграждение"),10,5,_loc2_);
         addChild(_loc3_);
         var _loc4_:§_-K2G§ = new §_-K2G§(gls("Забрать"));
         _loc4_.x = 90;
         _loc4_.y = 150;
         _loc4_.addEventListener(MouseEvent.CLICK,hide);
         addChild(_loc4_);
         place();
         this.width = 300;
         this.height = 230;
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-LD§();
         }
         _instance.show();
      }
   }
}

