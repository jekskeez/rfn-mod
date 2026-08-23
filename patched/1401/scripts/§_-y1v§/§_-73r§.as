package §_-y1v§
{
   import hscript.Token;
   
   public class §_-73r§
   {
      
      public var §_-gi§:§_-Gj§;
      
      public function §_-73r§()
      {
      }
      
      public function toString() : String
      {
         var _loc1_:Array = [];
         var _loc2_:§_-Gj§ = §_-gi§;
         while(_loc2_ != null)
         {
            _loc1_.push(_loc2_.§_-Rs§);
            _loc2_ = _loc2_.next;
         }
         return "{" + _loc1_.join(",") + "}";
      }
      
      public function remove(param1:Token) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:§_-Gj§ = §_-gi§;
         while(_loc3_ != null)
         {
            if(_loc3_.§_-Rs§ == param1)
            {
               if(_loc2_ == null)
               {
                  §_-gi§ = _loc3_.next;
               }
               else
               {
                  _loc2_.next = _loc3_.next;
               }
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.next;
         }
         return _loc3_ != null;
      }
      
      public function pop() : Token
      {
         var _loc1_:§_-Gj§ = §_-gi§;
         if(_loc1_ == null)
         {
            return null;
         }
         §_-gi§ = _loc1_.next;
         return _loc1_.§_-Rs§;
      }
      
      public function iterator() : Object
      {
         var l:§_-Gj§ = §_-gi§;
         return {
            "hasNext":function():Boolean
            {
               return l != null;
            },
            "next":function():Token
            {
               var _loc1_:§_-Gj§ = l;
               l = _loc1_.next;
               return _loc1_.§_-Rs§;
            }
         };
      }
      
      public function isEmpty() : Boolean
      {
         return §_-gi§ == null;
      }
      
      public function first() : Token
      {
         return §_-gi§ == null ? null : §_-gi§.§_-Rs§;
      }
      
      public function add(param1:Token) : void
      {
         §_-gi§ = new §_-Gj§(param1,§_-gi§);
      }
   }
}

