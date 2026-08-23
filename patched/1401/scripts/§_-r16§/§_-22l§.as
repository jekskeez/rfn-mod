package §_-r16§
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import §_-e1G§.§_-034§;
   import §_-e1G§.§_-kb§;
   import buttons.§_-91k§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import tape.§_-K2k§;
   import utils.StringUtil;
   import utils.§_-Y25§;
   import utils.§_-x1Z§;
   
   public class §_-22l§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 58;
      
      private static const §_-R1K§:int = 58;
      
      private var §_-x1H§:§_-034§ = null;
      
      private var §_-D0§:§_-Y25§ = null;
      
      private var §_-51D§:§_-22V§ = null;
      
      private var icon:DisplayObject = null;
      
      private var §_-n1M§:SimpleButton = null;
      
      private var crossButton:SimpleButton = null;
      
      private var §_-P1a§:SimpleButton = null;
      
      private var §_-sT§:§_-kb§;
      
      private var exchange:Boolean = false;
      
      protected var background:DisplayObject = null;
      
      public var elementId:int;
      
      public function §_-22l§(param1:int)
      {
         var countFormat:TextFormat;
         var id:int = param1;
         super();
         this.elementId = id;
         this.background = new ElementSlotBack();
         this.background.width = this.background.height = §_-r2u§;
         addChild(this.background);
         this.icon = new this.iconClass();
         this.icon.scaleX = this.icon.scaleY = 0.7;
         this.icon.x += int((§_-r2u§ - this.icon.width) * 0.5);
         this.icon.y += int((§_-R1K§ - this.icon.height) * 0.5);
         (this.icon as MovieClip).mouseEnabled = false;
         addChild(this.icon);
         countFormat = new TextFormat(§_-22V§.§_-F2z§,12,6697728,true,null,null,null,null,"right");
         this.§_-51D§ = new §_-22V§("0",0,38,countFormat,54);
         this.§_-51D§.mouseEnabled = false;
         addChild(this.§_-51D§);
         try
         {
            this.§_-n1M§ = new CollectionItemExchangeButton();
         }
         catch(e:Error)
         {
            this.§_-n1M§ = new SimpleButton();
         }
         this.§_-n1M§.x = 37;
         this.§_-n1M§.y = 4;
         this.§_-n1M§.width = this.§_-n1M§.height = 20;
         this.§_-n1M§.filters = [new GlowFilter(16777215,1,4,4,3)];
         this.§_-n1M§.addEventListener(MouseEvent.CLICK,this.§_-n1T§);
         addChild(this.§_-n1M§);
         new §_-kb§(this.§_-n1M§,gls("Добавить на обмен"));
         this.crossButton = new §_-91k§();
         this.crossButton.x = 37;
         this.crossButton.y = 4;
         this.crossButton.scaleX = this.crossButton.scaleY = 0.8;
         this.crossButton.filters = [new GlowFilter(16777215,1,4,4,3)];
         this.crossButton.addEventListener(MouseEvent.CLICK,this.§_-72N§);
         addChild(this.crossButton);
         new §_-kb§(this.crossButton,gls("Удалить из обмена"));
         this.§_-P1a§ = new ButtonPlusYellowShort();
         this.§_-P1a§.scaleX = this.§_-P1a§.scaleY = 1.2;
         this.§_-P1a§.x = 50;
         this.§_-P1a§.y = 50;
         this.§_-P1a§.addEventListener(MouseEvent.CLICK,this.§_-p1q§);
         addChild(this.§_-P1a§);
         this.§_-sT§ = new §_-kb§(this.§_-P1a§,this.§_-e2v§,true);
         this.§_-x1H§ = this.§_-XW§;
         this.§_-Dh§();
         if(this.§_-11c§)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§);
            addEventListener(MouseEvent.MOUSE_OUT,this.§_-9c§);
         }
      }
      
      public function §_-11A§() : void
      {
         §_-k1C§.§_-o0§(§_-vy§.§_-13q§,this.elementId);
         §_-k1C§.§_-72N§(this.elementId);
      }
      
      public function set §_-Qw§(param1:Boolean) : void
      {
         this.exchange = param1;
         this.§_-n1M§.visible = !this.exchange && this.§_-93Y§ != null && this.§_-93Y§.count > 1;
         this.crossButton.visible = this.exchange && this.§_-93Y§ != null && this.§_-93Y§.count > 1;
         this.§_-P1a§.visible = this.§_-93Y§ == null || this.§_-93Y§.count < 1;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get §_-2B§() : Boolean
      {
         if(this.§_-93Y§ == null)
         {
            return false;
         }
         return this.§_-93Y§.count > 0;
      }
      
      public function get §_-93Y§() : §_-Y25§
      {
         return this.§_-D0§;
      }
      
      public function set §_-93Y§(param1:§_-Y25§) : void
      {
         if(this.§_-D0§ == param1)
         {
            return;
         }
         if(this.§_-D0§ != null)
         {
            this.§_-D0§.removeEventListener(Event.CHANGE,this.§_-Dh§);
         }
         this.§_-D0§ = param1;
         this.§_-D0§.addEventListener(Event.CHANGE,this.§_-Dh§);
         this.§_-Dh§();
      }
      
      protected function get price() : int
      {
         return §_-8S§.§_-Z21§(this.elementId);
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         this.§_-P1a§.visible = true;
         this.§_-51D§.visible = false;
      }
      
      private function §_-9c§(param1:MouseEvent) : void
      {
         this.§_-P1a§.visible = this.§_-93Y§ == null || this.§_-93Y§.count < 1;
         this.§_-51D§.visible = true;
      }
      
      private function §_-Dh§(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.§_-n1M§.visible = false;
         this.crossButton.visible = false;
         this.§_-P1a§.visible = false;
         if(this.§_-93Y§ == null || this.§_-93Y§.count == 0)
         {
            this.background.filters = §_-x1Z§.§_-c2G§;
            this.icon.filters = §_-x1Z§.§_-c2G§;
            this.§_-n1M§.visible = false;
            this.crossButton.visible = false;
            this.§_-P1a§.visible = this.§_-11c§;
            this.§_-51D§.text = "";
            return;
         }
         this.background.filters = [];
         this.icon.filters = [];
         this.§_-k17§();
         this.§_-51D§.text = this.§_-93Y§.count.toString();
      }
      
      protected function §_-k17§() : void
      {
         if(this.§_-93Y§.count > 1)
         {
            this.§_-n1M§.visible = !this.exchange;
            this.crossButton.visible = this.exchange;
         }
      }
      
      protected function §_-p1q§(param1:MouseEvent) : void
      {
         Game.buy(§_-h2B§.§_-aa§,this.price,0,Game.selfId,this.elementId);
      }
      
      private function §_-n1T§(param1:MouseEvent) : void
      {
         §_-k1C§.§_-n1T§(this.elementId);
      }
      
      private function §_-72N§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         §_-k1C§.§_-72N§(this.elementId);
      }
      
      protected function get iconClass() : Class
      {
         return §_-vy§.§_-z2p§(this.elementId);
      }
      
      protected function get §_-XW§() : §_-034§
      {
         return new §_-034§(this.background,§_-vy§.§_-13q§,this.elementId);
      }
      
      protected function get §_-e2v§() : String
      {
         return gls("Купить за {0} {1}",this.price.toString(),StringUtil.word("монет",this.price));
      }
      
      protected function get §_-11c§() : Boolean
      {
         return true;
      }
   }
}

