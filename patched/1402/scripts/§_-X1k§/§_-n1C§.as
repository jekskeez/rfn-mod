package §_-X1k§
{
   import §_-8Q§.Balk;
   import §_-8Q§.BalloonBody;
   import §_-8Q§.Box;
   import §_-8Q§.PoiseRight;
   import §_-8Q§.PortalBlue;
   import §_-8Q§.PortalRed;
   import §_-8Q§.Trampoline;
   import §_-8Q§.WeightBody;
   import §_-8Q§.§_-21l§;
   import §_-8Q§.§_-622§;
   import §_-8Q§.§_-A2Q§;
   import §_-8Q§.§_-HR§;
   import §_-8Q§.§_-MV§;
   import §_-8Q§.§_-e1P§;
   import §_-8Q§.§_-ep§;
   import §_-8Q§.§_-o25§;
   import §_-8Q§.§_-q2D§;
   import §_-8Q§.§_-y1I§;
   import §_-8Q§.§_-z2J§;
   import §_-F5§.BodyDestructor;
   import §_-F5§.Hammer;
   import §_-I1q§.§_-C3Q§;
   import §_-I1q§.§_-Fr§;
   import §_-I1q§.§_-IY§;
   import §_-I1q§.§_-K8§;
   import §_-I1q§.§_-d2U§;
   import §_-I1q§.§_-r2T§;
   import §_-I1q§.§_-w27§;
   import §_-g16§.§_-713§;
   import §_-g16§.§_-CM§;
   import §_-g16§.§_-L1n§;
   import §_-g16§.§_-j1C§;
   import §_-g16§.§_-w3§;
   import flash.utils.getQualifiedClassName;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-n1C§
   {
      
      private static const DATA:Array = [{
         "class":Balk,
         "text":gls("С помощью палок ты сможешь построить всё что угодно!\nПерсональный предмет - никто кроме тебя не может его касаться."),
         "preview":"Balk"
      },{
         "class":§_-622§,
         "hide":1
      },{
         "class":Box,
         "text":gls("Ящик послужит тебе ступенькой, также ты сможешь нажать им на кнопку.\nПерсональный предмет - никто кроме тебя не может его касаться."),
         "preview":"Box"
      },{
         "class":§_-21l§,
         "hide":1
      },{
         "class":§_-y1I§,
         "hide":1
      },{
         "class":§_-ep§,
         "hide":1
      },{
         "class":§_-MV§,
         "hide":1
      },{
         "class":§_-HR§,
         "hide":1
      },{
         "class":WeightBody,
         "text":gls("Гирей ты сможешь привести в действие многие механизмы, например, лифты."),
         "preview":"WeightBody"
      },{
         "class":Trampoline,
         "text":gls("С его помощью ты сможешь подпрыгнуть намного выше обычного, почти взлететь!\nПерсональный предмет - никто кроме тебя не может его касаться."),
         "preview":"Trampoline"
      },{
         "class":§_-o25§,
         "hide":1
      },{
         "class":PoiseRight,
         "text":gls("Ядром ты можешь толкать других белок, нажимать труднодоступные кнопки и высоко подкидывать самого себя!"),
         "preview":"PoiseRight"
      },{
         "class":PortalBlue,
         "text":gls("Портал поможет тебе мгновенно переместиться из одного места в другое."),
         "preview":"PortalBlue"
      },{
         "class":PortalRed,
         "text":gls("Портал поможет тебе мгновенно переместиться из одного места в другое."),
         "preview":"PortalRed"
      },{
         "class":§_-z2J§,
         "hide":1
      },{
         "class":§_-q2D§,
         "hide":1
      },{
         "class":BodyDestructor,
         "text":gls("Поможет тебе убрать с карты установленный тобой предмет. Шаман может удалять любые предметы."),
         "preview":"BodyDestructor"
      },{
         "class":§_-w3§,
         "hide":1,
         "ammo":true
      },{
         "class":BalloonBody,
         "text":gls("На шарике ты сможешь отправиться куда угодно! Перелететь с одного места на другое теперь проще простого!"),
         "preview":"BalloonBody"
      },{
         "class":§_-713§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-CM§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-L1n§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-j1C§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-e1P§,
         "hide":1
      },{
         "class":§_-IY§,
         "hide":1
      },{
         "class":§_-Fr§,
         "hide":1
      },null,{
         "class":Hammer,
         "text":gls("Молоток позволит тебе освободиться из капкана."),
         "preview":"Hammer"
      },{
         "class":§_-A2Q§,
         "hide":1
      },null,{
         "class":§_-K8§,
         "hide":1
      },{
         "class":§_-w27§,
         "hide":1
      },{
         "class":§_-d2U§,
         "hide":1
      },{
         "class":§_-r2T§,
         "hide":1
      },{
         "class":§_-C3Q§,
         "hide":1
      },null];
      
      private static var _items:Array = null;
      
      public function §_-n1C§()
      {
         super();
      }
      
      public static function get §_-E1w§() : int
      {
         return DATA.length;
      }
      
      public static function get items() : Array
      {
         var _loc1_:int = 0;
         if(!_items)
         {
            _items = [];
            _loc1_ = 0;
            while(_loc1_ < §_-E1w§)
            {
               if(!(DATA[_loc1_] == null || !("text" in DATA[_loc1_])))
               {
                  _items.push(_loc1_);
               }
               _loc1_++;
            }
         }
         return _items;
      }
      
      public static function §_-52K§(param1:int) : Boolean
      {
         return param1 in DATA && Boolean(DATA[param1]) && "ammo" in DATA[param1];
      }
      
      public static function §_-Q2U§(param1:int) : String
      {
         return DATA[param1]["preview"];
      }
      
      public static function §_-71N§(param1:int) : Class
      {
         var _loc2_:Object = §_-815§(param1);
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_["class"];
      }
      
      public static function §_-92G§(param1:int) : Class
      {
         var _loc2_:Object = §_-815§(param1);
         var _loc3_:Object = §_-f1b§.§_-N1§(_loc2_["class"]);
         return _loc3_["icon"];
      }
      
      public static function §_-3f§(param1:int) : String
      {
         var _loc2_:Object = §_-815§(param1);
         var _loc3_:Object = §_-f1b§.§_-N1§(_loc2_["class"]);
         return _loc3_["title"];
      }
      
      public static function §_-c1Z§(param1:int) : String
      {
         return §_-815§(param1)["text"];
      }
      
      public static function §_-q2W§(param1:*) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < DATA.length)
         {
            if(DATA[_loc2_])
            {
               if(param1 is Class && param1 == DATA[_loc2_]["class"])
               {
                  return _loc2_;
               }
               if(getQualifiedClassName(param1) == getQualifiedClassName(DATA[_loc2_]["class"]))
               {
                  return _loc2_;
               }
            }
            _loc2_++;
         }
         return -1;
      }
      
      private static function §_-815§(param1:int) : Object
      {
         return DATA[param1];
      }
   }
}

