package §_-62p§
{
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-h1U§ extends Sprite
   {
      
      private static const §_-CD§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,12,16777215);
      
      private static const §_-5i§:TextFormat = new TextFormat(null,12,16730663,true);
      
      private var §_-n2P§:§_-22V§;
      
      private var §_-v1s§:§_-22V§;
      
      public function §_-h1U§()
      {
         super();
         this.graphics.beginFill(16730663);
         this.graphics.drawRoundRectComplex(0,0,64,18,5,0,5,0);
         this.graphics.beginFill(16777215);
         this.graphics.drawRoundRectComplex(64,0,106,18,0,5,0,5);
         this.§_-n2P§ = new §_-22V§("",0,0,§_-CD§);
         addChild(this.§_-n2P§);
         this.§_-v1s§ = new §_-22V§("",0,0,§_-5i§);
         addChild(this.§_-v1s§);
         this.mouseEnabled = false;
      }
      
      public function set text(param1:String) : void
      {
         this.§_-n2P§.text = param1;
         this.§_-n2P§.x = 30 - int(this.§_-n2P§.textWidth * 0.5);
      }
      
      public function set value(param1:String) : void
      {
         this.§_-v1s§.text = param1;
         this.§_-v1s§.x = 115 - int(this.§_-v1s§.textWidth * 0.5);
      }
   }
}

