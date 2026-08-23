package views
{
   import §_-22D§.TweenMax;
   import §_-Kc§.§_-A30§;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   
   public class §_-om§ extends Sprite
   {
      
      public function §_-om§(param1:*, param2:int, param3:int, param4:TextFormat = null, param5:Number = 0.7, param6:Number = NaN, param7:Number = NaN, param8:Boolean = false)
      {
         var valueFormat:TextFormat;
         var valueField:§_-i5§;
         var fadeOut:Function;
         var _localInstanse:§_-om§ = null;
         var value:* = param1;
         var fromX:int = param2;
         var fromY:int = param3;
         var format:TextFormat = param4;
         var time:Number = param5;
         var toX:Number = param6;
         var toY:Number = param7;
         var suppressAutoTween:Boolean = param8;
         super();
         valueFormat = format ? format : new TextFormat(§_-i5§.§_-c10§,18,16774444,true);
         valueField = new §_-i5§("+" + value,0,0,valueFormat);
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
               "ease":§_-A30§.easeInOut,
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

