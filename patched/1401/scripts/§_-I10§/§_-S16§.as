package §_-I10§
{
   import §_-k1c§.§_-Q13§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-S16§
   {
      
      private static var §_-P20§:Boolean = false;
      
      private static var §_-z2P§:int = §_-S2I§.§_-61T§;
      
      private static var §_-yK§:§_-Q13§ = null;
      
      private static var §_-t1t§:§_-Q13§ = null;
      
      private static var §_-kL§:§_-Q13§ = null;
      
      private static var §_-78§:§_-Q13§ = null;
      
      public function §_-S16§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-P20§)
         {
            return;
         }
         §_-P20§ = true;
         Connection.listen(§_-o2C§,[§_-S2I§.§_-i2S§]);
      }
      
      public static function get §_-j1Q§() : Boolean
      {
         if(§_-z2P§ != §_-S2I§.§_-ub§)
         {
            return false;
         }
         if(!§_-t1t§)
         {
            §_-t1t§ = new §_-Q13§(gls("Действие недоступно"),gls("На сервере начались технические работы.\nПожалуйста, зайди немного позже."));
         }
         §_-t1t§.show();
         return true;
      }
      
      public static function §_-R2D§() : void
      {
         switch(§_-z2P§)
         {
            case §_-S2I§.§_-ub§:
               if(!§_-yK§)
               {
                  §_-yK§ = new §_-Q13§(gls("Работы на сервере"),gls("На сервере начинаются технические работы,\nигра будет недоступна в течение некоторого времени.\nПриносим извинения за доставленные неудобства."));
               }
               §_-yK§.show();
               break;
            case §_-S2I§.§_-nP§:
               if(!§_-kL§)
               {
                  §_-kL§ = new §_-Q13§(gls("Обновление"),gls("Приложение было обновлено. Чтобы воспользоваться\nновым функционалом, необходимо перезапустить игру."));
               }
               §_-kL§.show();
               break;
            case §_-S2I§.§_-23a§:
               if(!§_-78§)
               {
                  §_-78§ = new §_-Q13§(gls("Внимание!"),gls("От твоего имени было повторно запущено приложение."));
               }
               §_-78§.show();
         }
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         §_-z2P§ = param1[0];
         §_-R2D§();
      }
   }
}

