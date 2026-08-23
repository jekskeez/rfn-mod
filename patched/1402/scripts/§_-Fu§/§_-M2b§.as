package §_-Fu§
{
   import §_-8D§.§_-L2I§;
   import §_-X1k§.§_-C2b§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-M2b§ extends Sprite
   {
      
      public static const WIDTH:int = 385;
      
      public static const §_-i2u§:int = 68;
      
      private static const §_-mx§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,6570780,true);
      
      private static const §_-9H§:TextFormat = new TextFormat(§_-i5§.§_-c10§,24,16777215,true);
      
      private var passType:int;
      
      private var bg:Shape;
      
      private var §_-ez§:Sprite;
      
      private var §_-73F§:§_-i5§;
      
      private var §_-t3§:§_-i5§;
      
      private var timer:§_-L2I§;
      
      public function §_-M2b§(param1:int)
      {
         super();
         this.passType = param1;
         this.init();
      }
      
      public function set §_-N2Q§(param1:int) : void
      {
         this.§_-73F§.text = gls("Только сегодня получай х{0} очков {1}!",param1,§_-C2b§.§_-Gq§(this.passType));
         this.§_-t3§.text = "x" + param1;
      }
      
      public function §_-y24§(param1:String, param2:int) : void
      {
         this.timer.§_-y25§(param1,param2);
      }
      
      private function init() : void
      {
         this.bg = new Shape();
         this.bg.graphics.beginFill(16767911);
         this.bg.graphics.lineStyle(1,16049098);
         this.bg.graphics.drawRoundRect(0,0,WIDTH,§_-i2u§,7,7);
         this.bg.graphics.endFill();
         addChild(this.bg);
         this.timer = new §_-L2I§();
         this.timer.x = WIDTH - this.timer.width - 6;
         this.timer.y = (§_-i2u§ - this.timer.height) * 0.5;
         addChild(this.timer);
         this.§_-73F§ = new §_-i5§("",12,16,§_-mx§,this.timer.x - 12 - 8);
         this.§_-73F§.multiline = true;
         this.§_-73F§.wordWrap = true;
         addChild(this.§_-73F§);
         this.§_-ez§ = new DiscountImage();
         this.§_-ez§.scaleX = this.§_-ez§.scaleY = 0.5;
         this.§_-ez§.x = -5;
         this.§_-ez§.y = -5;
         addChild(this.§_-ez§);
         this.§_-t3§ = new §_-i5§("",8,16,§_-9H§,this.§_-ez§.width * 2);
         this.§_-t3§.rotation = -18;
         this.§_-ez§.addChild(this.§_-t3§);
      }
   }
}

