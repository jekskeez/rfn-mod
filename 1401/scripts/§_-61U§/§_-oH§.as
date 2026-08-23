package §_-61U§
{
   import §_-k1c§.Dialog;
   import flash.text.TextFormat;
   
   public class §_-oH§ extends Dialog
   {
      
      private static var _instance:§_-oH§ = null;
      
      public function §_-oH§()
      {
         super(gls("Обмен недоступен"));
         var _loc1_:ImageNoCollections = new ImageNoCollections();
         _loc1_.y = 40;
         _loc1_.x = 205 - int(_loc1_.width * 0.5);
         addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("К сожалению, у вас нет нужных другу предметов."),0,10,new TextFormat(null,14,4604991,true));
         _loc2_.x = 190 - int(_loc2_.textWidth * 0.5);
         addChild(_loc2_);
         place();
         this.width = 410;
         this.height = 350;
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-oH§();
         }
         _instance.show();
      }
   }
}

