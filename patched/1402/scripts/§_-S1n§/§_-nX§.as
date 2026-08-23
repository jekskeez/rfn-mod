package §_-S1n§
{
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-P2x§;
   import flash.display.DisplayObject;
   import flash.text.StyleSheet;
   import utils.§_-r1G§;
   
   public class §_-nX§ extends §_-kr§
   {
      
      private static const §_-m16§:int = 207;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","text-align: justify;","}",".gold {","color: #B48000;","font-weight: bold;","}",".green {","color: #1B5B08;","font-weight: bold;","}",".brown {","color: #754E0E;","font-weight: bold;","}",".center {","text-align: center;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      public function §_-nX§(param1:DisplayObject, param2:int, param3:int)
      {
         super(param1,"",false,true);
         this.visible = false;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.field.styleSheet = this.style;
         this.field.width = §_-m16§ - 13;
         this.init(param2,param3);
      }
      
      override protected function draw() : void
      {
         var _loc1_:int = int(this.field.textHeight) + 10;
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,§_-m16§,_loc1_,5,5,5,5);
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
            case §_-42H§.§_-R2h§:
               _loc4_ = "green";
               _loc5_ = §_-42H§.§_-U13§[param2]["tittle"];
               _loc6_ = §_-42H§.§_-U13§[param2]["description"];
               break;
            case §_-42H§.§_-zL§:
               _loc4_ = "gold";
               _loc5_ = §_-42H§.§_-V10§[param2]["tittle"];
               _loc6_ = §_-42H§.§_-V10§[param2]["description"];
               break;
            case §_-42H§.§_-R1m§:
               _loc4_ = "brown";
               _loc5_ = §_-P2x§.§_-01H§(§_-42H§.§_-s1B§[param2]["clothesId"]);
               _loc6_ = §_-P2x§.§_-T1O§(§_-42H§.§_-s1B§[param2]["clothesId"]);
         }
         _loc3_ += §_-r1G§.span(_loc5_,_loc4_) + "</span><br/></textformat>";
         _loc3_ += _loc6_;
         if(param1 == §_-42H§.§_-R2h§)
         {
            _loc3_ += gls("<br/><br/><span class = \'center\'>Предмет из коллеции<br/><span class = \'gold\'>«{0}»</span></span>",§_-42H§.§_-V10§[§_-42H§.§_-U13§[param2]["collection"]]["collectionName"]);
         }
         else if(param1 == §_-42H§.§_-zL§)
         {
            _loc3_ += gls("<br/><br/><span class = \'center\'>Предмет с локации<br/><span class = \'gold\'>«{0}»</span></span>",§_-at§.§_-13l§(§_-42H§.§_-13l§(param2)).name);
         }
         this.field.htmlText = _loc3_ + "</body>";
         this.draw();
      }
   }
}

