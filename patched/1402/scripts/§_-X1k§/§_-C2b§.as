package §_-X1k§
{
   import flash.utils.getDefinitionByName;
   import utils.StringUtil;
   
   public class §_-C2b§
   {
      
      public static const §_-j20§:int = 1;
      
      public static const §_-wY§:int = 2;
      
      public static const §_-pP§:int = 3;
      
      public static const §_-C2z§:int = 4;
      
      public static const §_-1y§:int = 300;
      
      public static const §_-i1s§:String = "hollow_location";
      
      public static const §_-F1q§:String = "buy_nutty_pass";
      
      public static const §_-78§:Array = [§_-j20§,§_-wY§,§_-pP§];
      
      public static const §_-qA§:Array = ["free","paid","season"];
      
      private static var §_-P2R§:Object = {};
      
      private static var §_-dX§:Object = {};
      
      private static var §_-u21§:Boolean = false;
      
      public function §_-C2b§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         if(§_-u21§)
         {
            return;
         }
         §_-u21§ = true;
         for each(_loc1_ in §_-HZ§.§_-C2g§.versions)
         {
            §_-P2R§[_loc1_.v] = _loc1_;
         }
         for each(_loc2_ in §_-HZ§.§_-C2g§.types)
         {
            §_-dX§[_loc2_.id] = _loc2_;
         }
      }
      
      public static function §_-Z2C§(param1:int) : Object
      {
         return param1 > 0 ? §_-P2R§[param1] : null;
      }
      
      public static function §_-q1g§(param1:int) : int
      {
         var _loc2_:Object = §_-Z2C§(param1);
         return _loc2_ ? int(_loc2_.type) : 0;
      }
      
      public static function §_-k18§(param1:int) : Array
      {
         var _loc2_:Object = §_-Z2C§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.levels) ? _loc2_.levels : [];
      }
      
      public static function §_-X2j§(param1:int) : Object
      {
         var _loc2_:Object = §_-Z2C§(param1);
         return _loc2_ ? _loc2_.max_level : null;
      }
      
      public static function §_-D1g§(param1:int) : Object
      {
         var _loc2_:Object = §_-Z2C§(param1);
         return _loc2_ ? _loc2_.tasks : null;
      }
      
      public static function §_-c1V§(param1:Object) : String
      {
         if(!param1 || !param1.text)
         {
            return "";
         }
         return gls(param1.text,§_-C8§(param1,0),§_-C8§(param1,1),§_-C8§(param1,2));
      }
      
      public static function §_-52F§(param1:int, param2:int) : String
      {
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc3_:Object = §_-D1g§(param1);
         if(!_loc3_)
         {
            return "";
         }
         for each(_loc4_ in §_-qA§)
         {
            for each(_loc5_ in _loc3_[_loc4_])
            {
               if(_loc5_.id == param2)
               {
                  return §_-c1V§(_loc5_);
               }
            }
         }
         return "";
      }
      
      public static function §_-S14§(param1:int) : String
      {
         var _loc2_:Object = §_-Y28§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.caption) ? gls(_loc2_.caption) : gls("Ореховый Пропуск");
      }
      
      public static function §_-Gq§(param1:int) : String
      {
         var _loc2_:Object = §_-Y28§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.caption_prepositional) ? gls(_loc2_.caption_prepositional) : gls("Ореховый Пропуск");
      }
      
      public static function §_-Sz§(param1:int) : int
      {
         var _loc2_:Object = §_-Y28§(param1);
         if(Boolean(_loc2_) && Boolean(_loc2_.colors) && Boolean(_loc2_.colors.main))
         {
            return StringUtil.§_-l2W§(_loc2_.colors.main);
         }
         return 16765562;
      }
      
      public static function §_-U1g§(param1:int) : Class
      {
         var _loc2_:Object = §_-Y28§(param1);
         if(Boolean(_loc2_) && Boolean(_loc2_.graphics) && Boolean(_loc2_.graphics.headerClass))
         {
            return getDefinitionByName(_loc2_.graphics.headerClass) as Class;
         }
         return Class;
      }
      
      public static function §_-K2T§(param1:int) : Class
      {
         var _loc2_:Object = §_-Y28§(param1);
         if(Boolean(_loc2_) && Boolean(_loc2_.graphics) && Boolean(_loc2_.graphics.iconClass))
         {
            return getDefinitionByName(_loc2_.graphics.iconClass) as Class;
         }
         return Class;
      }
      
      public static function §_-MZ§(param1:int) : Array
      {
         var _loc2_:Object = §_-Y28§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.filters) ? _loc2_.filters.header as Array : null;
      }
      
      public static function §_-W15§(param1:int) : int
      {
         var _loc2_:Object = §_-Y28§(param1);
         return _loc2_ ? int(_loc2_.offer_id) : 0;
      }
      
      public static function §_-Ly§(param1:int) : Array
      {
         var _loc2_:Object = §_-Y28§(param1);
         return Boolean(_loc2_) && _loc2_.announcement_pages is Array ? _loc2_.announcement_pages : [];
      }
      
      public static function §_-q1j§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in §_-P2R§)
         {
            _loc1_.push(int(_loc2_));
         }
         return _loc1_;
      }
      
      private static function §_-Y28§(param1:int) : Object
      {
         return §_-dX§[param1];
      }
      
      private static function §_-C8§(param1:Object, param2:int) : String
      {
         if(param2 != 0)
         {
            return "";
         }
         switch(param1.action)
         {
            case §_-i1s§:
               return Boolean(param1.categories) && param1.categories.length > 0 ? §_-at§.§_-13l§(param1.categories[0]).name : "";
            case §_-F1q§:
               return Boolean(param1.categories) && param1.categories.length > 0 ? §_-S14§(param1.categories[0]) : "";
            default:
               return "goal" in param1 ? String(param1.goal) : "";
         }
      }
   }
}

