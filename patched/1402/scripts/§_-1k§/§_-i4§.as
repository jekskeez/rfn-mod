package §_-1k§
{
   import protocol.§_-s2l§;
   import utils.§_-K1Y§;
   
   public class §_-i4§ extends §_-G2R§
   {
      
      private var §_-u21§:Boolean = false;
      
      private var map:int = 0;
      
      private var location:int = 0;
      
      public function §_-i4§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param4);
         this.map = param3 & 0xFFFFFF;
         this.location = param3 >>> 24 & 0xFF;
      }
      
      override public function §_-O1s§() : void
      {
         if(this.§_-u21§)
         {
            return;
         }
         this.§_-u21§ = true;
         super.§_-O1s§();
         addChild(new PostElementAdmin());
         addChild(new §_-i5§("<body><b>" + gls("Информация") + "</b></body>",85,5,style));
         var _loc1_:§_-i5§ = new §_-i5§("",85,20,style);
         addChild(_loc1_);
         switch(this.type)
         {
            case §_-s2l§.MAP_APPROVED:
               _loc1_.htmlText = gls("<body>Поздравляем! Твоя карта №{0} одобрена модератором\nв локацию «{1}»!\nВ награду ты получаешь  <b>{2}</b> #Ac.",this.map,§_-at§.§_-13l§(this.location).name,§_-at§.§_-13l§(this.location).award);
               §_-K1Y§.§_-P2W§(_loc1_,"#Ac",ImageIconNut,0.6,0.6,-_loc1_.x - 1,-_loc1_.y + 1,true);
               break;
            case §_-s2l§.§_-W1y§:
               _loc1_.htmlText = gls("<body>К сожалению, твоя карта №{0} отклонена модератором.\nПопытайся снова! Но помни: твоя карта должна быть\nнеповторимой и интересной! Удачи!",this.map);
               break;
            case §_-s2l§.§_-03y§:
               _loc1_.htmlText = gls("<body>Дорогой друг! Мы закрываем возможность отправки карт\nна модерацию по причине реконструкции всех локаций.\nОрехи, потраченные на отправку карт, возвращены.");
         }
      }
   }
}

