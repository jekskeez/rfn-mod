package views
{
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   
   public class §_-33e§ extends Sprite
   {
      
      private var §_-R1K§:§_-i5§;
      
      private var §_-j2s§:§_-i5§;
      
      private var §_-DI§:Sprite = new Sprite();
      
      public var colors:Array;
      
      public function §_-33e§(param1:String = "", param2:TextFormat = null, param3:Array = null, param4:Array = null)
      {
         super();
         this.§_-R1K§ = new §_-i5§("",0,0,param2);
         addChild(this.§_-R1K§);
         this.§_-j2s§ = new §_-i5§("",0,0,param2);
         if(param4 != null)
         {
            this.§_-j2s§.filters = param4;
            addChild(this.§_-j2s§);
         }
         addChild(this.§_-DI§);
         this.colors = param3 == null ? [0,16777215] : param3;
         this.text = param1;
      }
      
      public function get textWidth() : Number
      {
         return this.§_-R1K§.textWidth;
      }
      
      override public function set width(param1:Number) : void
      {
         this.§_-R1K§.width = param1;
         this.§_-R1K§.multiline = true;
         this.§_-R1K§.wordWrap = true;
         this.§_-j2s§.width = param1;
         this.§_-j2s§.multiline = true;
         this.§_-j2s§.wordWrap = true;
      }
      
      public function set text(param1:String) : void
      {
         this.§_-R1K§.text = param1;
         this.§_-j2s§.text = param1;
         this.§_-DI§.graphics.clear();
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(this.§_-R1K§.width,this.§_-R1K§.height / this.§_-R1K§.numLines + 3,Math.PI * 0.5,0,0);
         this.§_-DI§.graphics.beginGradientFill(GradientType.LINEAR,this.colors,[1,1],[0,187],_loc2_,"repeat");
         this.§_-DI§.graphics.drawRect(0,0,this.§_-R1K§.width,this.§_-R1K§.height + 10);
         this.§_-DI§.graphics.endFill();
         this.§_-DI§.mask = this.§_-R1K§;
      }
      
      override public function set filters(param1:Array) : void
      {
         this.§_-j2s§.filters = param1;
         addChild(this.§_-j2s§);
      }
   }
}

