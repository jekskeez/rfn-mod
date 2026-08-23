package §_-X2O§
{
   import §_-k1c§.Dialog;
   import §_-vK§.§_-QC§;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-jB§;
   
   public class §_-6Z§ extends Dialog
   {
      
      private var content:§_-22V§ = null;
      
      private var §_-e2Y§:int = -1;
      
      private var §_-Zn§:int = 0;
      
      private var buttonBuy:§_-j18§;
      
      private var §_-6Q§:§_-22V§;
      
      public function §_-6Z§()
      {
         super(gls("Изучение навыка"));
         this.content = new §_-22V§(gls("Ты собираешься выучить 4-й уровень навыка!"),0,10,new TextFormat(null,14,2039583,null,null,null,null,null,TextFormatAlign.CENTER));
         this.content.width = 300;
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         this.buttonBuy = new §_-j18§("");
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         place(this.buttonBuy);
         this.§_-6Q§ = new §_-22V§("",0,0,new TextFormat(null,14,0,true));
         this.§_-6Q§.mouseEnabled = false;
         addChild(this.§_-6Q§);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
      }
      
      public function set §_-Q2s§(param1:int) : void
      {
         this.§_-e2Y§ = param1;
         this.content.text = gls("Ты собираешься выучить 4-й уровень навыка «{0}».",§_-QC§.perkData[param1]["name"]);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
      }
      
      public function set cost(param1:int) : void
      {
         this.§_-Zn§ = param1;
         this.buttonBuy.field.text = gls("Выучить за {0}",this.§_-Zn§) + " - ";
         this.buttonBuy.redraw();
         this.buttonBuy.x = this.content.x + int((this.content.width - this.buttonBuy.width) * 0.5);
         §_-jB§.§_-fG§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
      }
      
      private function buy(param1:MouseEvent) : void
      {
         super.hide(param1);
         GameSounds.play(§_-43Z§.CLICK);
         Game.buy(§_-h2B§.§_-T2O§,this.§_-Zn§,0,Game.selfId,this.§_-e2Y§);
      }
   }
}

