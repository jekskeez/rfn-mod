package §_-k1c§
{
   import §_-I10§.§_-Bg§;
   import §_-T2y§.§_-5K§;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import views.§_-s28§;
   
   public class §_-41X§ extends Dialog
   {
      
      private static const §_-82h§:int = 6;
      
      public static var §_-Lh§:Array = [];
      
      private static var _instance:§_-41X§ = null;
      
      private var §_-N1M§:§_-Q13§ = null;
      
      private var §_-YD§:§_-Q13§ = null;
      
      private var §_-v2b§:§_-j18§ = null;
      
      private var §_-W1A§:Vector.<§_-s28§> = new Vector.<§_-s28§>(0);
      
      public function §_-41X§()
      {
         super(gls("Подарки друзьям"));
         this.init();
         this.§_-N1M§ = new §_-Q13§(gls("Подарки"),gls("Подарки друзьям успешно отправлены!\nНе забудь проверять почту, тебе\nобязательно отправят подарки в ответ."));
         this.§_-YD§ = new §_-Q13§(gls("Подарки"),gls("Чтобы отправить подарки, выбери хотя бы одного\nдруга, которому ещё не оправлял сегодня подарок."));
      }
      
      public static function show() : void
      {
         if(!§_-Bg§.§_-I2L§)
         {
            return;
         }
         if(!_instance)
         {
            _instance = new §_-41X§();
         }
         _instance.show();
      }
      
      private function init() : void
      {
         var _loc1_:§_-22V§ = null;
         var _loc2_:int = 0;
         var _loc3_:§_-s28§ = null;
         var _loc4_:ImageNoFriends = null;
         if(§_-Bg§.§_-I2L§.length != 0)
         {
            _loc1_ = new §_-22V§(gls("Отправляй друзьям подарки каждый день и они обязательно ответят тебе взаимностью!"),0,10,new TextFormat(null,14,4604991,true));
            _loc1_.x = 375 - int(_loc1_.textWidth * 0.5);
            addChild(_loc1_);
            _loc2_ = 0;
            while(_loc2_ < §_-82h§)
            {
               _loc3_ = new §_-s28§(_loc2_ >= §_-Bg§.§_-I2L§.length ? -1 : int(§_-Bg§.§_-I2L§[_loc2_]));
               _loc3_.x = 25 + 350 * (_loc2_ % 2);
               _loc3_.y = 40 + 75 * int(_loc2_ * 0.5);
               addChild(_loc3_);
               this.§_-W1A§.push(_loc3_);
               _loc2_++;
            }
            this.§_-v2b§ = new §_-j18§(gls("Отправить"));
            this.§_-v2b§.addEventListener(MouseEvent.CLICK,this.§_-T2j§);
            addChild(this.§_-v2b§);
         }
         else
         {
            _loc1_ = new §_-22V§(gls("У тебя нет друзей, чтобы обмениваться подарками."),0,10,new TextFormat(null,14,4604991,true));
            _loc1_.x = 190 - int(_loc1_.textWidth * 0.5);
            addChild(_loc1_);
            _loc4_ = new ImageNoFriends();
            _loc4_.y = 40;
            _loc4_.x = 205 - int(_loc4_.width * 0.5);
            addChild(_loc4_);
            this.§_-v2b§ = new §_-j18§(gls("Пригласить друзей"));
            this.§_-v2b§.addEventListener(MouseEvent.CLICK,this.inviteFriends);
            addChild(this.§_-v2b§);
         }
         place(this.§_-v2b§);
         this.width = §_-Bg§.§_-I2L§.length != 0 ? 750 : 410;
         this.height = 350;
      }
      
      private function inviteFriends(param1:MouseEvent) : void
      {
         Game.inviteFriends();
         hide();
      }
      
      private function §_-T2j§(param1:MouseEvent) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-W1A§.length)
         {
            if(!(!this.§_-W1A§[_loc3_].state || this.§_-W1A§[_loc3_].§_-42S§))
            {
               this.§_-W1A§[_loc3_].§_-p2u§(_loc2_.length * 5000);
               _loc2_.push(this.§_-W1A§[_loc3_].playerId);
            }
            _loc3_++;
         }
         if(_loc2_.length == 0)
         {
            this.§_-YD§.show();
            return;
         }
         §_-Lh§ = §_-Lh§.concat(_loc2_);
         Connection.§_-Li§(§_-h2B§.§_-f2E§,_loc2_);
         §_-5K§.§_-b1W§();
         hide();
         this.§_-N1M§.show();
         §_-5K§.§_-b1W§();
      }
   }
}

