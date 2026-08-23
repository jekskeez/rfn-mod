package §_-X2O§
{
   import §_-I10§.§_-ct§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-jB§;
   
   public class §_-8V§ extends Dialog
   {
      
      private var content:§_-22V§ = null;
      
      public function §_-8V§()
      {
         super(gls("Сброс профессии"));
         this.content = new §_-22V§(gls("Все перья будут возвращены. Ты сможешь распределить перья по навыкам заново."),0,10,new TextFormat(null,14,2039583,null,null,null,null,null,TextFormatAlign.CENTER));
         this.content.width = 320;
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         var _loc1_:§_-j18§ = new §_-j18§(gls("Сбросить за {0}",§_-ct§.§_-b1e§) + " - ");
         _loc1_.addEventListener(MouseEvent.CLICK,this.reset);
         place(_loc1_);
         §_-jB§.§_-fG§(_loc1_.field,"-",ImageIconCoins,0.7,0.7,-_loc1_.field.x + 2,-3,false,false);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + _loc1_.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
      }
      
      private function reset(param1:MouseEvent) : void
      {
         super.hide(param1);
         GameSounds.play(§_-43Z§.CLICK);
         Game.§_-K2t§(§_-h2B§.§_-u2H§,§_-ct§.§_-b1e§,0,Game.selfId,§_-ct§.§_-m1k§);
      }
   }
}

