package §_-d1P§
{
   import §_-B1G§.§_-32t§;
   import §_-E1v§.§_-31Y§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import protocol.§_-s2l§;
   import utils.§_-33I§;
   
   public class §_-c1N§ extends Dialog
   {
      
      private static const §_-z1c§:Object = {};
      
      private static var _instance:§_-c1N§ = null;
      
      §_-z1c§[§_-s2l§.§_-s1H§] = gls("Обычное состояние");
      §_-z1c§[§_-s2l§.§_-02b§] = gls("Обновление сервера");
      §_-z1c§[§_-s2l§.§_-B3w§] = gls("Обновление клиента");
      §_-z1c§[§_-s2l§.§_-qB§] = gls("Обновление конфига");
      §_-z1c§[§_-s2l§.§_-12h§] = gls("Вход с другого устройства");
      
      private var §_-v2Q§:TextField = new TextField();
      
      private var §_-n1b§:§_-32t§ = new §_-32t§(180);
      
      private var §_-b2Y§:int = 0;
      
      public function §_-c1N§()
      {
         super(gls("Отправить сообщение"));
         _instance = this;
         this.init();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      public static function §_-q2d§(param1:int) : void
      {
         if(_instance == null)
         {
            new §_-c1N§();
         }
         _instance.show();
         _instance.§_-b2Y§ = param1;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-v2Q§.text = "";
      }
      
      private function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(!param1 || !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         if(!param1.ctrlKey || param1.keyCode != Keyboard.H)
         {
            return;
         }
         this.show();
         this.§_-b2Y§ = 0;
      }
      
      private function init() : void
      {
         var _loc2_:String = null;
         addChild(new §_-i5§(gls("Текст:"),0,5,new TextFormat(§_-i5§.§_-c10§,13,0)));
         this.§_-v2Q§.x = 0;
         this.§_-v2Q§.y = 35;
         this.§_-v2Q§.width = 320;
         this.§_-v2Q§.height = 40;
         this.§_-v2Q§.multiline = true;
         this.§_-v2Q§.wordWrap = true;
         this.§_-v2Q§.type = TextFieldType.INPUT;
         this.§_-v2Q§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,13,0);
         this.§_-v2Q§.borderColor = 11776947;
         this.§_-v2Q§.border = true;
         addChild(this.§_-v2Q§);
         var _loc1_:Array = [];
         for(_loc2_ in §_-z1c§)
         {
            _loc1_.push({
               "label":§_-z1c§[_loc2_],
               "value":int(_loc2_)
            });
         }
         this.§_-n1b§.§_-GO§ = _loc1_;
         this.§_-n1b§.§_-JZ§ = 0;
         this.§_-n1b§.x = 140;
         this.§_-n1b§.y = 83;
         this.§_-n1b§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§);
         addChild(this.§_-n1b§);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Отправить"));
         _loc3_.x = 0;
         _loc3_.y = 80;
         _loc3_.addEventListener(MouseEvent.CLICK,this.request);
         addChild(_loc3_);
         place();
         this.width = 350;
         this.height -= 60;
      }
      
      private function request(param1:MouseEvent) : void
      {
         §_-31Y§.sendMessage(this.§_-v2Q§.text,this.§_-n1b§.§_-E2v§["value"],this.§_-b2Y§);
         hide();
      }
   }
}

