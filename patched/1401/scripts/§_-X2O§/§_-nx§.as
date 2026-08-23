package §_-X2O§
{
   import §_-I10§.§_-ct§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-jB§;
   
   public class §_-nx§ extends Dialog
   {
      
      private var content:§_-22V§ = null;
      
      private var §_-Wu§:int = §_-ct§.§_-F2j§;
      
      private var buttonBuy:§_-j18§;
      
      public function §_-nx§()
      {
         super(gls("Покупка профессии"));
         this.content = new §_-22V§(gls("Ты покупаешь профессию. Набор навыков в текущей профессии будет сохранен, и ты сможешь переключаться между профессиями.\n\nПолученные перья сохранятся, и ты сможешь изучить новые способности."),0,10,new TextFormat(null,14,2039583));
         this.content.width = 370;
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         this.buttonBuy = new §_-j18§(gls("Купить за {0}",§_-ct§.§_-i§) + " - ");
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         place(this.buttonBuy);
         §_-jB§.§_-fG§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
      }
      
      public function set branch(param1:int) : void
      {
         this.§_-Wu§ = param1;
         this.content.text = gls("Ты покупаешь профессию «{0}». Набор навыков в текущей профессии будет сохранен, и ты сможешь переключаться между профессиями.\n\nПолученные перья сохранятся, и ты сможешь изучить новые способности.",§_-ct§.§_-t1c§[this.§_-Wu§]);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
      }
      
      private function buy(param1:MouseEvent) : void
      {
         super.hide(param1);
         GameSounds.play(§_-43Z§.CLICK);
         Game.§_-K2t§(§_-h2B§.§_-OX§,§_-ct§.§_-i§,0,Game.selfId,this.§_-Wu§);
      }
   }
}

