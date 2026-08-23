package §_-S1n§
{
   import §_-U19§.§_-F2Y§;
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   
   public class §_-bs§ extends §_-kr§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var max:Boolean;
      
      private var level:int = 0;
      
      private var exp:int = 0;
      
      private var §_-034§:int = 0;
      
      private var §_-r1B§:int = 0;
      
      private var §_-R2P§:int = 0;
      
      public function §_-bs§(param1:DisplayObject, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super(param1);
         this.exp = param2;
         this.§_-034§ = param4;
         this.max = this.max;
         this.§_-r1B§ = param5;
         this.§_-R2P§ = param6;
         this.level = param3;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         var _loc2_:§_-i5§ = new §_-i5§(gls("<body>Уровень клана: <span class=\'bold\'>{0}</span></body>",this.level),5,2,_loc1_);
         addChild(_loc2_);
         var _loc3_:String = this.level == §_-F2Y§.MAX_LEVEL ? gls("<body>Опыт: <span class=\'bold\'>{0}</span></body>",this.exp) : gls("<body>Опыт: <span class=\'bold\'>{0}/{1}</span></body>",this.exp,this.§_-034§);
         var _loc4_:§_-i5§ = new §_-i5§(_loc3_,5,17,_loc1_);
         addChild(_loc4_);
         var _loc5_:§_-i5§ = new §_-i5§(gls("<body>Дневной лимит: <span class=\'bold\'>{0}/{1}</span></body>",this.§_-r1B§,this.§_-R2P§),5,32,_loc1_);
         addChild(_loc5_);
         draw();
      }
   }
}

