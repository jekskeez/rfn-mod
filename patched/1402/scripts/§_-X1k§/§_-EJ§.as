package §_-X1k§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-EJ§
   {
      
      public static const §_-aO§:Array = [{
         "name":gls("Смайлы «Белки»"),
         "description":gls("Большой набор смайлов для белки.\nПоказывайте игрокам свои уникальные эмоции."),
         "icon":"ImageSmilePack0"
      },{
         "name":gls("Смайлы «Заяц»"),
         "description":gls("Большой набор смайлов для белки.\nПоказывайте игрокам свои уникальные эмоции."),
         "icon":"ImageSmilePack0"
      },{
         "name":gls("Смайлы «Новый год»"),
         "description":gls("Большой набор смайлов для белки.\nПоказывайте игрокам свои уникальные эмоции."),
         "icon":"ImageSmilePack0"
      }];
      
      public static const §_-X2R§:Array = [gls("Улыбаюсь"),gls("Смеюсь"),gls("Смущаюсь"),gls("Целую"),gls("Лицо рука"),gls("Cкууучно"),gls("Удивлён"),gls("Грущу"),gls("Плачу"),gls("Злюсь"),gls("Смеюсь"),gls("Целую"),gls("Плачу"),gls("Смущаюсь"),gls("В отчаянии"),gls("Смеюсь"),gls("Улыбаюсь"),gls("Смущаюсь"),gls("Целую"),gls("В отчаянии"),gls("Сплю"),gls("Удивлён"),gls("Огорчён"),gls("Плачу"),gls("Злюсь"),gls("Умиляюсь"),gls("В шоке"),gls("Дразню"),gls("Извини")];
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public static var smiles:Array = [];
      
      public function §_-EJ§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-62E§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         smiles = param1[0];
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.SMILES_CHANGED));
      }
   }
}

