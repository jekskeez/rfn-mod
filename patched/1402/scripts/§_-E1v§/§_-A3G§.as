package §_-E1v§
{
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class §_-A3G§
   {
      
      private static var §_-W1a§:StyleSheet;
      
      private static const §_-aD§:String = ["body {","font-family: \"Arial\";","font-size: 12px;","color: #313436;","}","a {","text-decoration: underline;","color: #0877c2;","font-size: 12px;","}","a:hover {","text-decoration: none;","}",".bold {","color: #e0347e;","font-weight: bold;","}"].join("\n");
      
      public static const §_-v1I§:TextFormat = new TextFormat("Arial",12,3224630);
      
      public static const §_-EF§:TextFormat = new TextFormat("Arial",12,3224630,true);
      
      public function §_-A3G§()
      {
         super();
      }
      
      public static function get style() : StyleSheet
      {
         if(!§_-W1a§)
         {
            §_-W1a§ = new StyleSheet();
            §_-W1a§.parseCSS(§_-aD§);
         }
         return §_-W1a§;
      }
   }
}

