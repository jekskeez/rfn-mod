package chat
{
   import §_-B1G§.ScrollPane;
   import buttons.§_-Hg§;
   import events.§_-b2G§;
   import flash.events.Event;
   
   public class §_-In§ extends §_-63Y§
   {
      
      protected var §_-a3§:§_-Hg§ = null;
      
      protected var §_-W18§:ScrollPane = null;
      
      protected var §_-U1B§:Vector.<§_-N2t§> = new Vector.<§_-N2t§>();
      
      protected var §_-b1A§:§_-N2t§;
      
      public function §_-In§()
      {
         super();
      }
      
      public function add(param1:§_-N2t§) : void
      {
         this.§_-U1B§.push(param1);
         if(!this.§_-b1A§)
         {
            this.§_-G1O§ = param1;
         }
      }
      
      public function get §_-G1O§() : §_-N2t§
      {
         return this.§_-b1A§;
      }
      
      public function set §_-G1O§(param1:§_-N2t§) : void
      {
         if(this.§_-b1A§ == param1 || param1 == null)
         {
            return;
         }
         if(this.§_-b1A§)
         {
            this.§_-b1A§.removeEventListener("CHANGED",this.§_-52S§);
         }
         this.§_-b1A§ = param1;
         this.§_-b1A§.§_-pH§(this.§_-W18§.width - 20);
         this.§_-b1A§.addEventListener("CHANGED",this.§_-52S§);
         this.§_-W18§.source = this.§_-b1A§;
         this.§_-W18§.update();
         this.§_-G1O§.§_-O1s§();
         this.scroll = this.§_-G1O§.§_-fW§;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.addEventListener(Event.CHANGE,this.§_-X2c§);
         addChild(this.§_-W18§);
         this.§_-a3§ = new §_-Hg§();
         addChild(this.§_-a3§);
      }
      
      protected function §_-X2c§(param1:Event) : void
      {
         if(this.§_-G1O§)
         {
            this.§_-G1O§.§_-fW§ = this.scroll;
         }
      }
      
      protected function §_-QC§(param1:§_-b2G§) : void
      {
         this.scroll = 0;
      }
      
      protected function §_-52S§(param1:Event) : void
      {
         this.§_-W18§.update();
      }
      
      protected function get scroll() : Number
      {
         return this.§_-W18§.maxVerticalScrollPosition - this.§_-W18§.verticalScrollPosition;
      }
      
      protected function set scroll(param1:Number) : void
      {
         try
         {
            this.§_-W18§.verticalScrollPosition = this.§_-W18§.maxVerticalScrollPosition - param1;
         }
         catch(e:Error)
         {
         }
      }
   }
}

