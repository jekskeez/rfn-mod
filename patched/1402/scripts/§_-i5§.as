package
{
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class §_-i5§ extends TextField
   {
      
      public static const §_-c10§:String = "Roboto";
      
      public static const §_-p1s§:String = "a_PlakatTitul";
      
      public static const §_-Y2H§:int = 6175017;
      
      public static const §_-726§:String = "#5E3929";
      
      private var maxWidth:Number;
      
      private var §_-wa§:*;
      
      public function §_-i5§(param1:String, param2:Number, param3:Number, param4:* = null, param5:Number = 0)
      {
         super();
         this.x = param2;
         this.y = param3;
         this.maxWidth = param5;
         this.multiline = true;
         this.selectable = false;
         this.embedFonts = true;
         this.antiAliasType = AntiAliasType.ADVANCED;
         this.gridFitType = GridFitType.PIXEL;
         this.thickness = 100;
         this.sharpness = 0;
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
         this.update();
      }
      
      public function get userData() : *
      {
         return this.§_-wa§;
      }
      
      public function set userData(param1:*) : void
      {
         this.§_-wa§ = param1;
      }
      
      override public function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         super.setTextFormat(param1,param2,param3);
         this.update();
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         this.update();
      }
      
      override public function set htmlText(param1:String) : void
      {
         super.htmlText = param1;
         this.update();
      }
      
      private function update() : void
      {
         if(this.maxWidth == 0)
         {
            return;
         }
         this.wordWrap = true;
         this.width = this.maxWidth;
      }
      
      private function §_-x23§(param1:String, param2:TextFormat) : void
      {
         if(param2.font == null)
         {
            param2.font = §_-c10§;
         }
         if(param2.color == null)
         {
            param2.color = §_-Y2H§;
         }
         this.defaultTextFormat = param2;
         this.text = param1;
      }
      
      private function §_-q5§(param1:String, param2:StyleSheet) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         this.styleSheet = param2;
         if(this.styleSheet)
         {
            _loc3_ = this.styleSheet.getStyle("body");
            if(_loc3_ == null)
            {
               _loc3_ = {};
            }
            if(!("fontFamily" in _loc3_))
            {
               _loc3_["fontFamily"] = §_-c10§;
            }
            if(!("color" in _loc3_))
            {
               _loc3_["color"] = §_-726§;
            }
            if(!("fontSize" in _loc3_))
            {
               _loc3_["fontSize"] = "11px";
            }
            this.styleSheet.setStyle("body",_loc3_);
            _loc4_ = this.styleSheet.getStyle("a:hover");
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
}

