package §_-Q2E§
{
   import §_-X1k§.§_-4v§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-K1Y§;
   
   public class §_-w12§ extends Dialog
   {
      
      private var content:§_-i5§ = null;
      
      public function §_-w12§()
      {
         super(gls("Сброс профессии"));
         this.content = new §_-i5§(gls("Все перья будут возвращены. Ты сможешь распределить перья по навыкам заново."),0,10,new TextFormat(null,14,2039583,null,null,null,null,null,TextFormatAlign.CENTER));
         this.content.width = 320;
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         var _loc1_:§_-K2G§ = new §_-K2G§(gls("Сбросить за {0}",§_-4v§.§_-lb§) + " - ");
         _loc1_.addEventListener(MouseEvent.CLICK,this.reset);
         place(_loc1_);
         §_-K1Y§.§_-P2W§(_loc1_.field,"-",ImageIconCoins,0.7,0.7,-_loc1_.field.x + 2,-3,false,false);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + _loc1_.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
      }
      
      private function reset(param1:MouseEvent) : void
      {
         super.hide(param1);
         GameSounds.play(§_-RH§.CLICK);
         Game.§_-u2z§(§_-u1O§.§_-fm§,§_-4v§.§_-lb§,0,Game.selfId,§_-4v§.§_-71M§);
      }
   }
}

