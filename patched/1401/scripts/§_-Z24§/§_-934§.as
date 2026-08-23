package §_-Z24§
{
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Br§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import protocol.§_-T2o§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-vo§;
   import utils.§_-x1Z§;
   
   public class §_-934§ extends Sprite
   {
      
      private var §_-C3O§:CheckBox = null;
      
      private var §_-tU§:Sprite = null;
      
      private var §_-72z§:§_-j18§ = null;
      
      public function §_-934§()
      {
         super();
         this.§_-tU§ = new Sprite();
         this.§_-tU§.graphics.beginFill(15524553);
         this.§_-tU§.graphics.drawRoundRectComplex(0,0,827,32,5,5,5,5);
         this.§_-tU§.graphics.endFill();
         addChild(this.§_-tU§);
         this.§_-C3O§ = new CheckBox();
         §_-vo§.§_-l1V§(this.§_-C3O§);
         this.§_-C3O§.selected = §_-Bm§.§_-2S§(§_-T2o§.§_-2O§);
         this.§_-C3O§.x = this.§_-C3O§.y = 5;
         this.§_-C3O§.label = gls("Автоматическое взятие бонуса при входе в игру");
         this.§_-C3O§.width = 500;
         this.§_-C3O§.addEventListener(MouseEvent.CLICK,this.§_-62e§);
         this.§_-tU§.addChild(this.§_-C3O§);
         this.§_-72z§ = new §_-j18§("Магазин");
         this.§_-72z§.scaleX = this.§_-72z§.scaleY = 0.8;
         this.§_-72z§.x = this.§_-tU§.width - this.§_-72z§.width - 5;
         this.§_-72z§.y = 5;
         this.§_-72z§.addEventListener(MouseEvent.CLICK,this.§_-m21§);
         addChild(this.§_-72z§);
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-y21§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-y21§);
         §_-Br§.addEventListener(GameEvent.CHANGED,this.§_-y21§);
      }
      
      public function §_-y21§(param1:GameEvent = null) : void
      {
         this.§_-C3O§.mouseChildren = this.§_-C3O§.mouseEnabled = §_-Br§.§_-f2k§;
         this.§_-tU§.filters = this.§_-C3O§.filters = §_-Br§.§_-f2k§ ? [] : §_-x1Z§.§_-c2G§;
         this.§_-C3O§.label = §_-Br§.§_-f2k§ ? gls("Автоматическое взятие бонуса при входе в игру") : gls("Автоматическое взятие бонуса при входе в игру") + " (" + gls("Необходим VIP статус") + ")";
         this.§_-72z§.visible = !§_-Br§.§_-f2k§;
      }
      
      private function §_-62e§(param1:MouseEvent) : void
      {
         if(!§_-Br§.§_-f2k§)
         {
            return;
         }
         if(this.§_-C3O§.selected)
         {
            §_-Bm§.set(§_-T2o§.§_-2O§);
         }
         else
         {
            §_-Bm§.§_-fy§(§_-T2o§.§_-2O§);
         }
      }
      
      private function §_-m21§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         §_-m1L§.§_-Y1T§(§_-m1L§.VIP);
      }
   }
}

