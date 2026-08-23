package §_-I18§
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-U19§.§_-VK§;
   import §_-U19§.§_-m1L§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import §_-zG§.§_-62l§;
   import buttons.§_-K2G§;
   import events.§_-s1d§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   import views.§_-r2O§;
   
   public class §_-v2R§ extends Dialog
   {
      
      public static const §_-KP§:int = 5;
      
      public static const §_-K2§:int = 5;
      
      public static const §_-4L§:int = 100;
      
      private static var §_-N1F§:int = 0;
      
      private var §_-CW§:§_-62l§ = null;
      
      private var §_-p2E§:§_-Fk§;
      
      private var §_-X10§:§_-K2G§ = null;
      
      private var §_-GQ§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function §_-v2R§()
      {
         super(gls("Заявки на вступление в клан"));
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-13N§]);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.§_-CW§.clear();
      }
      
      public function §_-p2O§(param1:Array) : void
      {
         var _loc2_:Vector.<§_-VK§> = new Vector.<§_-VK§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(new §_-VK§(param1[_loc3_],param1[_loc3_ + 1]));
            _loc3_ += 2;
         }
         this.§_-CW§.§_-p2O§(_loc2_);
      }
      
      private function init() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:TextFormat = null;
         var _loc5_:§_-i5§ = null;
         var _loc6_:§_-r2O§ = null;
         this.§_-p2E§ = new §_-Fk§(gls("Клан заблокирован"),gls("Ты не можешь принимать или отклонять заявки,\nт.к. твой клан заблокирован."));
         this.§_-CW§ = new §_-62l§();
         this.§_-CW§.x = 15;
         this.§_-CW§.y = 24;
         this.§_-CW§.addEventListener(§_-s1d§.§_-n2H§,this.§_-Fc§);
         addChild(this.§_-CW§);
         var _loc1_:§_-K2G§ = new §_-K2G§(gls("Принять"));
         _loc1_.x = 80;
         _loc1_.y = this.§_-CW§.y + this.§_-CW§.height - 40;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-8l§);
         addChild(_loc1_);
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Отказать"));
         _loc2_.x = 185;
         _loc2_.y = this.§_-CW§.y + this.§_-CW§.height - 40;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-q2C§);
         addChild(_loc2_);
         if(Game.self["clan_duty"] == Clan.§_-01X§)
         {
            _loc3_ = new Sprite();
            _loc3_.graphics.beginFill(15524553);
            _loc3_.graphics.drawRoundRectComplex(0,0,325,125,7.5,7.5,7.5,7.5);
            _loc3_.graphics.endFill();
            _loc3_.x = 10;
            _loc3_.y = _loc2_.y + _loc2_.height + 10;
            addChild(_loc3_);
            _loc4_ = new TextFormat(null,14,4666410,false);
            _loc4_.align = TextFormatAlign.CENTER;
            _loc4_.leading = 2.5;
            _loc5_ = new §_-i5§("",_loc3_.x + 20,_loc3_.y + 10,_loc4_);
            _loc5_.text = gls("Получая новый уровень клана, ты можешь\nдобавлять  больше участников,\nтакже ты можешь купить места за монетки");
            addChild(_loc5_);
            this.§_-X10§ = new §_-K2G§(gls("Купить {0} мест за {1}",§_-K2§,5) + " -   ",200);
            this.§_-X10§.x = 75;
            this.§_-X10§.y = _loc5_.y + 65;
            this.§_-X10§.addEventListener(MouseEvent.CLICK,this.§_-03h§);
            addChild(this.§_-X10§);
            _loc6_ = new §_-r2O§();
            _loc6_.x = _loc3_.x;
            _loc6_.y = _loc3_.y + _loc3_.height + 10;
            _loc6_.§_-5S§ = §_-B2U§.§_-Q2g§(Game.self["clan_id"]).§_-B1D§;
            addChild(_loc6_);
         }
         place();
         this.height += 60;
         this.width += 26;
      }
      
      public function §_-75§(param1:int) : void
      {
         var _loc2_:DisplayObject = null;
         if(Game.self["clan_duty"] != Clan.§_-01X§)
         {
            return;
         }
         §_-N1F§ = Math.min(§_-4L§,§_-KP§ * (param1 / §_-K2§ + 1));
         this.§_-X10§.field.text = gls("Купить {0} мест за {1}",§_-K2§,§_-N1F§) + " -   ";
         this.§_-X10§.redraw();
         while(this.§_-GQ§.length > 0)
         {
            _loc2_ = this.§_-GQ§.shift();
            _loc2_.parent.removeChild(_loc2_);
         }
         this.§_-GQ§ = §_-K1Y§.§_-P2W§(this.§_-X10§.field,"-",ImageIconCoins,0.7,0.7,-this.§_-X10§.field.x,-3,false,false);
      }
      
      private function §_-03h§(param1:MouseEvent) : void
      {
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).state == §_-s2l§.§_-F2E§)
         {
            this.§_-p2E§.show();
            return;
         }
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).coins < §_-N1F§ && (Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§))
         {
            new §_-hC§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки дополнительных мест.\nПополните бюджет вашего клана.")).show();
            return;
         }
         if(Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§)
         {
            Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-S5§,§_-N1F§,0);
         }
         else
         {
            Game.buy(§_-u1O§.§_-S5§,§_-N1F§,0);
         }
      }
      
      private function §_-8l§(param1:MouseEvent) : void
      {
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).state == §_-s2l§.§_-F2E§)
         {
            this.§_-p2E§.show();
            return;
         }
         this.§_-CW§.§_-Vh§();
      }
      
      private function §_-q2C§(param1:MouseEvent) : void
      {
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).state == §_-s2l§.§_-F2E§)
         {
            this.§_-p2E§.show();
            return;
         }
         this.§_-CW§.§_-G1A§();
      }
      
      private function §_-Fc§(param1:§_-s1d§) : void
      {
         dispatchEvent(new §_-s1d§(param1.count));
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!§_-m1L§.§_-K1W§)
         {
            return;
         }
         this.§_-p2O§(param1[0]);
      }
   }
}

