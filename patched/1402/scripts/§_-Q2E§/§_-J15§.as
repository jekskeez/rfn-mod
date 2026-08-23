package §_-Q2E§
{
   import §_-X1k§.§_-4v§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-K1Y§;
   
   public class §_-J15§ extends Dialog
   {
      
      private var content:§_-i5§ = null;
      
      private var §_-c1i§:int = §_-4v§.§_-631§;
      
      private var buttonBuy:§_-K2G§;
      
      public function §_-J15§()
      {
         super(gls("Покупка профессии"));
         this.content = new §_-i5§(gls("Ты покупаешь профессию. Набор навыков в текущей профессии будет сохранен, и ты сможешь переключаться между профессиями.\n\nПолученные перья сохранятся, и ты сможешь изучить новые способности."),0,10,new TextFormat(null,14,2039583));
         this.content.width = 370;
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         this.buttonBuy = new §_-K2G§(gls("Купить за {0}",§_-4v§.§_-YD§) + " - ");
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         place(this.buttonBuy);
         §_-K1Y§.§_-P2W§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
      }
      
      public function set branch(param1:int) : void
      {
         this.§_-c1i§ = param1;
         this.content.text = gls("Ты покупаешь профессию «{0}». Набор навыков в текущей профессии будет сохранен, и ты сможешь переключаться между профессиями.\n\nПолученные перья сохранятся, и ты сможешь изучить новые способности.",§_-4v§.§_-za§[this.§_-c1i§]);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.buttonBuy.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
      }
      
      private function buy(param1:MouseEvent) : void
      {
         super.hide(param1);
         GameSounds.play(§_-RH§.CLICK);
         Game.§_-u2z§(§_-u1O§.§_-G2§,§_-4v§.§_-YD§,0,Game.selfId,this.§_-c1i§);
      }
   }
}

