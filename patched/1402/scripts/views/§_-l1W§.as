package views
{
   import §_-5T§.§_-eC§;
   import buttons.§_-K2G§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import utils.§_-K1Y§;
   import utils.§_-y1l§;
   
   public class §_-l1W§ extends Sprite
   {
      
      private var §_-S1l§:§_-eC§ = null;
      
      private var §_-O24§:§_-eC§ = null;
      
      private var §_-SJ§:MovieClip = null;
      
      private var §_-O0§:§_-K2G§;
      
      public function §_-l1W§()
      {
         super();
         this.init();
      }
      
      public function change(param1:int, param2:int) : void
      {
         this.§_-O24§.id = param1;
         this.§_-S1l§.id = param2;
         this.§_-O24§.mouseEnabled = this.§_-S1l§.mouseEnabled = false;
         this.§_-O24§.mouseChildren = this.§_-S1l§.mouseChildren = false;
         (this.§_-SJ§ as ExchangeArrowsView).blueArrow.filters = param1 == -1 ? §_-y1l§.§_-Tk§ : [];
         (this.§_-SJ§ as ExchangeArrowsView).greenArrow.filters = param2 == -1 ? §_-y1l§.§_-Tk§ : [];
         this.§_-O0§.enabled = param1 != -1 && param2 != -1;
      }
      
      private function init() : void
      {
         this.graphics.beginFill(11964012,0.4);
         this.graphics.drawRect(0,0,59,59);
         this.graphics.drawRect(110,0,59,59);
         this.§_-S1l§ = new §_-eC§();
         this.§_-S1l§.x = this.§_-S1l§.y = 7;
         addChild(this.§_-S1l§);
         this.§_-O24§ = new §_-eC§();
         this.§_-O24§.x = 117;
         this.§_-O24§.y = 7;
         addChild(this.§_-O24§);
         this.§_-SJ§ = new ExchangeArrowsView();
         this.§_-SJ§.x = 65;
         this.§_-SJ§.y = 8;
         addChild(this.§_-SJ§);
         this.§_-O0§ = new §_-K2G§(gls("Обменять за") + " -    " + Game.§_-kd§);
         this.§_-O0§.x = 200;
         this.§_-O0§.y = 15;
         this.§_-O0§.addEventListener(MouseEvent.CLICK,this.§_-E7§);
         addChild(this.§_-O0§);
         §_-K1Y§.§_-P2W§(this.§_-O0§.field,"-",ImageIconNut,0.7,0.7,-this.§_-O0§.field.x,-3,false,false);
      }
      
      private function §_-E7§(param1:MouseEvent) : void
      {
         if(!this.§_-O0§.enabled)
         {
            return;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

