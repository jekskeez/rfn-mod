package §_-Q1P§
{
   import §_-Rj§.§_-A32§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import events.GameEvent;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import utils.§_-vo§;
   import views.§_-h2q§;
   
   public class §_-zW§ extends Dialog
   {
      
      private var game:§_-A32§;
      
      private var §_-H2G§:§_-h2q§ = new §_-h2q§(gls("Кол-во белок:"));
      
      private var §_-n22§:CheckBox = new CheckBox();
      
      private var §_-T2K§:CheckBox = new CheckBox();
      
      private var §_-R1A§:§_-j18§ = new §_-j18§(gls("Другой фон"));
      
      public function §_-zW§(param1:§_-A32§)
      {
         super(gls("Настройки тестирования\nкарты"));
         this.game = param1;
         this.§_-H2G§.value = 1;
         this.§_-H2G§.y = 20;
         addChild(this.§_-H2G§);
         §_-vo§.§_-l1V§(this.§_-n22§);
         this.§_-n22§.y = this.§_-H2G§.y + this.§_-H2G§.height + 10;
         this.§_-n22§.label = gls("Добавить дракошу");
         this.§_-n22§.width = 200;
         this.§_-n22§.drawNow();
         addChild(this.§_-n22§);
         §_-vo§.§_-l1V§(this.§_-T2K§);
         this.§_-T2K§.y = this.§_-n22§.y + this.§_-n22§.height + 5;
         this.§_-T2K§.label = gls("Добавить зайца НеСудьбы");
         this.§_-T2K§.width = 200;
         this.§_-T2K§.drawNow();
         addChild(this.§_-T2K§);
         this.§_-R1A§.x = 95;
         this.§_-R1A§.y = this.§_-T2K§.y + this.§_-T2K§.height + 12;
         this.§_-R1A§.addEventListener(MouseEvent.CLICK,this.§_-p2c§);
         addChild(this.§_-R1A§);
         place();
         this.width = 350;
         this.height = 215;
      }
      
      public function get §_-I1y§() : int
      {
         return int(this.§_-H2G§.value);
      }
      
      public function set §_-I1y§(param1:int) : void
      {
         this.§_-H2G§.value = param1;
      }
      
      public function get §_-T2t§() : Boolean
      {
         return this.§_-n22§.selected;
      }
      
      public function get §_-R2k§() : Boolean
      {
         return this.§_-T2K§.selected;
      }
      
      override public function show() : void
      {
         this.§_-D2p§();
         super.show();
      }
      
      public function §_-D2p§() : void
      {
         if(!this.game)
         {
            return;
         }
         this.§_-72q§(this.§_-n22§,§_-q1p§.§_-4N§(this.game.§_-v1P§.mode));
         this.§_-72q§(this.§_-T2K§,§_-q1p§.§_-xI§(this.game.§_-v1P§.mode,this.game.§_-v1P§.§_-Vz§));
      }
      
      public function dispose() : void
      {
         hide();
         this.§_-R1A§.removeEventListener(MouseEvent.CLICK,this.§_-p2c§);
         this.game = null;
      }
      
      private function §_-72q§(param1:CheckBox, param2:Boolean) : void
      {
         param1.mouseEnabled = param1.mouseChildren = param2;
         param1.alpha = param2 ? 1 : 0.5;
         if(!param2)
         {
            param1.selected = false;
         }
      }
      
      private function §_-p2c§(param1:MouseEvent) : void
      {
         dispatchEvent(new GameEvent(GameEvent.SWAP_BACKGROUND));
      }
   }
}

