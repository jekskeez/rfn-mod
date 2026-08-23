package §_-S1n§
{
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-K1Y§;
   
   public class §_-z14§ extends §_-kr§
   {
      
      private static const §_-m16§:int = 207;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","text-align: justify;","}","a {","font-weight: bold;","}",".red {","color: #F71C00;","}"].join("\n");
      
      private var §_-Q1w§:§_-i5§;
      
      private var §_-QX§:§_-i5§;
      
      private var style:StyleSheet;
      
      public function §_-z14§(param1:DisplayObject, param2:String, param3:String, param4:String)
      {
         super(param1,param3);
         this.visible = false;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.field.styleSheet = this.style;
         this.field.width = §_-m16§ - 13;
         this.field.htmlText = "<body>" + param3 + "</body>";
         this.init(param2,param4);
      }
      
      override protected function draw() : void
      {
         var _loc1_:int = int(this.field.textHeight) + 33;
         if(this.§_-QX§ != null)
         {
            _loc1_ += this.§_-QX§.textHeight;
         }
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,§_-m16§,_loc1_,5,5,5,5);
         this.graphics.endFill();
      }
      
      private function init(param1:String, param2:String) : void
      {
         var _loc3_:TextFormat = new TextFormat(null,12,11829248,true);
         _loc3_.align = TextFormatAlign.CENTER;
         this.§_-Q1w§ = new §_-i5§(param1,0,2,_loc3_);
         this.§_-Q1w§.width = §_-m16§;
         this.§_-Q1w§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-Q1w§);
         this.field.y = 20;
         if(param2 == "")
         {
            this.draw();
            return;
         }
         this.§_-QX§ = new §_-i5§(gls("<body><a>Награда:  <span class=\'red\'>{0}</span></a></body>",param2),95,int(this.field.y + this.field.textHeight + 5),this.style);
         addChild(this.§_-QX§);
         §_-K1Y§.§_-P2W§(this.§_-QX§,"^",ImageIconExp,0.7,0.7,this.§_-QX§.x - 185,-this.§_-QX§.y + 3,false,false);
         this.draw();
      }
   }
}

