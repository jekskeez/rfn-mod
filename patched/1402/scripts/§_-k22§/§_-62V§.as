package §_-k22§
{
   import §_-S1n§.§_-kr§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import buttons.§_-j2x§;
   import com.api.PaymentEvent;
   import com.api.Services;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-62V§ extends Dialog
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,6829595,false,false,false,null,null,TextFormatAlign.CENTER);
      
      private static var _instance:§_-62V§ = null;
      
      private var data:Object = null;
      
      public function §_-62V§()
      {
         super(gls("Выбор способа оплаты"),true,true,null,false);
         var _loc1_:§_-j2x§ = new §_-j2x§(gls("Робокасса"),300,20,this.§_-t2C§,1.3);
         _loc1_.y = 15;
         _loc1_.name = "robokassa";
         _loc1_.enabled = false;
         addChild(_loc1_);
         new §_-kr§(_loc1_,gls("Скоро"));
         var _loc2_:§_-i5§ = new §_-i5§(gls("Оплата картами РФ"),0,_loc1_.y + _loc1_.height,§_-W2P§,_loc1_.width);
         addChild(_loc2_);
         var _loc3_:§_-j2x§ = new §_-j2x§(gls("ЮКасса"),300,20,this.§_-t2C§,1.3);
         _loc3_.y = _loc2_.y + _loc2_.height + 10;
         _loc3_.§_-lT§();
         _loc3_.name = "yookassa";
         addChild(_loc3_);
         var _loc4_:§_-i5§ = new §_-i5§(gls("Оплата СБП, СберПэй, ЮМани"),0,_loc3_.y + _loc3_.height,§_-W2P§,_loc3_.width);
         addChild(_loc4_);
         var _loc5_:§_-j2x§ = new §_-j2x§(gls("Иксолла"),300,20,this.§_-t2C§,1.3);
         _loc5_.y = _loc4_.y + _loc4_.height + 10;
         _loc5_.§_-I29§();
         _loc5_.name = "xsolla";
         addChild(_loc5_);
         var _loc6_:§_-i5§ = new §_-i5§(gls("Оплата другими картами"),0,_loc5_.y + _loc5_.height,§_-W2P§,_loc5_.width);
         addChild(_loc6_);
         place();
         this.height += 62;
         Services.addEventListener(PaymentEvent.PAYMENT_SUCCESS,this.§_-r1f§,false,0,false,Services.isOAuth);
         Services.addEventListener(PaymentEvent.PAYMENT_FAILED,this.§_-6S§,false,0,false,Services.isOAuth);
      }
      
      public static function show(param1:Object) : void
      {
         if(_instance == null)
         {
            _instance = new §_-62V§();
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
         this.§_-01q§ = 20;
         this.§_-7N§ = 20;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      private function §_-t2C§(param1:MouseEvent) : void
      {
         close();
         (Services.bank as Dialog).hide();
         §_-p2U§.add(param1.currentTarget.name);
         this.data["provider"] = param1.currentTarget.name;
         Services.buy(this.data);
      }
      
      private function §_-r1f§(param1:PaymentEvent) : void
      {
         navigateToURL(new URLRequest(param1.result.toString()));
      }
      
      private function §_-6S§(param1:PaymentEvent) : void
      {
         new §_-Fk§(gls("Ошибка оплаты"),gls("Платёжный сервис временно недоступен.\nПопробуй позже, мы работаем над решением проблемы.")).show();
      }
   }
}

