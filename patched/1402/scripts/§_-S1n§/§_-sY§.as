package §_-S1n§
{
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-ku§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.text.StyleSheet;
   
   public class §_-sY§ extends §_-kr§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","}"].join("\n");
      
      private var text:§_-i5§;
      
      private var §_-Lj§:DisplayObject;
      
      private var §_-F1N§:DisplayObject;
      
      private var §_-Vc§:DisplayObject;
      
      private var §_-Q2B§:DisplayObject;
      
      public function §_-sY§(param1:DisplayObject)
      {
         super(param1);
         this.init();
         §_-LZ§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-Vj§);
         §_-hO§.addEventListener(Event.CHANGE,this.§_-L23§);
         §_-hO§.addEventListener(GameEvent.ENERGY_CHANGED,this.§_-Vj§);
         §_-hO§.addEventListener(GameEvent.MANA_CHANGED,this.§_-Vj§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.text = new §_-i5§("",12,2,_loc1_);
         addChild(this.text);
         this.§_-Lj§ = new ImageIconEnergy();
         this.§_-Lj§.scaleX = this.§_-Lj§.scaleY = 0.55;
         this.§_-Lj§.x = 4;
         this.§_-Lj§.y = 5;
         addChild(this.§_-Lj§);
         this.§_-F1N§ = new ImageIconMana();
         this.§_-F1N§.scaleX = this.§_-F1N§.scaleY = 0.55;
         this.§_-F1N§.x = 1;
         this.§_-F1N§.y = this.§_-Lj§.y + this.§_-Lj§.height;
         addChild(this.§_-F1N§);
         this.§_-Vc§ = new ImageIconVIP();
         this.§_-Vc§.scaleX = this.§_-Vc§.scaleY = 0.55;
         this.§_-Vc§.x = 2;
         this.§_-Vc§.y = this.§_-F1N§.y + this.§_-F1N§.height + 1;
         addChild(this.§_-Vc§);
         this.§_-Q2B§ = new ImageIconExp();
         this.§_-Q2B§.scaleX = this.§_-Q2B§.scaleY = 0.55;
         addChild(this.§_-Q2B§);
         this.§_-Vj§();
         draw();
      }
      
      private function §_-L23§(param1:Event = null) : void
      {
         this.§_-Vj§();
      }
      
      private function §_-Vj§(param1:GameEvent = null) : void
      {
         var _loc2_:uint = uint(§_-LZ§.§_-02R§);
         var _loc3_:String = gls("Энергия: <b>{0}/{1}</b>",§_-hO§.§_-i2E§,§_-hO§.§_-g2y§);
         var _loc4_:String = gls("\nМана: <b>{0}/{1}</b>",§_-hO§.§_-Sy§,§_-hO§.§_-333§);
         if(§_-ku§.§_-R1C§(§_-ku§.§_-v2p§))
         {
            if(!§_-hO§.§_-ZC§)
            {
               _loc4_ += ", " + gls("<b>+{0}</b> маны через <b>{1}</b>",25,§_-ku§.§_-q1v§);
            }
            else
            {
               _loc4_ += ", " + gls("у тебя полная мана.");
            }
            _loc4_ += "\n" + gls("Зелье Могущества действует ещё <b>{0}</b>",§_-ku§.§_-g2V§(§_-ku§.§_-v2p§));
         }
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc7_:String = "\n" + (_loc2_ == 0 ? gls("<body>Ты достиг максимального уровня</body>") : gls("<body>До следующего уровня:  <b>{0}</b> опыта</body>",_loc2_));
         if(!§_-hO§.§_-wH§)
         {
            _loc3_ += gls(", <b>+{0}</b> {1} через: <b>{2}</b>",§_-F1Z§.§_-O1u§ ? 2 : 1,§_-F1Z§.§_-O1u§ ? gls("энергии") : gls("энергия"),§_-hO§.§_-j1x§);
         }
         this.§_-Vc§.visible = §_-F1Z§.§_-O1u§;
         this.§_-Vc§.y = this.§_-F1N§.y + this.§_-F1N§.height + (§_-ku§.§_-R1C§(§_-ku§.§_-v2p§) ? 16 : 1);
         this.§_-Q2B§.y = this.§_-Vc§.y + (this.§_-Vc§.visible ? this.§_-Vc§.height + 2 : -1);
         if(§_-F1Z§.§_-O1u§)
         {
            _loc5_ += gls("\nVIP-статус действует ещё <b> {0}</b>",§_-F1Z§.§_-j1x§);
         }
         this.text.htmlText = "<body>" + _loc3_ + _loc4_ + _loc5_ + _loc6_ + _loc7_ + "</body>";
         draw();
      }
   }
}

