package §_-01t§
{
   import §_-J19§.§_-534§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-r12§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import protocol.§_-n2E§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-L2J§;
   import utils.§_-y1l§;
   
   public class §_-93p§ extends Sprite
   {
      
      private var §_-l2I§:CheckBox = null;
      
      private var §_-33A§:Sprite = null;
      
      private var §_-R1r§:§_-K2G§ = null;
      
      public function §_-93p§()
      {
         super();
         this.§_-33A§ = new Sprite();
         this.§_-33A§.graphics.beginFill(15524553);
         this.§_-33A§.graphics.drawRoundRectComplex(0,0,827,32,5,5,5,5);
         this.§_-33A§.graphics.endFill();
         addChild(this.§_-33A§);
         this.§_-l2I§ = new CheckBox();
         §_-L2J§.§_-61Q§(this.§_-l2I§);
         this.§_-l2I§.selected = §_-r12§.§_-FS§(§_-n2E§.§_-PG§);
         this.§_-l2I§.x = this.§_-l2I§.y = 5;
         this.§_-l2I§.label = gls("Автоматическое взятие бонуса при входе в игру");
         this.§_-l2I§.width = 500;
         this.§_-l2I§.addEventListener(MouseEvent.CLICK,this.§_-02r§);
         this.§_-33A§.addChild(this.§_-l2I§);
         this.§_-R1r§ = new §_-K2G§("Магазин");
         this.§_-R1r§.scaleX = this.§_-R1r§.scaleY = 0.8;
         this.§_-R1r§.x = this.§_-33A§.width - this.§_-R1r§.width - 5;
         this.§_-R1r§.y = 5;
         this.§_-R1r§.addEventListener(MouseEvent.CLICK,this.§_-F2R§);
         addChild(this.§_-R1r§);
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-q1o§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-q1o§);
         §_-F1Z§.addEventListener(GameEvent.CHANGED,this.§_-q1o§);
      }
      
      public function §_-q1o§(param1:GameEvent = null) : void
      {
         this.§_-l2I§.mouseChildren = this.§_-l2I§.mouseEnabled = §_-F1Z§.§_-O1u§;
         this.§_-33A§.filters = this.§_-l2I§.filters = §_-F1Z§.§_-O1u§ ? [] : §_-y1l§.§_-Tk§;
         this.§_-l2I§.label = §_-F1Z§.§_-O1u§ ? gls("Автоматическое взятие бонуса при входе в игру") : gls("Автоматическое взятие бонуса при входе в игру") + " (" + gls("Необходим VIP статус") + ")";
         this.§_-R1r§.visible = !§_-F1Z§.§_-O1u§;
      }
      
      private function §_-02r§(param1:MouseEvent) : void
      {
         if(!§_-F1Z§.§_-O1u§)
         {
            return;
         }
         if(this.§_-l2I§.selected)
         {
            §_-r12§.set(§_-n2E§.§_-PG§);
         }
         else
         {
            §_-r12§.§_-42k§(§_-n2E§.§_-PG§);
         }
      }
      
      private function §_-F2R§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
         §_-534§.§_-R2X§(§_-534§.VIP);
      }
   }
}

