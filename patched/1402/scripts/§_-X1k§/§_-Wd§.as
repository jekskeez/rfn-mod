package §_-X1k§
{
   import §_-bN§.§_-Fk§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-Wd§
   {
      
      private static var §_-u21§:Boolean = false;
      
      private static var §_-X2X§:int = §_-s2l§.§_-s1H§;
      
      private static var §_-Ni§:§_-Fk§ = null;
      
      private static var §_-Z1X§:§_-Fk§ = null;
      
      private static var §_-mu§:§_-Fk§ = null;
      
      private static var §_-LC§:§_-Fk§ = null;
      
      public function §_-Wd§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-u21§)
         {
            return;
         }
         §_-u21§ = true;
         Connection.listen(§_-x2f§,[§_-s2l§.§_-E1C§]);
      }
      
      public static function get §_-xR§() : Boolean
      {
         if(§_-X2X§ != §_-s2l§.§_-02b§)
         {
            return false;
         }
         if(!§_-Z1X§)
         {
            §_-Z1X§ = new §_-Fk§(gls("Действие недоступно"),gls("На сервере начались технические работы.\nПожалуйста, зайди немного позже."));
         }
         §_-Z1X§.show();
         return true;
      }
      
      public static function §_-H2q§() : void
      {
         switch(§_-X2X§)
         {
            case §_-s2l§.§_-02b§:
               if(!§_-Ni§)
               {
                  §_-Ni§ = new §_-Fk§(gls("Работы на сервере"),gls("На сервере начинаются технические работы,\nигра будет недоступна в течение некоторого времени.\nПриносим извинения за доставленные неудобства."));
               }
               §_-Ni§.show();
               break;
            case §_-s2l§.§_-B3w§:
               if(!§_-mu§)
               {
                  §_-mu§ = new §_-Fk§(gls("Обновление"),gls("Приложение было обновлено. Чтобы воспользоваться\nновым функционалом, необходимо перезапустить игру."));
               }
               §_-mu§.show();
               break;
            case §_-s2l§.§_-12h§:
               if(!§_-LC§)
               {
                  §_-LC§ = new §_-Fk§(gls("Внимание!"),gls("От твоего имени было повторно запущено приложение."));
               }
               §_-LC§.show();
         }
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         §_-X2X§ = param1[0];
         §_-H2q§();
      }
   }
}

