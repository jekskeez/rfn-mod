package §_-92r§
{
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-N10§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-K1Y§;
   
   public class §_-q1D§ extends Dialog
   {
      
      private static var _instance:§_-q1D§ = null;
      
      public function §_-q1D§()
      {
         super(gls("Играй с VIP-статусом"));
         this.init();
      }
      
      public static function hide() : void
      {
         if(_instance)
         {
            _instance.hide();
         }
      }
      
      public static function show() : void
      {
         if(§_-F1Z§.§_-O1u§ || §_-LZ§.§_-mA§ < Game.§_-V1W§)
         {
            return;
         }
         if(!§_-N10§.§_-o1G§(§_-N10§.§_-aX§))
         {
            return;
         }
         if(!_instance)
         {
            _instance = new §_-q1D§();
         }
         _instance.show();
         _instance.x = 30;
         _instance.y = 90;
         §_-N10§.§_-p2j§(§_-N10§.§_-aX§);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,23,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 15;
         this.§_-7N§ = 20;
         this.topOffset = 5;
         this.§_-f2d§ = 0;
      }
      
      private function init() : void
      {
         var _loc5_:§_-i5§ = null;
         addChild(new DialogVIPPart1()).x = 15;
         var _loc1_:DialogVIPPart2 = new DialogVIPPart2();
         addChild(_loc1_).x = 15;
         _loc1_.y = 72;
         addChild(new §_-i5§(gls("и много других преимуществ"),70,110,new TextFormat(null,12,6763521)));
         addChild(new §_-i5§(gls("1 день"),87,130,new TextFormat(null,14,6763521,true)));
         var _loc2_:Array = [gls("Одно бесплатное воскрешение на раунде"),gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("х2 скорость получения опыта\nбелкой и шаманом")];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc5_ = new §_-i5§(_loc2_[_loc3_],75,37 * _loc3_,new TextFormat(null,12,6763521,true,null,null,null,null,"center"));
            _loc5_.wordWrap = true;
            _loc5_.width = 230;
            addChild(_loc5_);
            _loc3_++;
         }
         var _loc4_:§_-K2G§ = new §_-K2G§(" -   " + §_-93H§.§_-z1K§(§_-F1Z§.§_-43p§));
         _loc4_.x = 143;
         _loc4_.y = 130;
         _loc4_.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(_loc4_);
         §_-K1Y§.§_-P2W§(_loc4_.field,"-",ImageIconCoins,0.7,0.7,-_loc4_.field.x + 5,-3,false,false);
         place();
         this.width = 350;
         this.height = 210;
      }
      
      private function buy(param1:MouseEvent) : void
      {
         §_-F1Z§.buy(§_-F1Z§.§_-43p§);
         §_-N10§.used(§_-N10§.§_-aX§);
         hide();
      }
   }
}

