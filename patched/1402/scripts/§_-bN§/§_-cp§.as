package §_-bN§
{
   import §_-X1k§.§_-HZ§;
   import §_-X1k§.§_-XW§;
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-K1Y§;
   
   public class §_-cp§ extends Dialog
   {
      
      private var §_-93t§:Function;
      
      private var §_-Jc§:Function;
      
      private var §_-Z11§:§_-i5§;
      
      private var §_-93y§:§_-K2G§;
      
      private var §_-14§:§_-K2G§;
      
      private var images:Vector.<DisplayObject> = null;
      
      public function §_-cp§(param1:Function, param2:Function)
      {
         super(gls("Изменить имя"),true,false);
         this.§_-93t§ = param1;
         this.§_-Jc§ = param2;
         this.§_-Z11§ = new §_-i5§("",0,5,new TextFormat(null,14,2039583));
         addChild(this.§_-Z11§);
         this.§_-14§ = new §_-K2G§(gls("Ок"));
         this.§_-14§.addEventListener(MouseEvent.CLICK,this.§_-k1l§);
         this.§_-93y§ = new §_-K2G§(gls("Отмена"));
         this.§_-93y§.addEventListener(MouseEvent.CLICK,this.§_-m5§);
         place(this.§_-14§,this.§_-93y§);
         Connection.listen(§_-x2f§,[§_-s2l§.§_-Im§]);
      }
      
      private static function get price() : int
      {
         return §_-HZ§.player.name_change_coins_price;
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         Game.request(Game.selfId,§_-Y2E§.§_-n2H§,true);
         Game.§_-dS§ = false;
      }
      
      override public function show() : void
      {
         var _loc1_:DisplayObject = null;
         this.width = Game.§_-dS§ ? 310 : 270;
         this.height = Game.§_-dS§ ? 160 : 110;
         this.§_-Z11§.htmlText = this.text;
         if(this.images)
         {
            for each(_loc1_ in this.images)
            {
               removeChild(_loc1_);
            }
         }
         this.images = §_-K1Y§.§_-P2W§(this.§_-Z11§,"#Co",ImageIconCoins,0.6,0.6,-this.§_-Z11§.x - 2,-this.§_-Z11§.y,true);
         super.show();
      }
      
      private function get text() : String
      {
         if(!Game.§_-dS§)
         {
            return gls("Поменять имя за <b>{0}</b> #Co   ?",price);
         }
         return gls("После <b>{0}</b> уровня у тебя есть возможность\nодин раз поменять имя бесплатно, после\nиспользования которой изменить имя\nможно будет за <b>{1}</b> #Co  .",§_-XW§.§_-01R§,§_-HZ§.player.name_change_coins_price);
      }
      
      private function §_-m5§(param1:MouseEvent) : void
      {
         this.§_-Jc§();
         hide();
      }
      
      private function §_-k1l§(param1:MouseEvent) : void
      {
         if(Game.§_-dS§)
         {
            Game.§_-dS§ = false;
         }
         else if(Game.§_-I20§ < price)
         {
            Services.bank.open();
            return;
         }
         this.§_-93t§();
         hide();
      }
   }
}

