package §_-I10§
{
   import §_-637§.BodyDestructor;
   import §_-637§.Hammer;
   import §_-83V§.Balk;
   import §_-83V§.BalloonBody;
   import §_-83V§.Box;
   import §_-83V§.PoiseRight;
   import §_-83V§.PortalBlue;
   import §_-83V§.PortalRed;
   import §_-83V§.Trampoline;
   import §_-83V§.WeightBody;
   import §_-83V§.§_-F0§;
   import §_-83V§.§_-GN§;
   import §_-83V§.§_-K1t§;
   import §_-83V§.§_-co§;
   import §_-83V§.§_-d2e§;
   import §_-83V§.§_-e2§;
   import §_-83V§.§_-j2W§;
   import §_-83V§.§_-r14§;
   import §_-83V§.§_-r2G§;
   import §_-83V§.§_-sn§;
   import §_-83V§.§_-t26§;
   import §_-d11§.§_-4P§;
   import §_-d11§.§_-Cj§;
   import §_-d11§.§_-UT§;
   import §_-d11§.§_-p1i§;
   import §_-d11§.§_-sS§;
   import §_-u2r§.§_-418§;
   import §_-u2r§.§_-620§;
   import §_-u2r§.§_-92D§;
   import §_-u2r§.§_-T2M§;
   import §_-u2r§.§_-rE§;
   import §_-u2r§.§_-x1A§;
   import §_-u2r§.§_-y12§;
   import flash.utils.getQualifiedClassName;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-X2T§
   {
      
      private static const DATA:Array = [{
         "class":Balk,
         "text":gls("С помощью палок ты сможешь построить всё что угодно!\nПерсональный предмет - никто кроме тебя не может его касаться."),
         "preview":"Balk"
      },{
         "class":§_-F0§,
         "hide":1
      },{
         "class":Box,
         "text":gls("Ящик послужит тебе ступенькой, также ты сможешь нажать им на кнопку.\nПерсональный предмет - никто кроме тебя не может его касаться."),
         "preview":"Box"
      },{
         "class":§_-t26§,
         "hide":1
      },{
         "class":§_-GN§,
         "hide":1
      },{
         "class":§_-e2§,
         "hide":1
      },{
         "class":§_-d2e§,
         "hide":1
      },{
         "class":§_-sn§,
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
         "class":§_-r14§,
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
         "class":§_-K1t§,
         "hide":1
      },{
         "class":§_-j2W§,
         "hide":1
      },{
         "class":BodyDestructor,
         "text":gls("Поможет тебе убрать с карты установленный тобой предмет. Шаман может удалять любые предметы."),
         "preview":"BodyDestructor"
      },{
         "class":§_-4P§,
         "hide":1,
         "ammo":true
      },{
         "class":BalloonBody,
         "text":gls("На шарике ты сможешь отправиться куда угодно! Перелететь с одного места на другое теперь проще простого!"),
         "preview":"BalloonBody"
      },{
         "class":§_-Cj§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-p1i§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-sS§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-UT§,
         "hide":1,
         "ammo":true
      },{
         "class":§_-co§,
         "hide":1
      },{
         "class":§_-418§,
         "hide":1
      },{
         "class":§_-92D§,
         "hide":1
      },null,{
         "class":Hammer,
         "text":gls("Молоток позволит тебе освободиться из капкана."),
         "preview":"Hammer"
      },{
         "class":§_-r2G§,
         "hide":1
      },null,{
         "class":§_-rE§,
         "hide":1
      },{
         "class":§_-T2M§,
         "hide":1
      },{
         "class":§_-x1A§,
         "hide":1
      },{
         "class":§_-620§,
         "hide":1
      },{
         "class":§_-y12§,
         "hide":1
      },null];
      
      private static var _items:Array = null;
      
      public function §_-X2T§()
      {
         super();
      }
      
      public static function get §_-OF§() : int
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
            while(_loc1_ < §_-OF§)
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
      
      public static function §_-P1d§(param1:int) : Boolean
      {
         return param1 in DATA && Boolean(DATA[param1]) && "ammo" in DATA[param1];
      }
      
      public static function §_-y7§(param1:int) : String
      {
         return DATA[param1]["preview"];
      }
      
      public static function §_-s1f§(param1:int) : Class
      {
         var _loc2_:Object = §_-43X§(param1);
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_["class"];
      }
      
      public static function §_-D2L§(param1:int) : Class
      {
         var _loc2_:Object = §_-43X§(param1);
         var _loc3_:Object = §_-03s§.§_-h2i§(_loc2_["class"]);
         return _loc3_["icon"];
      }
      
      public static function §_-bh§(param1:int) : String
      {
         var _loc2_:Object = §_-43X§(param1);
         var _loc3_:Object = §_-03s§.§_-h2i§(_loc2_["class"]);
         return _loc3_["title"];
      }
      
      public static function §_-33M§(param1:int) : String
      {
         return §_-43X§(param1)["text"];
      }
      
      public static function §_-X21§(param1:*) : int
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
      
      private static function §_-43X§(param1:int) : Object
      {
         return DATA[param1];
      }
   }
}

