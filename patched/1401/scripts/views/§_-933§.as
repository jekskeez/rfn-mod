package views
{
   import §_-f1x§.§_-t3§;
   import buttons.§_-j18§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import utils.§_-jB§;
   import utils.§_-x1Z§;
   
   public class §_-933§ extends Sprite
   {
      
      private var §_-GC§:§_-t3§ = null;
      
      private var §_-812§:§_-t3§ = null;
      
      private var §_-wj§:MovieClip = null;
      
      private var §_-h§:§_-j18§;
      
      public function §_-933§()
      {
         super();
         this.init();
      }
      
      public function change(param1:int, param2:int) : void
      {
         this.§_-812§.id = param1;
         this.§_-GC§.id = param2;
         this.§_-812§.mouseEnabled = this.§_-GC§.mouseEnabled = false;
         this.§_-812§.mouseChildren = this.§_-GC§.mouseChildren = false;
         (this.§_-wj§ as ExchangeArrowsView).blueArrow.filters = param1 == -1 ? §_-x1Z§.§_-c2G§ : [];
         (this.§_-wj§ as ExchangeArrowsView).greenArrow.filters = param2 == -1 ? §_-x1Z§.§_-c2G§ : [];
         this.§_-h§.enabled = param1 != -1 && param2 != -1;
      }
      
      private function init() : void
      {
         this.graphics.beginFill(11964012,0.4);
         this.graphics.drawRect(0,0,59,59);
         this.graphics.drawRect(110,0,59,59);
         this.§_-GC§ = new §_-t3§();
         this.§_-GC§.x = this.§_-GC§.y = 7;
         addChild(this.§_-GC§);
         this.§_-812§ = new §_-t3§();
         this.§_-812§.x = 117;
         this.§_-812§.y = 7;
         addChild(this.§_-812§);
         this.§_-wj§ = new ExchangeArrowsView();
         this.§_-wj§.x = 65;
         this.§_-wj§.y = 8;
         addChild(this.§_-wj§);
         this.§_-h§ = new §_-j18§(gls("Обменять за") + " -    " + Game.§_-z2b§);
         this.§_-h§.x = 200;
         this.§_-h§.y = 15;
         this.§_-h§.addEventListener(MouseEvent.CLICK,this.§_-L1x§);
         addChild(this.§_-h§);
         §_-jB§.§_-fG§(this.§_-h§.field,"-",ImageIconNut,0.7,0.7,-this.§_-h§.field.x,-3,false,false);
      }
      
      private function §_-L1x§(param1:MouseEvent) : void
      {
         if(!this.§_-h§.enabled)
         {
            return;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

