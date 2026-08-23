package §_-e1G§
{
   import §_-I10§.§_-Br§;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.text.StyleSheet;
   import flash.utils.Timer;
   
   public class §_-ie§ extends §_-Hb§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","}"].join("\n");
      
      private var §_-z1Y§:int;
      
      private var timer:Timer = new Timer(1000);
      
      private var text:§_-22V§;
      
      private var §_-X1I§:DisplayObject;
      
      private var §_-kf§:DisplayObject;
      
      public function §_-ie§(param1:DisplayObject)
      {
         super(param1);
         this.init();
      }
      
      public function §_-O2§(param1:int) : void
      {
         this.§_-z1Y§ = param1;
         this.§_-EK§();
      }
      
      public function §_-EK§() : void
      {
         var _loc1_:String = "";
         var _loc2_:String = this.§_-z1Y§ < 0 ? gls("    Ты достиг максимального уровня.") : gls("    До следующего уровня:  <b>{0}</b> опыта.",this.§_-z1Y§);
         this.§_-X1I§.visible = §_-Br§.§_-f2k§;
         this.§_-X1I§.y = this.§_-X1I§.visible ? 23 : 0;
         if(this.§_-X1I§.visible)
         {
            _loc1_ += gls("\n    VIP-статус действует<br/>    ещё <B> {0}</B>.",§_-Br§.§_-M1D§);
            if(!this.timer.running)
            {
               this.§_-y9§();
            }
         }
         else if(this.timer.running)
         {
            this.timer.stop();
         }
         _loc1_ += gls("\n\nШаман получает опыт за каждую белку, которой\nпомог добраться до дупла. Уровень шамана\nповышается, когда он наберёт достаточное\nколичество очков опыта.");
         this.text.htmlText = "<body>" + _loc2_ + _loc1_ + "</body>";
         draw();
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.text = new §_-22V§("",2,2,_loc1_);
         addChild(this.text);
         this.§_-kf§ = new ImageIconShamanExp();
         this.§_-kf§.scaleX = this.§_-kf§.scaleY = 0.6;
         this.§_-kf§.x = 1;
         this.§_-kf§.y = 3;
         addChild(this.§_-kf§);
         this.§_-X1I§ = new ImageIconVIP();
         this.§_-X1I§.scaleX = this.§_-X1I§.scaleY = 0.6;
         this.§_-X1I§.x = 4;
         this.§_-X1I§.y = 25;
         addChild(this.§_-X1I§);
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-D1F§);
         this.§_-EK§();
         draw();
      }
      
      private function §_-D1F§(param1:TimerEvent = null) : void
      {
         this.§_-EK§();
      }
      
      private function §_-y9§() : void
      {
         this.timer.reset();
         this.timer.start();
      }
   }
}

