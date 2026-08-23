package §_-735§
{
   import hscript.Token;
   
   public class §_-4k§
   {
      
      public var §_-T2M§:§_-i2n§;
      
      public function §_-4k§()
      {
      }
      
      public function toString() : String
      {
         var _loc1_:Array = [];
         var _loc2_:§_-i2n§ = §_-T2M§;
         while(_loc2_ != null)
         {
            _loc1_.push(_loc2_.§_-uw§);
            _loc2_ = _loc2_.next;
         }
         return "{" + _loc1_.join(",") + "}";
      }
      
      public function remove(param1:Token) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:§_-i2n§ = §_-T2M§;
         while(_loc3_ != null)
         {
            if(_loc3_.§_-uw§ == param1)
            {
               if(_loc2_ == null)
               {
                  §_-T2M§ = _loc3_.next;
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
         var _loc1_:§_-i2n§ = §_-T2M§;
         if(_loc1_ == null)
         {
            return null;
         }
         §_-T2M§ = _loc1_.next;
         return _loc1_.§_-uw§;
      }
      
      public function iterator() : Object
      {
         var l:§_-i2n§ = §_-T2M§;
         return {
            "hasNext":function():Boolean
            {
               return l != null;
            },
            "next":function():Token
            {
               var _loc1_:§_-i2n§ = l;
               l = _loc1_.next;
               return _loc1_.§_-uw§;
            }
         };
      }
      
      public function isEmpty() : Boolean
      {
         return §_-T2M§ == null;
      }
      
      public function first() : Token
      {
         return §_-T2M§ == null ? null : §_-T2M§.§_-uw§;
      }
      
      public function add(param1:Token) : void
      {
         §_-T2M§ = new §_-i2n§(param1,§_-T2M§);
      }
   }
}

