package views
{
   import §_-22D§.TweenMax;
   import §_-Kc§.§_-A30§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-Z2M§ extends Sprite
   {
      
      public function §_-Z2M§(param1:DisplayObject, param2:int, param3:int, param4:int = -1, param5:int = -1, param6:Number = 0.7)
      {
         var self:§_-Z2M§ = null;
         var image:DisplayObject = param1;
         var fromX:int = param2;
         var fromY:int = param3;
         var toX:int = param4;
         var toY:int = param5;
         var time:Number = param6;
         super();
         image.x = 2;
         image.y = 0;
         addChild(image);
         this.x = fromX;
         this.y = fromY;
         self = this;
         mouseEnabled = false;
         mouseChildren = false;
         if(toX != -1 && toY != -1)
         {
            TweenMax.to(self,time,{
               "x":toX,
               "y":toY,
               "ease":§_-A30§.easeInOut,
               "onComplete":function():void
               {
                  TweenMax.to(self,0.4,{
                     "alpha":0,
                     "onComplete":finish
                  });
               }
            });
         }
         else
         {
            TweenMax.to(self,time,{
               "y":self.y - 100,
               "onComplete":function():void
               {
                  TweenMax.to(self,1,{
                     "alpha":0,
                     "onComplete":finish
                  });
               }
            });
         }
      }
      
      private function finish() : void
      {
         if(Boolean(this.parent) && this.parent.contains(this))
         {
            this.parent.removeChild(this);
         }
      }
   }
}

