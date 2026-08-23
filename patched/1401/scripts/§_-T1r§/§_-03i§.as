package §_-T1r§
{
   import §_-e1G§.§_-Hb§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import utils.§_-AR§;
   
   public class §_-03i§ extends Sprite
   {
      
      private var §_-vR§:§_-AR§ = new §_-AR§();
      
      public function §_-03i§(param1:DisplayObject, param2:Number = 1, param3:Number = 0.5, param4:String = "", param5:int = 0, param6:int = 0, param7:int = 65280)
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
         this.§_-vR§.start = 0;
         this.§_-vR§.radius = 18;
         this.§_-vR§.x = this.§_-vR§.radius;
         this.§_-vR§.y = this.§_-vR§.radius;
         this.§_-vR§.color = param7;
         this.§_-vR§.alpha = param3;
         addChild(this.§_-vR§);
         if(param4 != "")
         {
            new §_-Hb§(this,"<body>" + param4 + "</body>",false,true);
         }
      }
      
      public function update(param1:int) : void
      {
         this.§_-vR§.end = Math.PI * 2 - param1 / 100 * Math.PI * 2;
      }
   }
}

