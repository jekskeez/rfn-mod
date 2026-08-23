package §_-wJ§
{
   import §_-S1n§.§_-U2m§;
   import §_-S1n§.§_-nX§;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-WS§;
   import buttons.§_-917§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import tape.§_-QN§;
   import utils.StringUtil;
   import utils.§_-Y11§;
   import utils.§_-y1l§;
   
   public class §_-j1u§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 58;
      
      private static const §_-u1l§:int = 58;
      
      private var §_-y9§:§_-nX§ = null;
      
      private var §_-83h§:§_-Y11§ = null;
      
      private var §_-T2t§:§_-i5§ = null;
      
      private var icon:DisplayObject = null;
      
      private var §_-i20§:SimpleButton = null;
      
      private var crossButton:SimpleButton = null;
      
      private var §_-e1f§:SimpleButton = null;
      
      private var §_-82i§:§_-U2m§;
      
      private var exchange:Boolean = false;
      
      protected var background:DisplayObject = null;
      
      public var elementId:int;
      
      public function §_-j1u§(param1:int)
      {
         var countFormat:TextFormat;
         var id:int = param1;
         super();
         this.elementId = id;
         this.background = new ElementSlotBack();
         this.background.width = this.background.height = §_-B1t§;
         addChild(this.background);
         this.icon = new this.iconClass();
         this.icon.scaleX = this.icon.scaleY = 0.7;
         this.icon.x += int((§_-B1t§ - this.icon.width) * 0.5);
         this.icon.y += int((§_-u1l§ - this.icon.height) * 0.5);
         (this.icon as MovieClip).mouseEnabled = false;
         addChild(this.icon);
         countFormat = new TextFormat(§_-i5§.§_-c10§,12,6697728,true,null,null,null,null,"right");
         this.§_-T2t§ = new §_-i5§("0",0,38,countFormat,54);
         this.§_-T2t§.mouseEnabled = false;
         addChild(this.§_-T2t§);
         try
         {
            this.§_-i20§ = new CollectionItemExchangeButton();
         }
         catch(e:Error)
         {
            this.§_-i20§ = new SimpleButton();
         }
         this.§_-i20§.x = 37;
         this.§_-i20§.y = 4;
         this.§_-i20§.width = this.§_-i20§.height = 20;
         this.§_-i20§.filters = [new GlowFilter(16777215,1,4,4,3)];
         this.§_-i20§.addEventListener(MouseEvent.CLICK,this.§_-e2E§);
         addChild(this.§_-i20§);
         new §_-U2m§(this.§_-i20§,gls("Добавить на обмен"));
         this.crossButton = new §_-917§();
         this.crossButton.x = 37;
         this.crossButton.y = 4;
         this.crossButton.scaleX = this.crossButton.scaleY = 0.8;
         this.crossButton.filters = [new GlowFilter(16777215,1,4,4,3)];
         this.crossButton.addEventListener(MouseEvent.CLICK,this.§_-eL§);
         addChild(this.crossButton);
         new §_-U2m§(this.crossButton,gls("Удалить из обмена"));
         this.§_-e1f§ = new ButtonPlusYellowShort();
         this.§_-e1f§.scaleX = this.§_-e1f§.scaleY = 1.2;
         this.§_-e1f§.x = 50;
         this.§_-e1f§.y = 50;
         this.§_-e1f§.addEventListener(MouseEvent.CLICK,this.§_-z2Y§);
         addChild(this.§_-e1f§);
         this.§_-82i§ = new §_-U2m§(this.§_-e1f§,this.§_-k2g§,true);
         this.§_-y9§ = this.§_-oj§;
         this.§_-A2n§();
         if(this.§_-63E§)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§);
            addEventListener(MouseEvent.MOUSE_OUT,this.§_-k2s§);
         }
      }
      
      public function §_-3T§() : void
      {
         §_-WS§.§_-U1X§(§_-42H§.§_-R2h§,this.elementId);
         §_-WS§.§_-eL§(this.elementId);
      }
      
      public function set §_-h1H§(param1:Boolean) : void
      {
         this.exchange = param1;
         this.§_-i20§.visible = !this.exchange && this.§_-fv§ != null && this.§_-fv§.count > 1;
         this.crossButton.visible = this.exchange && this.§_-fv§ != null && this.§_-fv§.count > 1;
         this.§_-e1f§.visible = this.§_-fv§ == null || this.§_-fv§.count < 1;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get §_-6p§() : Boolean
      {
         if(this.§_-fv§ == null)
         {
            return false;
         }
         return this.§_-fv§.count > 0;
      }
      
      public function get §_-fv§() : §_-Y11§
      {
         return this.§_-83h§;
      }
      
      public function set §_-fv§(param1:§_-Y11§) : void
      {
         if(this.§_-83h§ == param1)
         {
            return;
         }
         if(this.§_-83h§ != null)
         {
            this.§_-83h§.removeEventListener(Event.CHANGE,this.§_-A2n§);
         }
         this.§_-83h§ = param1;
         this.§_-83h§.addEventListener(Event.CHANGE,this.§_-A2n§);
         this.§_-A2n§();
      }
      
      protected function get price() : int
      {
         return §_-93H§.§_-82Y§(this.elementId);
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         this.§_-e1f§.visible = true;
         this.§_-T2t§.visible = false;
      }
      
      private function §_-k2s§(param1:MouseEvent) : void
      {
         this.§_-e1f§.visible = this.§_-fv§ == null || this.§_-fv§.count < 1;
         this.§_-T2t§.visible = true;
      }
      
      private function §_-A2n§(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.§_-i20§.visible = false;
         this.crossButton.visible = false;
         this.§_-e1f§.visible = false;
         if(this.§_-fv§ == null || this.§_-fv§.count == 0)
         {
            this.background.filters = §_-y1l§.§_-Tk§;
            this.icon.filters = §_-y1l§.§_-Tk§;
            this.§_-i20§.visible = false;
            this.crossButton.visible = false;
            this.§_-e1f§.visible = this.§_-63E§;
            this.§_-T2t§.text = "";
            return;
         }
         this.background.filters = [];
         this.icon.filters = [];
         this.§_-W1o§();
         this.§_-T2t§.text = this.§_-fv§.count.toString();
      }
      
      protected function §_-W1o§() : void
      {
         if(this.§_-fv§.count > 1)
         {
            this.§_-i20§.visible = !this.exchange;
            this.crossButton.visible = this.exchange;
         }
      }
      
      protected function §_-z2Y§(param1:MouseEvent) : void
      {
         Game.buy(§_-u1O§.§_-c2D§,this.price,0,Game.selfId,this.elementId);
      }
      
      private function §_-e2E§(param1:MouseEvent) : void
      {
         §_-WS§.§_-e2E§(this.elementId);
      }
      
      private function §_-eL§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
         §_-WS§.§_-eL§(this.elementId);
      }
      
      protected function get iconClass() : Class
      {
         return §_-42H§.§_-D1U§(this.elementId);
      }
      
      protected function get §_-oj§() : §_-nX§
      {
         return new §_-nX§(this.background,§_-42H§.§_-R2h§,this.elementId);
      }
      
      protected function get §_-k2g§() : String
      {
         return gls("Купить за {0} {1}",this.price.toString(),StringUtil.word("монет",this.price));
      }
      
      protected function get §_-63E§() : Boolean
      {
         return true;
      }
   }
}

