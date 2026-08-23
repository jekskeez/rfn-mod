package §_-C1M§
{
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-hH§;
   import com.api.PaymentEvent;
   import com.api.Services;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-dE§ extends Dialog
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,6829595,false,false,false,null,null,TextFormatAlign.CENTER);
      
      private static var _instance:§_-dE§ = null;
      
      private var data:Object = null;
      
      public function §_-dE§()
      {
         super(gls("Выбор способа оплаты"),true,true,null,false);
         var _loc1_:§_-hH§ = new §_-hH§(gls("Робокасса"),300,20,this.§_-u1Z§,1.3);
         _loc1_.y = 15;
         _loc1_.name = "robokassa";
         _loc1_.enabled = false;
         addChild(_loc1_);
         new §_-Hb§(_loc1_,gls("Скоро"));
         var _loc2_:§_-22V§ = new §_-22V§(gls("Оплата картами РФ"),0,_loc1_.y + _loc1_.height,§_-i2c§,_loc1_.width);
         addChild(_loc2_);
         var _loc3_:§_-hH§ = new §_-hH§(gls("ЮКасса"),300,20,this.§_-u1Z§,1.3);
         _loc3_.y = _loc2_.y + _loc2_.height + 10;
         _loc3_.§_-v5§();
         _loc3_.name = "yookassa";
         addChild(_loc3_);
         var _loc4_:§_-22V§ = new §_-22V§(gls("Оплата СБП, СберПэй, ЮМани"),0,_loc3_.y + _loc3_.height,§_-i2c§,_loc3_.width);
         addChild(_loc4_);
         var _loc5_:§_-hH§ = new §_-hH§(gls("Иксолла"),300,20,this.§_-u1Z§,1.3);
         _loc5_.y = _loc4_.y + _loc4_.height + 10;
         _loc5_.§_-52e§();
         _loc5_.name = "xsolla";
         addChild(_loc5_);
         var _loc6_:§_-22V§ = new §_-22V§(gls("Оплата другими картами"),0,_loc5_.y + _loc5_.height,§_-i2c§,_loc5_.width);
         addChild(_loc6_);
         place();
         this.height += 62;
         Services.addEventListener(PaymentEvent.PAYMENT_SUCCESS,this.§_-029§,false,0,false,Services.isOAuth);
         Services.addEventListener(PaymentEvent.PAYMENT_FAILED,this.§_-Z2s§,false,0,false,Services.isOAuth);
      }
      
      public static function show(param1:Object) : void
      {
         if(_instance == null)
         {
            _instance = new §_-dE§();
         }
         _instance.show();
         _instance.data = param1;
      }
      
      override public function show() : void
      {
         super.show();
         this.redrawModalBackdrop();
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
         this.graphics.endFill();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 20;
         this.§_-4n§ = 20;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      private function §_-u1Z§(param1:MouseEvent) : void
      {
         close();
         (Services.bank as Dialog).hide();
         §_-TQ§.add(param1.currentTarget.name);
         this.data["provider"] = param1.currentTarget.name;
         Services.buy(this.data);
      }
      
      private function §_-029§(param1:PaymentEvent) : void
      {
         navigateToURL(new URLRequest(param1.result.toString()));
      }
      
      private function §_-Z2s§(param1:PaymentEvent) : void
      {
         new §_-Q13§(gls("Ошибка оплаты"),gls("Платёжный сервис временно недоступен.\nПопробуй позже, мы работаем над решением проблемы.")).show();
      }
   }
}

