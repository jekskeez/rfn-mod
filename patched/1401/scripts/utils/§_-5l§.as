package utils
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-5l§ extends Sprite
   {
      
      private static const §_-Q1l§:int = 15528439;
      
      private var §_-JX§:SimbolMessageImage = new SimbolMessageImage();
      
      private var §_-M1l§:InnerSimbolMessageImage = new InnerSimbolMessageImage();
      
      private var text:§_-22V§;
      
      private var image:DisplayObject = null;
      
      private var §_-K2h§:int = 0;
      
      private var §_-H1Z§:int = 0;
      
      public function §_-5l§(param1:String, param2:Boolean = false, param3:int = 175, param4:DisplayObject = null, param5:int = 0, param6:int = 0)
      {
         super();
         var _loc7_:int = 14;
         if(param2)
         {
            _loc7_ = 12;
            param3 = 300;
         }
         var _loc8_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,_loc7_,1653869,true);
         if(param4 != null)
         {
            this.image = param4;
            this.image.x = param5;
            this.image.y = param6;
            addChild(this.image);
         }
         this.§_-M1l§.width = 15;
         addChild(this.§_-M1l§);
         addChild(this.§_-JX§);
         this.text = new §_-22V§(param1,10,15,_loc8_);
         this.text.width = param3;
         this.text.wordWrap = true;
         addChild(this.text);
         this.draw();
      }
      
      public function draw() : void
      {
         this.§_-K2h§ = Math.floor(super.width);
         this.§_-H1Z§ = Math.floor(super.height);
         this.graphics.clear();
         this.graphics.lineStyle(2,1653869);
         this.graphics.beginFill(§_-Q1l§);
         this.graphics.drawRoundRectComplex(0,2,this.§_-K2h§ + 10,this.§_-H1Z§ + 13,5,5,5,5);
         this.graphics.endFill();
         this.§_-M1l§.x = 0;
         this.§_-M1l§.y = int(this.§_-H1Z§ - this.§_-JX§.height) - 6;
         this.§_-M1l§.width = this.§_-K2h§ + 10;
         this.§_-JX§.x = int(this.§_-K2h§) + 9;
         this.§_-JX§.y = int(this.§_-H1Z§ - this.§_-JX§.height);
         this.filters = [new GlowFilter(16777134,1,0,0,2,2)];
      }
   }
}

