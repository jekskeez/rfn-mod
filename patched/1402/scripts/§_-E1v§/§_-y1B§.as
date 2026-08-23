package §_-E1v§
{
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class §_-y1B§ extends TextField
   {
      
      private var maxWidth:Number;
      
      public function §_-y1B§(param1:String, param2:Number, param3:Number, param4:* = null, param5:Number = 0)
      {
         super();
         this.x = param2;
         this.y = param3;
         this.maxWidth = param5;
         this.multiline = true;
         this.selectable = false;
         this.autoSize = TextFieldAutoSize.LEFT;
         if(param4 == null)
         {
            param4 = new StyleSheet();
         }
         if(param4 is TextFormat)
         {
            this.§_-x23§(param1,param4);
         }
         else if(param4 is StyleSheet)
         {
            this.§_-q5§(param1,param4);
         }
         this.update(this.maxWidth);
      }
      
      public function §_-m1J§() : void
      {
         this.update(this.maxWidth);
      }
      
      override public function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:Number = this.width;
         super.setTextFormat(param1,param2,param3);
         this.update(_loc4_);
      }
      
      override public function set text(param1:String) : void
      {
         var _loc2_:Number = this.width;
         super.text = param1;
         this.update(_loc2_);
      }
      
      override public function set htmlText(param1:String) : void
      {
         var _loc2_:Number = this.width;
         super.htmlText = param1;
         this.update(_loc2_);
      }
      
      private function update(param1:Number) : void
      {
         if(this.maxWidth == 0)
         {
            return;
         }
         this.wordWrap = false;
         this.autoSize = TextFieldAutoSize.LEFT;
         if(this.width > this.maxWidth)
         {
            this.wordWrap = true;
            this.autoSize = TextFieldAutoSize.NONE;
            this.width = this.maxWidth;
         }
         this.x += int((param1 - this.width) * 0.5);
      }
      
      private function §_-x23§(param1:String, param2:TextFormat) : void
      {
         this.defaultTextFormat = param2;
         this.text = param1;
      }
      
      private function §_-q5§(param1:String, param2:StyleSheet) : void
      {
         this.styleSheet = param2;
         var _loc3_:Object = this.styleSheet.getStyle("body");
         if(_loc3_ == null)
         {
            _loc3_ = {};
         }
         this.styleSheet.setStyle("body",_loc3_);
         var _loc4_:Object = this.styleSheet.getStyle("a:hover");
         if(_loc4_ == null)
         {
            _loc4_ = {};
         }
         if(!("textDecoration" in _loc4_))
         {
            _loc4_["textDecoration"] = "none";
         }
         this.styleSheet.setStyle("a:hover",_loc4_);
         super.htmlText = param1;
      }
   }
}

