package utils
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-Wr§ extends Sprite
   {
      
      private static const §_-xL§:int = 15528439;
      
      private var §_-yS§:SimbolMessageImage = new SimbolMessageImage();
      
      private var §_-M1F§:InnerSimbolMessageImage = new InnerSimbolMessageImage();
      
      private var text:§_-i5§;
      
      private var image:DisplayObject = null;
      
      private var §_-r2H§:int = 0;
      
      private var §_-uo§:int = 0;
      
      public function §_-Wr§(param1:String, param2:Boolean = false, param3:int = 175, param4:DisplayObject = null, param5:int = 0, param6:int = 0)
      {
         super();
         var _loc7_:int = 14;
         if(param2)
         {
            _loc7_ = 12;
            param3 = 300;
         }
         var _loc8_:TextFormat = new TextFormat(§_-i5§.§_-c10§,_loc7_,1653869,true);
         if(param4 != null)
         {
            this.image = param4;
            this.image.x = param5;
            this.image.y = param6;
            addChild(this.image);
         }
         this.§_-M1F§.width = 15;
         addChild(this.§_-M1F§);
         addChild(this.§_-yS§);
         this.text = new §_-i5§(param1,10,15,_loc8_);
         this.text.width = param3;
         this.text.wordWrap = true;
         addChild(this.text);
         this.draw();
      }
      
      public function draw() : void
      {
         this.§_-r2H§ = Math.floor(super.width);
         this.§_-uo§ = Math.floor(super.height);
         this.graphics.clear();
         this.graphics.lineStyle(2,1653869);
         this.graphics.beginFill(§_-xL§);
         this.graphics.drawRoundRectComplex(0,2,this.§_-r2H§ + 10,this.§_-uo§ + 13,5,5,5,5);
         this.graphics.endFill();
         this.§_-M1F§.x = 0;
         this.§_-M1F§.y = int(this.§_-uo§ - this.§_-yS§.height) - 6;
         this.§_-M1F§.width = this.§_-r2H§ + 10;
         this.§_-yS§.x = int(this.§_-r2H§) + 9;
         this.§_-yS§.y = int(this.§_-uo§ - this.§_-yS§.height);
         this.filters = [new GlowFilter(16777134,1,0,0,2,2)];
      }
   }
}

