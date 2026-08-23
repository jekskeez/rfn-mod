package
{
   import §_-hd§.§_-01M§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.StageQuality;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   import utils.§_-z22§;
   
   public class §_-Z1D§
   {
      
      private static const §_-G2s§:int = 2;
      
      private static var §_-U28§:Object = {};
      
      public function §_-Z1D§()
      {
         super();
      }
      
      public static function §_-P2V§(param1:*, param2:Boolean = true) : Array
      {
         var _loc3_:String = §_-Ay§(param1);
         if(_loc3_ in §_-U28§ && (!(param1 is MovieClip) || §_-U28§[_loc3_]["scale"] == param1.scaleX))
         {
            if("age" in §_-U28§[_loc3_])
            {
               §_-U28§[_loc3_]["age"] = §_-Z1D§.§_-G2s§;
            }
            return §_-U28§[_loc3_]["dataArray"];
         }
         §_-U28§[_loc3_] = {};
         var _loc4_:int = int(param1.totalFrames);
         §_-U28§[_loc3_]["dataArray"] = !param2 ? new Array(_loc4_) : §_-WT§(param1,0,_loc4_ - 1);
         if(param1 is MovieClip)
         {
            §_-U28§[_loc3_]["scale"] = param1.scaleX;
         }
         if(param1 is §_-z22§)
         {
            §_-U28§[_loc3_]["age"] = §_-Z1D§.§_-G2s§;
         }
         return §_-U28§[_loc3_]["dataArray"];
      }
      
      public static function §_-13w§(param1:*, param2:int) : void
      {
         var _loc3_:String = §_-Ay§(param1);
         if(Boolean(§_-U28§[_loc3_]) && Boolean(§_-U28§[_loc3_]["dataArray"]) && (!§_-U28§[_loc3_]["dataArray"][param2] || §_-U28§[_loc3_]["dataArray"][param2] == null))
         {
            §_-U28§[_loc3_]["dataArray"][param2] = §_-WT§(param1,param2,param2)[0];
         }
      }
      
      public static function §_-nm§(param1:Array) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ in §_-U28§)
            {
               if("age" in §_-U28§[_loc2_])
               {
                  §_-U28§[_loc2_]["age"] = §_-Z1D§.§_-G2s§;
               }
            }
         }
      }
      
      public static function §_-y20§(param1:Boolean = false) : void
      {
         var _loc3_:String = null;
         var _loc4_:BitmapData = null;
         var _loc2_:Array = [];
         for(_loc3_ in §_-U28§)
         {
            if(§_-U28§[_loc3_] == null || §_-U28§[_loc3_]["dataArray"] == null)
            {
               _loc2_.push(_loc3_);
            }
            else if("age" in §_-U28§[_loc3_])
            {
               --§_-U28§[_loc3_]["age"];
               if(!(!param1 && §_-U28§[_loc3_]["age"] > 0))
               {
                  if("dataArray" in §_-U28§[_loc3_])
                  {
                     for each(_loc4_ in §_-U28§[_loc3_]["dataArray"])
                     {
                        if(_loc4_)
                        {
                           _loc4_.dispose();
                        }
                     }
                     §_-U28§[_loc3_]["dataArray"] = null;
                     delete §_-U28§[_loc3_]["dataArray"];
                  }
                  §_-U28§[_loc3_] = null;
                  _loc2_.push(_loc3_);
               }
            }
         }
         for each(_loc3_ in _loc2_)
         {
            delete §_-U28§[_loc3_];
         }
      }
      
      public static function §_-WT§(param1:*, param2:int, param3:int) : Array
      {
         var _loc9_:BitmapData = null;
         var _loc4_:Rectangle = param1.getRect(param1);
         var _loc5_:Array = [];
         var _loc6_:Matrix = new Matrix();
         _loc6_.translate(-_loc4_.x,-_loc4_.y);
         _loc6_.scale(Math.abs(param1.scaleX * §_-01M§.§_-22T§),Math.abs(param1.scaleY * §_-01M§.§_-22T§));
         var _loc7_:String = "";
         if(Game.stage.quality.toLowerCase() != StageQuality.HIGH)
         {
            _loc7_ = Game.stage.quality;
            Game.stage.quality = StageQuality.HIGH;
         }
         var _loc8_:int = param2;
         while(_loc8_ <= param3)
         {
            param1.gotoAndStop(_loc8_ + 1);
            _loc9_ = new BitmapData(_loc4_.width * Math.abs(param1.scaleX * §_-01M§.§_-22T§),_loc4_.height * Math.abs(param1.scaleY * §_-01M§.§_-22T§),true,0);
            _loc9_.draw(param1,_loc6_);
            _loc5_.push(_loc9_);
            _loc8_++;
         }
         if(_loc7_ != "")
         {
            Game.stage.quality = _loc7_;
         }
         return _loc5_;
      }
      
      private static function §_-Ay§(param1:*) : String
      {
         var _loc2_:String = param1 is String ? param1 : getQualifiedClassName(param1);
         if(param1 is §_-z22§)
         {
            _loc2_ = param1.getName();
         }
         return _loc2_;
      }
   }
}

