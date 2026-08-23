package §_-xm§
{
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-7O§;
   import buttons.§_-j18§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-53k§ extends Dialog
   {
      
      private static var _instance:§_-53k§ = null;
      
      private var §_-x2r§:TextField = new TextField();
      
      private var §_-k2i§:TextField = new TextField();
      
      public function §_-53k§(param1:String = null, param2:String = null)
      {
         if(_instance != null)
         {
            _instance.close();
         }
         _instance = this;
         if(param2 == null)
         {
            param2 = gls("Каждая белка, состоящая в клане, должна\nвносить орешки или монетки.");
         }
         super(param1 == null ? gls("Внеси свой взнос") : param1);
         this.init(param2);
      }
      
      private function init(param1:String) : void
      {
         var _loc2_:§_-22V§ = new §_-22V§(param1,5,0,new TextFormat(null,14,0));
         _loc2_.width = 296;
         addChild(_loc2_);
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,14090240,true);
         var _loc4_:DisplayObject = addChild(new ImageFieldInputText());
         _loc4_.x = _loc2_.x;
         _loc4_.y = _loc2_.y + _loc2_.textHeight + 20;
         this.§_-k2i§.x = _loc4_.x + 8;
         this.§_-k2i§.y = _loc4_.y + 4;
         this.§_-k2i§.type = TextFieldType.INPUT;
         this.§_-k2i§.defaultTextFormat = _loc3_;
         this.§_-k2i§.width = 35;
         this.§_-k2i§.restrict = "[0-9]";
         this.§_-k2i§.maxChars = 4;
         this.§_-k2i§.embedFonts = true;
         this.§_-k2i§.text = "0";
         this.§_-k2i§.height = this.§_-k2i§.textHeight + 5;
         addChild(this.§_-k2i§);
         var _loc5_:ImageIconNut = new ImageIconNut();
         _loc5_.x = this.§_-k2i§.x + 43;
         _loc5_.y = this.§_-k2i§.y;
         _loc5_.scaleX = _loc5_.scaleY = 0.8;
         addChild(_loc5_);
         var _loc6_:DisplayObject = addChild(new ImageFieldInputText());
         _loc6_.x = _loc4_.x + _loc4_.width + 13;
         _loc6_.y = _loc4_.y;
         this.§_-x2r§.x = _loc6_.x + 8;
         this.§_-x2r§.y = _loc6_.y + 4;
         this.§_-x2r§.type = TextFieldType.INPUT;
         this.§_-x2r§.defaultTextFormat = _loc3_;
         this.§_-x2r§.width = 35;
         this.§_-x2r§.restrict = "[0-9]";
         this.§_-x2r§.maxChars = 3;
         this.§_-x2r§.embedFonts = true;
         this.§_-x2r§.text = "0";
         this.§_-x2r§.height = this.§_-x2r§.textHeight + 5;
         addChild(this.§_-x2r§);
         var _loc7_:ImageIconCoins = new ImageIconCoins();
         _loc7_.x = this.§_-x2r§.x + 42;
         _loc7_.y = this.§_-x2r§.y;
         _loc7_.scaleX = _loc7_.scaleY = 0.8;
         addChild(_loc7_);
         var _loc8_:§_-j18§ = new §_-j18§(gls("Внести"));
         _loc8_.x = _loc2_.x + _loc2_.width - _loc8_.width;
         _loc8_.y = _loc4_.y;
         _loc8_.addEventListener(MouseEvent.CLICK,this.§_-O2V§);
         addChild(_loc8_);
         place();
         this.width += 10;
         this.height = this.topOffset + _loc8_.y + _loc8_.height + this.§_-JZ§ + 20;
      }
      
      private function §_-O2V§(param1:MouseEvent) : void
      {
         if(int(this.§_-x2r§.text) == 0 && int(this.§_-k2i§.text) == 0)
         {
            return;
         }
         if(Game.§_-DJ§ < int(this.§_-x2r§.text))
         {
            Services.bank.open(§_-7O§.§_-s1Z§);
            return;
         }
         if(Game.§_-I2M§ < int(this.§_-k2i§.text))
         {
            Services.bank.open(§_-7O§.§_-K2P§);
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-x2B§,int(this.§_-x2r§.text),int(this.§_-k2i§.text));
         this.close();
      }
   }
}

