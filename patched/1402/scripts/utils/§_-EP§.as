package utils
{
   import §_-8Q§.BalloonBody;
   import §_-8Q§.PoiseRight;
   import §_-8Q§.PortalBlue;
   import §_-8Q§.PortalRed;
   import §_-8Q§.Trampoline;
   import §_-8Q§.WeightBody;
   import §_-8Q§.§_-2G§;
   import §_-8Q§.§_-31p§;
   import §_-8Q§.§_-G1T§;
   import §_-8Q§.§_-K2U§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-a2D§;
   import §_-8Q§.§_-o25§;
   import §_-8Q§.§_-q2D§;
   import §_-8Q§.§_-r2V§;
   import §_-8Q§.§_-t20§;
   import §_-8Q§.§_-z2J§;
   import §_-A3j§.§_-b1N§;
   import §_-E2w§.§_-82r§;
   import §_-E2w§.§_-DR§;
   import §_-E2w§.§_-Lp§;
   import §_-E2w§.§_-RF§;
   import §_-E2w§.§_-V2A§;
   import §_-F6§.§_-v2T§;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-43h§;
   import §_-M16§.§_-M§;
   import §_-M16§.§_-o1l§;
   import §_-M16§.§_-p11§;
   import §_-cH§.§_-9J§;
   import §_-cH§.§_-D2y§;
   import §_-cH§.§_-M1J§;
   import §_-cH§.§_-N11§;
   import §_-j2H§.Branch;
   import §_-j2H§.Stone;
   import §_-j2H§.§_-01b§;
   import §_-j2H§.§_-41K§;
   import §_-j2H§.§_-4l§;
   import §_-j2H§.§_-72s§;
   import §_-j2H§.§_-Eg§;
   import §_-j2H§.§_-L§;
   import §_-j2H§.§_-L2G§;
   import §_-j2H§.§_-MT§;
   import §_-j2H§.§_-O2v§;
   import §_-j2H§.§_-PH§;
   import §_-j2H§.§_-PJ§;
   import §_-j2H§.§_-Q2u§;
   import §_-j2H§.§_-a2Q§;
   import §_-j2H§.§_-bc§;
   import §_-j2H§.§_-c2d§;
   import §_-j2H§.§_-d1v§;
   import §_-j2H§.§_-d2T§;
   import §_-j2H§.§_-ec§;
   import §_-j2H§.§_-g2M§;
   import §_-j2H§.§_-h11§;
   import §_-j2H§.§_-k1§;
   import §_-j2H§.§_-k2G§;
   import §_-j2H§.§_-o2C§;
   import §_-j2H§.§_-r2W§;
   import §_-j2H§.§_-tY§;
   import §_-k1z§.DecorationCactus1;
   import §_-k1z§.DecorationCactus2;
   import §_-k1z§.DecorationDesertCloud1;
   import §_-k1z§.DecorationDesertCloud2;
   import §_-k1z§.§_-03x§;
   import §_-k1z§.§_-4g§;
   import §_-k1z§.§_-A1J§;
   import §_-k1z§.§_-B§;
   import §_-k1z§.§_-G1q§;
   import §_-k1z§.§_-Gc§;
   import §_-k1z§.§_-JN§;
   import §_-k1z§.§_-LO§;
   import §_-k1z§.§_-M20§;
   import §_-k1z§.§_-QW§;
   import §_-k1z§.§_-RV§;
   import §_-k1z§.§_-Rk§;
   import §_-k1z§.§_-S1c§;
   import §_-k1z§.§_-S29§;
   import §_-k1z§.§_-Si§;
   import §_-k1z§.§_-T1u§;
   import §_-k1z§.§_-jh§;
   import §_-k1z§.§_-k1y§;
   import §_-k1z§.§_-p1J§;
   import §_-k1z§.§_-qS§;
   import §_-k1z§.§_-z1j§;
   import §_-l2u§.§_-Kb§;
   import avmplus.getQualifiedClassName;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-d7§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-EP§
   {
      
      private static const §_-Z1q§:Number = 0.1;
      
      private static const §_-M2c§:Number = 0.5;
      
      private static const §_-B3y§:Number = 0.25;
      
      public static const §_-r1F§:int = 100;
      
      private static const §_-F2w§:Object = {
         (getQualifiedClassName(BalloonBody)):§_-Z1q§,
         (getQualifiedClassName(PortalBlue)):§_-M2c§,
         (getQualifiedClassName(PortalRed)):§_-M2c§,
         (getQualifiedClassName(§_-o25§)):§_-Z1q§,
         (getQualifiedClassName(PoiseRight)):§_-Z1q§,
         (getQualifiedClassName(§_-t20§)):§_-M2c§,
         (getQualifiedClassName(§_-O2k§)):§_-Z1q§,
         (getQualifiedClassName(§_-41K§)):§_-Z1q§,
         (getQualifiedClassName(§_-L2G§)):§_-Z1q§,
         (getQualifiedClassName(§_-Q2u§)):§_-Z1q§,
         (getQualifiedClassName(§_-O2v§)):§_-Z1q§,
         (getQualifiedClassName(§_-Eg§)):§_-Z1q§,
         (getQualifiedClassName(§_-01b§)):§_-Z1q§,
         (getQualifiedClassName(§_-K2U§)):§_-Z1q§,
         (getQualifiedClassName(§_-G1T§)):§_-Z1q§,
         (getQualifiedClassName(§_-4l§)):§_-Z1q§,
         (getQualifiedClassName(§_-p11§)):§_-B3y§,
         (getQualifiedClassName(§_-o1l§)):§_-B3y§ + 0.3,
         (getQualifiedClassName(§_-M§)):§_-B3y§,
         (getQualifiedClassName(WeightBody)):§_-Z1q§,
         (getQualifiedClassName(§_-a2Q§)):§_-Z1q§,
         (getQualifiedClassName(§_-PJ§)):§_-Z1q§,
         (getQualifiedClassName(§_-g2M§)):§_-Z1q§,
         (getQualifiedClassName(Stone)):§_-Z1q§,
         (getQualifiedClassName(§_-z2J§)):§_-M2c§,
         (getQualifiedClassName(§_-q2D§)):§_-M2c§,
         (getQualifiedClassName(Branch)):§_-Z1q§,
         (getQualifiedClassName(§_-72s§)):§_-Z1q§,
         (getQualifiedClassName(Trampoline)):§_-Z1q§,
         (getQualifiedClassName(§_-k1§)):§_-Z1q§,
         (getQualifiedClassName(§_-tY§)):§_-M2c§,
         (getQualifiedClassName(§_-o2C§)):§_-Z1q§,
         (getQualifiedClassName(§_-ec§)):§_-M2c§,
         (getQualifiedClassName(§_-b1N§)):§_-Z1q§,
         (getQualifiedClassName(§_-03x§)):§_-Z1q§,
         (getQualifiedClassName(§_-A1J§)):§_-Z1q§,
         (getQualifiedClassName(§_-S1c§)):§_-Z1q§,
         (getQualifiedClassName(§_-k1y§)):§_-Z1q§,
         (getQualifiedClassName(§_-qS§)):§_-Z1q§,
         (getQualifiedClassName(§_-4g§)):§_-Z1q§,
         (getQualifiedClassName(§_-z1j§)):§_-Z1q§,
         (getQualifiedClassName(§_-2G§)):§_-Z1q§,
         (getQualifiedClassName(§_-31p§)):§_-Z1q§,
         (getQualifiedClassName(§_-bc§)):§_-Z1q§,
         (getQualifiedClassName(§_-L§)):§_-Z1q§,
         (getQualifiedClassName(§_-43h§)):§_-B3y§,
         (getQualifiedClassName(§_-a2D§)):§_-Z1q§,
         (getQualifiedClassName(§_-Lp§)):§_-Z1q§,
         (getQualifiedClassName(§_-82r§)):§_-Z1q§,
         (getQualifiedClassName(§_-V2A§)):§_-Z1q§,
         (getQualifiedClassName(§_-DR§)):§_-Z1q§,
         (getQualifiedClassName(§_-RF§)):§_-Z1q§,
         (getQualifiedClassName(§_-MT§)):§_-Z1q§,
         (getQualifiedClassName(§_-k2G§)):§_-M2c§,
         (getQualifiedClassName(§_-d2T§)):§_-M2c§,
         (getQualifiedClassName(§_-PH§)):§_-Z1q§,
         (getQualifiedClassName(§_-QW§)):§_-Z1q§,
         (getQualifiedClassName(§_-Rk§)):§_-Z1q§,
         (getQualifiedClassName(§_-jh§)):§_-Z1q§,
         (getQualifiedClassName(§_-9J§)):§_-Z1q§,
         (getQualifiedClassName(§_-M1J§)):§_-Z1q§,
         (getQualifiedClassName(§_-M20§)):§_-Z1q§,
         (getQualifiedClassName(§_-RV§)):§_-Z1q§,
         (getQualifiedClassName(§_-D2y§)):§_-Z1q§,
         (getQualifiedClassName(§_-N11§)):§_-Z1q§,
         (getQualifiedClassName(§_-B§)):§_-Z1q§,
         (getQualifiedClassName(§_-Gc§)):§_-Z1q§,
         (getQualifiedClassName(§_-T1u§)):§_-Z1q§,
         (getQualifiedClassName(§_-r2V§)):§_-M2c§,
         (getQualifiedClassName(§_-v2T§)):§_-Z1q§,
         (getQualifiedClassName(DecorationDesertCloud1)):§_-Z1q§,
         (getQualifiedClassName(DecorationDesertCloud2)):§_-Z1q§,
         (getQualifiedClassName(DecorationCactus1)):§_-Z1q§,
         (getQualifiedClassName(DecorationCactus2)):§_-Z1q§,
         (getQualifiedClassName(§_-JN§)):§_-Z1q§,
         (getQualifiedClassName(§_-Si§)):§_-Z1q§,
         (getQualifiedClassName(§_-S29§)):§_-Z1q§,
         (getQualifiedClassName(§_-d1v§)):§_-Z1q§,
         (getQualifiedClassName(§_-h11§)):§_-Z1q§,
         (getQualifiedClassName(§_-c2d§)):§_-Z1q§,
         (getQualifiedClassName(§_-r2W§)):§_-Z1q§,
         (getQualifiedClassName(§_-G1q§)):§_-Z1q§,
         (getQualifiedClassName(§_-LO§)):§_-M2c§,
         (getQualifiedClassName(§_-p1J§)):§_-M2c§
      };
      
      private static const §_-NM§:Object = {
         (getQualifiedClassName(Branch)):5.5,
         (getQualifiedClassName(§_-O2v§)):0.6,
         (getQualifiedClassName(§_-Eg§)):0.6,
         (getQualifiedClassName(§_-01b§)):0.6,
         (getQualifiedClassName(§_-k1§)):0.6,
         (getQualifiedClassName(§_-tY§)):0.6,
         (getQualifiedClassName(§_-o2C§)):1,
         (getQualifiedClassName(§_-bc§)):0.6,
         (getQualifiedClassName(§_-L§)):0.6,
         (getQualifiedClassName(§_-PH§)):1,
         (getQualifiedClassName(§_-d1v§)):0.6,
         (getQualifiedClassName(§_-d2T§)):0.8,
         (getQualifiedClassName(BalloonBody)):1.6
      };
      
      public function §_-EP§()
      {
         super();
      }
      
      public static function §_-u2W§(param1:§_-Kb§, param2:Function) : void
      {
         param2.call(null,param1.number,§_-L29§(param1));
      }
      
      private static function §_-L29§(param1:§_-Kb§) : int
      {
         var _loc8_:Object = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Object = null;
         var _loc12_:String = null;
         var _loc13_:Number = NaN;
         var _loc14_:Boolean = false;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc2_:Array = §_-a2f§(param1.map);
         var _loc3_:Array = _loc2_[1];
         var _loc4_:Object = {};
         var _loc5_:Point = _loc2_[0];
         var _loc6_:Sprite = new Sprite();
         var _loc7_:Shape = new Shape();
         _loc7_.graphics.beginFill(255);
         _loc7_.graphics.drawRect(0,0,_loc5_.x,_loc5_.y);
         _loc7_.graphics.endFill();
         _loc6_.addChild(_loc7_);
         for each(_loc8_ in _loc3_)
         {
            _loc11_ = _loc8_["object"];
            (_loc11_ as §_-3l§).§_-o2I§(_loc8_["data"]);
            _loc12_ = getQualifiedClassName(_loc11_);
            if(!(_loc12_ in _loc4_))
            {
               _loc4_[_loc12_] = 0;
            }
            _loc13_ = _loc5_.x * _loc5_.y / (§_-Zy§.§_-21V§ * §_-Zy§.§_-02T§);
            _loc14_ = false;
            if(_loc11_ is §_-xn§)
            {
               _loc6_.addChild(_loc11_ as DisplayObject);
               _loc14_ = _loc7_.hitTestObject(_loc11_ as DisplayObject);
               _loc6_.removeChild(_loc11_ as DisplayObject);
            }
            if(_loc14_)
            {
               if(_loc12_ in §_-F2w§)
               {
                  _loc15_ = Number(§_-F2w§[_loc12_]);
                  if(_loc15_ == §_-Z1q§)
                  {
                     if(_loc11_ is §_-41O§)
                     {
                        switch(_loc12_)
                        {
                           case "Branch":
                              _loc16_ = (_loc11_ as §_-41O§).size.x * Game.§_-12A§;
                              _loc17_ = 20;
                              break;
                           case "Stone":
                              _loc16_ = (_loc11_ as §_-41O§).size.x * Game.§_-12A§;
                              _loc17_ = (_loc11_ as §_-41O§).size.y * Game.§_-12A§;
                              break;
                           default:
                              _loc16_ = Math.abs((_loc11_ as §_-41O§).size.x * Game.§_-12A§ * 0.5);
                              _loc17_ = Math.abs((_loc11_ as §_-41O§).size.y * Game.§_-12A§ * 0.5);
                        }
                     }
                     else
                     {
                        _loc16_ = Number(_loc11_.width);
                        _loc17_ = Number(_loc11_.height);
                     }
                     _loc18_ = Math.min(_loc16_,_loc5_.x) * Math.min(_loc17_,_loc5_.y);
                     _loc15_ *= _loc18_ / 10000;
                  }
                  _loc4_[_loc12_] += _loc15_ / _loc13_;
               }
               if(_loc12_ in §_-NM§)
               {
                  _loc19_ = (_loc11_.rotation < 0 ? 360 - Math.abs(_loc11_.rotation) : _loc11_.rotation) * Game.D2R;
                  _loc20_ = Math.abs(Math.cos(_loc19_) * Math.sin(_loc19_));
                  _loc4_[_loc12_] += _loc20_ * §_-NM§[_loc12_] / _loc13_;
               }
            }
            if(_loc11_ is §_-d7§)
            {
               _loc4_[_loc12_] += (_loc11_ as §_-d7§).§_-u2W§();
            }
            if(_loc11_ is §_-l2r§)
            {
               (_loc11_ as §_-l2r§).dispose();
            }
         }
         _loc9_ = 0;
         for(_loc10_ in _loc4_)
         {
            _loc9_ += _loc4_[_loc10_];
         }
         return _loc9_ * 2;
      }
      
      private static function §_-a2f§(param1:*) : Array
      {
         var size:Point;
         var objects:Array;
         var objectsClasses:Array;
         var input:Object = null;
         var entity:* = undefined;
         var object:* = undefined;
         var data:* = param1;
         try
         {
            input = JSON.parse(data);
         }
         catch(e:Error)
         {
            §_-p2U§.add("Failed to decode JSON map data: " + e,data);
            throw e;
         }
         size = null;
         if(3 in input)
         {
            size = new Point(input[3][0],input[3][1]);
         }
         else
         {
            size = new Point(§_-Zy§.§_-21V§,§_-Zy§.§_-02T§);
         }
         objects = input[1];
         objectsClasses = [];
         for each(entity in objects)
         {
            if(!(entity == "" || §_-f1b§.§_-N1m§(entity[0]) == null))
            {
               object = new (§_-f1b§.§_-N1m§(entity[0]) as Class)();
               objectsClasses.push({
                  "object":object,
                  "data":entity[1]
               });
            }
         }
         return [size,objectsClasses];
      }
   }
}

