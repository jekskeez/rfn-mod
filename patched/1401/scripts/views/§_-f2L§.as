package views
{
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-m2t§;
   import §_-e1G§.§_-Hb§;
   import §_-e1G§.§_-o2Z§;
   import §_-k1c§.§_-7O§;
   import com.api.Services;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.StringUtil;
   
   public class §_-f2L§ extends Sprite
   {
      
      private var §_-hn§:§_-22V§;
      
      private var §_-S1C§:§_-22V§;
      
      private var §_-T2P§:SimpleButton;
      
      private var §_-p2F§:§_-o2Z§ = null;
      
      private var §_-X2N§:§_-o2Z§ = null;
      
      public var notify:§_-CO§ = null;
      
      public function §_-f2L§()
      {
         super();
         this.visible = false;
         this.init();
      }
      
      public function init() : void
      {
         var image:DisplayObject;
         var buttonBuyNuts:SimpleButton;
         var frame:HeaderBalanceFrame = null;
         this.buttonMode = true;
         frame = new HeaderBalanceFrame();
         addChild(frame);
         image = new ImageIconNut();
         image.scaleX = image.scaleY = 0.7;
         image.x = 5;
         image.y = 5;
         image.cacheAsBitmap = true;
         frame.addChild(image);
         this.§_-hn§ = new §_-22V§("",30,5,new TextFormat(null,12,16777215,true));
         this.§_-hn§.mouseEnabled = false;
         frame.addChild(this.§_-hn§);
         frame.addEventListener(MouseEvent.CLICK,this.§_-RT§);
         this.§_-p2F§ = new §_-o2Z§(frame,gls("Орехи"),gls("За них можно покупать разные товары"));
         buttonBuyNuts = new ButtonBalance();
         buttonBuyNuts.x = frame.x + frame.width - 2;
         buttonBuyNuts.y = 3;
         buttonBuyNuts.upState.cacheAsBitmap = true;
         buttonBuyNuts.addEventListener(MouseEvent.CLICK,this.§_-RT§);
         addChild(buttonBuyNuts);
         new §_-Hb§(buttonBuyNuts,gls("Пополнить баланс"));
         frame = new HeaderBalanceFrame();
         frame.x = buttonBuyNuts.x + buttonBuyNuts.width + 6;
         addChild(frame);
         image = new ImageIconCoins();
         image.scaleX = image.scaleY = 0.7;
         image.x = 6;
         image.y = 5;
         image.cacheAsBitmap = true;
         frame.addChild(image);
         this.§_-S1C§ = new §_-22V§("",30,5,new TextFormat(null,12,16777215,true));
         this.§_-S1C§.mouseEnabled = false;
         frame.addChild(this.§_-S1C§);
         frame.addEventListener(MouseEvent.CLICK,this.§_-Od§);
         this.§_-X2N§ = new §_-o2Z§(frame,gls("Монетки"),gls("За них можно покупать уникальные товары и энергетики"),145);
         this.§_-T2P§ = new ButtonBalance();
         this.§_-T2P§.x = frame.x + frame.width - 2;
         this.§_-T2P§.y = 3;
         this.§_-T2P§.upState.cacheAsBitmap = true;
         this.§_-T2P§.addEventListener(MouseEvent.CLICK,this.§_-Od§);
         addChild(this.§_-T2P§);
         new §_-Hb§(this.§_-T2P§,gls("Пополнить баланс"));
         this.notify = new §_-CO§(16);
         this.notify.scaleX = this.notify.scaleY = 0.7;
         this.notify.§_-O1s§ = §_-CO§.§_-J1t§;
         this.notify.text = gls("Забери свой бонус!");
         this.notify.x = this.§_-T2P§.x - 60;
         this.notify.y = this.§_-T2P§.y + 55;
         this.notify.filters = [new GlowFilter(16777215,1,4,4,1),new GlowFilter(13158,1,4,4,0.5)];
         this.notify.addEventListener(MouseEvent.CLICK,this.§_-Od§);
         addChild(this.notify);
         Game.§_-Y2s§(GameEvent.BALANCE_CHANGED,this.update);
         §_-m2t§.addEventListener(GameEvent.DAILY_BONUS_UPDATE,function(param1:GameEvent):void
         {
            notify.visible = §_-m2t§.§_-Pd§ && §_-Q2v§.§_-91S§;
         });
         §_-Q2v§.addEventListener(GameEvent.EDUCATION_QUEST_CHANGED,function(param1:GameEvent):void
         {
            if(param1.data["onComplete"])
            {
               notify.visible = §_-m2t§.§_-Pd§;
            }
            else
            {
               notify.visible = §_-m2t§.§_-Pd§ && §_-Q2v§.§_-91S§;
            }
         });
         this.update();
      }
      
      override public function get width() : Number
      {
         return this.§_-T2P§.x + this.§_-T2P§.width;
      }
      
      public function §_-r2§(param1:int) : void
      {
         if(param1 > 9999)
         {
            this.§_-S1C§.text = String(int(param1 / 1000)) + "к";
            this.§_-X2N§.§_-632§("",gls("У тебя <b>{0}</b> {1}",String(param1),StringUtil.word("монет",param1)) + "\n" + gls("Перейди в банк чтобы пополнить счёт."));
         }
         else
         {
            this.§_-S1C§.text = String(param1);
            this.§_-X2N§.§_-632§(gls("Монеты"),gls("Перейди в банк, чтобы пополнить счёт."));
         }
      }
      
      public function §_-Ky§(param1:int) : void
      {
         if(param1 > 9999)
         {
            this.§_-hn§.text = String(int(param1 / 1000)) + "к";
            this.§_-p2F§.§_-632§("",gls("У тебя <b>{0}</b> {1}",String(param1),StringUtil.word("орехов",param1) + "\n" + gls("Белки очень запасливы. Собери как можно больше орехов.")));
         }
         else
         {
            this.§_-hn§.text = String(param1);
            this.§_-p2F§.§_-632§(gls("Орехи"),gls("Белки очень запасливы. Собери как можно больше орехов."));
         }
      }
      
      private function update(param1:GameEvent = null) : void
      {
         if("nuts" in Game.self)
         {
            this.§_-Ky§(Game.self.nuts);
         }
         if("coins" in Game.self)
         {
            this.§_-r2§(Game.self.coins);
         }
      }
      
      private function §_-RT§(param1:MouseEvent) : void
      {
         this.§_-g2q§(§_-7O§.§_-K2P§);
      }
      
      private function §_-Od§(param1:MouseEvent) : void
      {
         this.§_-g2q§(§_-7O§.§_-s1Z§);
      }
      
      private function §_-g2q§(param1:int) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         if(Boolean(this.notify) && Boolean(this.notify.parent))
         {
            this.notify.parent.removeChild(this.notify);
         }
         Services.bank.open(param1);
      }
   }
}

