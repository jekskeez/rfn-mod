package
{
   import §_-C1l§.§_-a2§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.StageQuality;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   import utils.§_-f2f§;
   
   public class §_-Ey§
   {
      
      private static const §_-ZB§:int = 2;
      
      private static var §_-13D§:Object = {};
      
      public function §_-Ey§()
      {
         super();
      }
      
      public static function §_-23A§(param1:*, param2:Boolean = true) : Array
      {
         var _loc3_:String = §_-H2d§(param1);
         if(_loc3_ in §_-13D§ && (!(param1 is MovieClip) || §_-13D§[_loc3_]["scale"] == param1.scaleX))
         {
            if("age" in §_-13D§[_loc3_])
            {
               §_-13D§[_loc3_]["age"] = §_-Ey§.§_-ZB§;
            }
            return §_-13D§[_loc3_]["dataArray"];
         }
         §_-13D§[_loc3_] = {};
         var _loc4_:int = int(param1.totalFrames);
         §_-13D§[_loc3_]["dataArray"] = !param2 ? new Array(_loc4_) : §_-yB§(param1,0,_loc4_ - 1);
         if(param1 is MovieClip)
         {
            §_-13D§[_loc3_]["scale"] = param1.scaleX;
         }
         if(param1 is §_-f2f§)
         {
            §_-13D§[_loc3_]["age"] = §_-Ey§.§_-ZB§;
         }
         return §_-13D§[_loc3_]["dataArray"];
      }
      
      public static function §_-OZ§(param1:*, param2:int) : void
      {
         var _loc3_:String = §_-H2d§(param1);
         if(Boolean(§_-13D§[_loc3_]) && Boolean(§_-13D§[_loc3_]["dataArray"]) && (!§_-13D§[_loc3_]["dataArray"][param2] || §_-13D§[_loc3_]["dataArray"][param2] == null))
         {
            §_-13D§[_loc3_]["dataArray"][param2] = §_-yB§(param1,param2,param2)[0];
         }
      }
      
      public static function §_-J17§(param1:Array) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ in §_-13D§)
            {
               if("age" in §_-13D§[_loc2_])
               {
                  §_-13D§[_loc2_]["age"] = §_-Ey§.§_-ZB§;
               }
            }
         }
      }
      
      public static function §_-51M§(param1:Boolean = false) : void
      {
         var _loc3_:String = null;
         var _loc4_:BitmapData = null;
         var _loc2_:Array = [];
         for(_loc3_ in §_-13D§)
         {
            if(§_-13D§[_loc3_] == null || §_-13D§[_loc3_]["dataArray"] == null)
            {
               _loc2_.push(_loc3_);
            }
            else if("age" in §_-13D§[_loc3_])
            {
               --§_-13D§[_loc3_]["age"];
               if(!(!param1 && §_-13D§[_loc3_]["age"] > 0))
               {
                  if("dataArray" in §_-13D§[_loc3_])
                  {
                     for each(_loc4_ in §_-13D§[_loc3_]["dataArray"])
                     {
                        if(_loc4_)
                        {
                           _loc4_.dispose();
                        }
                     }
                     §_-13D§[_loc3_]["dataArray"] = null;
                     delete §_-13D§[_loc3_]["dataArray"];
                  }
                  §_-13D§[_loc3_] = null;
                  _loc2_.push(_loc3_);
               }
            }
         }
         for each(_loc3_ in _loc2_)
         {
            delete §_-13D§[_loc3_];
         }
      }
      
      public static function §_-yB§(param1:*, param2:int, param3:int) : Array
      {
         var _loc9_:BitmapData = null;
         var _loc4_:Rectangle = param1.getRect(param1);
         var _loc5_:Array = [];
         var _loc6_:Matrix = new Matrix();
         _loc6_.translate(-_loc4_.x,-_loc4_.y);
         _loc6_.scale(Math.abs(param1.scaleX * §_-a2§.§_-v1n§),Math.abs(param1.scaleY * §_-a2§.§_-v1n§));
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
            _loc9_ = new BitmapData(_loc4_.width * Math.abs(param1.scaleX * §_-a2§.§_-v1n§),_loc4_.height * Math.abs(param1.scaleY * §_-a2§.§_-v1n§),true,0);
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
      
      private static function §_-H2d§(param1:*) : String
      {
         var _loc2_:String = param1 is String ? param1 : getQualifiedClassName(param1);
         if(param1 is §_-f2f§)
         {
            _loc2_ = param1.getName();
         }
         return _loc2_;
      }
   }
}

