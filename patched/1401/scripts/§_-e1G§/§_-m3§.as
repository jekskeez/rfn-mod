package §_-e1G§
{
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   
   public class §_-m3§ extends §_-Hb§
   {
      
      private var §_-F1i§:§_-22V§;
      
      private var §_-31T§:§_-22V§;
      
      private var §_-fc§:int = -1;
      
      public function §_-m3§(param1:DisplayObject, param2:String, param3:String, param4:String = "")
      {
         super(param1,param2,true);
         this.visible = false;
         this.§_-fc§ = width;
         this.init(param3,param4);
      }
      
      public function load(param1:String, param2:String, param3:String) : void
      {
         super.field.wordWrap = false;
         super.setStatus(param1);
         this.§_-F1i§.text = int(param3) > 0 ? gls("{0} место среди друзей",param3) : "";
         this.§_-31T§.text = gls("Опыт: {0}",param2);
         this.draw();
      }
      
      override protected function draw() : void
      {
         this.field.y = this.§_-F1i§.text == "" ? 2 : 15;
         this.§_-31T§.y = this.field.y + 15;
         var _loc1_:int = int(Math.max(this.field.textWidth,this.§_-F1i§.textWidth,this.§_-31T§.textWidth)) + 15;
         var _loc2_:int = int(this.field.textHeight) + 10 + this.§_-F1i§.textHeight + this.§_-31T§.textHeight;
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,_loc1_,_loc2_,5,5,5,5);
         this.graphics.endFill();
      }
      
      private function init(param1:String, param2:String) : void
      {
         this.§_-F1i§ = new §_-22V§(param2,5,2,new TextFormat(null,12,0,false));
         addChild(this.§_-F1i§);
         this.field.y = 15;
         this.§_-31T§ = new §_-22V§(param1,5,this.field.y + 15,new TextFormat(null,10,7224588,true));
         addChild(this.§_-31T§);
         this.draw();
      }
   }
}

