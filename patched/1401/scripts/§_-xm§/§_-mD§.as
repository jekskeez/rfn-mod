package §_-xm§
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-j18§;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-vo§;
   
   public class §_-mD§ extends Dialog
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #000000;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-c1V§:Array = [];
      
      private var §_-H9§:§_-Q13§;
      
      private var locationId:int;
      
      public function §_-mD§(param1:int)
      {
         super(gls("Выбор режима"));
         this.locationId = param1;
         this.init();
      }
      
      private function init() : void
      {
         var _loc3_:int = 0;
         var _loc4_:§_-j18§ = null;
         var _loc5_:CheckBox = null;
         this.style.parseCSS(§_-I2U§);
         var _loc1_:§_-22V§ = new §_-22V§(gls("<body>Выбери режимы, доступные\nдля частного района:</body>"),0,0,this.style);
         _loc1_.x = 20;
         _loc1_.y = 15;
         addChild(_loc1_);
         var _loc2_:Array = §_-q1p§.§_-l29§(this.locationId).modes;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ != §_-q1p§.§_-w1Y§)
            {
               _loc5_ = new CheckBox();
               §_-vo§.§_-l1V§(_loc5_);
               _loc5_.selected = true;
               _loc5_.x = 20;
               _loc5_.y = 55 + 23 * this.§_-c1V§.length;
               _loc5_.name = String(_loc3_);
               _loc5_.label = §_-q1p§.§_-m15§[_loc3_].name;
               _loc5_.width = 400;
               addChild(_loc5_);
               this.§_-c1V§.push(_loc5_);
            }
         }
         _loc4_ = new §_-j18§(gls("Купить"));
         _loc4_.x = 75;
         _loc4_.y = 30 + this.§_-c1V§[this.§_-c1V§.length - 1].y;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-a8§);
         addChild(_loc4_);
         place();
         this.width += 40;
         this.height += 15;
      }
      
      private function §_-a8§(param1:MouseEvent) : void
      {
         var _loc3_:CheckBox = null;
         var _loc4_:uint = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-c1V§)
         {
            if(_loc3_.selected)
            {
               _loc4_ = uint(1 << int(_loc3_.name));
               _loc2_ |= _loc4_;
            }
         }
         if(_loc2_ == 0)
         {
            if(!this.§_-H9§)
            {
               this.§_-H9§ = new §_-Q13§(gls("Выбор режима"),gls("Для того, чтобы купить частный район,\nнеобходимо выбрать хотя бы один режим."));
            }
            this.§_-H9§.show();
            return;
         }
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).coins < §_-93l§.§_-hI§ && (Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§))
         {
            new §_-53k§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки частного района.\nПополните бюджет вашего клана.")).show();
            return;
         }
         if(Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§)
         {
            Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-w2e§,§_-93l§.§_-hI§,0,this.locationId << 8,_loc2_);
         }
         else
         {
            Game.buy(§_-h2B§.§_-w2e§,§_-93l§.§_-hI§,0,this.locationId << 8,_loc2_);
         }
         if(Boolean(this.§_-H9§) && this.§_-H9§.visible)
         {
            this.§_-H9§.hide();
         }
         hide();
      }
   }
}

