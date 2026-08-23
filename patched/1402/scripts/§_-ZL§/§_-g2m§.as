package §_-ZL§
{
   import §_-bN§.Dialog;
   import §_-l2u§.§_-62b§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import utils.§_-L2J§;
   import views.§_-Y20§;
   
   public class §_-g2m§ extends Dialog
   {
      
      private var game:§_-62b§;
      
      private var §_-sW§:§_-Y20§ = new §_-Y20§(gls("Кол-во белок:"));
      
      private var §_-qi§:CheckBox = new CheckBox();
      
      private var §_-919§:CheckBox = new CheckBox();
      
      private var §_-x2L§:§_-K2G§ = new §_-K2G§(gls("Другой фон"));
      
      public function §_-g2m§(param1:§_-62b§)
      {
         super(gls("Настройки тестирования\nкарты"));
         this.game = param1;
         this.§_-sW§.value = 1;
         this.§_-sW§.y = 20;
         addChild(this.§_-sW§);
         §_-L2J§.§_-61Q§(this.§_-qi§);
         this.§_-qi§.y = this.§_-sW§.y + this.§_-sW§.height + 10;
         this.§_-qi§.label = gls("Добавить дракошу");
         this.§_-qi§.width = 200;
         this.§_-qi§.drawNow();
         addChild(this.§_-qi§);
         §_-L2J§.§_-61Q§(this.§_-919§);
         this.§_-919§.y = this.§_-qi§.y + this.§_-qi§.height + 5;
         this.§_-919§.label = gls("Добавить зайца НеСудьбы");
         this.§_-919§.width = 200;
         this.§_-919§.drawNow();
         addChild(this.§_-919§);
         this.§_-x2L§.x = 95;
         this.§_-x2L§.y = this.§_-919§.y + this.§_-919§.height + 12;
         this.§_-x2L§.addEventListener(MouseEvent.CLICK,this.§_-k1v§);
         addChild(this.§_-x2L§);
         place();
         this.width = 350;
         this.height = 215;
      }
      
      public function get §_-e1W§() : int
      {
         return int(this.§_-sW§.value);
      }
      
      public function set §_-e1W§(param1:int) : void
      {
         this.§_-sW§.value = param1;
      }
      
      public function get §_-v1a§() : Boolean
      {
         return this.§_-qi§.selected;
      }
      
      public function get §_-Ya§() : Boolean
      {
         return this.§_-919§.selected;
      }
      
      override public function show() : void
      {
         this.§_-e2d§();
         super.show();
      }
      
      public function §_-e2d§() : void
      {
         if(!this.game)
         {
            return;
         }
         this.§_-k2Z§(this.§_-qi§,§_-at§.§_-N2l§(this.game.§_-63x§.mode));
         this.§_-k2Z§(this.§_-919§,§_-at§.§_-y1P§(this.game.§_-63x§.mode,this.game.§_-63x§.§_-F2u§));
      }
      
      public function dispose() : void
      {
         hide();
         this.§_-x2L§.removeEventListener(MouseEvent.CLICK,this.§_-k1v§);
         this.game = null;
      }
      
      private function §_-k2Z§(param1:CheckBox, param2:Boolean) : void
      {
         param1.mouseEnabled = param1.mouseChildren = param2;
         param1.alpha = param2 ? 1 : 0.5;
         if(!param2)
         {
            param1.selected = false;
         }
      }
      
      private function §_-k1v§(param1:MouseEvent) : void
      {
         dispatchEvent(new GameEvent(GameEvent.SWAP_BACKGROUND));
      }
   }
}

