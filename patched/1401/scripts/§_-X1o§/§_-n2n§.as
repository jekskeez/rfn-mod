package §_-X1o§
{
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-n2n§ extends §_-D2I§
   {
      
      private static const §_-I2U§:String = [".blue {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #1e43bb;","font-weight: bold;","}",".red {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #BD0501;","font-weight: bold;","}"].join("\n");
      
      private var §_-d2u§:§_-22V§ = null;
      
      private var §_-E23§:int = 0;
      
      public function §_-n2n§(param1:int, param2:int)
      {
         super(param1,param2);
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-F2m§]);
      }
      
      public function get frags() : int
      {
         return this.§_-E23§;
      }
      
      public function set frags(param1:int) : void
      {
         this.§_-E23§ = param1;
         this.§_-d2u§.htmlText = "<body><span class=\"" + (this.team == Hero.§_-17§ ? "red" : "blue") + "\"><b>" + this.§_-E23§.toString() + "</b></span></body>";
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-d2u§ = new §_-22V§("<body><span class=\"" + (this.team == Hero.§_-17§ ? "red" : "blue") + "\"><b>0</b></span></body>",130,0,_loc1_,26);
         addChild(this.§_-d2u§);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!("4" in param1) || this.player.id != param1[4])
         {
            return;
         }
         ++this.frags;
      }
   }
}

