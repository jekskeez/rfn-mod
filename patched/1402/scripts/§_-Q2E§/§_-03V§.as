package §_-Q2E§
{
   import §_-bN§.Dialog;
   import §_-o10§.§_-pl§;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-K1Y§;
   
   public class §_-03V§ extends Dialog
   {
      
      private var content:§_-i5§ = null;
      
      private var §_-437§:int = -1;
      
      private var §_-tF§:int = 0;
      
      private var buttonBuy:§_-K2G§;
      
      private var §_-ls§:§_-i5§;
      
      public function §_-03V§()
      {
         super(gls("Изучение навыка"));
         this.content = new §_-i5§(gls("Ты собираешься выучить 4-й уровень навыка!"),0,10,new TextFormat(null,14,2039583,null,null,null,null,null,TextFormatAlign.CENTER));
         this.content.width = 300;
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         this.buttonBuy = new §_-K2G§("");
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         place(this.buttonBuy);
         this.§_-ls§ = new §_-i5§("",0,0,new TextFormat(null,14,0,true));
         this.§_-ls§.mouseEnabled = false;
         addChild(this.§_-ls§);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
      }
      
      public function set §_-ok§(param1:int) : void
      {
         this.§_-437§ = param1;
         this.content.text = gls("Ты собираешься выучить 4-й уровень навыка «{0}».",§_-pl§.perkData[param1]["name"]);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
      }
      
      public function set cost(param1:int) : void
      {
         this.§_-tF§ = param1;
         this.buttonBuy.field.text = gls("Выучить за {0}",this.§_-tF§) + " - ";
         this.buttonBuy.redraw();
         this.buttonBuy.x = this.content.x + int((this.content.width - this.buttonBuy.width) * 0.5);
         §_-K1Y§.§_-P2W§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
      }
      
      private function buy(param1:MouseEvent) : void
      {
         super.hide(param1);
         GameSounds.play(§_-RH§.CLICK);
         Game.buy(§_-u1O§.§_-O1W§,this.§_-tF§,0,Game.selfId,this.§_-437§);
      }
   }
}

