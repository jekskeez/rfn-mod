package utils
{
   import §_-l2u§.§_-Kb§;
   import flash.display.DisplayObject;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-v1P§
   {
      
      private static const §_-b2A§:Array = ["Орехи","Дупло","Сенсор","Кнопка","Кнопка-сенсор","Квадратный сенсор"];
      
      public function §_-v1P§()
      {
         super();
      }
      
      public static function §_-a1T§(param1:§_-Kb§, param2:Function) : void
      {
         param2.call(null,param1.number,§_-L29§(param1.map));
      }
      
      public static function §_-S1B§(param1:Number) : Boolean
      {
         return param1 < 0.2 && param1 >= 0;
      }
      
      private static function §_-L29§(param1:*) : int
      {
         var objects:Array;
         var alphaCount:int;
         var input:Object = null;
         var entity:* = undefined;
         var object:§_-xn§ = null;
         var data:* = param1;
         try
         {
            input = JSON.parse(data);
         }
         catch(e:Error)
         {
            §_-p2U§.add("Failed to decode JSON map data: " + e,data);
            throw e;
         }
         objects = input[1];
         alphaCount = 0;
         for each(entity in objects)
         {
            if(!(entity == "" || §_-f1b§.§_-N1m§(entity[0]) == null))
            {
               object = new (§_-f1b§.§_-N1m§(entity[0]) as Class)();
               if(§_-b2A§.indexOf(§_-f1b§.getName(object)) != -1 && object is DisplayObject && entity.length == 3 && §_-S1B§(entity[2][1]))
               {
                  alphaCount++;
               }
            }
         }
         return alphaCount;
      }
   }
}

