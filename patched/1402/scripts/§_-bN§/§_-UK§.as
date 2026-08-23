package §_-bN§
{
   import utils.§_-K1Y§;
   
   public class §_-UK§ extends §_-Fk§
   {
      
      public function §_-UK§(param1:int)
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
         §_-K1Y§.§_-31q§(this.content,_loc2_);
      }
   }
}

