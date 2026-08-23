package §_-l26§
{
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class §_-32A§
   {
      
      private static var §_-r2e§:StyleSheet;
      
      private static const §_-I2U§:String = ["body {","font-family: \"Arial\";","font-size: 12px;","color: #313436;","}","a {","text-decoration: underline;","color: #0877c2;","font-size: 12px;","}","a:hover {","text-decoration: none;","}",".bold {","color: #e0347e;","font-weight: bold;","}"].join("\n");
      
      public static const §_-53t§:TextFormat = new TextFormat("Arial",12,3224630);
      
      public static const §_-hP§:TextFormat = new TextFormat("Arial",12,3224630,true);
      
      public function §_-32A§()
      {
         super();
      }
      
      public static function get style() : StyleSheet
      {
         if(!§_-r2e§)
         {
            §_-r2e§ = new StyleSheet();
            §_-r2e§.parseCSS(§_-I2U§);
         }
         return §_-r2e§;
      }
   }
}

