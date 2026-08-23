package §_-62K§
{
   import §_-I10§.§_-a1D§;
   import §_-a1W§.§_-F23§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-x1u§ extends Sprite
   {
      
      public static const WIDTH:int = 385;
      
      public static const §_-kI§:int = 68;
      
      private static const §_-H1y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,6570780,true);
      
      private static const §_-BO§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,24,16777215,true);
      
      private var passType:int;
      
      private var bg:Shape;
      
      private var §_-X1i§:Sprite;
      
      private var §_-P1z§:§_-22V§;
      
      private var §_-aA§:§_-22V§;
      
      private var timer:§_-F23§;
      
      public function §_-x1u§(param1:int)
      {
         super();
         this.passType = param1;
         this.init();
      }
      
      public function set §_-y1s§(param1:int) : void
      {
         this.§_-P1z§.text = gls("Только сегодня получай х{0} очков {1}!",param1,§_-a1D§.§_-vT§(this.passType));
         this.§_-aA§.text = "x" + param1;
      }
      
      public function §_-L2c§(param1:String, param2:int) : void
      {
         this.timer.§_-hk§(param1,param2);
      }
      
      private function init() : void
      {
         this.bg = new Shape();
         this.bg.graphics.beginFill(16767911);
         this.bg.graphics.lineStyle(1,16049098);
         this.bg.graphics.drawRoundRect(0,0,WIDTH,§_-kI§,7,7);
         this.bg.graphics.endFill();
         addChild(this.bg);
         this.timer = new §_-F23§();
         this.timer.x = WIDTH - this.timer.width - 6;
         this.timer.y = (§_-kI§ - this.timer.height) * 0.5;
         addChild(this.timer);
         this.§_-P1z§ = new §_-22V§("",12,16,§_-H1y§,this.timer.x - 12 - 8);
         this.§_-P1z§.multiline = true;
         this.§_-P1z§.wordWrap = true;
         addChild(this.§_-P1z§);
         this.§_-X1i§ = new DiscountImage();
         this.§_-X1i§.scaleX = this.§_-X1i§.scaleY = 0.5;
         this.§_-X1i§.x = -5;
         this.§_-X1i§.y = -5;
         addChild(this.§_-X1i§);
         this.§_-aA§ = new §_-22V§("",8,16,§_-BO§,this.§_-X1i§.width * 2);
         this.§_-aA§.rotation = -18;
         this.§_-X1i§.addChild(this.§_-aA§);
      }
   }
}

