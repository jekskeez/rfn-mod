package utils
{
   import §_-42B§.TweenMax;
   import §_-H7§.§_-z1v§;
   import §_-I10§.§_-428§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import views.§_-Y2A§;
   import views.§_-y17§;
   
   public final class §_-r2N§
   {
      
      public static const §_-p2O§:Number = 0.55;
      
      public static const §_-e18§:int = -35;
      
      private static const §_-lL§:int = 25;
      
      private static const §_-m2s§:int = 28;
      
      private static const §_-S1o§:int = 32;
      
      private static const §_-z17§:int = 20;
      
      private static const §_-X20§:Number = 1;
      
      public function §_-r2N§()
      {
         super();
      }
      
      public static function §_-72k§(param1:DisplayObject) : Point
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         return param1.localToGlobal(new Point(_loc2_.left + _loc2_.width * 0.5,_loc2_.top + _loc2_.height * 0.5));
      }
      
      public static function §_-73z§(param1:DisplayObject, param2:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         if(!param2 || !param1)
         {
            return;
         }
         var _loc3_:Array = param2.items as Array;
         if(Boolean(_loc3_) && Boolean(_loc3_.length))
         {
            _loc4_ = 0;
            for each(_loc5_ in _loc3_)
            {
               if(§_-vu§(param1,_loc5_,_loc4_))
               {
                  _loc4_++;
               }
            }
            return;
         }
         §_-vu§(param1,param2,0);
      }
      
      public static function §_-03M§(param1:DisplayObject, param2:int, param3:DisplayObject = null) : void
      {
         var _loc6_:Point = null;
         if(!param1 || param2 <= 0)
         {
            return;
         }
         var _loc4_:Point = §_-72k§(param1);
         var _loc5_:String = String(param2);
         if(param3)
         {
            _loc6_ = §_-72k§(param3);
            §_-A2r§(_loc4_.x,_loc4_.y,_loc5_,_loc6_.x + §_-e18§,_loc6_.y,null,§_-p2O§,§_-e18§,0);
            return;
         }
         §_-A2r§(_loc4_.x,_loc4_.y,_loc5_,§_-m2s§,§_-S1o§,null,§_-p2O§,§_-e18§,0);
      }
      
      public static function §_-BD§(param1:Number, param2:Number, param3:*, param4:int, param5:TextFormat = null, param6:Number = 0.55, param7:int = -35, param8:int = 0, param9:int = 0) : void
      {
         var _loc10_:Point = §_-je§.§_-4§(param4,param9);
         §_-A2r§(param1,param2,param3,_loc10_.x,_loc10_.y,param5,param6,param7,param8);
      }
      
      public static function §_-A2r§(param1:Number, param2:Number, param3:*, param4:Number, param5:Number, param6:TextFormat = null, param7:Number = 0.55, param8:int = -35, param9:int = 0) : void
      {
         Game.stage.addChild(new §_-Y2A§(param3,int(param1 + param8),int(param2 + param9),param6,param7,param4,param5));
      }
      
      public static function §_-A3v§(param1:Number, param2:Number, param3:*, param4:int, param5:*, param6:Number = 1, param7:TextFormat = null, param8:Number = 0.55, param9:int = 0, param10:int = 0, param11:int = 0, param12:Boolean = true, param13:int = 0) : void
      {
         var runFlyout:Function;
         var anchorPoint:Point = null;
         var popX:int = 0;
         var popY:int = 0;
         var icon:DisplayObject = null;
         var x:Number = param1;
         var y:Number = param2;
         var value:* = param3;
         var rewardType:int = param4;
         var image:* = param5;
         var scale:Number = param6;
         var format:TextFormat = param7;
         var time:Number = param8;
         var deltaX:int = param9;
         var deltaY:int = param10;
         var iconOffsetY:int = param11;
         var centerIcon:Boolean = param12;
         var stack:int = param13;
         anchorPoint = §_-je§.§_-4§(rewardType,stack);
         var startX:int = int(x + deltaX);
         var startY:int = int(y + deltaY);
         popX = startX;
         popY = startY - §_-z17§;
         icon = §_-k13§(image,scale);
         if(!icon)
         {
            return;
         }
         runFlyout = function():void
         {
            var valueView:§_-Y2A§;
            var textWidth:int;
            var textHeight:int;
            var popLayer:Sprite = null;
            var iconStartX:int = 0;
            var iconStartY:int = 0;
            var iconEndX:int = 0;
            var iconEndY:int = 0;
            §_-h2R§(icon,scale);
            popLayer = new Sprite();
            popLayer.x = popX;
            popLayer.y = popY;
            Game.stage.addChild(popLayer);
            valueView = new §_-Y2A§(value,0,0,format,time,NaN,NaN,true);
            popLayer.addChild(valueView);
            textWidth = Math.max(1,int(valueView.width));
            textHeight = Math.max(1,int(valueView.height));
            if(centerIcon)
            {
               icon.y = int((textHeight - icon.height) * 0.5);
            }
            else
            {
               icon.y = iconOffsetY;
            }
            icon.x = textWidth + 3;
            popLayer.addChild(icon);
            iconStartX = popX + int(icon.x);
            iconStartY = popY + int(icon.y);
            iconEndX = anchorPoint.x + deltaX;
            iconEndY = anchorPoint.y;
            TweenMax.to(popLayer,§_-X20§,{
               "alpha":0,
               "onComplete":function():void
               {
                  if(icon.parent == popLayer)
                  {
                     popLayer.removeChild(icon);
                  }
                  icon.alpha = 1;
                  if(popLayer.parent)
                  {
                     popLayer.parent.removeChild(popLayer);
                  }
                  Game.stage.addChild(new §_-y17§(icon,iconStartX - 2,iconStartY,iconEndX,iconEndY,time));
               }
            });
         };
         if(icon is §_-z1v§)
         {
            icon.addEventListener(Event.COMPLETE,function once(param1:Event):void
            {
               icon.removeEventListener(Event.COMPLETE,once);
               runFlyout();
            });
         }
         else
         {
            runFlyout();
         }
      }
      
      public static function §_-81V§(param1:Number, param2:Number, param3:*, param4:int, param5:Number = 1, param6:Number = 0.55, param7:int = 0, param8:int = 0, param9:int = 0) : void
      {
         var _loc10_:Point = §_-je§.§_-4§(param4,param9);
         var _loc11_:DisplayObject = §_-k13§(param3,param5);
         if(!_loc11_)
         {
            return;
         }
         Game.stage.addChild(new §_-y17§(_loc11_,int(param1 + param7),int(param2 + param8),_loc10_.x + param7,_loc10_.y,param6));
      }
      
      public static function §_-o1o§(param1:Class) : int
      {
         if(param1 == ImageIconNut)
         {
            return §_-428§.§_-wG§;
         }
         if(param1 == ImageIconCoins)
         {
            return §_-428§.§_-113§;
         }
         if(param1 == ImageIconMana)
         {
            return §_-428§.§_-a1H§;
         }
         if(param1 == ImageIconEnergy)
         {
            return §_-428§.§_-61Q§;
         }
         if(param1 == ImageIconExp)
         {
            return §_-428§.§_-P13§;
         }
         if(param1 == ImageIconShamanExp)
         {
            return §_-428§.§_-cb§;
         }
         return §_-428§.§_-113§;
      }
      
      private static function §_-h2R§(param1:DisplayObject, param2:Number) : void
      {
         if(param2 != 0 || !(param1 is §_-z1v§))
         {
            return;
         }
         var _loc3_:§_-z1v§ = §_-z1v§(param1);
         var _loc4_:Number = §_-lL§ / Math.max(_loc3_.height,1);
         var _loc5_:Number = §_-lL§ / Math.max(_loc3_.width,1);
         var _loc6_:Number = Math.min(1,Math.min(_loc4_,_loc5_));
         if(_loc6_ < 1)
         {
            _loc3_.scaleX = _loc3_.scaleY = _loc6_;
         }
      }
      
      private static function §_-k13§(param1:*, param2:Number) : DisplayObject
      {
         var _loc4_:Number = NaN;
         var _loc3_:DisplayObject = param1 is Class ? new (param1 as Class)() as DisplayObject : param1 as DisplayObject;
         if(!_loc3_)
         {
            return null;
         }
         §_-A1Y§(_loc3_);
         if(param2 > 0)
         {
            _loc4_ = param2 > 64 ? 64 : param2;
            _loc3_.scaleX = _loc3_.scaleY = _loc4_;
         }
         return _loc3_;
      }
      
      private static function §_-A1Y§(param1:DisplayObject) : void
      {
         if(!(param1 is MovieClip))
         {
            return;
         }
         var _loc2_:MovieClip = MovieClip(param1);
         if(_loc2_.totalFrames < 1)
         {
            return;
         }
         var _loc3_:Rectangle = _loc2_.getBounds(_loc2_);
         if(_loc3_.width >= 1 && _loc3_.height >= 1)
         {
            return;
         }
         _loc2_.gotoAndStop(1);
         _loc3_ = _loc2_.getBounds(_loc2_);
         if(_loc3_.width < 1 && _loc3_.height < 1 && _loc2_.totalFrames > 1)
         {
            _loc2_.gotoAndStop(_loc2_.totalFrames);
         }
      }
      
      private static function §_-vu§(param1:DisplayObject, param2:Object, param3:int) : Boolean
      {
         var _loc4_:int = int(param2.type);
         var _loc5_:String = §_-S2G§(_loc4_,int(param2.count));
         if(!_loc5_)
         {
            return false;
         }
         var _loc6_:Point = §_-72k§(param1);
         var _loc7_:§_-z1v§ = new §_-z1v§(_loc4_,int(param2.id));
         §_-A3v§(_loc6_.x,_loc6_.y,_loc5_,_loc4_,_loc7_,0,null,§_-p2O§,§_-e18§,param3 * 16 - 2,0,true,param3);
         return true;
      }
      
      private static function §_-S2G§(param1:int, param2:int) : String
      {
         switch(param1)
         {
            case §_-428§.§_-113§:
            case §_-428§.§_-wG§:
            case §_-428§.§_-61Q§:
            case §_-428§.§_-a1H§:
            case §_-428§.§_-P13§:
               return param2 > 0 ? String(param2) : "";
            case §_-428§.§_-8r§:
               return param2 > 0 ? String(param2) : "";
            case §_-428§.§_-O2P§:
            case §_-428§.§_-dU§:
            case §_-428§.§_-N1P§:
               return param2 > 0 ? §_-ex§.§_-a1G§(param2 * 86400,true) : "";
            default:
               return param2 > 1 ? String(param2) : "";
         }
      }
   }
}

