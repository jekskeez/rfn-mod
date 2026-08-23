package tape
{
   import §_-S1n§.§_-kr§;
   import buttons.§_-613§;
   import events.GameEvent;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import utils.§_-72U§;
   
   public class §_-T2G§ extends §_-L2v§
   {
      
      private static const §_-I23§:int = 500;
      
      private static const §_-B21§:String = gls("Поиск");
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #FFFFFF;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}",".selected {","text-decoration: none;","color: #FFDD77;","}"].join("\n");
      
      private var §_-bW§:§_-O2t§ = null;
      
      private var §_-s§:§_-72U§ = null;
      
      private var §_-e19§:Timer = null;
      
      private var §_-O2L§:§_-i5§ = null;
      
      private var §_-V1L§:int = §_-O2t§.§_-B1w§;
      
      public function §_-T2G§()
      {
         super(5,2,200,5,5,0,128,31,false,false);
      }
      
      override protected function §_-j2y§() : void
      {
         this.§_-T1X§ = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.§_-42u§ = new §_-613§(new ButtonRewindLeftDouble(),new ButtonRewindLeftDoubleInactive());
         this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-025§ = new §_-613§(new ButtonRewindRightDouble(),new ButtonRewindRightDoubleInactive());
         this.§_-T1X§.setState(true);
         this.§_-42u§.setState(true);
         this.buttonNext.setState(true);
         this.§_-025§.setState(true);
         this.§_-T1X§.x = 10;
         this.§_-T1X§.y = 7;
         this.§_-42u§.x = 10;
         this.§_-42u§.y = 38;
         this.buttonNext.x = 862;
         this.buttonNext.y = 7;
         this.§_-025§.x = 862;
         this.§_-025§.y = 38;
         super.§_-j2y§();
         var _loc1_:FindPlayerImage = new FindPlayerImage();
         _loc1_.x = 219;
         _loc1_.y = -11;
         addChild(_loc1_);
         this.§_-s§ = new §_-72U§(§_-B21§,237,-11,57,15,new TextFormat(§_-i5§.§_-c10§,11,16777215));
         this.§_-s§.background = false;
         this.§_-s§.addEventListener(Event.CHANGE,this.§_-73x§);
         addChild(this.§_-s§);
         new §_-kr§(this.§_-s§,gls("Поиск по имени"));
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-aD§);
         this.§_-O2L§ = new §_-i5§("",300,-11,_loc2_);
         this.§_-O2L§.addEventListener(TextEvent.LINK,this.§_-R1d§);
         addChild(this.§_-O2L§);
         this.§_-8d§();
         this.§_-e19§ = new Timer(§_-I23§,1);
         this.§_-e19§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-M2w§);
         this.§_-bW§ = new §_-O2t§("",this.§_-V1L§);
         this.§_-bW§.addEventListener(GameEvent.FRIENDS_UPDATE,this.§_-1S§);
         setData(this.§_-bW§);
      }
      
      public function clear() : void
      {
         this.§_-bW§.clear();
      }
      
      private function §_-M2w§(param1:TimerEvent = null) : void
      {
         var _loc2_:String = this.§_-s§.text;
         if(_loc2_ == "" || _loc2_ == §_-B21§)
         {
            setData(this.§_-bW§);
            return;
         }
         var _loc3_:§_-O2t§ = new §_-O2t§(_loc2_,this.§_-V1L§);
         _loc3_.§_-j1a§(this.§_-bW§.§_-C2L§(_loc2_));
         setData(_loc3_);
      }
      
      private function §_-73x§(param1:Event) : void
      {
         this.§_-e19§.reset();
         this.§_-e19§.start();
      }
      
      private function §_-8d§() : void
      {
         var _loc1_:String = this.§_-V1L§ == §_-O2t§.§_-B1w§ ? gls("<span class=\'selected\'>уровню</span>") : gls("<a href=\'event:exp\'>уровню</a>");
         var _loc2_:String = this.§_-V1L§ == §_-O2t§.§_-P1y§ ? gls("<span class=\'selected\'>онлайну</span>") : gls("<a href=\'event:online\'>онлайну</a>");
         this.§_-O2L§.htmlText = gls("<body>Сортировать по {0}/{1}</body>",_loc1_,_loc2_);
      }
      
      private function §_-R1d§(param1:TextEvent) : void
      {
         this.§_-V1L§ = param1.text == "online" ? §_-O2t§.§_-P1y§ : §_-O2t§.§_-B1w§;
         this.§_-bW§.§_-11X§(this.§_-V1L§);
         this.§_-bW§.§_-U2n§();
         this.§_-8d§();
         this.§_-M2w§();
      }
      
      private function §_-1S§(param1:GameEvent) : void
      {
         this.§_-bW§.§_-s2G§.x = 41;
         this.§_-bW§.§_-s2G§.y = 7;
         addChild(this.§_-bW§.§_-s2G§);
      }
   }
}

