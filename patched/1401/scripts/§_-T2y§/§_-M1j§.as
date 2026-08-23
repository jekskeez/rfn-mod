package §_-T2y§
{
   import §_-I10§.§_-8S§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-d1C§;
   import utils.§_-ex§;
   
   public class §_-M1j§ extends Screen
   {
      
      private static const §_-r2w§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,28,16711680,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-H1y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,16777215,false,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,0,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-13z§:§_-22V§ = new §_-22V§(gls("Оставшееся время блокировки:"),0,510,new TextFormat(§_-22V§.§_-pJ§,17,16777215,true));
      
      private var §_-P1v§:§_-22V§;
      
      private var §_-J19§:§_-22V§;
      
      private var §_-z2E§:§_-22V§;
      
      private var §_-KL§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      public function §_-M1j§()
      {
         super();
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-N29§]);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-5W§();
      }
      
      private function init() : void
      {
         §_-8S§.§_-k23§ = false;
         §_-8S§.load();
         this.§_-KL§ = new Sprite();
         addChild(this.§_-KL§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         var _loc1_:ScreenBlockedBackground = new ScreenBlockedBackground();
         _loc1_.mouseEnabled = false;
         this.§_-rm§.addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Ты заблокирован\n за нарушение правил\n игры!"),313,38,§_-a1Y§);
         this.§_-rm§.addChild(_loc2_);
         §_-13z§.x = int((§_-a9§.§_-9o§ - §_-13z§.textWidth) * 0.5);
         this.§_-rm§.addChild(§_-13z§);
         this.§_-P1v§ = new §_-22V§("",0,530,§_-r2w§);
         this.§_-P1v§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-P1v§.width = §_-a9§.§_-9o§;
         this.§_-P1v§.height = 200;
         this.§_-rm§.addChild(this.§_-P1v§);
         this.§_-J19§ = new §_-22V§("",0,568,§_-H1y§);
         this.§_-J19§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-J19§.width = §_-a9§.§_-9o§;
         this.§_-J19§.height = 200;
         this.§_-rm§.addChild(this.§_-J19§);
         this.§_-z2E§ = new §_-22V§("",0,590,§_-H1y§);
         this.§_-z2E§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-z2E§.width = §_-a9§.§_-9o§;
         this.§_-z2E§.height = 200;
         this.§_-rm§.addChild(this.§_-z2E§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = §_-a9§.§_-9o§;
         var _loc3_:Number = §_-a9§.§_-31m§;
         if(Boolean(Game.starling) && Boolean(Game.starling.stage))
         {
            _loc2_ = Game.starling.stage.stageWidth;
            _loc3_ = Game.starling.stage.stageHeight;
         }
         else if(this.stage)
         {
            _loc2_ = this.stage.stageWidth;
            _loc3_ = this.stage.stageHeight;
         }
         this.§_-KL§.graphics.clear();
         this.§_-KL§.graphics.beginFill(3684408);
         this.§_-KL§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-KL§.graphics.endFill();
         this.§_-rm§.x = (_loc2_ - §_-a9§.§_-9o§) * 0.5;
         this.§_-rm§.y = (_loc3_ - §_-a9§.§_-31m§) * 0.5;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != Game.selfId)
         {
            return;
         }
         if(param1[1] == §_-h2B§.§_-03c§)
         {
            §_-13z§.visible = false;
            this.§_-P1v§.text = gls("Навсегда");
         }
         else
         {
            this.§_-P1v§.text = §_-ex§.§_-M1D§(param1[4]);
         }
         this.§_-J19§.text = gls("Причина бана: {0}",§_-d1C§.§_-is§(param1[2]));
         switch(param1[3])
         {
            case 0:
               this.§_-z2E§.text = gls("Автоматическая система бана");
               break;
            case 45:
               this.§_-z2E§.text = gls("Администрация");
               break;
            default:
               this.§_-z2E§.text = gls("Модератор: №{0}",param1[3]);
         }
         §_-71o§.show(this);
      }
   }
}

