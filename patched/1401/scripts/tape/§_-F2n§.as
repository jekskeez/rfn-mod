package tape
{
   import §_-e1G§.§_-Hb§;
   import buttons.§_-wc§;
   import events.GameEvent;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import utils.§_-w2j§;
   
   public class §_-F2n§ extends §_-3l§
   {
      
      private static const §_-R1q§:int = 500;
      
      private static const §_-03C§:String = gls("Поиск");
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #FFFFFF;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".selected {","text-decoration: none;","color: #FFDD77;","}"].join("\n");
      
      private var §_-VT§:§_-M1Z§ = null;
      
      private var §_-J1y§:§_-w2j§ = null;
      
      private var §_-v1W§:Timer = null;
      
      private var §_-q2f§:§_-22V§ = null;
      
      private var §_-Q23§:int = §_-M1Z§.§_-s1u§;
      
      public function §_-F2n§()
      {
         super(5,2,200,5,5,0,128,31,false,false);
      }
      
      override protected function §_-bX§() : void
      {
         this.§_-Z2B§ = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.§_-F1m§ = new §_-wc§(new ButtonRewindLeftDouble(),new ButtonRewindLeftDoubleInactive());
         this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-s19§ = new §_-wc§(new ButtonRewindRightDouble(),new ButtonRewindRightDoubleInactive());
         this.§_-Z2B§.setState(true);
         this.§_-F1m§.setState(true);
         this.buttonNext.setState(true);
         this.§_-s19§.setState(true);
         this.§_-Z2B§.x = 10;
         this.§_-Z2B§.y = 7;
         this.§_-F1m§.x = 10;
         this.§_-F1m§.y = 38;
         this.buttonNext.x = 862;
         this.buttonNext.y = 7;
         this.§_-s19§.x = 862;
         this.§_-s19§.y = 38;
         super.§_-bX§();
         var _loc1_:FindPlayerImage = new FindPlayerImage();
         _loc1_.x = 219;
         _loc1_.y = -11;
         addChild(_loc1_);
         this.§_-J1y§ = new §_-w2j§(§_-03C§,237,-11,57,15,new TextFormat(§_-22V§.§_-F2z§,11,16777215));
         this.§_-J1y§.background = false;
         this.§_-J1y§.addEventListener(Event.CHANGE,this.§_-z1M§);
         addChild(this.§_-J1y§);
         new §_-Hb§(this.§_-J1y§,gls("Поиск по имени"));
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-I2U§);
         this.§_-q2f§ = new §_-22V§("",300,-11,_loc2_);
         this.§_-q2f§.addEventListener(TextEvent.LINK,this.§_-L2P§);
         addChild(this.§_-q2f§);
         this.§_-L2O§();
         this.§_-v1W§ = new Timer(§_-R1q§,1);
         this.§_-v1W§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-w1v§);
         this.§_-VT§ = new §_-M1Z§("",this.§_-Q23§);
         this.§_-VT§.addEventListener(GameEvent.FRIENDS_UPDATE,this.§_-h1E§);
         setData(this.§_-VT§);
      }
      
      public function clear() : void
      {
         this.§_-VT§.clear();
      }
      
      private function §_-w1v§(param1:TimerEvent = null) : void
      {
         var _loc2_:String = this.§_-J1y§.text;
         if(_loc2_ == "" || _loc2_ == §_-03C§)
         {
            setData(this.§_-VT§);
            return;
         }
         var _loc3_:§_-M1Z§ = new §_-M1Z§(_loc2_,this.§_-Q23§);
         _loc3_.§_-U1w§(this.§_-VT§.§_-I1b§(_loc2_));
         setData(_loc3_);
      }
      
      private function §_-z1M§(param1:Event) : void
      {
         this.§_-v1W§.reset();
         this.§_-v1W§.start();
      }
      
      private function §_-L2O§() : void
      {
         var _loc1_:String = this.§_-Q23§ == §_-M1Z§.§_-s1u§ ? gls("<span class=\'selected\'>уровню</span>") : gls("<a href=\'event:exp\'>уровню</a>");
         var _loc2_:String = this.§_-Q23§ == §_-M1Z§.§_-135§ ? gls("<span class=\'selected\'>онлайну</span>") : gls("<a href=\'event:online\'>онлайну</a>");
         this.§_-q2f§.htmlText = gls("<body>Сортировать по {0}/{1}</body>",_loc1_,_loc2_);
      }
      
      private function §_-L2P§(param1:TextEvent) : void
      {
         this.§_-Q23§ = param1.text == "online" ? §_-M1Z§.§_-135§ : §_-M1Z§.§_-s1u§;
         this.§_-VT§.§_-z1G§(this.§_-Q23§);
         this.§_-VT§.§_-i5§();
         this.§_-L2O§();
         this.§_-w1v§();
      }
      
      private function §_-h1E§(param1:GameEvent) : void
      {
         this.§_-VT§.§_-Ld§.x = 41;
         this.§_-VT§.§_-Ld§.y = 7;
         addChild(this.§_-VT§.§_-Ld§);
      }
   }
}

