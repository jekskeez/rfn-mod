package §_-63u§
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-W1e§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.§_-jB§;
   import utils.§_-nO§;
   
   public class §_-d1V§ extends §_-31r§
   {
      
      public static const §_-O2p§:int = 0;
      
      public static const §_-U1C§:int = 1;
      
      public static const §_-h25§:int = 2;
      
      public static const §_-aU§:int = 3;
      
      public static const §_-Me§:int = 4;
      
      private static const §_-i16§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,8280118,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #7E5836;","text-align: center;","}"].join("\n");
      
      private const §_-Th§:Array;
      
      private var §_-13y§:Sprite = null;
      
      private var §_-D8§:§_-j18§ = null;
      
      private var §_-xa§:§_-j18§ = null;
      
      private var state:int = 0;
      
      private var §_-43n§:DialogVIPPart1 = null;
      
      private var §_-q1P§:Sprite = null;
      
      private var §_-Xl§:§_-22V§ = null;
      
      private var §_-RX§:Shape = null;
      
      private var §_-Ls§:Boolean = false;
      
      public function §_-d1V§()
      {
         this.§_-Th§ = [{
            "text":"<body>" + gls("Ты еще очень молодая белка, поэтому Шаман предлагает воскресить тебя!") + "</body>",
            "function":this.§_-p1U§
         },{
            "text":"<body>" + gls("Ты приобрёл VIP-статус, и теперь тебе доступно бесплатное воскрешение.") + "</body>",
            "function":this.§_-b1K§
         },{
            "text":"<body>" + gls("На испытаниях тебе доступно одно бесплатное воскрешение.") + "</body>",
            "function":this.§_-s2d§
         },{"text":"<body>" + gls("Купи <b>VIP-статус</b> на сутки и получи:") + "</body>"},{"text":"<body>" + gls("Воспользуйся магией воскрешения!") + "</body>"}];
         super(MovieEndRoundDeath);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = -150;
         this.§_-4n§ = 0;
         this.topOffset = -90;
         this.§_-JZ§ = 0;
      }
      
      override public function show() : void
      {
         setTimeout(function():void
         {
            GameSounds.play("dialog_death");
         },1100);
         super.show();
      }
      
      override protected function init(param1:Class) : void
      {
         super.init(param1);
         this.§_-13y§ = new Sprite();
         this.§_-13y§.x = 0;
         this.§_-13y§.y = 125;
         addChild(this.§_-13y§);
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-I2U§);
         this.§_-D8§ = new §_-j18§(gls("Воскреснуть"),132,16,this.§_-Z2z§);
         this.§_-D8§.x = 210;
         this.§_-D8§.y = 45;
         new §_-Hb§(this.§_-D8§,gls("Воскреснуть бесплатно!"));
         this.§_-13y§.addChild(this.§_-D8§);
         this.§_-xa§ = new §_-j18§(gls("Купить VIP за {0}   -",§_-8S§.§_-7h§(§_-Br§.§_-F2a§)),185,16,this.§_-j24§);
         this.§_-xa§.x = 15;
         this.§_-xa§.y = 45;
         new §_-Hb§(this.§_-xa§,gls("Купить VIP статус"));
         this.§_-13y§.addChild(this.§_-xa§);
         §_-jB§.§_-fG§(this.§_-xa§.field,"-",ImageIconCoins,0.7,0.7,-this.§_-xa§.field.x + 5,-3,false,false);
         this.§_-RX§ = new Shape();
         this.§_-RX§.graphics.lineStyle(2,11509389,1,false);
         this.§_-RX§.graphics.moveTo(0,0);
         this.§_-RX§.graphics.lineTo(339,0);
         this.§_-RX§.y = 82;
         this.§_-RX§.x = 11;
         this.§_-13y§.addChild(this.§_-RX§);
         this.§_-Xl§ = new §_-22V§("",43,-75,_loc2_,270);
         this.§_-Xl§.x = (this.§_-13y§.width - this.§_-Xl§.width) * 0.5;
         this.§_-13y§.addChild(this.§_-Xl§);
         this.§_-q1P§ = new Sprite();
         this.§_-13y§.addChild(this.§_-q1P§);
         this.§_-43n§ = new DialogVIPPart1();
         this.§_-43n§.x = 39;
         this.§_-43n§.y = -52;
         this.§_-q1P§.addChild(this.§_-43n§);
         var _loc3_:§_-22V§ = new §_-22V§("",48,20,_loc2_,270);
         _loc3_.htmlText = "<body>" + gls("и многое другое") + "</body>";
         this.§_-q1P§.addChild(_loc3_);
         _loc3_ = new §_-22V§(gls("Одно бесплатное воскрешение на раунде"),95,-52,§_-i16§);
         _loc3_.wordWrap = true;
         _loc3_.width = 230;
         this.§_-q1P§.addChild(_loc3_);
         _loc3_ = new §_-22V§(gls("Макс. энергия 300\nВосполнение 2 эн./мин."),95,-15,§_-i16§);
         _loc3_.wordWrap = true;
         _loc3_.width = 230;
         this.§_-q1P§.addChild(_loc3_);
         this.§_-h1X§.text = gls("твоя белочка погибла");
         this.§_-J2C§.text = gls("Но ты можешь воскреснуть!");
         var _loc4_:§_-nO§ = new §_-nO§();
         _loc4_.§_-bb§(-44,-3,-81,-94);
         this.§_-b2s§.filters = [new ColorMatrixFilter(_loc4_)];
         §_-Br§.addEventListener(GameEvent.CHANGED,this.§_-32s§);
         this.§_-32s§(null);
         this.setBgHeight = 323;
      }
      
      override protected function set setBgHeight(param1:int) : void
      {
         super.setBgHeight = param1;
         if(this.§_-RX§)
         {
            this.§_-RX§.y = param1 - 242;
         }
         if(Boolean(this.§_-D8§) && Boolean(this.§_-xa§))
         {
            this.§_-D8§.y = this.§_-xa§.y = param1 - 279;
         }
      }
      
      private function §_-32s§(param1:GameEvent = null) : void
      {
         this.§_-xa§.visible = !§_-Br§.§_-f2k§;
         this.§_-D8§.visible = this.state != 4;
         this.§_-D8§.x = §_-Br§.§_-f2k§ ? (§_-31r§.WIDTH - this.§_-D8§.width) * 0.5 : 210;
         this.§_-wW§ = this.state != 3 && !this.§_-Ls§;
         this.§_-Xl§.htmlText = this.§_-Th§[this.state]["text"];
      }
      
      public function set §_-wW§(param1:Boolean) : void
      {
         this.§_-D8§.enabled = param1;
      }
      
      public function update(param1:int) : void
      {
         this.state = param1;
         this.§_-32s§();
         this.topOffset = this.state != §_-aU§ ? -90 : -128;
         this.setBgHeight = this.state == §_-aU§ ? 323 : 280;
         this.§_-q1P§.visible = this.state == §_-aU§;
      }
      
      private function §_-Z2z§(param1:MouseEvent) : void
      {
         var _loc2_:Function = this.§_-Th§[this.state]["function"];
         if(_loc2_ != null)
         {
            _loc2_();
         }
      }
      
      private function §_-p1U§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-AM§);
      }
      
      private function §_-b1K§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-7E§);
      }
      
      private function §_-s2d§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-67§);
      }
      
      private function §_-j24§(param1:MouseEvent = null) : void
      {
         §_-W1e§.used(§_-W1e§.§_-l1l§);
         if(§_-Br§.buy(§_-Br§.§_-F2a§))
         {
            §_-Br§.§_-K2q§ = true;
         }
      }
      
      public function set §_-hU§(param1:Boolean) : void
      {
         this.§_-Ls§ = param1;
         this.§_-32s§();
      }
   }
}

