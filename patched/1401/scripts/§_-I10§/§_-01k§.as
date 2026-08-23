package §_-I10§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-01k§
   {
      
      public static const §_-p2R§:Array = [{
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
      
      public static const §_-ZC§:Array = [gls("Улыбаюсь"),gls("Смеюсь"),gls("Смущаюсь"),gls("Целую"),gls("Лицо рука"),gls("Cкууучно"),gls("Удивлён"),gls("Грущу"),gls("Плачу"),gls("Злюсь"),gls("Смеюсь"),gls("Целую"),gls("Плачу"),gls("Смущаюсь"),gls("В отчаянии"),gls("Смеюсь"),gls("Улыбаюсь"),gls("Смущаюсь"),gls("Целую"),gls("В отчаянии"),gls("Сплю"),gls("Удивлён"),gls("Огорчён"),gls("Плачу"),gls("Злюсь"),gls("Умиляюсь"),gls("В шоке"),gls("Дразню"),gls("Извини")];
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public static var smiles:Array = [];
      
      public function §_-01k§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-33V§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         smiles = param1[0];
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.SMILES_CHANGED));
      }
   }
}

