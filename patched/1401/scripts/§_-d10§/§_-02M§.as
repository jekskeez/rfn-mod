package §_-d10§
{
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-02M§ extends LearningKey
   {
      
      private static const §_-N1Y§:TextFormat = new TextFormat(null,14,0,true,null,null,null,null,TextFormatAlign.CENTER);
      
      public function §_-02M§(param1:String)
      {
         super();
         var _loc2_:§_-22V§ = new §_-22V§(param1,0,0,§_-N1Y§,this.width);
         _loc2_.mouseEnabled = false;
         _loc2_.x = -1;
         _loc2_.y = (this.height - _loc2_.height) * 0.5 - 2;
         addChild(_loc2_);
      }
   }
}

