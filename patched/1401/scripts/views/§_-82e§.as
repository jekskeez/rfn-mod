package views
{
   import §_-e1G§.§_-Hb§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class §_-82e§ extends Sprite
   {
      
      private var valueField:§_-22V§ = null;
      
      public function §_-82e§()
      {
         super();
         mouseChildren = false;
         buttonMode = true;
         useHandCursor = true;
         graphics.beginFill(11062527,0.35);
         graphics.lineStyle(1,7829367,0.15);
         graphics.drawRoundRect(0,0,76,20,5);
         graphics.endFill();
         addChild(new §_-22V§(gls("Играют:"),3,2,new TextFormat(null,12,16777215)));
         this.valueField = new §_-22V§("",31,2.25,new TextFormat(null,12,15790320,true));
         this.valueField.width = 60;
         this.valueField.autoSize = TextFieldAutoSize.CENTER;
         this.valueField.filters = [new GlowFilter(8026746,0.5,1,1,2)];
         addChild(this.valueField);
         new §_-Hb§(this,gls("Количество игроков сейчас играющих на локациях."));
         visible = false;
      }
      
      public function §_-A3V§(param1:int) : void
      {
         this.valueField.text = param1.toString();
         visible = true;
      }
   }
}

