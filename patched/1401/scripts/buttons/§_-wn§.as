package buttons
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-wn§ extends Sprite
   {
      
      private var button:SimpleButton;
      
      public var textField:§_-22V§ = null;
      
      public function §_-wn§(param1:SimpleButton, param2:TextFormat, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.button = param1;
         addChild(this.button);
         param2.align = TextFormatAlign.CENTER;
         this.textField = new §_-22V§("",param3,param4,param2,param5);
         this.textField.width = param5 == 0 ? this.width : param5;
         this.textField.wordWrap = false;
         this.textField.multiline = false;
         this.textField.mouseEnabled = false;
         addChild(this.textField);
      }
      
      public function §_-g2P§() : void
      {
         this.textField.y = int((this.button.height - this.textField.textHeight) * 0.5) - 2;
      }
      
      public function get back() : SimpleButton
      {
         return this.button;
      }
      
      public function clear() : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         addChild(this.button);
         addChild(this.textField);
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.mouseChildren = param1;
         this.button.enabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this.button.enabled;
      }
   }
}

