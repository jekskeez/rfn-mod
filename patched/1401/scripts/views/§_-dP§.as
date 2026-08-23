package views
{
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   
   public class §_-dP§ extends Sprite
   {
      
      private var §_-o8§:§_-22V§;
      
      private var §_-73L§:§_-22V§;
      
      private var §_-m1S§:Sprite = new Sprite();
      
      public var colors:Array;
      
      public function §_-dP§(param1:String = "", param2:TextFormat = null, param3:Array = null, param4:Array = null)
      {
         super();
         this.§_-o8§ = new §_-22V§("",0,0,param2);
         addChild(this.§_-o8§);
         this.§_-73L§ = new §_-22V§("",0,0,param2);
         if(param4 != null)
         {
            this.§_-73L§.filters = param4;
            addChild(this.§_-73L§);
         }
         addChild(this.§_-m1S§);
         this.colors = param3 == null ? [0,16777215] : param3;
         this.text = param1;
      }
      
      public function get textWidth() : Number
      {
         return this.§_-o8§.textWidth;
      }
      
      override public function set width(param1:Number) : void
      {
         this.§_-o8§.width = param1;
         this.§_-o8§.multiline = true;
         this.§_-o8§.wordWrap = true;
         this.§_-73L§.width = param1;
         this.§_-73L§.multiline = true;
         this.§_-73L§.wordWrap = true;
      }
      
      public function set text(param1:String) : void
      {
         this.§_-o8§.text = param1;
         this.§_-73L§.text = param1;
         this.§_-m1S§.graphics.clear();
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(this.§_-o8§.width,this.§_-o8§.height / this.§_-o8§.numLines + 3,Math.PI * 0.5,0,0);
         this.§_-m1S§.graphics.beginGradientFill(GradientType.LINEAR,this.colors,[1,1],[0,187],_loc2_,"repeat");
         this.§_-m1S§.graphics.drawRect(0,0,this.§_-o8§.width,this.§_-o8§.height + 10);
         this.§_-m1S§.graphics.endFill();
         this.§_-m1S§.mask = this.§_-o8§;
      }
      
      override public function set filters(param1:Array) : void
      {
         this.§_-73L§.filters = param1;
         addChild(this.§_-73L§);
      }
   }
}

