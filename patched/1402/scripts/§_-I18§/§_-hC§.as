package §_-I18§
{
   import §_-bN§.Dialog;
   import §_-bN§.§_-Sg§;
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-hC§ extends Dialog
   {
      
      private static var _instance:§_-hC§ = null;
      
      private var §_-hv§:TextField = new TextField();
      
      private var §_-QZ§:TextField = new TextField();
      
      public function §_-hC§(param1:String = null, param2:String = null)
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
         var _loc2_:§_-i5§ = new §_-i5§(param1,5,0,new TextFormat(null,14,0));
         _loc2_.width = 296;
         addChild(_loc2_);
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,14090240,true);
         var _loc4_:DisplayObject = addChild(new ImageFieldInputText());
         _loc4_.x = _loc2_.x;
         _loc4_.y = _loc2_.y + _loc2_.textHeight + 20;
         this.§_-QZ§.x = _loc4_.x + 8;
         this.§_-QZ§.y = _loc4_.y + 4;
         this.§_-QZ§.type = TextFieldType.INPUT;
         this.§_-QZ§.defaultTextFormat = _loc3_;
         this.§_-QZ§.width = 35;
         this.§_-QZ§.restrict = "[0-9]";
         this.§_-QZ§.maxChars = 4;
         this.§_-QZ§.embedFonts = true;
         this.§_-QZ§.text = "0";
         this.§_-QZ§.height = this.§_-QZ§.textHeight + 5;
         addChild(this.§_-QZ§);
         var _loc5_:ImageIconNut = new ImageIconNut();
         _loc5_.x = this.§_-QZ§.x + 43;
         _loc5_.y = this.§_-QZ§.y;
         _loc5_.scaleX = _loc5_.scaleY = 0.8;
         addChild(_loc5_);
         var _loc6_:DisplayObject = addChild(new ImageFieldInputText());
         _loc6_.x = _loc4_.x + _loc4_.width + 13;
         _loc6_.y = _loc4_.y;
         this.§_-hv§.x = _loc6_.x + 8;
         this.§_-hv§.y = _loc6_.y + 4;
         this.§_-hv§.type = TextFieldType.INPUT;
         this.§_-hv§.defaultTextFormat = _loc3_;
         this.§_-hv§.width = 35;
         this.§_-hv§.restrict = "[0-9]";
         this.§_-hv§.maxChars = 3;
         this.§_-hv§.embedFonts = true;
         this.§_-hv§.text = "0";
         this.§_-hv§.height = this.§_-hv§.textHeight + 5;
         addChild(this.§_-hv§);
         var _loc7_:ImageIconCoins = new ImageIconCoins();
         _loc7_.x = this.§_-hv§.x + 42;
         _loc7_.y = this.§_-hv§.y;
         _loc7_.scaleX = _loc7_.scaleY = 0.8;
         addChild(_loc7_);
         var _loc8_:§_-K2G§ = new §_-K2G§(gls("Внести"));
         _loc8_.x = _loc2_.x + _loc2_.width - _loc8_.width;
         _loc8_.y = _loc4_.y;
         _loc8_.addEventListener(MouseEvent.CLICK,this.§_-m1M§);
         addChild(_loc8_);
         place();
         this.width += 10;
         this.height = this.topOffset + _loc8_.y + _loc8_.height + this.§_-f2d§ + 20;
      }
      
      private function §_-m1M§(param1:MouseEvent) : void
      {
         if(int(this.§_-hv§.text) == 0 && int(this.§_-QZ§.text) == 0)
         {
            return;
         }
         if(Game.§_-I20§ < int(this.§_-hv§.text))
         {
            Services.bank.open(§_-Sg§.§_-7G§);
            return;
         }
         if(Game.§_-v1T§ < int(this.§_-QZ§.text))
         {
            Services.bank.open(§_-Sg§.§_-23U§);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-121§,int(this.§_-hv§.text),int(this.§_-QZ§.text));
         this.close();
      }
   }
}

