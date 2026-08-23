package §_-k1c§
{
   import utils.§_-jB§;
   
   public class §_-e15§ extends §_-Q13§
   {
      
      public function §_-e15§(param1:int)
      {
         super(gls("Бонус"),gls("Друзья, которых ты позвал в игру,\nсобрали для тебя {0} #Ac и {1} #Ex",param1,param1 * 10));
         var _loc2_:Array = [{
            "replaceString":"#Ac",
            "imageClass":ImageIconNut,
            "scaleX":0.8,
            "scaleY":0.8,
            "shiftX":-14,
            "shiftY":-12,
            "isHtml":true
         },{
            "replaceString":"#Ex",
            "imageClass":ImageIconExp,
            "scaleX":0.8,
            "scaleY":0.8,
            "shiftX":-8,
            "shiftY":-12,
            "isHtml":true
         }];
         §_-jB§.§_-Y2B§(this.content,_loc2_);
      }
   }
}

