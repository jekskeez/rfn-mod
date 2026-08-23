package §_-e1G§
{
   import §_-dc§.Clan;
   import §_-dc§.§_-d1q§;
   import §_-dc§.§_-e2W§;
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   
   public class §_-T2R§ extends §_-Hb§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var §_-XW§:String = null;
      
      private var max:int = 0;
      
      private var §_-y1l§:int = 0;
      
      private var id:int = 0;
      
      private var §_-b1J§:int = 0;
      
      public function §_-T2R§(param1:DisplayObject, param2:String, param3:int, param4:int, param5:int, param6:int)
      {
         super(param1);
         this.max = param6;
         this.§_-y1l§ = param5;
         this.id = param3;
         this.§_-b1J§ = param4;
         this.§_-XW§ = param2;
         this.init();
      }
      
      private function init() : void
      {
         var _loc3_:§_-22V§ = null;
         var _loc4_:§_-22V§ = null;
         var _loc5_:Clan = null;
         var _loc6_:int = 0;
         var _loc7_:§_-22V§ = null;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         var _loc2_:§_-22V§ = new §_-22V§("<body>" + this.§_-XW§ + "</body>",5,2,_loc1_);
         addChild(_loc2_);
         if(this.§_-b1J§ == §_-d1q§.§_-F2G§)
         {
            _loc3_ = new §_-22V§(gls("<body><span class=\'bold\'>Достигнут максимальный уровень тотема.</span></body>"),5,_loc2_.y + _loc2_.textHeight + 2,_loc1_);
            addChild(_loc3_);
         }
         else
         {
            _loc4_ = new §_-22V§("<body><span class=\'bold\'>" + this.§_-y1l§ + "/" + this.max + "</span></body>",5,_loc2_.y + _loc2_.textHeight + 2,_loc1_);
            addChild(_loc4_);
            _loc5_ = §_-e2W§.§_-W2X§(Game.selfId);
            _loc6_ = §_-d1q§.§_-B1H§(this.id,this.§_-b1J§);
            if(_loc5_.level < _loc6_)
            {
               _loc7_ = new §_-22V§(gls("<body>Требуется: <span class=\'bold\'>{0}</span> уровень клана</body>",_loc6_),5,_loc4_.y + _loc4_.textHeight + 2,_loc1_);
               addChild(_loc7_);
            }
         }
         draw();
      }
   }
}

