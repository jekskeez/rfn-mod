package §_-bN§
{
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-N10§;
   import §_-X1k§.§_-XW§;
   import §_-s2e§.§_-U2d§;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import views.§_-q2a§;
   
   public class §_-YP§ extends Dialog
   {
      
      private static var _instance:§_-YP§ = null;
      
      public function §_-YP§()
      {
         super(gls("Продлить VIP-статус"));
         this.init();
      }
      
      public static function show() : void
      {
         if(§_-LZ§.§_-mA§ <= §_-XW§.§_-I1V§)
         {
            return;
         }
         §_-U2d§.load(function():void
         {
            if(!_instance)
            {
               _instance = new §_-YP§();
            }
            _instance.show();
            §_-N10§.§_-p2j§(§_-N10§.§_-w1G§);
         },true);
      }
      
      override public function showDialog() : void
      {
         super.showDialog();
         Connection.§_-e2T§(§_-u1O§.§_-w2G§,§_-u1O§.§_-u2h§);
      }
      
      private function init() : void
      {
         var _loc1_:§_-i5§ = new §_-i5§(gls("VIP статус даёт огромное превосходство в игре. Продли его\nдействие, чтобы не потерять преимущества VIP игрока."),10,0,new TextFormat(null,14,6504987,true,null,null,null,null,"center"));
         _loc1_.wordWrap = true;
         _loc1_.width = 550;
         addChild(_loc1_);
         var _loc2_:DialogVIPView = new DialogVIPView();
         _loc2_.x = 10;
         _loc2_.y = 40;
         addChild(_loc2_);
         var _loc3_:§_-q2a§ = new §_-q2a§();
         _loc3_.x = _loc2_.x;
         _loc3_.y = _loc2_.y + 295;
         _loc3_.callback = this.§_-513§;
         addChild(_loc3_);
         var _loc4_:Array = [gls("Одно бесплатное воскрешение на раунде"),gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("х2 скорость получения опыта белкой и шаманом"),gls("+100 маны ежедневно"),gls("Золотые крылья рядом с именем"),gls("Доступ к чату VIP игроков")];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc1_ = new §_-i5§(_loc4_[_loc5_],_loc2_.x + 310,_loc2_.y + 43 * _loc5_ + 14,new TextFormat(null,12,6763521,true,null,null,null,null,"center"));
            _loc1_.wordWrap = true;
            _loc1_.width = 230;
            addChild(_loc1_);
            _loc5_++;
         }
         place();
      }
      
      private function §_-513§() : void
      {
         §_-N10§.used(§_-N10§.§_-w1G§);
      }
   }
}

