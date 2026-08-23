package §_-K1§
{
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-s2v§ extends Sprite
   {
      
      private static const §_-C1Q§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,12,16777215);
      
      private static const §_-fC§:TextFormat = new TextFormat(null,12,16730663,true);
      
      private var §_-Z11§:§_-i5§;
      
      private var §_-I1z§:§_-i5§;
      
      public function §_-s2v§()
      {
         super();
         this.graphics.beginFill(16730663);
         this.graphics.drawRoundRectComplex(0,0,64,18,5,0,5,0);
         this.graphics.beginFill(16777215);
         this.graphics.drawRoundRectComplex(64,0,106,18,0,5,0,5);
         this.§_-Z11§ = new §_-i5§("",0,0,§_-C1Q§);
         addChild(this.§_-Z11§);
         this.§_-I1z§ = new §_-i5§("",0,0,§_-fC§);
         addChild(this.§_-I1z§);
         this.mouseEnabled = false;
      }
      
      public function set text(param1:String) : void
      {
         this.§_-Z11§.text = param1;
         this.§_-Z11§.x = 30 - int(this.§_-Z11§.textWidth * 0.5);
      }
      
      public function set value(param1:String) : void
      {
         this.§_-I1z§.text = param1;
         this.§_-I1z§.x = 115 - int(this.§_-I1z§.textWidth * 0.5);
      }
   }
}

