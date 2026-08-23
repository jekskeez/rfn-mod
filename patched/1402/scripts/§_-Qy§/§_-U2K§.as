package §_-Qy§
{
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-U2K§ extends LearningKey
   {
      
      private static const §_-G1y§:TextFormat = new TextFormat(null,14,0,true,null,null,null,null,TextFormatAlign.CENTER);
      
      public function §_-U2K§(param1:String)
      {
         super();
         var _loc2_:§_-i5§ = new §_-i5§(param1,0,0,§_-G1y§,this.width);
         _loc2_.mouseEnabled = false;
         _loc2_.x = -1;
         _loc2_.y = (this.height - _loc2_.height) * 0.5 - 2;
         addChild(_loc2_);
      }
   }
}

