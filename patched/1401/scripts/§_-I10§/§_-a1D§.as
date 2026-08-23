package §_-I10§
{
   import flash.utils.getDefinitionByName;
   import utils.StringUtil;
   
   public class §_-a1D§
   {
      
      public static const §_-U14§:int = 1;
      
      public static const §_-fs§:int = 2;
      
      public static const §_-81j§:int = 3;
      
      public static const §_-k1r§:int = 4;
      
      public static const §_-51H§:int = 300;
      
      public static const §_-cX§:String = "hollow_location";
      
      public static const §_-f1H§:String = "buy_nutty_pass";
      
      public static const §_-Yh§:Array = [§_-U14§,§_-fs§,§_-81j§];
      
      public static const §_-lS§:Array = ["free","paid","season"];
      
      private static var §_-a1I§:Object = {};
      
      private static var §_-c2E§:Object = {};
      
      private static var §_-P20§:Boolean = false;
      
      public function §_-a1D§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         if(§_-P20§)
         {
            return;
         }
         §_-P20§ = true;
         for each(_loc1_ in §_-t2V§.§_-N1v§.versions)
         {
            §_-a1I§[_loc1_.v] = _loc1_;
         }
         for each(_loc2_ in §_-t2V§.§_-N1v§.types)
         {
            §_-c2E§[_loc2_.id] = _loc2_;
         }
      }
      
      public static function §_-y13§(param1:int) : Object
      {
         return param1 > 0 ? §_-a1I§[param1] : null;
      }
      
      public static function §_-X1z§(param1:int) : int
      {
         var _loc2_:Object = §_-y13§(param1);
         return _loc2_ ? int(_loc2_.type) : 0;
      }
      
      public static function §_-h2J§(param1:int) : Array
      {
         var _loc2_:Object = §_-y13§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.levels) ? _loc2_.levels : [];
      }
      
      public static function §_-F1I§(param1:int) : Object
      {
         var _loc2_:Object = §_-y13§(param1);
         return _loc2_ ? _loc2_.max_level : null;
      }
      
      public static function §_-i10§(param1:int) : Object
      {
         var _loc2_:Object = §_-y13§(param1);
         return _loc2_ ? _loc2_.tasks : null;
      }
      
      public static function §_-13S§(param1:Object) : String
      {
         if(!param1 || !param1.text)
         {
            return "";
         }
         return gls(param1.text,§_-R1l§(param1,0),§_-R1l§(param1,1),§_-R1l§(param1,2));
      }
      
      public static function §_-N2v§(param1:int, param2:int) : String
      {
         var _loc4_:String = null;
         var _loc5_:Object = null;
         var _loc3_:Object = §_-i10§(param1);
         if(!_loc3_)
         {
            return "";
         }
         for each(_loc4_ in §_-lS§)
         {
            for each(_loc5_ in _loc3_[_loc4_])
            {
               if(_loc5_.id == param2)
               {
                  return §_-13S§(_loc5_);
               }
            }
         }
         return "";
      }
      
      public static function §_-hY§(param1:int) : String
      {
         var _loc2_:Object = §_-83f§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.caption) ? gls(_loc2_.caption) : gls("Ореховый Пропуск");
      }
      
      public static function §_-vT§(param1:int) : String
      {
         var _loc2_:Object = §_-83f§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.caption_prepositional) ? gls(_loc2_.caption_prepositional) : gls("Ореховый Пропуск");
      }
      
      public static function §_-DG§(param1:int) : int
      {
         var _loc2_:Object = §_-83f§(param1);
         if(Boolean(_loc2_) && Boolean(_loc2_.colors) && Boolean(_loc2_.colors.main))
         {
            return StringUtil.§_-C1R§(_loc2_.colors.main);
         }
         return 16765562;
      }
      
      public static function §_-pp§(param1:int) : Class
      {
         var _loc2_:Object = §_-83f§(param1);
         if(Boolean(_loc2_) && Boolean(_loc2_.graphics) && Boolean(_loc2_.graphics.headerClass))
         {
            return getDefinitionByName(_loc2_.graphics.headerClass) as Class;
         }
         return Class;
      }
      
      public static function §_-1A§(param1:int) : Class
      {
         var _loc2_:Object = §_-83f§(param1);
         if(Boolean(_loc2_) && Boolean(_loc2_.graphics) && Boolean(_loc2_.graphics.iconClass))
         {
            return getDefinitionByName(_loc2_.graphics.iconClass) as Class;
         }
         return Class;
      }
      
      public static function §_-83R§(param1:int) : Array
      {
         var _loc2_:Object = §_-83f§(param1);
         return Boolean(_loc2_) && Boolean(_loc2_.filters) ? _loc2_.filters.header as Array : null;
      }
      
      public static function §_-w§(param1:int) : int
      {
         var _loc2_:Object = §_-83f§(param1);
         return _loc2_ ? int(_loc2_.offer_id) : 0;
      }
      
      public static function §_-1X§(param1:int) : Array
      {
         var _loc2_:Object = §_-83f§(param1);
         return Boolean(_loc2_) && _loc2_.announcement_pages is Array ? _loc2_.announcement_pages : [];
      }
      
      public static function §_-L1F§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in §_-a1I§)
         {
            _loc1_.push(int(_loc2_));
         }
         return _loc1_;
      }
      
      private static function §_-83f§(param1:int) : Object
      {
         return §_-c2E§[param1];
      }
      
      private static function §_-R1l§(param1:Object, param2:int) : String
      {
         if(param2 != 0)
         {
            return "";
         }
         switch(param1.action)
         {
            case §_-cX§:
               return Boolean(param1.categories) && param1.categories.length > 0 ? §_-q1p§.§_-l29§(param1.categories[0]).name : "";
            case §_-f1H§:
               return Boolean(param1.categories) && param1.categories.length > 0 ? §_-hY§(param1.categories[0]) : "";
            default:
               return "goal" in param1 ? String(param1.goal) : "";
         }
      }
   }
}

