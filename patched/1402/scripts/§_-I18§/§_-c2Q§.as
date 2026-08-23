package §_-I18§
{
   import §_-B1G§.ScrollPane;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
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
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import tape.§_-5h§;
   import tape.§_-cY§;
   import utils.§_-L2J§;
   
   public class §_-c2Q§ extends Dialog
   {
      
      private static const §_-Gx§:String = gls("Поиск");
      
      private static const §_-xh§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,10917501,null,null,null,null,null,null,null,null,null,2);
      
      private static const §_-23W§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,5783050,null,null,null,null,null,null,null,null,null,2);
      
      private static const §_-n9§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,5783050,true,null,null,null,null,"center");
      
      private static var instance:§_-c2Q§ = null;
      
      private var §_-9b§:TextField = null;
      
      private var §_-52T§:§_-i5§ = null;
      
      private var §_-b2p§:SimpleButton = null;
      
      private var §_-F18§:§_-K2G§ = null;
      
      private var §_-W18§:ScrollPane = null;
      
      private var §_-u2O§:§_-5h§ = null;
      
      private var §_-k2x§:§_-cY§ = null;
      
      public function §_-c2Q§()
      {
         super(gls("Кланы"));
         this.init();
      }
      
      public static function show(param1:MouseEvent = null) : void
      {
         if(!instance)
         {
            instance = new §_-c2Q§();
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
         instance.§_-9b§.removeEventListener(FocusEvent.FOCUS_IN,instance.§_-B2A§);
         instance.§_-9b§.removeEventListener(FocusEvent.FOCUS_OUT,instance.§_-Oa§);
         instance.§_-9b§.removeEventListener(KeyboardEvent.KEY_DOWN,instance.§_-r1i§);
         instance.§_-u2O§.removeEventListener(Event.CHANGE,instance.§_-83Q§);
         instance.§_-k2x§.dispose();
         instance = null;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-9b§.defaultTextFormat = §_-xh§;
         this.§_-9b§.text = §_-Gx§;
         this.§_-Oa§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-W2e§]);
         this.§_-42R§();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-W2e§]);
      }
      
      private function init() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.lineStyle(1,10917501);
         _loc1_.graphics.drawRoundRectComplex(2,10,260,29,3,1.5,3,1.5);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         this.§_-9b§ = new TextField();
         this.§_-9b§.x = 7;
         this.§_-9b§.y = 15;
         this.§_-9b§.width = 256;
         this.§_-9b§.height = 30;
         this.§_-9b§.type = TextFieldType.INPUT;
         this.§_-9b§.defaultTextFormat = §_-xh§;
         this.§_-9b§.maxChars = §_-Zy§.§_-u2H§;
         this.§_-9b§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         this.§_-9b§.addEventListener(FocusEvent.FOCUS_IN,this.§_-B2A§);
         this.§_-9b§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         this.§_-9b§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
         §_-L2J§.embedFonts(this.§_-9b§);
         addChild(this.§_-9b§);
         this.§_-b2p§ = new ButtonSearch();
         this.§_-b2p§.x = _loc1_.x + _loc1_.width + 5;
         this.§_-b2p§.y = 10;
         this.§_-b2p§.addEventListener(MouseEvent.CLICK,this.§_-wV§);
         addChild(this.§_-b2p§);
         this.§_-52T§ = new §_-i5§(gls("Кланы не найдены"),0,0,§_-n9§,295);
         this.§_-52T§.y = 150;
         this.§_-52T§.visible = false;
         addChild(this.§_-52T§);
         this.§_-k2x§ = new §_-cY§();
         this.§_-u2O§ = new §_-5h§();
         this.§_-u2O§.setData(this.§_-k2x§);
         this.§_-u2O§.addEventListener(Event.CHANGE,this.§_-83Q§);
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.x = 2;
         this.§_-W18§.y = 50;
         this.§_-W18§.width = 294;
         this.§_-W18§.height = 250;
         this.§_-W18§.source = this.§_-u2O§;
         this.§_-W18§.update();
         addChild(this.§_-W18§);
         this.§_-F18§ = new §_-K2G§(gls("Создать клан"),0,14,this.§_-Z8§);
         place(this.§_-F18§);
         this.height = 390;
      }
      
      private function §_-B2A§(param1:FocusEvent) : void
      {
         this.§_-9b§.defaultTextFormat = §_-23W§;
         this.§_-9b§.text = this.§_-9b§.text == §_-Gx§ ? "" : this.§_-9b§.text;
      }
      
      private function §_-Oa§(param1:FocusEvent = null) : void
      {
         if(this.§_-9b§.text != "" && this.§_-9b§.text != §_-Gx§)
         {
            return;
         }
         this.§_-9b§.defaultTextFormat = §_-xh§;
         this.§_-9b§.text = §_-Gx§;
      }
      
      private function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.§_-42R§();
      }
      
      private function §_-wV§(param1:MouseEvent) : void
      {
         this.§_-42R§();
      }
      
      private function §_-Z8§(param1:MouseEvent) : void
      {
         §_-BK§.show();
      }
      
      private function §_-83Q§(param1:Event) : void
      {
         this.§_-W18§.update();
      }
      
      private function §_-42R§() : void
      {
         var _loc1_:String = this.§_-9b§.text;
         if(_loc1_ == §_-Gx§)
         {
            _loc1_ = "";
         }
         Connection.§_-e2T§(§_-u1O§.§_-w2Q§,_loc1_,false);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = param1[2];
         if(_loc2_.length == 0)
         {
            this.§_-52T§.visible = true;
            this.§_-W18§.visible = false;
            return;
         }
         this.§_-52T§.visible = false;
         this.§_-W18§.visible = true;
         this.§_-k2x§.§_-Ls§(_loc2_);
         this.§_-W18§.update();
      }
   }
}

