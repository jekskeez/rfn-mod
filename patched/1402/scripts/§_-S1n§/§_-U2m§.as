package §_-S1n§
{
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   
   public class §_-U2m§ extends §_-kr§
   {
      
      public function §_-U2m§(param1:DisplayObject, param2:String = "", param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override protected function get baseFormat() : TextFormat
      {
         return new TextFormat(null,12,7621644,true);
      }
      
      override protected function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,this.width + 10,this.height + 4,5,5,5,5);
         this.graphics.endFill();
      }
   }
}

