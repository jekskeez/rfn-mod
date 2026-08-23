package §_-F2q§
{
   import flash.utils.ByteArray;
   
   public class §_-e2Y§
   {
      
      private var §_-5§:String;
      
      private var §_-Ng§:ByteArray;
      
      private var §_-62d§:Object = null;
      
      public function §_-e2Y§(param1:String, param2:ByteArray)
      {
         super();
         this.§_-5§ = param1;
         this.§_-Ng§ = param2;
      }
      
      public static function replace(param1:String, param2:Array) : String
      {
         var _loc3_:* = undefined;
         var _loc4_:String = null;
         for(_loc3_ in param2)
         {
            do
            {
               _loc4_ = param1;
               param1 = param1.replace("{" + _loc3_ + "}",param2[_loc3_]);
            }
            while(_loc4_ != param1);
         }
         return param1;
      }
      
      public function gls(param1:String, param2:Array) : String
      {
         return replace(this.get(param1),param2);
      }
      
      private function get(param1:String) : String
      {
         if(§_-Zy§.§_-73r§ == this.§_-5§)
         {
            return param1;
         }
         if(this.§_-62d§ == null)
         {
            this.§_-62d§ = this.§_-90§();
         }
         if(!(param1 in this.§_-62d§))
         {
            §_-p2U§.add("Warning: String not found:\'" + param1 + "\'");
            return param1;
         }
         var _loc2_:String = this.§_-62d§[param1][§_-Zy§.§_-73r§];
         if(_loc2_ == "NAN")
         {
            §_-p2U§.add("Warning: Locale string not found! \'" + param1 + "\' Locale:" + §_-Zy§.§_-73r§);
         }
         var _loc3_:Array = _loc2_.match(/[А-Яа-яЁё]/g);
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            §_-p2U§.add("Warning: Locale string contains RU characters! \'" + param1 + "\' Locale:" + §_-Zy§.§_-73r§);
         }
         return _loc2_;
      }
      
      private function §_-90§() : Object
      {
         var _loc1_:Object = {};
         var _loc2_:ByteArray = this.§_-Ng§;
         var _loc3_:String = _loc2_.readUTFBytes(_loc2_.length);
         var _loc4_:Array = _loc3_.split(/(\t)|(\n)/);
         var _loc5_:int = int(_loc4_.length / 6) * 6;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_[_loc6_] = (_loc4_[_loc6_] as String).replace(/\\n/g,"\n");
            _loc4_[_loc6_] = (_loc4_[_loc6_] as String).replace(/\\t/g,"\t");
            _loc4_[_loc6_] = (_loc4_[_loc6_] as String).replace(/\\"/g,"\"");
            _loc4_[_loc6_] = (_loc4_[_loc6_] as String).replace(/\\-/g,"-");
            _loc4_[_loc6_] = (_loc4_[_loc6_] as String).replace(/(\\){2}/g,"\\");
            _loc4_[_loc6_ + 3] = (_loc4_[_loc6_ + 3] as String).replace(/\\n/g,"\n");
            _loc4_[_loc6_ + 3] = (_loc4_[_loc6_ + 3] as String).replace(/\\t/g,"\t");
            _loc4_[_loc6_ + 3] = (_loc4_[_loc6_ + 3] as String).replace(/\\"/g,"\"");
            _loc4_[_loc6_ + 3] = (_loc4_[_loc6_ + 3] as String).replace(/\\-/g,"-");
            _loc4_[_loc6_ + 3] = (_loc4_[_loc6_ + 3] as String).replace(/(\\){2}/g,"\\");
            _loc1_[_loc4_[_loc6_]] = {};
            _loc1_[_loc4_[_loc6_]][§_-Zy§.§_-73r§] = _loc4_[_loc6_ + 3];
            _loc6_ += 6;
         }
         return _loc1_;
      }
   }
}

