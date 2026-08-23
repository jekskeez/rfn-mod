package §_-bN§
{
   import flash.text.TextFormat;
   
   public class §_-j1F§ extends Dialog
   {
      
      public function §_-j1F§()
      {
         super(gls("Верни друзей"));
         var _loc1_:ImageNoFriends = new ImageNoFriends();
         _loc1_.y = 40;
         _loc1_.x = 205 - int(_loc1_.width * 0.5);
         addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("В данный момент тебе некого возвращать."),0,10,new TextFormat(null,14,4604991,true));
         _loc2_.x = 190 - int(_loc2_.textWidth * 0.5);
         addChild(_loc2_);
         place();
         this.width = 410;
         this.height = 350;
      }
   }
}

