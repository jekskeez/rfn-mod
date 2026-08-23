package §_-cm§
{
   import §_-S1n§.§_-kr§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import utils.§_-45§;
   
   public class §_-Q2h§ extends Sprite
   {
      
      private var §_-Vi§:§_-45§ = new §_-45§();
      
      public function §_-Q2h§(param1:DisplayObject, param2:Number = 1, param3:Number = 0.5, param4:String = "", param5:int = 0, param6:int = 0, param7:int = 65280)
      {
         super();
         var _loc8_:Shape = new Shape();
         _loc8_.graphics.beginFill(0);
         _loc8_.graphics.drawCircle(18,18,18);
         _loc8_.graphics.drawCircle(18,18,16);
         _loc8_.graphics.beginFill(0,0.2);
         _loc8_.graphics.drawCircle(18,18,16);
         _loc8_.cacheAsBitmap = true;
         addChild(_loc8_);
         param1.scaleX = param2;
         param1.scaleY = param2;
         param1.x = 18 - int(param1.width * 0.5) + param5;
         param1.y = 18 - int(param1.height * 0.5) + param6;
         param1.cacheAsBitmap = true;
         addChild(param1);
         this.§_-Vi§.start = 0;
         this.§_-Vi§.radius = 18;
         this.§_-Vi§.x = this.§_-Vi§.radius;
         this.§_-Vi§.y = this.§_-Vi§.radius;
         this.§_-Vi§.color = param7;
         this.§_-Vi§.alpha = param3;
         addChild(this.§_-Vi§);
         if(param4 != "")
         {
            new §_-kr§(this,"<body>" + param4 + "</body>",false,true);
         }
      }
      
      public function update(param1:int) : void
      {
         this.§_-Vi§.end = Math.PI * 2 - param1 / 100 * Math.PI * 2;
      }
   }
}

