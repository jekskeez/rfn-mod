package §_-S1n§
{
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   
   public class §_-73§ extends §_-kr§
   {
      
      private var §_-L1u§:§_-i5§;
      
      private var §_-rM§:§_-i5§;
      
      private var §_-tv§:int = -1;
      
      public function §_-73§(param1:DisplayObject, param2:String, param3:String, param4:String = "")
      {
         super(param1,param2,true);
         this.visible = false;
         this.§_-tv§ = width;
         this.init(param3,param4);
      }
      
      public function load(param1:String, param2:String, param3:String) : void
      {
         super.field.wordWrap = false;
         super.setStatus(param1);
         this.§_-L1u§.text = int(param3) > 0 ? gls("{0} место среди друзей",param3) : "";
         this.§_-rM§.text = gls("Опыт: {0}",param2);
         this.draw();
      }
      
      override protected function draw() : void
      {
         this.field.y = this.§_-L1u§.text == "" ? 2 : 15;
         this.§_-rM§.y = this.field.y + 15;
         var _loc1_:int = int(Math.max(this.field.textWidth,this.§_-L1u§.textWidth,this.§_-rM§.textWidth)) + 15;
         var _loc2_:int = int(this.field.textHeight) + 10 + this.§_-L1u§.textHeight + this.§_-rM§.textHeight;
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,_loc1_,_loc2_,5,5,5,5);
         this.graphics.endFill();
      }
      
      private function init(param1:String, param2:String) : void
      {
         this.§_-L1u§ = new §_-i5§(param2,5,2,new TextFormat(null,12,0,false));
         addChild(this.§_-L1u§);
         this.field.y = 15;
         this.§_-rM§ = new §_-i5§(param1,5,this.field.y + 15,new TextFormat(null,10,7224588,true));
         addChild(this.§_-rM§);
         this.draw();
      }
   }
}

