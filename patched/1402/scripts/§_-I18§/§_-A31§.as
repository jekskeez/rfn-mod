package §_-I18§
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import buttons.§_-K2G§;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-L2J§;
   
   public class §_-A31§ extends Dialog
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #000000;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-X2Z§:Array = [];
      
      private var §_-AK§:§_-Fk§;
      
      private var locationId:int;
      
      public function §_-A31§(param1:int)
      {
         super(gls("Выбор режима"));
         this.locationId = param1;
         this.init();
      }
      
      private function init() : void
      {
         var _loc3_:int = 0;
         var _loc4_:§_-K2G§ = null;
         var _loc5_:CheckBox = null;
         this.style.parseCSS(§_-aD§);
         var _loc1_:§_-i5§ = new §_-i5§(gls("<body>Выбери режимы, доступные\nдля частного района:</body>"),0,0,this.style);
         _loc1_.x = 20;
         _loc1_.y = 15;
         addChild(_loc1_);
         var _loc2_:Array = §_-at§.§_-13l§(this.locationId).modes;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ != §_-at§.§_-F15§)
            {
               _loc5_ = new CheckBox();
               §_-L2J§.§_-61Q§(_loc5_);
               _loc5_.selected = true;
               _loc5_.x = 20;
               _loc5_.y = 55 + 23 * this.§_-X2Z§.length;
               _loc5_.name = String(_loc3_);
               _loc5_.label = §_-at§.§_-02X§[_loc3_].name;
               _loc5_.width = 400;
               addChild(_loc5_);
               this.§_-X2Z§.push(_loc5_);
            }
         }
         _loc4_ = new §_-K2G§(gls("Купить"));
         _loc4_.x = 75;
         _loc4_.y = 30 + this.§_-X2Z§[this.§_-X2Z§.length - 1].y;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-l2Q§);
         addChild(_loc4_);
         place();
         this.width += 40;
         this.height += 15;
      }
      
      private function §_-l2Q§(param1:MouseEvent) : void
      {
         var _loc3_:CheckBox = null;
         var _loc4_:uint = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-X2Z§)
         {
            if(_loc3_.selected)
            {
               _loc4_ = uint(1 << int(_loc3_.name));
               _loc2_ |= _loc4_;
            }
         }
         if(_loc2_ == 0)
         {
            if(!this.§_-AK§)
            {
               this.§_-AK§ = new §_-Fk§(gls("Выбор режима"),gls("Для того, чтобы купить частный район,\nнеобходимо выбрать хотя бы один режим."));
            }
            this.§_-AK§.show();
            return;
         }
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).coins < §_-l4§.§_-L2s§ && (Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§))
         {
            new §_-hC§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки частного района.\nПополните бюджет вашего клана.")).show();
            return;
         }
         if(Game.self["clan_duty"] == Clan.§_-01X§ || Game.self["clan_duty"] == Clan.§_-HJ§)
         {
            Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-Y2X§,§_-l4§.§_-L2s§,0,this.locationId << 8,_loc2_);
         }
         else
         {
            Game.buy(§_-u1O§.§_-Y2X§,§_-l4§.§_-L2s§,0,this.locationId << 8,_loc2_);
         }
         if(Boolean(this.§_-AK§) && this.§_-AK§.visible)
         {
            this.§_-AK§.hide();
         }
         hide();
      }
   }
}

