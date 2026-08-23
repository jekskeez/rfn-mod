package views
{
   import §_-42B§.TweenMax;
   import §_-r2A§.§_-j29§;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   
   public class §_-Y2A§ extends Sprite
   {
      
      public function §_-Y2A§(param1:*, param2:int, param3:int, param4:TextFormat = null, param5:Number = 0.7, param6:Number = NaN, param7:Number = NaN, param8:Boolean = false)
      {
         var valueFormat:TextFormat;
         var valueField:§_-22V§;
         var fadeOut:Function;
         var _localInstanse:§_-Y2A§ = null;
         var value:* = param1;
         var fromX:int = param2;
         var fromY:int = param3;
         var format:TextFormat = param4;
         var time:Number = param5;
         var toX:Number = param6;
         var toY:Number = param7;
         var suppressAutoTween:Boolean = param8;
         super();
         valueFormat = format ? format : new TextFormat(§_-22V§.§_-F2z§,18,16774444,true);
         valueField = new §_-22V§("+" + value,0,0,valueFormat);
         valueField.filters = [new DropShadowFilter(0,0,13700,1,2,2,12.5)];
         addChild(valueField);
         this.x = fromX;
         this.y = fromY;
         if(suppressAutoTween)
         {
            return;
         }
         _localInstanse = this;
         fadeOut = function():void
         {
            TweenMax.to(_localInstanse,0.4,{
               "alpha":0,
               "onComplete":function():void
               {
                  if(_localInstanse.parent == null)
                  {
                     return;
                  }
                  if(!_localInstanse.parent.contains(_localInstanse))
                  {
                     return;
                  }
                  _localInstanse.parent.removeChild(_localInstanse);
               }
            });
         };
         if(!isNaN(toX) && !isNaN(toY))
         {
            TweenMax.to(_localInstanse,time,{
               "x":toX,
               "y":toY,
               "ease":§_-j29§.easeInOut,
               "onComplete":fadeOut
            });
         }
         else
         {
            TweenMax.to(_localInstanse,time,{
               "y":_localInstanse.y - 100,
               "onComplete":function():void
               {
                  TweenMax.to(_localInstanse,1,{
                     "alpha":0,
                     "onComplete":function():void
                     {
                        if(_localInstanse.parent == null)
                        {
                           return;
                        }
                        if(!_localInstanse.parent.contains(_localInstanse))
                        {
                           return;
                        }
                        _localInstanse.parent.removeChild(_localInstanse);
                     }
                  });
               }
            });
         }
      }
   }
}

