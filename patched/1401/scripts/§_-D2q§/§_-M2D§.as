package §_-D2q§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-k1c§.Dialog;
   import §_-z2Z§.§_-O1D§;
   import §_-z2Z§.§_-ps§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import tape.§_-91w§;
   import utils.§_-ex§;
   import utils.§_-jB§;
   
   public class §_-M2D§ extends Dialog
   {
      
      private static var _instance:§_-M2D§ = null;
      
      private var id:int = -1;
      
      private var isRent:Boolean = false;
      
      public function §_-M2D§(param1:int, param2:Boolean)
      {
         var back:DisplayObject;
         var data:§_-91w§;
         var tapeView:§_-ps§;
         var buttonBuy:§_-j18§;
         var id:int = param1;
         var isRent:Boolean = param2;
         super("",false);
         this.id = id;
         this.isRent = isRent;
         back = addChildAt(new DialogSkinInfoBack(),0);
         addChild(new §_-22V§(gls("Внимание"),0,10,Dialog.FORMAT_CAPTION_18_CENTER,back.width)).filters = Dialog.§_-m2A§;
         addChild(new §_-22V§(gls("Чтобы использовать образ, необходимо\nприобрести базовый костюм."),50,50,new TextFormat(null,14,6105102,true,null,null,null,null,"center")));
         addChild(new §_-22V§(gls("Мы даём тебе базовый\nкостюм на {0},\nчтобы ты мог испытать\nвсе прелести нового образа!",§_-ex§.§_-M1D§(isRent ? 3600 : int(24 * 60 * 60))),140,255,new TextFormat(null,14,6105102,true,null,null,null,null,"center")));
         data = new §_-91w§(§_-O1D§);
         data.setData(§_-g2W§.§_-W2m§(§_-g2W§.§_-X2e§(this.id)).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-g2W§.getPackageCoinsPrice(param1) != 0 || §_-h1f§.§_-i21§(param1,§_-h1f§.§_-A3r§);
         }));
         tapeView = new §_-ps§(60,10,2);
         tapeView.setData(data);
         tapeView.x = 145;
         tapeView.y = 130;
         tapeView.mouseEnabled = false;
         tapeView.mouseChildren = false;
         addChild(tapeView);
         buttonBuy = new §_-j18§((isRent ? §_-g2W§.§_-BA§(this.id) : §_-g2W§.getPackageCoinsPrice(this.id)) + " -");
         buttonBuy.x = int((back.width - buttonBuy.width) * 0.5);
         buttonBuy.y = 350;
         buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-Ai§);
         addChild(buttonBuy);
         §_-jB§.§_-fG§(buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-buttonBuy.field.x,-3,false,false);
         place();
         this.§_-O2e§.x -= 15;
         this.§_-O2e§.y += 5;
      }
      
      public static function show(param1:int, param2:Boolean = false) : void
      {
         if(!_instance)
         {
            _instance = new §_-M2D§(param1,param2);
         }
         else if(_instance.id != param1 || _instance.isRent != param2)
         {
            _instance.hide();
            _instance = new §_-M2D§(param1,param2);
         }
         _instance.show();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 0;
         this.§_-4n§ = 0;
         this.topOffset = 0;
         this.§_-JZ§ = 0;
      }
      
      private function §_-Ai§(param1:MouseEvent) : void
      {
         if(this.isRent)
         {
            Game.§_-K2t§(§_-h2B§.§_-s2Z§,§_-g2W§.§_-BA§(this.id),0,Game.selfId,this.id);
         }
         else
         {
            Game.§_-K2t§(§_-h2B§.§_-m1U§,§_-g2W§.getPackageCoinsPrice(this.id),0,Game.selfId,this.id);
         }
         hide();
      }
   }
}

