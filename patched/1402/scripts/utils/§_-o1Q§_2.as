package utils
{
   import §_-22D§.TweenMax;
   import §_-X1k§.§_-A3y§;
   import §_-u1R§.§_-g1m§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import views.§_-Z2M§;
   import views.§_-om§;
   
   public final class §_-o1Q§
   {
      
      public static const §_-17§:Number = 0.55;
      
      public static const §_-N2q§:int = -35;
      
      private static const §_-Ok§:int = 25;
      
      private static const §_-mg§:int = 28;
      
      private static const §_-511§:int = 32;
      
      private static const §_-w2C§:int = 20;
      
      private static const §_-T2j§:Number = 1;
      
      public function §_-o1Q§()
      {
         super();
      }
      
      public static function §_-Z2c§(param1:DisplayObject) : Point
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         return param1.localToGlobal(new Point(_loc2_.left + _loc2_.width * 0.5,_loc2_.top + _loc2_.height * 0.5));
      }
      
      public static function §_-i1g§(param1:DisplayObject, param2:Object) : void
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
               if(§_-43t§(param1,_loc5_,_loc4_))
               {
                  _loc4_++;
               }
            }
            return;
         }
         §_-43t§(param1,param2,0);
      }
      
      public static function §_-43m§(param1:DisplayObject, param2:int, param3:DisplayObject = null) : void
      {
         var _loc6_:Point = null;
         if(!param1 || param2 <= 0)
         {
            return;
         }
         var _loc4_:Point = §_-Z2c§(param1);
         var _loc5_:String = String(param2);
         if(param3)
         {
            _loc6_ = §_-Z2c§(param3);
            §_-c1U§(_loc4_.x,_loc4_.y,_loc5_,_loc6_.x + §_-N2q§,_loc6_.y,null,§_-17§,§_-N2q§,0);
            return;
         }
         §_-c1U§(_loc4_.x,_loc4_.y,_loc5_,§_-mg§,§_-511§,null,§_-17§,§_-N2q§,0);
      }
      
      public static function §_-Pg§(param1:Number, param2:Number, param3:*, param4:int, param5:TextFormat = null, param6:Number = 0.55, param7:int = -35, param8:int = 0, param9:int = 0) : void
      {
         var _loc10_:Point = §_-PL§.§_-Q2C§(param4,param9);
         §_-c1U§(param1,param2,param3,_loc10_.x,_loc10_.y,param5,param6,param7,param8);
      }
      
      public static function §_-c1U§(param1:Number, param2:Number, param3:*, param4:Number, param5:Number, param6:TextFormat = null, param7:Number = 0.55, param8:int = -35, param9:int = 0) : void
      {
         Game.stage.addChild(new §_-om§(param3,int(param1 + param8),int(param2 + param9),param6,param7,param4,param5));
      }
      
      public static function §_-K2u§(param1:Number, param2:Number, param3:*, param4:int, param5:*, param6:Number = 1, param7:TextFormat = null, param8:Number = 0.55, param9:int = 0, param10:int = 0, param11:int = 0, param12:Boolean = true, param13:int = 0) : void
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
         anchorPoint = §_-PL§.§_-Q2C§(rewardType,stack);
         var startX:int = int(x + deltaX);
         var startY:int = int(y + deltaY);
         popX = startX;
         popY = startY - §_-w2C§;
         icon = §_-r2N§(image,scale);
         if(!icon)
         {
            return;
         }
         runFlyout = function():void
         {
            var valueView:§_-om§;
            var textWidth:int;
            var textHeight:int;
            var popLayer:Sprite = null;
            var iconStartX:int = 0;
            var iconStartY:int = 0;
            var iconEndX:int = 0;
            var iconEndY:int = 0;
            §_-rx§(icon,scale);
            popLayer = new Sprite();
            popLayer.x = popX;
            popLayer.y = popY;
            Game.stage.addChild(popLayer);
            valueView = new §_-om§(value,0,0,format,time,NaN,NaN,true);
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
            TweenMax.to(popLayer,§_-T2j§,{
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
                  Game.stage.addChild(new §_-Z2M§(icon,iconStartX - 2,iconStartY,iconEndX,iconEndY,time));
               }
            });
         };
         if(icon is §_-g1m§)
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
      
      public static function §_-r1u§(param1:Number, param2:Number, param3:*, param4:int, param5:Number = 1, param6:Number = 0.55, param7:int = 0, param8:int = 0, param9:int = 0) : void
      {
         var _loc10_:Point = §_-PL§.§_-Q2C§(param4,param9);
         var _loc11_:DisplayObject = §_-r2N§(param3,param5);
         if(!_loc11_)
         {
            return;
         }
         Game.stage.addChild(new §_-Z2M§(_loc11_,int(param1 + param7),int(param2 + param8),_loc10_.x + param7,_loc10_.y,param6));
      }
      
      public static function §_-Hw§(param1:Class) : int
      {
         if(param1 == ImageIconNut)
         {
            return §_-A3y§.§_-l2X§;
         }
         if(param1 == ImageIconCoins)
         {
            return §_-A3y§.§_-M1U§;
         }
         if(param1 == ImageIconMana)
         {
            return §_-A3y§.§_-fz§;
         }
         if(param1 == ImageIconEnergy)
         {
            return §_-A3y§.§_-W27§;
         }
         if(param1 == ImageIconExp)
         {
            return §_-A3y§.§_-V2n§;
         }
         if(param1 == ImageIconShamanExp)
         {
            return §_-A3y§.§_-QS§;
         }
         return §_-A3y§.§_-M1U§;
      }
      
      private static function §_-rx§(param1:DisplayObject, param2:Number) : void
      {
         if(param2 != 0 || !(param1 is §_-g1m§))
         {
            return;
         }
         var _loc3_:§_-g1m§ = §_-g1m§(param1);
         var _loc4_:Number = §_-Ok§ / Math.max(_loc3_.height,1);
         var _loc5_:Number = §_-Ok§ / Math.max(_loc3_.width,1);
         var _loc6_:Number = Math.min(1,Math.min(_loc4_,_loc5_));
         if(_loc6_ < 1)
         {
            _loc3_.scaleX = _loc3_.scaleY = _loc6_;
         }
      }
      
      private static function §_-r2N§(param1:*, param2:Number) : DisplayObject
      {
         var _loc4_:Number = NaN;
         var _loc3_:DisplayObject = param1 is Class ? new (param1 as Class)() as DisplayObject : param1 as DisplayObject;
         if(!_loc3_)
         {
            return null;
         }
         §_-u1N§(_loc3_);
         if(param2 > 0)
         {
            _loc4_ = param2 > 64 ? 64 : param2;
            _loc3_.scaleX = _loc3_.scaleY = _loc4_;
         }
         return _loc3_;
      }
      
      private static function §_-u1N§(param1:DisplayObject) : void
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
      
      private static function §_-43t§(param1:DisplayObject, param2:Object, param3:int) : Boolean
      {
         var _loc4_:int = int(param2.type);
         var _loc5_:String = §_-Lk§(_loc4_,int(param2.count));
         if(!_loc5_)
         {
            return false;
         }
         var _loc6_:Point = §_-Z2c§(param1);
         var _loc7_:§_-g1m§ = new §_-g1m§(_loc4_,int(param2.id));
         §_-K2u§(_loc6_.x,_loc6_.y,_loc5_,_loc4_,_loc7_,0,null,§_-17§,§_-N2q§,param3 * 16 - 2,0,true,param3);
         return true;
      }
      
      private static function §_-Lk§(param1:int, param2:int) : String
      {
         switch(param1)
         {
            case §_-A3y§.§_-M1U§:
            case §_-A3y§.§_-l2X§:
            case §_-A3y§.§_-W27§:
            case §_-A3y§.§_-fz§:
            case §_-A3y§.§_-V2n§:
               return param2 > 0 ? String(param2) : "";
            case §_-A3y§.§_-j1G§:
               return param2 > 0 ? String(param2) : "";
            case §_-A3y§.§_-y2q§:
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-o2t§:
               return param2 > 0 ? §_-B1d§.§_-wQ§(param2 * 86400,true) : "";
            default:
               return param2 > 1 ? String(param2) : "";
         }
      }
   }
}

