package §_-J19§
{
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-bN§.Dialog;
   import §_-z2V§.§_-D2g§;
   import §_-z2V§.§_-E1M§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import tape.§_-o2N§;
   import utils.§_-B1d§;
   import utils.§_-K1Y§;
   
   public class §_-B26§ extends Dialog
   {
      
      private static var _instance:§_-B26§ = null;
      
      private var id:int = -1;
      
      private var isRent:Boolean = false;
      
      public function §_-B26§(param1:int, param2:Boolean)
      {
         var back:DisplayObject;
         var data:§_-o2N§;
         var tapeView:§_-D2g§;
         var buttonBuy:§_-K2G§;
         var id:int = param1;
         var isRent:Boolean = param2;
         super("",false);
         this.id = id;
         this.isRent = isRent;
         back = addChildAt(new DialogSkinInfoBack(),0);
         addChild(new §_-i5§(gls("Внимание"),0,10,Dialog.FORMAT_CAPTION_18_CENTER,back.width)).filters = Dialog.§_-q2I§;
         addChild(new §_-i5§(gls("Чтобы использовать образ, необходимо\nприобрести базовый костюм."),50,50,new TextFormat(null,14,6105102,true,null,null,null,null,"center")));
         addChild(new §_-i5§(gls("Мы даём тебе базовый\nкостюм на {0},\nчтобы ты мог испытать\nвсе прелести нового образа!",§_-B1d§.§_-j1x§(isRent ? 3600 : int(24 * 60 * 60))),140,255,new TextFormat(null,14,6105102,true,null,null,null,null,"center")));
         data = new §_-o2N§(§_-E1M§);
         data.setData(§_-P2x§.§_-y18§(§_-P2x§.§_-b2c§(this.id)).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-P2x§.getPackageCoinsPrice(param1) != 0 || §_-L1o§.§_-J2p§(param1,§_-L1o§.§_-U1v§);
         }));
         tapeView = new §_-D2g§(60,10,2);
         tapeView.setData(data);
         tapeView.x = 145;
         tapeView.y = 130;
         tapeView.mouseEnabled = false;
         tapeView.mouseChildren = false;
         addChild(tapeView);
         buttonBuy = new §_-K2G§((isRent ? §_-P2x§.§_-O1c§(this.id) : §_-P2x§.getPackageCoinsPrice(this.id)) + " -");
         buttonBuy.x = int((back.width - buttonBuy.width) * 0.5);
         buttonBuy.y = 350;
         buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-Q2x§);
         addChild(buttonBuy);
         §_-K1Y§.§_-P2W§(buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-buttonBuy.field.x,-3,false,false);
         place();
         this.§_-x2T§.x -= 15;
         this.§_-x2T§.y += 5;
      }
      
      public static function show(param1:int, param2:Boolean = false) : void
      {
         if(!_instance)
         {
            _instance = new §_-B26§(param1,param2);
         }
         else if(_instance.id != param1 || _instance.isRent != param2)
         {
            _instance.hide();
            _instance = new §_-B26§(param1,param2);
         }
         _instance.show();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 0;
         this.§_-7N§ = 0;
         this.topOffset = 0;
         this.§_-f2d§ = 0;
      }
      
      private function §_-Q2x§(param1:MouseEvent) : void
      {
         if(this.isRent)
         {
            Game.§_-u2z§(§_-u1O§.§_-012§,§_-P2x§.§_-O1c§(this.id),0,Game.selfId,this.id);
         }
         else
         {
            Game.§_-u2z§(§_-u1O§.§_-j1U§,§_-P2x§.getPackageCoinsPrice(this.id),0,Game.selfId,this.id);
         }
         hide();
      }
   }
}

