package §_-e1G§
{
   import flash.display.DisplayObject;
   
   public class §_-o2m§ extends §_-Hb§
   {
      
      public function §_-o2m§(param1:DisplayObject, param2:String)
      {
         super(param1,"",false,true);
         this.maxWidth = 240;
         setStatus(param2);
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

