package §_-U2w§
{
   import §_-Kr§.§_-h1x§;
   import §_-k1c§.Dialog;
   import §_-l26§.§_-MZ§;
   import buttons.§_-j18§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import protocol.§_-S2I§;
   import utils.§_-c10§;
   
   public class §_-72h§ extends Dialog
   {
      
      private static const §_-Th§:Object = {};
      
      private static var _instance:§_-72h§ = null;
      
      §_-Th§[§_-S2I§.§_-61T§] = gls("Обычное состояние");
      §_-Th§[§_-S2I§.§_-ub§] = gls("Обновление сервера");
      §_-Th§[§_-S2I§.§_-nP§] = gls("Обновление клиента");
      §_-Th§[§_-S2I§.§_-s1g§] = gls("Обновление конфига");
      §_-Th§[§_-S2I§.§_-23a§] = gls("Вход с другого устройства");
      
      private var §_-z1H§:TextField = new TextField();
      
      private var §_-E2e§:§_-h1x§ = new §_-h1x§(180);
      
      private var §_-d2m§:int = 0;
      
      public function §_-72h§()
      {
         super(gls("Отправить сообщение"));
         _instance = this;
         this.init();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      public static function §_-R2a§(param1:int) : void
      {
         if(_instance == null)
         {
            new §_-72h§();
         }
         _instance.show();
         _instance.§_-d2m§ = param1;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-z1H§.text = "";
      }
      
      private function §_-21G§(param1:KeyboardEvent) : void
      {
         if(!param1 || !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         if(!param1.ctrlKey || param1.keyCode != Keyboard.H)
         {
            return;
         }
         this.show();
         this.§_-d2m§ = 0;
      }
      
      private function init() : void
      {
         var _loc2_:String = null;
         addChild(new §_-22V§(gls("Текст:"),0,5,new TextFormat(§_-22V§.§_-F2z§,13,0)));
         this.§_-z1H§.x = 0;
         this.§_-z1H§.y = 35;
         this.§_-z1H§.width = 320;
         this.§_-z1H§.height = 40;
         this.§_-z1H§.multiline = true;
         this.§_-z1H§.wordWrap = true;
         this.§_-z1H§.type = TextFieldType.INPUT;
         this.§_-z1H§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0);
         this.§_-z1H§.borderColor = 11776947;
         this.§_-z1H§.border = true;
         addChild(this.§_-z1H§);
         var _loc1_:Array = [];
         for(_loc2_ in §_-Th§)
         {
            _loc1_.push({
               "label":§_-Th§[_loc2_],
               "value":int(_loc2_)
            });
         }
         this.§_-E2e§.§_-gx§ = _loc1_;
         this.§_-E2e§.§_-Uf§ = 0;
         this.§_-E2e§.x = 140;
         this.§_-E2e§.y = 83;
         this.§_-E2e§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§);
         addChild(this.§_-E2e§);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Отправить"));
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
         §_-MZ§.sendMessage(this.§_-z1H§.text,this.§_-E2e§.§_-l1§["value"],this.§_-d2m§);
         hide();
      }
   }
}

