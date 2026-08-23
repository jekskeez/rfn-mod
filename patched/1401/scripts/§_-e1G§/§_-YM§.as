package §_-e1G§
{
   import flash.display.DisplayObject;
   
   public class §_-YM§ extends §_-Hb§
   {
      
      public function §_-YM§(param1:DisplayObject, param2:String = "", param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4,true);
      }
      
      override public function setStatus(param1:String) : void
      {
         if(this.field.htmlText == param1)
         {
            return;
         }
         this.field.htmlText = param1;
         this.field.width = this.maxWidth;
         this.field.width = this.field.textWidth + 6;
         draw();
      }
   }
}

