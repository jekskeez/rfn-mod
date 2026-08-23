package §_-xm§
{
   import §_-I10§.§_-d2x§;
   import §_-Kr§.§_-h1x§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   
   public class §_-93l§ extends Dialog
   {
      
      public static const §_-hI§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #000000;","}",".bold {","font-weight: bold;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".red {","color: #FF0000;","font-size: 13px;","}",".green {","color: #26A30A;","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-f1Y§:§_-h1x§ = new §_-h1x§(160);
      
      private var §_-837§:§_-Q13§;
      
      public function §_-93l§()
      {
         super(gls("Частные районы для клана"));
         this.init();
      }
      
      override public function show() : void
      {
         var _loc1_:Location = null;
         this.§_-f1Y§.removeAll();
         for each(_loc1_ in §_-q1p§.list)
         {
            if(!(_loc1_.level > §_-d2x§.§_-z2o§ || !_loc1_.game))
            {
               this.§_-f1Y§.addItem({
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
         this.style.parseCSS(§_-I2U§);
         this.§_-837§ = new §_-Q13§(gls("Клан заблокирован"),gls("Ты не можешь купить комнату,\nт.к. твой клан заблокирован."));
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(15524553);
         _loc1_.graphics.drawRoundRectComplex(5,45,415,75,7.5,7.5,7.5,7.5);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("<body><span class = \'bold\'>Частные районы</span> для клана доступны всем его участникам.\nПокупать районы за деньги клана может вождь и Опора.</body>"),0,2,this.style);
         _loc2_.x = int((_loc1_.width - _loc2_.width) * 0.5) + 5;
         addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§(gls("<body>Стоимость частного района <span class = \'bold\'>{0}</span> #Co . Время жизни: <span class = \'bold\'>1 сутки</span></body>);",§_-hI§),15,57,this.style);
         addChild(_loc3_);
         §_-jB§.§_-fG§(_loc3_,"#Co",ImageIconCoins,0.6,0.6,-_loc3_.x,-_loc3_.y,true);
         var _loc4_:§_-22V§ = new §_-22V§(gls("<body>Территория:</body>"),15,88,this.style);
         addChild(_loc4_);
         this.§_-f1Y§.x = 105;
         this.§_-f1Y§.y = 86;
         addChild(this.§_-f1Y§);
         var _loc5_:§_-j18§ = new §_-j18§(gls("Купить"));
         _loc5_.x = 290;
         _loc5_.y = 83;
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-a8§);
         addChild(_loc5_);
         place();
         this.height += 45;
      }
      
      private function §_-a8§(param1:MouseEvent) : void
      {
         if(!this.§_-f1Y§.§_-l1§)
         {
            return;
         }
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).state == §_-S2I§.§_-F2Q§)
         {
            this.§_-837§.show();
            return;
         }
         if(§_-q1p§.§_-l29§(this.§_-f1Y§.§_-l1§["value"]).§_-L1j§)
         {
            new §_-mD§(this.§_-f1Y§.§_-l1§["value"]).show();
            return;
         }
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).coins < §_-hI§ && (Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§))
         {
            new §_-53k§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки частного района.\nПополните бюджет вашего клана.")).show();
            return;
         }
         if(Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§)
         {
            Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-w2e§,§_-hI§,0,this.§_-f1Y§.§_-l1§["value"] << 8);
         }
         else
         {
            Game.buy(§_-h2B§.§_-w2e§,§_-hI§,0,this.§_-f1Y§.§_-l1§["value"] << 8);
         }
         this.hide();
      }
   }
}

