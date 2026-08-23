package §_-cA§
{
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-01r§ extends §_-wO§
   {
      
      private static const §_-aD§:String = [".blue {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #1e43bb;","font-weight: bold;","}",".red {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #BD0501;","font-weight: bold;","}"].join("\n");
      
      private var §_-x1b§:§_-i5§ = null;
      
      private var §_-V23§:int = 0;
      
      public function §_-01r§(param1:int, param2:int)
      {
         super(param1,param2);
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function get frags() : int
      {
         return this.§_-V23§;
      }
      
      public function set frags(param1:int) : void
      {
         this.§_-V23§ = param1;
         this.§_-x1b§.htmlText = "<body><span class=\"" + (this.team == Hero.§_-l1B§ ? "red" : "blue") + "\"><b>" + this.§_-V23§.toString() + "</b></span></body>";
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-x1b§ = new §_-i5§("<body><span class=\"" + (this.team == Hero.§_-l1B§ ? "red" : "blue") + "\"><b>0</b></span></body>",130,0,_loc1_,26);
         addChild(this.§_-x1b§);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!("4" in param1) || this.player.id != param1[4])
         {
            return;
         }
         ++this.frags;
      }
   }
}

