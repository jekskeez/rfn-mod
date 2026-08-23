package §_-e1G§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-vy§;
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   import utils.§_-xb§;
   
   public class §_-034§ extends §_-Hb§
   {
      
      private static const §_-ZV§:int = 207;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","text-align: justify;","}",".gold {","color: #B48000;","font-weight: bold;","}",".green {","color: #1B5B08;","font-weight: bold;","}",".brown {","color: #754E0E;","font-weight: bold;","}",".center {","text-align: center;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      public function §_-034§(param1:DisplayObject, param2:int, param3:int)
      {
         super(param1,"",false,true);
         this.visible = false;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.field.styleSheet = this.style;
         this.field.width = §_-ZV§ - 13;
         this.init(param2,param3);
      }
      
      override protected function draw() : void
      {
         var _loc1_:int = int(this.field.textHeight) + 10;
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,§_-ZV§,_loc1_,5,5,5,5);
         this.graphics.endFill();
      }
      
      private function init(param1:int, param2:int) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc3_:String = "<body><textformat leading = \'3\'><span class = \'center\'>";
         switch(param1)
         {
            case §_-vy§.§_-13q§:
               _loc4_ = "green";
               _loc5_ = §_-vy§.§_-U2M§[param2]["tittle"];
               _loc6_ = §_-vy§.§_-U2M§[param2]["description"];
               break;
            case §_-vy§.§_-N§:
               _loc4_ = "gold";
               _loc5_ = §_-vy§.§_-C3T§[param2]["tittle"];
               _loc6_ = §_-vy§.§_-C3T§[param2]["description"];
               break;
            case §_-vy§.§_-Ro§:
               _loc4_ = "brown";
               _loc5_ = §_-g2W§.§_-G1Y§(§_-vy§.§_-k1M§[param2]["clothesId"]);
               _loc6_ = §_-g2W§.§_-81F§(§_-vy§.§_-k1M§[param2]["clothesId"]);
         }
         _loc3_ += §_-xb§.span(_loc5_,_loc4_) + "</span><br/></textformat>";
         _loc3_ += _loc6_;
         if(param1 == §_-vy§.§_-13q§)
         {
            _loc3_ += gls("<br/><br/><span class = \'center\'>Предмет из коллеции<br/><span class = \'gold\'>«{0}»</span></span>",§_-vy§.§_-C3T§[§_-vy§.§_-U2M§[param2]["collection"]]["collectionName"]);
         }
         else if(param1 == §_-vy§.§_-N§)
         {
            _loc3_ += gls("<br/><br/><span class = \'center\'>Предмет с локации<br/><span class = \'gold\'>«{0}»</span></span>",§_-q1p§.§_-l29§(§_-vy§.§_-l29§(param2)).name);
         }
         this.field.htmlText = _loc3_ + "</body>";
         this.draw();
      }
   }
}

