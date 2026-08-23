package §_-C3e§
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-W1e§;
   import §_-I10§.§_-d2x§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-jB§;
   
   public class §_-g1H§ extends Dialog
   {
      
      private static var _instance:§_-g1H§ = null;
      
      public function §_-g1H§()
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
         if(§_-Br§.§_-f2k§ || §_-d2x§.§_-z2o§ < Game.§_-ow§)
         {
            return;
         }
         if(!§_-W1e§.§_-02P§(§_-W1e§.§_-g2r§))
         {
            return;
         }
         if(!_instance)
         {
            _instance = new §_-g1H§();
         }
         _instance.show();
         _instance.x = 30;
         _instance.y = 90;
         §_-W1e§.§_-q1R§(§_-W1e§.§_-g2r§);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,23,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 15;
         this.§_-4n§ = 20;
         this.topOffset = 5;
         this.§_-JZ§ = 0;
      }
      
      private function init() : void
      {
         var _loc5_:§_-22V§ = null;
         addChild(new DialogVIPPart1()).x = 15;
         var _loc1_:DialogVIPPart2 = new DialogVIPPart2();
         addChild(_loc1_).x = 15;
         _loc1_.y = 72;
         addChild(new §_-22V§(gls("и много других преимуществ"),70,110,new TextFormat(null,12,6763521)));
         addChild(new §_-22V§(gls("1 день"),87,130,new TextFormat(null,14,6763521,true)));
         var _loc2_:Array = [gls("Одно бесплатное воскрешение на раунде"),gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("х2 скорость получения опыта\nбелкой и шаманом")];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc5_ = new §_-22V§(_loc2_[_loc3_],75,37 * _loc3_,new TextFormat(null,12,6763521,true,null,null,null,null,"center"));
            _loc5_.wordWrap = true;
            _loc5_.width = 230;
            addChild(_loc5_);
            _loc3_++;
         }
         var _loc4_:§_-j18§ = new §_-j18§(" -   " + §_-8S§.§_-7h§(§_-Br§.§_-F2a§));
         _loc4_.x = 143;
         _loc4_.y = 130;
         _loc4_.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(_loc4_);
         §_-jB§.§_-fG§(_loc4_.field,"-",ImageIconCoins,0.7,0.7,-_loc4_.field.x + 5,-3,false,false);
         place();
         this.width = 350;
         this.height = 210;
      }
      
      private function buy(param1:MouseEvent) : void
      {
         §_-Br§.buy(§_-Br§.§_-F2a§);
         §_-W1e§.used(§_-W1e§.§_-g2r§);
         hide();
      }
   }
}

