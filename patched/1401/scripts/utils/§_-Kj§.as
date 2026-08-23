package utils
{
   import §_-42p§.§_-01t§;
   import §_-83V§.BalloonBody;
   import §_-83V§.PoiseRight;
   import §_-83V§.PortalBlue;
   import §_-83V§.PortalRed;
   import §_-83V§.Trampoline;
   import §_-83V§.WeightBody;
   import §_-83V§.§_-13x§;
   import §_-83V§.§_-918§;
   import §_-83V§.§_-A22§;
   import §_-83V§.§_-FF§;
   import §_-83V§.§_-K1§;
   import §_-83V§.§_-K1t§;
   import §_-83V§.§_-L8§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-83V§.§_-j2W§;
   import §_-83V§.§_-r14§;
   import §_-B1O§.Branch;
   import §_-B1O§.Stone;
   import §_-B1O§.§_-01Z§;
   import §_-B1O§.§_-222§;
   import §_-B1O§.§_-22r§;
   import §_-B1O§.§_-41L§;
   import §_-B1O§.§_-53j§;
   import §_-B1O§.§_-82g§;
   import §_-B1O§.§_-A1f§;
   import §_-B1O§.§_-L6§;
   import §_-B1O§.§_-LY§;
   import §_-B1O§.§_-M1V§;
   import §_-B1O§.§_-N1U§;
   import §_-B1O§.§_-N1V§;
   import §_-B1O§.§_-O26§;
   import §_-B1O§.§_-O2a§;
   import §_-B1O§.§_-QT§;
   import §_-B1O§.§_-WS§;
   import §_-B1O§.§_-Y2y§;
   import §_-B1O§.§_-Zf§;
   import §_-B1O§.§_-eX§;
   import §_-B1O§.§_-f1§;
   import §_-B1O§.§_-i2t§;
   import §_-B1O§.§_-lx§;
   import §_-B1O§.§_-o2p§;
   import §_-B1O§.§_-pg§;
   import §_-B1O§.§_-rc§;
   import §_-ID§.§_-2A§;
   import §_-ID§.§_-cE§;
   import §_-ID§.§_-f1N§;
   import §_-ID§.§_-j2D§;
   import §_-ID§.§_-z2y§;
   import §_-Rj§.§_-g1L§;
   import §_-Rn§.§_-31R§;
   import §_-Rn§.§_-83t§;
   import §_-Rn§.§_-J2f§;
   import §_-Rn§.§_-O§;
   import §_-Y22§.§_-C2x§;
   import §_-p2H§.DecorationCactus1;
   import §_-p2H§.DecorationCactus2;
   import §_-p2H§.DecorationDesertCloud1;
   import §_-p2H§.DecorationDesertCloud2;
   import §_-p2H§.§_-01a§;
   import §_-p2H§.§_-12S§;
   import §_-p2H§.§_-32d§;
   import §_-p2H§.§_-3d§;
   import §_-p2H§.§_-3f§;
   import §_-p2H§.§_-739§;
   import §_-p2H§.§_-83o§;
   import §_-p2H§.§_-92l§;
   import §_-p2H§.§_-C2E§;
   import §_-p2H§.§_-D1E§;
   import §_-p2H§.§_-F2B§;
   import §_-p2H§.§_-K16§;
   import §_-p2H§.§_-KG§;
   import §_-p2H§.§_-LK§;
   import §_-p2H§.§_-N1Z§;
   import §_-p2H§.§_-NL§;
   import §_-p2H§.§_-c1a§;
   import §_-p2H§.§_-fJ§;
   import §_-p2H§.§_-n2A§;
   import §_-p2H§.§_-u2O§;
   import §_-p2H§.§_-z1t§;
   import §_-p2f§.§_-73v§;
   import §_-p2f§.§_-Gq§;
   import §_-p2f§.§_-br§;
   import §_-p2f§.§_-k1O§;
   import §_-p2o§.§_-m2F§;
   import avmplus.getQualifiedClassName;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-W1B§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-R2m§;
   
   public class §_-Kj§
   {
      
      private static const §_-S3§:Number = 0.1;
      
      private static const §_-WP§:Number = 0.5;
      
      private static const §_-d1U§:Number = 0.25;
      
      public static const §_-11l§:int = 100;
      
      private static const §_-p2I§:Object = {
         (getQualifiedClassName(BalloonBody)):§_-S3§,
         (getQualifiedClassName(PortalBlue)):§_-WP§,
         (getQualifiedClassName(PortalRed)):§_-WP§,
         (getQualifiedClassName(§_-r14§)):§_-S3§,
         (getQualifiedClassName(PoiseRight)):§_-S3§,
         (getQualifiedClassName(§_-Q1J§)):§_-WP§,
         (getQualifiedClassName(§_-P2o§)):§_-S3§,
         (getQualifiedClassName(§_-rc§)):§_-S3§,
         (getQualifiedClassName(§_-L6§)):§_-S3§,
         (getQualifiedClassName(§_-N1U§)):§_-S3§,
         (getQualifiedClassName(§_-Zf§)):§_-S3§,
         (getQualifiedClassName(§_-N1V§)):§_-S3§,
         (getQualifiedClassName(§_-A1f§)):§_-S3§,
         (getQualifiedClassName(§_-13x§)):§_-S3§,
         (getQualifiedClassName(§_-FF§)):§_-S3§,
         (getQualifiedClassName(§_-LY§)):§_-S3§,
         (getQualifiedClassName(§_-31R§)):§_-d1U§,
         (getQualifiedClassName(§_-83t§)):§_-d1U§ + 0.3,
         (getQualifiedClassName(§_-J2f§)):§_-d1U§,
         (getQualifiedClassName(WeightBody)):§_-S3§,
         (getQualifiedClassName(§_-O2a§)):§_-S3§,
         (getQualifiedClassName(§_-O26§)):§_-S3§,
         (getQualifiedClassName(§_-M1V§)):§_-S3§,
         (getQualifiedClassName(Stone)):§_-S3§,
         (getQualifiedClassName(§_-K1t§)):§_-WP§,
         (getQualifiedClassName(§_-j2W§)):§_-WP§,
         (getQualifiedClassName(Branch)):§_-S3§,
         (getQualifiedClassName(§_-eX§)):§_-S3§,
         (getQualifiedClassName(Trampoline)):§_-S3§,
         (getQualifiedClassName(§_-Y2y§)):§_-S3§,
         (getQualifiedClassName(§_-f1§)):§_-WP§,
         (getQualifiedClassName(§_-lx§)):§_-S3§,
         (getQualifiedClassName(§_-82g§)):§_-WP§,
         (getQualifiedClassName(§_-01t§)):§_-S3§,
         (getQualifiedClassName(§_-KG§)):§_-S3§,
         (getQualifiedClassName(§_-32d§)):§_-S3§,
         (getQualifiedClassName(§_-01a§)):§_-S3§,
         (getQualifiedClassName(§_-NL§)):§_-S3§,
         (getQualifiedClassName(§_-c1a§)):§_-S3§,
         (getQualifiedClassName(§_-fJ§)):§_-S3§,
         (getQualifiedClassName(§_-n2A§)):§_-S3§,
         (getQualifiedClassName(§_-L8§)):§_-S3§,
         (getQualifiedClassName(§_-K1§)):§_-S3§,
         (getQualifiedClassName(§_-QT§)):§_-S3§,
         (getQualifiedClassName(§_-01Z§)):§_-S3§,
         (getQualifiedClassName(§_-O§)):§_-d1U§,
         (getQualifiedClassName(§_-A22§)):§_-S3§,
         (getQualifiedClassName(§_-f1N§)):§_-S3§,
         (getQualifiedClassName(§_-cE§)):§_-S3§,
         (getQualifiedClassName(§_-2A§)):§_-S3§,
         (getQualifiedClassName(§_-z2y§)):§_-S3§,
         (getQualifiedClassName(§_-j2D§)):§_-S3§,
         (getQualifiedClassName(§_-WS§)):§_-S3§,
         (getQualifiedClassName(§_-22r§)):§_-WP§,
         (getQualifiedClassName(§_-i2t§)):§_-WP§,
         (getQualifiedClassName(§_-o2p§)):§_-S3§,
         (getQualifiedClassName(§_-D1E§)):§_-S3§,
         (getQualifiedClassName(§_-N1Z§)):§_-S3§,
         (getQualifiedClassName(§_-83o§)):§_-S3§,
         (getQualifiedClassName(§_-73v§)):§_-S3§,
         (getQualifiedClassName(§_-k1O§)):§_-S3§,
         (getQualifiedClassName(§_-3d§)):§_-S3§,
         (getQualifiedClassName(§_-12S§)):§_-S3§,
         (getQualifiedClassName(§_-br§)):§_-S3§,
         (getQualifiedClassName(§_-Gq§)):§_-S3§,
         (getQualifiedClassName(§_-K16§)):§_-S3§,
         (getQualifiedClassName(§_-739§)):§_-S3§,
         (getQualifiedClassName(§_-92l§)):§_-S3§,
         (getQualifiedClassName(§_-918§)):§_-WP§,
         (getQualifiedClassName(§_-m2F§)):§_-S3§,
         (getQualifiedClassName(DecorationDesertCloud1)):§_-S3§,
         (getQualifiedClassName(DecorationDesertCloud2)):§_-S3§,
         (getQualifiedClassName(DecorationCactus1)):§_-S3§,
         (getQualifiedClassName(DecorationCactus2)):§_-S3§,
         (getQualifiedClassName(§_-F2B§)):§_-S3§,
         (getQualifiedClassName(§_-C2E§)):§_-S3§,
         (getQualifiedClassName(§_-3f§)):§_-S3§,
         (getQualifiedClassName(§_-53j§)):§_-S3§,
         (getQualifiedClassName(§_-41L§)):§_-S3§,
         (getQualifiedClassName(§_-pg§)):§_-S3§,
         (getQualifiedClassName(§_-222§)):§_-S3§,
         (getQualifiedClassName(§_-u2O§)):§_-S3§,
         (getQualifiedClassName(§_-LK§)):§_-WP§,
         (getQualifiedClassName(§_-z1t§)):§_-WP§
      };
      
      private static const §_-92F§:Object = {
         (getQualifiedClassName(Branch)):5.5,
         (getQualifiedClassName(§_-Zf§)):0.6,
         (getQualifiedClassName(§_-N1V§)):0.6,
         (getQualifiedClassName(§_-A1f§)):0.6,
         (getQualifiedClassName(§_-Y2y§)):0.6,
         (getQualifiedClassName(§_-f1§)):0.6,
         (getQualifiedClassName(§_-lx§)):1,
         (getQualifiedClassName(§_-QT§)):0.6,
         (getQualifiedClassName(§_-01Z§)):0.6,
         (getQualifiedClassName(§_-o2p§)):1,
         (getQualifiedClassName(§_-53j§)):0.6,
         (getQualifiedClassName(§_-i2t§)):0.8,
         (getQualifiedClassName(BalloonBody)):1.6
      };
      
      public function §_-Kj§()
      {
         super();
      }
      
      public static function §_-q§(param1:§_-g1L§, param2:Function) : void
      {
         param2.call(null,param1.number,§_-13A§(param1));
      }
      
      private static function §_-13A§(param1:§_-g1L§) : int
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
         var _loc2_:Array = §_-sb§(param1.map);
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
            (_loc11_ as §_-03u§).§_-41M§(_loc8_["data"]);
            _loc12_ = getQualifiedClassName(_loc11_);
            if(!(_loc12_ in _loc4_))
            {
               _loc4_[_loc12_] = 0;
            }
            _loc13_ = _loc5_.x * _loc5_.y / (§_-a9§.§_-9o§ * §_-a9§.§_-31m§);
            _loc14_ = false;
            if(_loc11_ is §_-63Q§)
            {
               _loc6_.addChild(_loc11_ as DisplayObject);
               _loc14_ = _loc7_.hitTestObject(_loc11_ as DisplayObject);
               _loc6_.removeChild(_loc11_ as DisplayObject);
            }
            if(_loc14_)
            {
               if(_loc12_ in §_-p2I§)
               {
                  _loc15_ = Number(§_-p2I§[_loc12_]);
                  if(_loc15_ == §_-S3§)
                  {
                     if(_loc11_ is §_-R2m§)
                     {
                        switch(_loc12_)
                        {
                           case "Branch":
                              _loc16_ = (_loc11_ as §_-R2m§).size.x * Game.§_-x2P§;
                              _loc17_ = 20;
                              break;
                           case "Stone":
                              _loc16_ = (_loc11_ as §_-R2m§).size.x * Game.§_-x2P§;
                              _loc17_ = (_loc11_ as §_-R2m§).size.y * Game.§_-x2P§;
                              break;
                           default:
                              _loc16_ = Math.abs((_loc11_ as §_-R2m§).size.x * Game.§_-x2P§ * 0.5);
                              _loc17_ = Math.abs((_loc11_ as §_-R2m§).size.y * Game.§_-x2P§ * 0.5);
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
               if(_loc12_ in §_-92F§)
               {
                  _loc19_ = (_loc11_.rotation < 0 ? 360 - Math.abs(_loc11_.rotation) : _loc11_.rotation) * Game.D2R;
                  _loc20_ = Math.abs(Math.cos(_loc19_) * Math.sin(_loc19_));
                  _loc4_[_loc12_] += _loc20_ * §_-92F§[_loc12_] / _loc13_;
               }
            }
            if(_loc11_ is §_-W1B§)
            {
               _loc4_[_loc12_] += (_loc11_ as §_-W1B§).§_-q§();
            }
            if(_loc11_ is §_-C2x§)
            {
               (_loc11_ as §_-C2x§).dispose();
            }
         }
         _loc9_ = 0;
         for(_loc10_ in _loc4_)
         {
            _loc9_ += _loc4_[_loc10_];
         }
         return _loc9_ * 2;
      }
      
      private static function §_-sb§(param1:*) : Array
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
            §_-TQ§.add("Failed to decode JSON map data: " + e,data);
            throw e;
         }
         size = null;
         if(3 in input)
         {
            size = new Point(input[3][0],input[3][1]);
         }
         else
         {
            size = new Point(§_-a9§.§_-9o§,§_-a9§.§_-31m§);
         }
         objects = input[1];
         objectsClasses = [];
         for each(entity in objects)
         {
            if(!(entity == "" || §_-03s§.§_-F1T§(entity[0]) == null))
            {
               object = new (§_-03s§.§_-F1T§(entity[0]) as Class)();
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

