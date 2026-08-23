package views
{
   import §_-S1n§.§_-kr§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class §_-83x§ extends Sprite
   {
      
      private var valueField:§_-i5§ = null;
      
      public function §_-83x§()
      {
         super();
         mouseChildren = false;
         buttonMode = true;
         useHandCursor = true;
         graphics.beginFill(11062527,0.35);
         graphics.lineStyle(1,7829367,0.15);
         graphics.drawRoundRect(0,0,76,20,5);
         graphics.endFill();
         addChild(new §_-i5§(gls("Играют:"),3,2,new TextFormat(null,12,16777215)));
         this.valueField = new §_-i5§("",31,2.25,new TextFormat(null,12,15790320,true));
         this.valueField.width = 60;
         this.valueField.autoSize = TextFieldAutoSize.CENTER;
         this.valueField.filters = [new GlowFilter(8026746,0.5,1,1,2)];
         addChild(this.valueField);
         new §_-kr§(this,gls("Количество игроков сейчас играющих на локациях."));
         visible = false;
      }
      
      public function §_-yB§(param1:int) : void
      {
         this.valueField.text = param1.toString();
         visible = true;
      }
   }
}

