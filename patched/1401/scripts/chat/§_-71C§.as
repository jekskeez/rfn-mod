package chat
{
   import §_-Kr§.ScrollPane;
   import buttons.§_-G2L§;
   import events.§_-4Y§;
   import flash.events.Event;
   
   public class §_-71C§ extends §_-N1D§
   {
      
      protected var §_-Y2N§:§_-G2L§ = null;
      
      protected var §_-M1N§:ScrollPane = null;
      
      protected var §_-6e§:Vector.<§_-AQ§> = new Vector.<§_-AQ§>();
      
      protected var §_-wV§:§_-AQ§;
      
      public function §_-71C§()
      {
         super();
      }
      
      public function add(param1:§_-AQ§) : void
      {
         this.§_-6e§.push(param1);
         if(!this.§_-wV§)
         {
            this.§_-S2t§ = param1;
         }
      }
      
      public function get §_-S2t§() : §_-AQ§
      {
         return this.§_-wV§;
      }
      
      public function set §_-S2t§(param1:§_-AQ§) : void
      {
         if(this.§_-wV§ == param1 || param1 == null)
         {
            return;
         }
         if(this.§_-wV§)
         {
            this.§_-wV§.removeEventListener("CHANGED",this.§_-21t§);
         }
         this.§_-wV§ = param1;
         this.§_-wV§.§_-7M§(this.§_-M1N§.width - 20);
         this.§_-wV§.addEventListener("CHANGED",this.§_-21t§);
         this.§_-M1N§.source = this.§_-wV§;
         this.§_-M1N§.update();
         this.§_-S2t§.§_-027§();
         this.scroll = this.§_-S2t§.§_-Z1w§;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.addEventListener(Event.CHANGE,this.§_-yb§);
         addChild(this.§_-M1N§);
         this.§_-Y2N§ = new §_-G2L§();
         addChild(this.§_-Y2N§);
      }
      
      protected function §_-yb§(param1:Event) : void
      {
         if(this.§_-S2t§)
         {
            this.§_-S2t§.§_-Z1w§ = this.scroll;
         }
      }
      
      protected function §_-o1n§(param1:§_-4Y§) : void
      {
         this.scroll = 0;
      }
      
      protected function §_-21t§(param1:Event) : void
      {
         this.§_-M1N§.update();
      }
      
      protected function get scroll() : Number
      {
         return this.§_-M1N§.maxVerticalScrollPosition - this.§_-M1N§.verticalScrollPosition;
      }
      
      protected function set scroll(param1:Number) : void
      {
         try
         {
            this.§_-M1N§.verticalScrollPosition = this.§_-M1N§.maxVerticalScrollPosition - param1;
         }
         catch(e:Error)
         {
         }
      }
   }
}

