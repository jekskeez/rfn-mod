package §_-e1G§
{
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-e1z§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.text.StyleSheet;
   
   public class §_-F1u§ extends §_-Hb§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","}"].join("\n");
      
      private var text:§_-22V§;
      
      private var §_-12r§:DisplayObject;
      
      private var §_-mV§:DisplayObject;
      
      private var §_-xS§:DisplayObject;
      
      private var §_-kf§:DisplayObject;
      
      public function §_-F1u§(param1:DisplayObject)
      {
         super(param1);
         this.init();
         §_-d2x§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-EK§);
         §_-Z1F§.addEventListener(Event.CHANGE,this.§_-I9§);
         §_-Z1F§.addEventListener(GameEvent.ENERGY_CHANGED,this.§_-EK§);
         §_-Z1F§.addEventListener(GameEvent.MANA_CHANGED,this.§_-EK§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.text = new §_-22V§("",12,2,_loc1_);
         addChild(this.text);
         this.§_-12r§ = new ImageIconEnergy();
         this.§_-12r§.scaleX = this.§_-12r§.scaleY = 0.55;
         this.§_-12r§.x = 4;
         this.§_-12r§.y = 5;
         addChild(this.§_-12r§);
         this.§_-mV§ = new ImageIconMana();
         this.§_-mV§.scaleX = this.§_-mV§.scaleY = 0.55;
         this.§_-mV§.x = 1;
         this.§_-mV§.y = this.§_-12r§.y + this.§_-12r§.height;
         addChild(this.§_-mV§);
         this.§_-xS§ = new ImageIconVIP();
         this.§_-xS§.scaleX = this.§_-xS§.scaleY = 0.55;
         this.§_-xS§.x = 2;
         this.§_-xS§.y = this.§_-mV§.y + this.§_-mV§.height + 1;
         addChild(this.§_-xS§);
         this.§_-kf§ = new ImageIconExp();
         this.§_-kf§.scaleX = this.§_-kf§.scaleY = 0.55;
         addChild(this.§_-kf§);
         this.§_-EK§();
         draw();
      }
      
      private function §_-I9§(param1:Event = null) : void
      {
         this.§_-EK§();
      }
      
      private function §_-EK§(param1:GameEvent = null) : void
      {
         var _loc2_:uint = uint(§_-d2x§.§_-e9§);
         var _loc3_:String = gls("Энергия: <b>{0}/{1}</b>",§_-Z1F§.§_-U1f§,§_-Z1F§.§_-u1t§);
         var _loc4_:String = gls("\nМана: <b>{0}/{1}</b>",§_-Z1F§.§_-bc§,§_-Z1F§.§_-t2P§);
         if(§_-e1z§.§_-Lq§(§_-e1z§.§_-02l§))
         {
            if(!§_-Z1F§.§_-Lm§)
            {
               _loc4_ += ", " + gls("<b>+{0}</b> маны через <b>{1}</b>",25,§_-e1z§.§_-a1h§);
            }
            else
            {
               _loc4_ += ", " + gls("у тебя полная мана.");
            }
            _loc4_ += "\n" + gls("Зелье Могущества действует ещё <b>{0}</b>",§_-e1z§.§_-7v§(§_-e1z§.§_-02l§));
         }
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc7_:String = "\n" + (_loc2_ == 0 ? gls("<body>Ты достиг максимального уровня</body>") : gls("<body>До следующего уровня:  <b>{0}</b> опыта</body>",_loc2_));
         if(!§_-Z1F§.§_-2h§)
         {
            _loc3_ += gls(", <b>+{0}</b> {1} через: <b>{2}</b>",§_-Br§.§_-f2k§ ? 2 : 1,§_-Br§.§_-f2k§ ? gls("энергии") : gls("энергия"),§_-Z1F§.§_-M1D§);
         }
         this.§_-xS§.visible = §_-Br§.§_-f2k§;
         this.§_-xS§.y = this.§_-mV§.y + this.§_-mV§.height + (§_-e1z§.§_-Lq§(§_-e1z§.§_-02l§) ? 16 : 1);
         this.§_-kf§.y = this.§_-xS§.y + (this.§_-xS§.visible ? this.§_-xS§.height + 2 : -1);
         if(§_-Br§.§_-f2k§)
         {
            _loc5_ += gls("\nVIP-статус действует ещё <b> {0}</b>",§_-Br§.§_-M1D§);
         }
         this.text.htmlText = "<body>" + _loc3_ + _loc4_ + _loc5_ + _loc6_ + _loc7_ + "</body>";
         draw();
      }
   }
}

