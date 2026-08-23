package utils
{
   import §_-Rj§.§_-g1L§;
   import flash.display.DisplayObject;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-qd§
   {
      
      private static const §_-71Z§:Array = ["Орехи","Дупло","Сенсор","Кнопка","Кнопка-сенсор","Квадратный сенсор"];
      
      public function §_-qd§()
      {
         super();
      }
      
      public static function §_-yD§(param1:§_-g1L§, param2:Function) : void
      {
         param2.call(null,param1.number,§_-13A§(param1.map));
      }
      
      public static function §_-Y2q§(param1:Number) : Boolean
      {
         return param1 < 0.2 && param1 >= 0;
      }
      
      private static function §_-13A§(param1:*) : int
      {
         var objects:Array;
         var alphaCount:int;
         var input:Object = null;
         var entity:* = undefined;
         var object:§_-63Q§ = null;
         var data:* = param1;
         try
         {
            input = JSON.parse(data);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Failed to decode JSON map data: " + e,data);
            throw e;
         }
         objects = input[1];
         alphaCount = 0;
         for each(entity in objects)
         {
            if(!(entity == "" || §_-03s§.§_-F1T§(entity[0]) == null))
            {
               object = new (§_-03s§.§_-F1T§(entity[0]) as Class)();
               if(§_-71Z§.indexOf(§_-03s§.getName(object)) != -1 && object is DisplayObject && entity.length == 3 && §_-Y2q§(entity[2][1]))
               {
                  alphaCount++;
               }
            }
         }
         return alphaCount;
      }
   }
}

