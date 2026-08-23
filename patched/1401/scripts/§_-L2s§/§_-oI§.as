package §_-L2s§
{
   import flash.utils.ByteArray;
   
   public class §_-oI§
   {
      
      private var §_-P2A§:String;
      
      private var §_-M2x§:ByteArray;
      
      private var §_-I1x§:Object = null;
      
      public function §_-oI§(param1:String, param2:ByteArray)
      {
         super();
         this.§_-P2A§ = param1;
         this.§_-M2x§ = param2;
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
         if(§_-a9§.§_-L2p§ == this.§_-P2A§)
         {
            return param1;
         }
         if(this.§_-I1x§ == null)
         {
            this.§_-I1x§ = this.§_-02H§();
         }
         if(!(param1 in this.§_-I1x§))
         {
            §_-TQ§.add("Warning: String not found:\'" + param1 + "\'");
            return param1;
         }
         var _loc2_:String = this.§_-I1x§[param1][§_-a9§.§_-L2p§];
         if(_loc2_ == "NAN")
         {
            §_-TQ§.add("Warning: Locale string not found! \'" + param1 + "\' Locale:" + §_-a9§.§_-L2p§);
         }
         var _loc3_:Array = _loc2_.match(/[А-Яа-яЁё]/g);
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            §_-TQ§.add("Warning: Locale string contains RU characters! \'" + param1 + "\' Locale:" + §_-a9§.§_-L2p§);
         }
         return _loc2_;
      }
      
      private function §_-02H§() : Object
      {
         var _loc1_:Object = {};
         var _loc2_:ByteArray = this.§_-M2x§;
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
            _loc1_[_loc4_[_loc6_]][§_-a9§.§_-L2p§] = _loc4_[_loc6_ + 3];
            _loc6_ += 6;
         }
         return _loc1_;
      }
   }
}

