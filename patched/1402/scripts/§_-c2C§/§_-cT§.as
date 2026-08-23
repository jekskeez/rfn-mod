package §_-c2C§
{
   import §_-X1k§.§_-93H§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-B1d§;
   import utils.§_-jb§;
   
   public class §_-cT§ extends Screen
   {
      
      private static const §_-e1U§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,28,16711680,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-mx§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,16777215,false,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,0,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-8Y§:§_-i5§ = new §_-i5§(gls("Оставшееся время блокировки:"),0,510,new TextFormat(§_-i5§.§_-p1s§,17,16777215,true));
      
      private var §_-y2h§:§_-i5§;
      
      private var §_-w6§:§_-i5§;
      
      private var §_-YY§:§_-i5§;
      
      private var §_-t2p§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      public function §_-cT§()
      {
         super();
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-x1i§]);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-w2y§();
      }
      
      private function init() : void
      {
         §_-93H§.§_-sX§ = false;
         §_-93H§.load();
         this.§_-t2p§ = new Sprite();
         addChild(this.§_-t2p§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         var _loc1_:ScreenBlockedBackground = new ScreenBlockedBackground();
         _loc1_.mouseEnabled = false;
         this.§_-03N§.addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Ты заблокирован\n за нарушение правил\n игры!"),313,38,§_-W2U§);
         this.§_-03N§.addChild(_loc2_);
         §_-8Y§.x = int((§_-Zy§.§_-21V§ - §_-8Y§.textWidth) * 0.5);
         this.§_-03N§.addChild(§_-8Y§);
         this.§_-y2h§ = new §_-i5§("",0,530,§_-e1U§);
         this.§_-y2h§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-y2h§.width = §_-Zy§.§_-21V§;
         this.§_-y2h§.height = 200;
         this.§_-03N§.addChild(this.§_-y2h§);
         this.§_-w6§ = new §_-i5§("",0,568,§_-mx§);
         this.§_-w6§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-w6§.width = §_-Zy§.§_-21V§;
         this.§_-w6§.height = 200;
         this.§_-03N§.addChild(this.§_-w6§);
         this.§_-YY§ = new §_-i5§("",0,590,§_-mx§);
         this.§_-YY§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-YY§.width = §_-Zy§.§_-21V§;
         this.§_-YY§.height = 200;
         this.§_-03N§.addChild(this.§_-YY§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = §_-Zy§.§_-21V§;
         var _loc3_:Number = §_-Zy§.§_-02T§;
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
         this.§_-t2p§.graphics.clear();
         this.§_-t2p§.graphics.beginFill(3684408);
         this.§_-t2p§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-t2p§.graphics.endFill();
         this.§_-03N§.x = (_loc2_ - §_-Zy§.§_-21V§) * 0.5;
         this.§_-03N§.y = (_loc3_ - §_-Zy§.§_-02T§) * 0.5;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != Game.selfId)
         {
            return;
         }
         if(param1[1] == §_-u1O§.§_-03D§)
         {
            §_-8Y§.visible = false;
            this.§_-y2h§.text = gls("Навсегда");
         }
         else
         {
            this.§_-y2h§.text = §_-B1d§.§_-j1x§(param1[4]);
         }
         this.§_-w6§.text = gls("Причина бана: {0}",§_-jb§.§_-tJ§(param1[2]));
         switch(param1[3])
         {
            case 0:
               this.§_-YY§.text = gls("Автоматическая система бана");
               break;
            case 45:
               this.§_-YY§.text = gls("Администрация");
               break;
            default:
               this.§_-YY§.text = gls("Модератор: №{0}",param1[3]);
         }
         §_-t2c§.show(this);
      }
   }
}

