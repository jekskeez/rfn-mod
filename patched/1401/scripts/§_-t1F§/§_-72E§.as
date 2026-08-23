package §_-t1F§
{
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-72E§ extends Dialog
   {
      
      private static const §_-P1F§:int = 0;
      
      private static const §_-01U§:int = 1;
      
      private static const §_-g1o§:int = 2;
      
      private static const §_-o24§:int = 3;
      
      private static const §_-v1u§:Array = [new ColorMatrixFilter([4,0,0,0,0,0.5,0.5,0,0,0,0.5,0,0.5,0,0,0,0,0,1,0])];
      
      private static const §_-Co§:Object = {};
      
      private static var _instance:§_-72E§ = null;
      
      §_-Co§[§_-P1F§] = gls("Промокод");
      §_-Co§[§_-01U§] = gls("Промокод уже был использован");
      §_-Co§[§_-g1o§] = gls("Промокод устарел");
      §_-Co§[§_-o24§] = gls("Некорректный промокод");
      
      private var §_-z1Z§:DisplayObject;
      
      private var §_-H2f§:TextField;
      
      public function §_-72E§()
      {
         super(gls("Ввести промокод"));
         this.init();
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-72E§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-ZL§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-t2l§]);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-t2l§]);
      }
      
      private function init() : void
      {
         this.§_-z1Z§ = new InviteKeyBackground();
         this.§_-z1Z§.x = 43;
         this.§_-z1Z§.y = 10;
         this.§_-z1Z§.addEventListener(MouseEvent.CLICK,this.§_-E2W§,false,0,true);
         addChild(this.§_-z1Z§);
         this.§_-H2f§ = new TextField();
         this.§_-H2f§.x = 46;
         this.§_-H2f§.y = 13;
         this.§_-H2f§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,15,3939591);
         this.§_-H2f§.text = §_-Co§[§_-P1F§];
         this.§_-H2f§.width = 205;
         this.§_-H2f§.height = 23;
         this.§_-H2f§.selectable = true;
         this.§_-H2f§.type = TextFieldType.INPUT;
         this.§_-H2f§.addEventListener(FocusEvent.FOCUS_IN,this.§_-G1m§);
         this.§_-H2f§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         addChild(this.§_-H2f§);
         var _loc1_:§_-j18§ = new §_-j18§(gls("Применить"));
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-r§,false,0,true);
         place(_loc1_);
         this.width = 326;
         this.height = this.topOffset + this.§_-JZ§ + this.§_-H2f§.y + this.§_-H2f§.height + _loc1_.height + 23;
         var _loc2_:ButtonFAQ = new ButtonFAQ();
         _loc2_.width = 14.5;
         _loc2_.height = 20;
         _loc2_.x = this.§_-O2e§.x - _loc2_.width - 5;
         _loc2_.y = this.§_-O2e§.y + 1;
         addChild(_loc2_);
         new §_-Hb§(_loc2_,gls("Промокод - это специальный код, который можно использовать для получения различных бонусов в игре. Чтобы получить промокод, следи за нашими социальными сетями и участвуй в специальных акциях!"));
         addEventListener(MouseEvent.CLICK,this.§_-v8§,false,0,true);
      }
      
      private function §_-r§(param1:MouseEvent) : void
      {
         if(this.§_-H2f§.text == "" || this.§_-S2W§(this.§_-H2f§.text))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-pn§,this.§_-H2f§.text);
      }
      
      private function §_-E2W§(param1:MouseEvent) : void
      {
         Game.stage.focus = this.§_-H2f§;
      }
      
      private function §_-v8§(param1:MouseEvent) : void
      {
         Game.stage.focus = Game.stage;
      }
      
      private function §_-G1m§(param1:FocusEvent) : void
      {
         var _loc2_:TextField = param1.currentTarget as TextField;
         if(this.§_-S2W§(this.§_-H2f§.text))
         {
            _loc2_.text = "";
         }
      }
      
      private function §_-R1E§(param1:FocusEvent) : void
      {
         var _loc2_:TextField = param1.currentTarget as TextField;
         if(_loc2_.text != "")
         {
            return;
         }
         this.§_-ZL§();
      }
      
      private function §_-ZL§() : void
      {
         this.§_-z1Z§.filters = [];
         this.§_-H2f§.filters = [];
         this.§_-H2f§.text = §_-Co§[§_-P1F§];
      }
      
      private function §_-S2W§(param1:String) : Boolean
      {
         var _loc2_:String = null;
         for each(_loc2_ in §_-Co§)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1[0])
         {
            case §_-01U§:
            case §_-g1o§:
            case §_-o24§:
               this.§_-H2f§.text = §_-Co§[param1[0]];
               this.§_-H2f§.filters = §_-v1u§;
               this.§_-z1Z§.filters = §_-v1u§;
               return;
            case §_-P1F§:
         }
         this.hide();
      }
   }
}

