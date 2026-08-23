package §_-81S§
{
   import protocol.§_-S2I§;
   import utils.§_-jB§;
   
   public class §_-z1o§ extends §_-33w§
   {
      
      private var §_-P20§:Boolean = false;
      
      private var map:int = 0;
      
      private var location:int = 0;
      
      public function §_-z1o§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param4);
         this.map = param3 & 0xFFFFFF;
         this.location = param3 >>> 24 & 0xFF;
      }
      
      override public function §_-027§() : void
      {
         if(this.§_-P20§)
         {
            return;
         }
         this.§_-P20§ = true;
         super.§_-027§();
         addChild(new PostElementAdmin());
         addChild(new §_-22V§("<body><b>" + gls("Информация") + "</b></body>",85,5,style));
         var _loc1_:§_-22V§ = new §_-22V§("",85,20,style);
         addChild(_loc1_);
         switch(this.type)
         {
            case §_-S2I§.MAP_APPROVED:
               _loc1_.htmlText = gls("<body>Поздравляем! Твоя карта №{0} одобрена модератором\nв локацию «{1}»!\nВ награду ты получаешь  <b>{2}</b> #Ac.",this.map,§_-q1p§.§_-l29§(this.location).name,§_-q1p§.§_-l29§(this.location).award);
               §_-jB§.§_-fG§(_loc1_,"#Ac",ImageIconNut,0.6,0.6,-_loc1_.x - 1,-_loc1_.y + 1,true);
               break;
            case §_-S2I§.§_-vl§:
               _loc1_.htmlText = gls("<body>К сожалению, твоя карта №{0} отклонена модератором.\nПопытайся снова! Но помни: твоя карта должна быть\nнеповторимой и интересной! Удачи!",this.map);
               break;
            case §_-S2I§.§_-y24§:
               _loc1_.htmlText = gls("<body>Дорогой друг! Мы закрываем возможность отправки карт\nна модерацию по причине реконструкции всех локаций.\nОрехи, потраченные на отправку карт, возвращены.");
         }
      }
   }
}

