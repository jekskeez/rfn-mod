package §_-k1c§
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-W1e§;
   import §_-I10§.§_-d2x§;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import views.§_-m23§;
   
   public class §_-F2X§ extends Dialog
   {
      
      private static var _instance:§_-F2X§ = null;
      
      public function §_-F2X§()
      {
         super(gls("Продлить VIP-статус"));
         this.init();
      }
      
      public static function show() : void
      {
         if(§_-d2x§.§_-z2o§ <= §_-My§.§_-U1R§)
         {
            return;
         }
         §_-EI§.load(function():void
         {
            if(!_instance)
            {
               _instance = new §_-F2X§();
            }
            _instance.show();
            §_-W1e§.§_-q1R§(§_-W1e§.§_-P24§);
         },true);
      }
      
      override public function showDialog() : void
      {
         super.showDialog();
         Connection.§_-Li§(§_-h2B§.§_-BN§,§_-h2B§.§_-4B§);
      }
      
      private function init() : void
      {
         var _loc1_:§_-22V§ = new §_-22V§(gls("VIP статус даёт огромное превосходство в игре. Продли его\nдействие, чтобы не потерять преимущества VIP игрока."),10,0,new TextFormat(null,14,6504987,true,null,null,null,null,"center"));
         _loc1_.wordWrap = true;
         _loc1_.width = 550;
         addChild(_loc1_);
         var _loc2_:DialogVIPView = new DialogVIPView();
         _loc2_.x = 10;
         _loc2_.y = 40;
         addChild(_loc2_);
         var _loc3_:§_-m23§ = new §_-m23§();
         _loc3_.x = _loc2_.x;
         _loc3_.y = _loc2_.y + 295;
         _loc3_.callback = this.§_-RE§;
         addChild(_loc3_);
         var _loc4_:Array = [gls("Одно бесплатное воскрешение на раунде"),gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("х2 скорость получения опыта белкой и шаманом"),gls("+100 маны ежедневно"),gls("Золотые крылья рядом с именем"),gls("Доступ к чату VIP игроков")];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc1_ = new §_-22V§(_loc4_[_loc5_],_loc2_.x + 310,_loc2_.y + 43 * _loc5_ + 14,new TextFormat(null,12,6763521,true,null,null,null,null,"center"));
            _loc1_.wordWrap = true;
            _loc1_.width = 230;
            addChild(_loc1_);
            _loc5_++;
         }
         place();
      }
      
      private function §_-RE§() : void
      {
         §_-W1e§.used(§_-W1e§.§_-P24§);
      }
   }
}

