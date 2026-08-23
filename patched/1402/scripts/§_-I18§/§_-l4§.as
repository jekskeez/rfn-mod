package §_-I18§
{
   import §_-B1G§.§_-32t§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-LZ§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   
   public class §_-l4§ extends Dialog
   {
      
      public static const §_-L2s§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #000000;","}",".bold {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".red {","color: #FF0000;","font-size: 13px;","}",".green {","color: #26A30A;","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-G17§:§_-32t§ = new §_-32t§(160);
      
      private var §_-p2E§:§_-Fk§;
      
      public function §_-l4§()
      {
         super(gls("Частные районы для клана"));
         this.init();
      }
      
      override public function show() : void
      {
         var _loc1_:Location = null;
         this.§_-G17§.removeAll();
         for each(_loc1_ in §_-at§.list)
         {
            if(!(_loc1_.level > §_-LZ§.§_-mA§ || !_loc1_.game))
            {
               this.§_-G17§.addItem({
                  "label":_loc1_.name,
                  "value":_loc1_.id
               });
            }
         }
         super.show();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-aD§);
         this.§_-p2E§ = new §_-Fk§(gls("Клан заблокирован"),gls("Ты не можешь купить комнату,\nт.к. твой клан заблокирован."));
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(15524553);
         _loc1_.graphics.drawRoundRectComplex(5,45,415,75,7.5,7.5,7.5,7.5);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("<body><span class = \'bold\'>Частные районы</span> для клана доступны всем его участникам.\nПокупать районы за деньги клана может вождь и Опора.</body>"),0,2,this.style);
         _loc2_.x = int((_loc1_.width - _loc2_.width) * 0.5) + 5;
         addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§(gls("<body>Стоимость частного района <span class = \'bold\'>{0}</span> #Co . Время жизни: <span class = \'bold\'>1 сутки</span></body>);",§_-L2s§),15,57,this.style);
         addChild(_loc3_);
         §_-K1Y§.§_-P2W§(_loc3_,"#Co",ImageIconCoins,0.6,0.6,-_loc3_.x,-_loc3_.y,true);
         var _loc4_:§_-i5§ = new §_-i5§(gls("<body>Территория:</body>"),15,88,this.style);
         addChild(_loc4_);
         this.§_-G17§.x = 105;
         this.§_-G17§.y = 86;
         addChild(this.§_-G17§);
         var _loc5_:§_-K2G§ = new §_-K2G§(gls("Купить"));
         _loc5_.x = 290;
         _loc5_.y = 83;
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-l2Q§);
         addChild(_loc5_);
         place();
         this.height += 45;
      }
      
      private function §_-l2Q§(param1:MouseEvent) : void
      {
         if(!this.§_-G17§.§_-E2v§)
         {
            return;
         }
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).state == §_-s2l§.§_-F2E§)
         {
            this.§_-p2E§.show();
            return;
         }
         if(§_-at§.§_-13l§(this.§_-G17§.§_-E2v§["value"]).§_-nY§)
         {
            new §_-A31§(this.§_-G17§.§_-E2v§["value"]).show();
            return;
         }
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).coins < §_-L2s§ && (Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§))
         {
            new §_-hC§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки частного района.\nПополните бюджет вашего клана.")).show();
            return;
         }
         if(Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§)
         {
            Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-Y2X§,§_-L2s§,0,this.§_-G17§.§_-E2v§["value"] << 8);
         }
         else
         {
            Game.buy(§_-u1O§.§_-Y2X§,§_-L2s§,0,this.§_-G17§.§_-E2v§["value"] << 8);
         }
         this.hide();
      }
   }
}

