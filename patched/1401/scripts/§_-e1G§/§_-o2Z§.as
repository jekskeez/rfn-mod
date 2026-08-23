package §_-e1G§
{
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   
   public class §_-o2Z§ extends §_-Hb§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var §_-Dq§:§_-22V§ = null;
      
      private var §_-730§:int;
      
      public function §_-o2Z§(param1:DisplayObject, param2:String, param3:String, param4:int = 185)
      {
         super(param1);
         this.§_-730§ = param4;
         this.init(param2,param3);
      }
      
      public function §_-632§(param1:String, param2:String) : void
      {
         param2 = param1 != "" ? "\n" + param2 : param2;
         this.§_-Dq§.text = "<body><span class=\'bold\'>" + param1 + "</span>" + param2 + "</body>";
         this.§_-Dq§.width = param1 == "" ? this.§_-Dq§.textWidth + 10 : this.§_-730§;
         draw();
      }
      
      private function init(param1:String, param2:String) : void
      {
         var _loc3_:StyleSheet = new StyleSheet();
         _loc3_.parseCSS(§_-I2U§);
         param2 = param1 != "" ? "\n" + param2 : param2;
         this.§_-Dq§ = new §_-22V§("<body><span class=\'bold\'>" + param1 + "</span>" + param2 + "</body>",7,2,_loc3_);
         this.§_-Dq§.wordWrap = true;
         this.§_-Dq§.multiline = true;
         this.§_-Dq§.width = this.§_-730§;
         addChild(this.§_-Dq§);
         draw();
      }
   }
}

