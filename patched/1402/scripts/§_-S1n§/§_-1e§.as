package §_-S1n§
{
   import §_-X1k§.§_-F1Z§;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.text.StyleSheet;
   import flash.utils.Timer;
   
   public class §_-1e§ extends §_-kr§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","}"].join("\n");
      
      private var §_-Z27§:int;
      
      private var timer:Timer = new Timer(1000);
      
      private var text:§_-i5§;
      
      private var §_-Hz§:DisplayObject;
      
      private var §_-Q2B§:DisplayObject;
      
      public function §_-1e§(param1:DisplayObject)
      {
         super(param1);
         this.init();
      }
      
      public function §_-Y26§(param1:int) : void
      {
         this.§_-Z27§ = param1;
         this.§_-Vj§();
      }
      
      public function §_-Vj§() : void
      {
         var _loc1_:String = "";
         var _loc2_:String = this.§_-Z27§ < 0 ? gls("    Ты достиг максимального уровня.") : gls("    До следующего уровня:  <b>{0}</b> опыта.",this.§_-Z27§);
         this.§_-Hz§.visible = §_-F1Z§.§_-O1u§;
         this.§_-Hz§.y = this.§_-Hz§.visible ? 23 : 0;
         if(this.§_-Hz§.visible)
         {
            _loc1_ += gls("\n    VIP-статус действует<br/>    ещё <B> {0}</B>.",§_-F1Z§.§_-j1x§);
            if(!this.timer.running)
            {
               this.§_-u2J§();
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
         _loc1_.parseCSS(§_-aD§);
         this.text = new §_-i5§("",2,2,_loc1_);
         addChild(this.text);
         this.§_-Q2B§ = new ImageIconShamanExp();
         this.§_-Q2B§.scaleX = this.§_-Q2B§.scaleY = 0.6;
         this.§_-Q2B§.x = 1;
         this.§_-Q2B§.y = 3;
         addChild(this.§_-Q2B§);
         this.§_-Hz§ = new ImageIconVIP();
         this.§_-Hz§.scaleX = this.§_-Hz§.scaleY = 0.6;
         this.§_-Hz§.x = 4;
         this.§_-Hz§.y = 25;
         addChild(this.§_-Hz§);
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-r28§);
         this.§_-Vj§();
         draw();
      }
      
      private function §_-r28§(param1:TimerEvent = null) : void
      {
         this.§_-Vj§();
      }
      
      private function §_-u2J§() : void
      {
         this.timer.reset();
         this.timer.start();
      }
   }
}

