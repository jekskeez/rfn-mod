package §_-S1n§
{
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   
   public class §_-f1W§ extends §_-kr§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var §_-68§:§_-i5§ = null;
      
      private var §_-CY§:int;
      
      public function §_-f1W§(param1:DisplayObject, param2:String, param3:String, param4:int = 185)
      {
         super(param1);
         this.§_-CY§ = param4;
         this.init(param2,param3);
      }
      
      public function §_-j2C§(param1:String, param2:String) : void
      {
         param2 = param1 != "" ? "\n" + param2 : param2;
         this.§_-68§.text = "<body><span class=\'bold\'>" + param1 + "</span>" + param2 + "</body>";
         this.§_-68§.width = param1 == "" ? this.§_-68§.textWidth + 10 : this.§_-CY§;
         draw();
      }
      
      private function init(param1:String, param2:String) : void
      {
         var _loc3_:StyleSheet = new StyleSheet();
         _loc3_.parseCSS(§_-aD§);
         param2 = param1 != "" ? "\n" + param2 : param2;
         this.§_-68§ = new §_-i5§("<body><span class=\'bold\'>" + param1 + "</span>" + param2 + "</body>",7,2,_loc3_);
         this.§_-68§.wordWrap = true;
         this.§_-68§.multiline = true;
         this.§_-68§.width = this.§_-CY§;
         addChild(this.§_-68§);
         draw();
      }
   }
}

