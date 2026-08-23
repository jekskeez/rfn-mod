package §_-e1G§
{
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-jB§;
   
   public class §_-T1U§ extends §_-Hb§
   {
      
      private static const §_-ZV§:int = 207;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","text-align: justify;","}","a {","font-weight: bold;","}",".red {","color: #F71C00;","}"].join("\n");
      
      private var §_-T1j§:§_-22V§;
      
      private var §_-Tp§:§_-22V§;
      
      private var style:StyleSheet;
      
      public function §_-T1U§(param1:DisplayObject, param2:String, param3:String, param4:String)
      {
         super(param1,param3);
         this.visible = false;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.field.styleSheet = this.style;
         this.field.width = §_-ZV§ - 13;
         this.field.htmlText = "<body>" + param3 + "</body>";
         this.init(param2,param4);
      }
      
      override protected function draw() : void
      {
         var _loc1_:int = int(this.field.textHeight) + 33;
         if(this.§_-Tp§ != null)
         {
            _loc1_ += this.§_-Tp§.textHeight;
         }
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,§_-ZV§,_loc1_,5,5,5,5);
         this.graphics.endFill();
      }
      
      private function init(param1:String, param2:String) : void
      {
         var _loc3_:TextFormat = new TextFormat(null,12,11829248,true);
         _loc3_.align = TextFormatAlign.CENTER;
         this.§_-T1j§ = new §_-22V§(param1,0,2,_loc3_);
         this.§_-T1j§.width = §_-ZV§;
         this.§_-T1j§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-T1j§);
         this.field.y = 20;
         if(param2 == "")
         {
            this.draw();
            return;
         }
         this.§_-Tp§ = new §_-22V§(gls("<body><a>Награда:  <span class=\'red\'>{0}</span></a></body>",param2),95,int(this.field.y + this.field.textHeight + 5),this.style);
         addChild(this.§_-Tp§);
         §_-jB§.§_-fG§(this.§_-Tp§,"^",ImageIconExp,0.7,0.7,this.§_-Tp§.x - 185,-this.§_-Tp§.y + 3,false,false);
         this.draw();
      }
   }
}

