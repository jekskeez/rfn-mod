package buttons
{
   import flash.events.MouseEvent;
   
   public class §_-i1E§ extends §_-y1N§
   {
      
      public function §_-i1E§(param1:Array, param2:int = 0)
      {
         var i:int;
         var buttonsArray:Array = param1;
         var state:int = param2;
         super(buttonsArray,state);
         i = 0;
         while(i < this.buttonsArray.length)
         {
            this.buttonsArray[i].addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
            {
               setState(param1.currentTarget.name);
            });
            i++;
         }
      }
      
      override public function setState(param1:int) : void
      {
         param1 = (param1 + 1) % this.buttonsArray.length;
         super.setState(param1);
      }
   }
}

