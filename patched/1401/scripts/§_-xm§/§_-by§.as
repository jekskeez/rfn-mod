package §_-xm§
{
   import §_-Kr§.ScrollPane;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import tape.§_-HG§;
   import tape.§_-sp§;
   import utils.§_-vo§;
   
   public class §_-by§ extends Dialog
   {
      
      private static const §_-E1h§:String = gls("Поиск");
      
      private static const §_-W1x§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,10917501,null,null,null,null,null,null,null,null,null,2);
      
      private static const §_-B1G§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,5783050,null,null,null,null,null,null,null,null,null,2);
      
      private static const §_-M1g§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,5783050,true,null,null,null,null,"center");
      
      private static var instance:§_-by§ = null;
      
      private var §_-fZ§:TextField = null;
      
      private var §_-yh§:§_-22V§ = null;
      
      private var §_-T29§:SimpleButton = null;
      
      private var §_-Tb§:§_-j18§ = null;
      
      private var §_-M1N§:ScrollPane = null;
      
      private var §_-C1d§:§_-HG§ = null;
      
      private var §_-P2t§:§_-sp§ = null;
      
      public function §_-by§()
      {
         super(gls("Кланы"));
         this.init();
      }
      
      public static function show(param1:MouseEvent = null) : void
      {
         if(!instance)
         {
            instance = new §_-by§();
         }
         instance.show();
      }
      
      public static function dispose() : void
      {
         if(!instance)
         {
            return;
         }
         instance.hide(null);
         instance.§_-fZ§.removeEventListener(FocusEvent.FOCUS_IN,instance.§_-G1m§);
         instance.§_-fZ§.removeEventListener(FocusEvent.FOCUS_OUT,instance.§_-R1E§);
         instance.§_-fZ§.removeEventListener(KeyboardEvent.KEY_DOWN,instance.§_-21G§);
         instance.§_-C1d§.removeEventListener(Event.CHANGE,instance.§_-V2x§);
         instance.§_-P2t§.dispose();
         instance = null;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-fZ§.defaultTextFormat = §_-W1x§;
         this.§_-fZ§.text = §_-E1h§;
         this.§_-R1E§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-x2K§]);
         this.§_-T1f§();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-x2K§]);
      }
      
      private function init() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.lineStyle(1,10917501);
         _loc1_.graphics.drawRoundRectComplex(2,10,260,29,3,1.5,3,1.5);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         this.§_-fZ§ = new TextField();
         this.§_-fZ§.x = 7;
         this.§_-fZ§.y = 15;
         this.§_-fZ§.width = 256;
         this.§_-fZ§.height = 30;
         this.§_-fZ§.type = TextFieldType.INPUT;
         this.§_-fZ§.defaultTextFormat = §_-W1x§;
         this.§_-fZ§.maxChars = §_-a9§.§_-y1i§;
         this.§_-fZ§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         this.§_-fZ§.addEventListener(FocusEvent.FOCUS_IN,this.§_-G1m§);
         this.§_-fZ§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         this.§_-fZ§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
         §_-vo§.embedFonts(this.§_-fZ§);
         addChild(this.§_-fZ§);
         this.§_-T29§ = new ButtonSearch();
         this.§_-T29§.x = _loc1_.x + _loc1_.width + 5;
         this.§_-T29§.y = 10;
         this.§_-T29§.addEventListener(MouseEvent.CLICK,this.§_-023§);
         addChild(this.§_-T29§);
         this.§_-yh§ = new §_-22V§(gls("Кланы не найдены"),0,0,§_-M1g§,295);
         this.§_-yh§.y = 150;
         this.§_-yh§.visible = false;
         addChild(this.§_-yh§);
         this.§_-P2t§ = new §_-sp§();
         this.§_-C1d§ = new §_-HG§();
         this.§_-C1d§.setData(this.§_-P2t§);
         this.§_-C1d§.addEventListener(Event.CHANGE,this.§_-V2x§);
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.x = 2;
         this.§_-M1N§.y = 50;
         this.§_-M1N§.width = 294;
         this.§_-M1N§.height = 250;
         this.§_-M1N§.source = this.§_-C1d§;
         this.§_-M1N§.update();
         addChild(this.§_-M1N§);
         this.§_-Tb§ = new §_-j18§(gls("Создать клан"),0,14,this.§_-g1X§);
         place(this.§_-Tb§);
         this.height = 390;
      }
      
      private function §_-G1m§(param1:FocusEvent) : void
      {
         this.§_-fZ§.defaultTextFormat = §_-B1G§;
         this.§_-fZ§.text = this.§_-fZ§.text == §_-E1h§ ? "" : this.§_-fZ§.text;
      }
      
      private function §_-R1E§(param1:FocusEvent = null) : void
      {
         if(this.§_-fZ§.text != "" && this.§_-fZ§.text != §_-E1h§)
         {
            return;
         }
         this.§_-fZ§.defaultTextFormat = §_-W1x§;
         this.§_-fZ§.text = §_-E1h§;
      }
      
      private function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.§_-T1f§();
      }
      
      private function §_-023§(param1:MouseEvent) : void
      {
         this.§_-T1f§();
      }
      
      private function §_-g1X§(param1:MouseEvent) : void
      {
         §_-32P§.show();
      }
      
      private function §_-V2x§(param1:Event) : void
      {
         this.§_-M1N§.update();
      }
      
      private function §_-T1f§() : void
      {
         var _loc1_:String = this.§_-fZ§.text;
         if(_loc1_ == §_-E1h§)
         {
            _loc1_ = "";
         }
         Connection.§_-Li§(§_-h2B§.§_-61d§,_loc1_,false);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = param1[2];
         if(_loc2_.length == 0)
         {
            this.§_-yh§.visible = true;
            this.§_-M1N§.visible = false;
            return;
         }
         this.§_-yh§.visible = false;
         this.§_-M1N§.visible = true;
         this.§_-P2t§.§_-814§(_loc2_);
         this.§_-M1N§.update();
      }
   }
}

