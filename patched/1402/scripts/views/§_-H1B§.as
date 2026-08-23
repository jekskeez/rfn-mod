package views
{
   import §_-S1n§.§_-f1W§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-X2k§;
   import §_-bN§.§_-Sg§;
   import com.api.Services;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.StringUtil;
   
   public class §_-H1B§ extends Sprite
   {
      
      private var §_-aG§:§_-i5§;
      
      private var §_-jo§:§_-i5§;
      
      private var §_-o1x§:SimpleButton;
      
      private var §_-LG§:§_-f1W§ = null;
      
      private var §_-43z§:§_-f1W§ = null;
      
      public var notify:§_-j2q§ = null;
      
      public function §_-H1B§()
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
         this.§_-aG§ = new §_-i5§("",30,5,new TextFormat(null,12,16777215,true));
         this.§_-aG§.mouseEnabled = false;
         frame.addChild(this.§_-aG§);
         frame.addEventListener(MouseEvent.CLICK,this.§_-j1T§);
         this.§_-LG§ = new §_-f1W§(frame,gls("Орехи"),gls("За них можно покупать разные товары"));
         buttonBuyNuts = new ButtonBalance();
         buttonBuyNuts.x = frame.x + frame.width - 2;
         buttonBuyNuts.y = 3;
         buttonBuyNuts.upState.cacheAsBitmap = true;
         buttonBuyNuts.addEventListener(MouseEvent.CLICK,this.§_-j1T§);
         addChild(buttonBuyNuts);
         new §_-kr§(buttonBuyNuts,gls("Пополнить баланс"));
         frame = new HeaderBalanceFrame();
         frame.x = buttonBuyNuts.x + buttonBuyNuts.width + 6;
         addChild(frame);
         image = new ImageIconCoins();
         image.scaleX = image.scaleY = 0.7;
         image.x = 6;
         image.y = 5;
         image.cacheAsBitmap = true;
         frame.addChild(image);
         this.§_-jo§ = new §_-i5§("",30,5,new TextFormat(null,12,16777215,true));
         this.§_-jo§.mouseEnabled = false;
         frame.addChild(this.§_-jo§);
         frame.addEventListener(MouseEvent.CLICK,this.§_-D2t§);
         this.§_-43z§ = new §_-f1W§(frame,gls("Монетки"),gls("За них можно покупать уникальные товары и энергетики"),145);
         this.§_-o1x§ = new ButtonBalance();
         this.§_-o1x§.x = frame.x + frame.width - 2;
         this.§_-o1x§.y = 3;
         this.§_-o1x§.upState.cacheAsBitmap = true;
         this.§_-o1x§.addEventListener(MouseEvent.CLICK,this.§_-D2t§);
         addChild(this.§_-o1x§);
         new §_-kr§(this.§_-o1x§,gls("Пополнить баланс"));
         this.notify = new §_-j2q§(16);
         this.notify.scaleX = this.notify.scaleY = 0.7;
         this.notify.§_-J28§ = §_-j2q§.§_-j2m§;
         this.notify.text = gls("Забери свой бонус!");
         this.notify.x = this.§_-o1x§.x - 60;
         this.notify.y = this.§_-o1x§.y + 55;
         this.notify.filters = [new GlowFilter(16777215,1,4,4,1),new GlowFilter(13158,1,4,4,0.5)];
         this.notify.addEventListener(MouseEvent.CLICK,this.§_-D2t§);
         addChild(this.notify);
         Game.§_-53O§(GameEvent.BALANCE_CHANGED,this.update);
         §_-X2k§.addEventListener(GameEvent.DAILY_BONUS_UPDATE,function(param1:GameEvent):void
         {
            notify.visible = §_-X2k§.§_-c2S§ && §_-Ac§.§_-V26§;
         });
         §_-Ac§.addEventListener(GameEvent.EDUCATION_QUEST_CHANGED,function(param1:GameEvent):void
         {
            if(param1.data["onComplete"])
            {
               notify.visible = §_-X2k§.§_-c2S§;
            }
            else
            {
               notify.visible = §_-X2k§.§_-c2S§ && §_-Ac§.§_-V26§;
            }
         });
         this.update();
      }
      
      override public function get width() : Number
      {
         return this.§_-o1x§.x + this.§_-o1x§.width;
      }
      
      public function §_-jG§(param1:int) : void
      {
         if(param1 > 9999)
         {
            this.§_-jo§.text = String(int(param1 / 1000)) + "к";
            this.§_-43z§.§_-j2C§("",gls("У тебя <b>{0}</b> {1}",String(param1),StringUtil.word("монет",param1)) + "\n" + gls("Перейди в банк чтобы пополнить счёт."));
         }
         else
         {
            this.§_-jo§.text = String(param1);
            this.§_-43z§.§_-j2C§(gls("Монеты"),gls("Перейди в банк, чтобы пополнить счёт."));
         }
      }
      
      public function §_-un§(param1:int) : void
      {
         if(param1 > 9999)
         {
            this.§_-aG§.text = String(int(param1 / 1000)) + "к";
            this.§_-LG§.§_-j2C§("",gls("У тебя <b>{0}</b> {1}",String(param1),StringUtil.word("орехов",param1) + "\n" + gls("Белки очень запасливы. Собери как можно больше орехов.")));
         }
         else
         {
            this.§_-aG§.text = String(param1);
            this.§_-LG§.§_-j2C§(gls("Орехи"),gls("Белки очень запасливы. Собери как можно больше орехов."));
         }
      }
      
      private function update(param1:GameEvent = null) : void
      {
         if("nuts" in Game.self)
         {
            this.§_-un§(Game.self.nuts);
         }
         if("coins" in Game.self)
         {
            this.§_-jG§(Game.self.coins);
         }
      }
      
      private function §_-j1T§(param1:MouseEvent) : void
      {
         this.§_-p2g§(§_-Sg§.§_-23U§);
      }
      
      private function §_-D2t§(param1:MouseEvent) : void
      {
         this.§_-p2g§(§_-Sg§.§_-7G§);
      }
      
      private function §_-p2g§(param1:int) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
         if(Boolean(this.notify) && Boolean(this.notify.parent))
         {
            this.notify.parent.removeChild(this.notify);
         }
         Services.bank.open(param1);
      }
   }
}

