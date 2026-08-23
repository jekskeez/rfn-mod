package §_-bN§
{
   import §_-X1k§.§_-i2a§;
   import §_-c2C§.§_-si§;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import views.§_-92F§;
   
   public class §_-qC§ extends Dialog
   {
      
      private static const §_-s9§:int = 6;
      
      public static var §_-Z12§:Array = [];
      
      private static var _instance:§_-qC§ = null;
      
      private var §_-O2A§:§_-Fk§ = null;
      
      private var §_-s5§:§_-Fk§ = null;
      
      private var §_-E1Q§:§_-K2G§ = null;
      
      private var §_-q1Z§:Vector.<§_-92F§> = new Vector.<§_-92F§>(0);
      
      public function §_-qC§()
      {
         super(gls("Подарки друзьям"));
         this.init();
         this.§_-O2A§ = new §_-Fk§(gls("Подарки"),gls("Подарки друзьям успешно отправлены!\nНе забудь проверять почту, тебе\nобязательно отправят подарки в ответ."));
         this.§_-s5§ = new §_-Fk§(gls("Подарки"),gls("Чтобы отправить подарки, выбери хотя бы одного\nдруга, которому ещё не оправлял сегодня подарок."));
      }
      
      public static function show() : void
      {
         if(!§_-i2a§.§_-51j§)
         {
            return;
         }
         if(!_instance)
         {
            _instance = new §_-qC§();
         }
         _instance.show();
      }
      
      private function init() : void
      {
         var _loc1_:§_-i5§ = null;
         var _loc2_:int = 0;
         var _loc3_:§_-92F§ = null;
         var _loc4_:ImageNoFriends = null;
         if(§_-i2a§.§_-51j§.length != 0)
         {
            _loc1_ = new §_-i5§(gls("Отправляй друзьям подарки каждый день и они обязательно ответят тебе взаимностью!"),0,10,new TextFormat(null,14,4604991,true));
            _loc1_.x = 375 - int(_loc1_.textWidth * 0.5);
            addChild(_loc1_);
            _loc2_ = 0;
            while(_loc2_ < §_-s9§)
            {
               _loc3_ = new §_-92F§(_loc2_ >= §_-i2a§.§_-51j§.length ? -1 : int(§_-i2a§.§_-51j§[_loc2_]));
               _loc3_.x = 25 + 350 * (_loc2_ % 2);
               _loc3_.y = 40 + 75 * int(_loc2_ * 0.5);
               addChild(_loc3_);
               this.§_-q1Z§.push(_loc3_);
               _loc2_++;
            }
            this.§_-E1Q§ = new §_-K2G§(gls("Отправить"));
            this.§_-E1Q§.addEventListener(MouseEvent.CLICK,this.§_-I1p§);
            addChild(this.§_-E1Q§);
         }
         else
         {
            _loc1_ = new §_-i5§(gls("У тебя нет друзей, чтобы обмениваться подарками."),0,10,new TextFormat(null,14,4604991,true));
            _loc1_.x = 190 - int(_loc1_.textWidth * 0.5);
            addChild(_loc1_);
            _loc4_ = new ImageNoFriends();
            _loc4_.y = 40;
            _loc4_.x = 205 - int(_loc4_.width * 0.5);
            addChild(_loc4_);
            this.§_-E1Q§ = new §_-K2G§(gls("Пригласить друзей"));
            this.§_-E1Q§.addEventListener(MouseEvent.CLICK,this.inviteFriends);
            addChild(this.§_-E1Q§);
         }
         place(this.§_-E1Q§);
         this.width = §_-i2a§.§_-51j§.length != 0 ? 750 : 410;
         this.height = 350;
      }
      
      private function inviteFriends(param1:MouseEvent) : void
      {
         Game.inviteFriends();
         hide();
      }
      
      private function §_-I1p§(param1:MouseEvent) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-q1Z§.length)
         {
            if(!(!this.§_-q1Z§[_loc3_].state || this.§_-q1Z§[_loc3_].§_-D27§))
            {
               this.§_-q1Z§[_loc3_].§_-03W§(_loc2_.length * 5000);
               _loc2_.push(this.§_-q1Z§[_loc3_].playerId);
            }
            _loc3_++;
         }
         if(_loc2_.length == 0)
         {
            this.§_-s5§.show();
            return;
         }
         §_-Z12§ = §_-Z12§.concat(_loc2_);
         Connection.§_-e2T§(§_-u1O§.§_-82I§,_loc2_);
         §_-si§.§_-m1x§();
         hide();
         this.§_-O2A§.show();
         §_-si§.§_-m1x§();
      }
   }
}

