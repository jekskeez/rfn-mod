package §_-S1n§
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-U19§.§_-su§;
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   
   public class §_-02M§ extends §_-kr§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var §_-oj§:String = null;
      
      private var max:int = 0;
      
      private var §_-n1s§:int = 0;
      
      private var id:int = 0;
      
      private var §_-Sf§:int = 0;
      
      public function §_-02M§(param1:DisplayObject, param2:String, param3:int, param4:int, param5:int, param6:int)
      {
         super(param1);
         this.max = param6;
         this.§_-n1s§ = param5;
         this.id = param3;
         this.§_-Sf§ = param4;
         this.§_-oj§ = param2;
         this.init();
      }
      
      private function init() : void
      {
         var _loc3_:§_-i5§ = null;
         var _loc4_:§_-i5§ = null;
         var _loc5_:Clan = null;
         var _loc6_:int = 0;
         var _loc7_:§_-i5§ = null;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         var _loc2_:§_-i5§ = new §_-i5§("<body>" + this.§_-oj§ + "</body>",5,2,_loc1_);
         addChild(_loc2_);
         if(this.§_-Sf§ == §_-su§.§_-R1U§)
         {
            _loc3_ = new §_-i5§(gls("<body><span class=\'bold\'>Достигнут максимальный уровень тотема.</span></body>"),5,_loc2_.y + _loc2_.textHeight + 2,_loc1_);
            addChild(_loc3_);
         }
         else
         {
            _loc4_ = new §_-i5§("<body><span class=\'bold\'>" + this.§_-n1s§ + "/" + this.max + "</span></body>",5,_loc2_.y + _loc2_.textHeight + 2,_loc1_);
            addChild(_loc4_);
            _loc5_ = §_-B2U§.§_-Q2g§(Game.selfId);
            _loc6_ = §_-su§.§_-6P§(this.id,this.§_-Sf§);
            if(_loc5_.level < _loc6_)
            {
               _loc7_ = new §_-i5§(gls("<body>Требуется: <span class=\'bold\'>{0}</span> уровень клана</body>",_loc6_),5,_loc4_.y + _loc4_.textHeight + 2,_loc1_);
               addChild(_loc7_);
            }
         }
         draw();
      }
   }
}

