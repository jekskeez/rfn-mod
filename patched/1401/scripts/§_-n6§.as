package
{
   import flash.Boot;
   import flash.utils.Dictionary;
   
   public class §_-n6§
   {
      
      public var h:Dictionary;
      
      public function §_-n6§()
      {
         if(Boot.§_-s2I§)
         {
            return;
         }
         h = new Dictionary();
      }
      
      public function toString() : String
      {
         var _loc4_:* = null as String;
         var _loc1_:§_-63L§ = new §_-63L§();
         _loc1_.b += "{";
         var _loc2_:* = §_-W2L§();
         var _loc3_:* = _loc2_;
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            _loc1_.b += _loc4_;
            _loc1_.b += " => ";
            _loc1_.b += §_-630§.string(get(_loc4_));
            if(_loc2_.hasNext())
            {
               _loc1_.b += ", ";
            }
         }
         _loc1_.b += "}";
         return _loc1_.b;
      }
      
      public function set(param1:String, param2:Object) : void
      {
         h["$" + param1] = param2;
      }
      
      public function remove(param1:String) : Boolean
      {
         param1 = "$" + param1;
         if(!h.hasOwnProperty(param1))
         {
            return false;
         }
         delete h[param1];
         return true;
      }
      
      public function §_-W2L§() : Object
      {
         var _loc2_:* = 0;
         var _loc1_:Array = [];
         var _loc3_:* = h;
         for(_loc2_ in _loc3_)
         {
            _loc1_.push((_loc2_).substr(1));
         }
         return _loc1_.iterator();
      }
      
      public function iterator() : Object
      {
         §§push("ref");
         §§push(h);
         §§push("it");
         var _loc2_:* = 0;
         var _loc1_:Array = [];
         var _loc3_:* = h;
         for(_loc2_ in _loc3_)
         {
            _loc1_.push(_loc2_);
         }
         return null;
      }
      
      public function get(param1:String) : Object
      {
         return h["$" + param1];
      }
      
      public function §_-Da§(param1:String) : Boolean
      {
         return h.hasOwnProperty("$" + param1);
      }
   }
}

