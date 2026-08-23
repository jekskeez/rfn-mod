package §_-k1c§
{
   import §_-I10§.§_-My§;
   import §_-I10§.§_-t2V§;
   import buttons.§_-j18§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-jB§;
   
   public class §_-w2B§ extends Dialog
   {
      
      private var §_-V2b§:Function;
      
      private var §_-U0§:Function;
      
      private var §_-n2P§:§_-22V§;
      
      private var §_-Z12§:§_-j18§;
      
      private var §_-ov§:§_-j18§;
      
      private var images:Vector.<DisplayObject> = null;
      
      public function §_-w2B§(param1:Function, param2:Function)
      {
         super(gls("Изменить имя"),true,false);
         this.§_-V2b§ = param1;
         this.§_-U0§ = param2;
         this.§_-n2P§ = new §_-22V§("",0,5,new TextFormat(null,14,2039583));
         addChild(this.§_-n2P§);
         this.§_-ov§ = new §_-j18§(gls("Ок"));
         this.§_-ov§.addEventListener(MouseEvent.CLICK,this.§_-G2y§);
         this.§_-Z12§ = new §_-j18§(gls("Отмена"));
         this.§_-Z12§.addEventListener(MouseEvent.CLICK,this.§_-K1H§);
         place(this.§_-ov§,this.§_-Z12§);
         Connection.listen(§_-o2C§,[§_-S2I§.§_-n1O§]);
      }
      
      private static function get price() : int
      {
         return §_-t2V§.player.name_change_coins_price;
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         Game.request(Game.selfId,§_-hF§.§_-31q§,true);
         Game.§_-nC§ = false;
      }
      
      override public function show() : void
      {
         var _loc1_:DisplayObject = null;
         this.width = Game.§_-nC§ ? 310 : 270;
         this.height = Game.§_-nC§ ? 160 : 110;
         this.§_-n2P§.htmlText = this.text;
         if(this.images)
         {
            for each(_loc1_ in this.images)
            {
               removeChild(_loc1_);
            }
         }
         this.images = §_-jB§.§_-fG§(this.§_-n2P§,"#Co",ImageIconCoins,0.6,0.6,-this.§_-n2P§.x - 2,-this.§_-n2P§.y,true);
         super.show();
      }
      
      private function get text() : String
      {
         if(!Game.§_-nC§)
         {
            return gls("Поменять имя за <b>{0}</b> #Co   ?",price);
         }
         return gls("После <b>{0}</b> уровня у тебя есть возможность\nодин раз поменять имя бесплатно, после\nиспользования которой изменить имя\nможно будет за <b>{1}</b> #Co  .",§_-My§.§_-32h§,§_-t2V§.player.name_change_coins_price);
      }
      
      private function §_-K1H§(param1:MouseEvent) : void
      {
         this.§_-U0§();
         hide();
      }
      
      private function §_-G2y§(param1:MouseEvent) : void
      {
         if(Game.§_-nC§)
         {
            Game.§_-nC§ = false;
         }
         else if(Game.§_-DJ§ < price)
         {
            Services.bank.open();
            return;
         }
         this.§_-V2b§();
         hide();
      }
   }
}

