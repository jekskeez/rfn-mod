package §_-6f§
{
   import §_-S1n§.§_-kr§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-71B§ extends Dialog
   {
      
      private static const §_-b21§:int = 0;
      
      private static const §_-Q14§:int = 1;
      
      private static const §_-l1c§:int = 2;
      
      private static const §_-bw§:int = 3;
      
      private static const §_-42q§:Array = [new ColorMatrixFilter([4,0,0,0,0,0.5,0.5,0,0,0,0.5,0,0.5,0,0,0,0,0,1,0])];
      
      private static const §_-s22§:Object = {};
      
      private static var _instance:§_-71B§ = null;
      
      §_-s22§[§_-b21§] = gls("Промокод");
      §_-s22§[§_-Q14§] = gls("Промокод уже был использован");
      §_-s22§[§_-l1c§] = gls("Промокод устарел");
      §_-s22§[§_-bw§] = gls("Некорректный промокод");
      
      private var §_-N2b§:DisplayObject;
      
      private var §_-wp§:TextField;
      
      public function §_-71B§()
      {
         super(gls("Ввести промокод"));
         this.init();
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-71B§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-T22§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-b2f§]);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-b2f§]);
      }
      
      private function init() : void
      {
         this.§_-N2b§ = new InviteKeyBackground();
         this.§_-N2b§.x = 43;
         this.§_-N2b§.y = 10;
         this.§_-N2b§.addEventListener(MouseEvent.CLICK,this.§_-i1T§,false,0,true);
         addChild(this.§_-N2b§);
         this.§_-wp§ = new TextField();
         this.§_-wp§.x = 46;
         this.§_-wp§.y = 13;
         this.§_-wp§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,15,3939591);
         this.§_-wp§.text = §_-s22§[§_-b21§];
         this.§_-wp§.width = 205;
         this.§_-wp§.height = 23;
         this.§_-wp§.selectable = true;
         this.§_-wp§.type = TextFieldType.INPUT;
         this.§_-wp§.addEventListener(FocusEvent.FOCUS_IN,this.§_-B2A§);
         this.§_-wp§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         addChild(this.§_-wp§);
         var _loc1_:§_-K2G§ = new §_-K2G§(gls("Применить"));
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-d2b§,false,0,true);
         place(_loc1_);
         this.width = 326;
         this.height = this.topOffset + this.§_-f2d§ + this.§_-wp§.y + this.§_-wp§.height + _loc1_.height + 23;
         var _loc2_:ButtonFAQ = new ButtonFAQ();
         _loc2_.width = 14.5;
         _loc2_.height = 20;
         _loc2_.x = this.§_-x2T§.x - _loc2_.width - 5;
         _loc2_.y = this.§_-x2T§.y + 1;
         addChild(_loc2_);
         new §_-kr§(_loc2_,gls("Промокод - это специальный код, который можно использовать для получения различных бонусов в игре. Чтобы получить промокод, следи за нашими социальными сетями и участвуй в специальных акциях!"));
         addEventListener(MouseEvent.CLICK,this.§_-f14§,false,0,true);
      }
      
      private function §_-d2b§(param1:MouseEvent) : void
      {
         if(this.§_-wp§.text == "" || this.§_-S2f§(this.§_-wp§.text))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-F2b§,this.§_-wp§.text);
      }
      
      private function §_-i1T§(param1:MouseEvent) : void
      {
         Game.stage.focus = this.§_-wp§;
      }
      
      private function §_-f14§(param1:MouseEvent) : void
      {
         Game.stage.focus = Game.stage;
      }
      
      private function §_-B2A§(param1:FocusEvent) : void
      {
         var _loc2_:TextField = param1.currentTarget as TextField;
         if(this.§_-S2f§(this.§_-wp§.text))
         {
            _loc2_.text = "";
         }
      }
      
      private function §_-Oa§(param1:FocusEvent) : void
      {
         var _loc2_:TextField = param1.currentTarget as TextField;
         if(_loc2_.text != "")
         {
            return;
         }
         this.§_-T22§();
      }
      
      private function §_-T22§() : void
      {
         this.§_-N2b§.filters = [];
         this.§_-wp§.filters = [];
         this.§_-wp§.text = §_-s22§[§_-b21§];
      }
      
      private function §_-S2f§(param1:String) : Boolean
      {
         var _loc2_:String = null;
         for each(_loc2_ in §_-s22§)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1[0])
         {
            case §_-Q14§:
            case §_-l1c§:
            case §_-bw§:
               this.§_-wp§.text = §_-s22§[param1[0]];
               this.§_-wp§.filters = §_-42q§;
               this.§_-N2b§.filters = §_-42q§;
               return;
            case §_-b21§:
         }
         this.hide();
      }
   }
}

