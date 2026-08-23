package §_-e1G§
{
   import §_-dc§.§_-F§;
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   
   public class §_-k2R§ extends §_-Hb§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var max:Boolean;
      
      private var level:int = 0;
      
      private var exp:int = 0;
      
      private var §_-F2k§:int = 0;
      
      private var §_-o2T§:int = 0;
      
      private var §_-nD§:int = 0;
      
      public function §_-k2R§(param1:DisplayObject, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super(param1);
         this.exp = param2;
         this.§_-F2k§ = param4;
         this.max = this.max;
         this.§_-o2T§ = param5;
         this.§_-nD§ = param6;
         this.level = param3;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         var _loc2_:§_-22V§ = new §_-22V§(gls("<body>Уровень клана: <span class=\'bold\'>{0}</span></body>",this.level),5,2,_loc1_);
         addChild(_loc2_);
         var _loc3_:String = this.level == §_-F§.MAX_LEVEL ? gls("<body>Опыт: <span class=\'bold\'>{0}</span></body>",this.exp) : gls("<body>Опыт: <span class=\'bold\'>{0}/{1}</span></body>",this.exp,this.§_-F2k§);
         var _loc4_:§_-22V§ = new §_-22V§(_loc3_,5,17,_loc1_);
         addChild(_loc4_);
         var _loc5_:§_-22V§ = new §_-22V§(gls("<body>Дневной лимит: <span class=\'bold\'>{0}/{1}</span></body>",this.§_-o2T§,this.§_-nD§),5,32,_loc1_);
         addChild(_loc5_);
         draw();
      }
   }
}

