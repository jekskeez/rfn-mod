package §_-a1J§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-N10§;
   import buttons.§_-K2G§;
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
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import utils.§_-K1Y§;
   import utils.§_-p1r§;
   
   public class §_-S2r§ extends §_-M2N§
   {
      
      public static const §_-Mn§:int = 0;
      
      public static const §_-r1T§:int = 1;
      
      public static const §_-do§:int = 2;
      
      public static const §_-v2F§:int = 3;
      
      public static const §_-rH§:int = 4;
      
      private static const §_-91b§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,8280118,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #7E5836;","text-align: center;","}"].join("\n");
      
      private const §_-z1c§:Array;
      
      private var §_-u1g§:Sprite = null;
      
      private var §_-Y1w§:§_-K2G§ = null;
      
      private var §_-J1j§:§_-K2G§ = null;
      
      private var state:int = 0;
      
      private var §_-kp§:DialogVIPPart1 = null;
      
      private var §_-t6§:Sprite = null;
      
      private var §_-41r§:§_-i5§ = null;
      
      private var §_-f21§:Shape = null;
      
      private var §_-72a§:Boolean = false;
      
      public function §_-S2r§()
      {
         this.§_-z1c§ = [{
            "text":"<body>" + gls("Ты еще очень молодая белка, поэтому Шаман предлагает воскресить тебя!") + "</body>",
            "function":this.§_-M1D§
         },{
            "text":"<body>" + gls("Ты приобрёл VIP-статус, и теперь тебе доступно бесплатное воскрешение.") + "</body>",
            "function":this.§_-u2e§
         },{
            "text":"<body>" + gls("На испытаниях тебе доступно одно бесплатное воскрешение.") + "</body>",
            "function":this.§_-v2A§
         },{"text":"<body>" + gls("Купи <b>VIP-статус</b> на сутки и получи:") + "</body>"},{"text":"<body>" + gls("Воспользуйся магией воскрешения!") + "</body>"}];
         super(MovieEndRoundDeath);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = -150;
         this.§_-7N§ = 0;
         this.topOffset = -90;
         this.§_-f2d§ = 0;
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
         this.§_-u1g§ = new Sprite();
         this.§_-u1g§.x = 0;
         this.§_-u1g§.y = 125;
         addChild(this.§_-u1g§);
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-aD§);
         this.§_-Y1w§ = new §_-K2G§(gls("Воскреснуть"),132,16,this.§_-J1z§);
         this.§_-Y1w§.x = 210;
         this.§_-Y1w§.y = 45;
         new §_-kr§(this.§_-Y1w§,gls("Воскреснуть бесплатно!"));
         this.§_-u1g§.addChild(this.§_-Y1w§);
         this.§_-J1j§ = new §_-K2G§(gls("Купить VIP за {0}   -",§_-93H§.§_-z1K§(§_-F1Z§.§_-43p§)),185,16,this.§_-G1Q§);
         this.§_-J1j§.x = 15;
         this.§_-J1j§.y = 45;
         new §_-kr§(this.§_-J1j§,gls("Купить VIP статус"));
         this.§_-u1g§.addChild(this.§_-J1j§);
         §_-K1Y§.§_-P2W§(this.§_-J1j§.field,"-",ImageIconCoins,0.7,0.7,-this.§_-J1j§.field.x + 5,-3,false,false);
         this.§_-f21§ = new Shape();
         this.§_-f21§.graphics.lineStyle(2,11509389,1,false);
         this.§_-f21§.graphics.moveTo(0,0);
         this.§_-f21§.graphics.lineTo(339,0);
         this.§_-f21§.y = 82;
         this.§_-f21§.x = 11;
         this.§_-u1g§.addChild(this.§_-f21§);
         this.§_-41r§ = new §_-i5§("",43,-75,_loc2_,270);
         this.§_-41r§.x = (this.§_-u1g§.width - this.§_-41r§.width) * 0.5;
         this.§_-u1g§.addChild(this.§_-41r§);
         this.§_-t6§ = new Sprite();
         this.§_-u1g§.addChild(this.§_-t6§);
         this.§_-kp§ = new DialogVIPPart1();
         this.§_-kp§.x = 39;
         this.§_-kp§.y = -52;
         this.§_-t6§.addChild(this.§_-kp§);
         var _loc3_:§_-i5§ = new §_-i5§("",48,20,_loc2_,270);
         _loc3_.htmlText = "<body>" + gls("и многое другое") + "</body>";
         this.§_-t6§.addChild(_loc3_);
         _loc3_ = new §_-i5§(gls("Одно бесплатное воскрешение на раунде"),95,-52,§_-91b§);
         _loc3_.wordWrap = true;
         _loc3_.width = 230;
         this.§_-t6§.addChild(_loc3_);
         _loc3_ = new §_-i5§(gls("Макс. энергия 300\nВосполнение 2 эн./мин."),95,-15,§_-91b§);
         _loc3_.wordWrap = true;
         _loc3_.width = 230;
         this.§_-t6§.addChild(_loc3_);
         this.§_-M1p§.text = gls("твоя белочка погибла");
         this.§_-22S§.text = gls("Но ты можешь воскреснуть!");
         var _loc4_:§_-p1r§ = new §_-p1r§();
         _loc4_.§_-xC§(-44,-3,-81,-94);
         this.§_-s2§.filters = [new ColorMatrixFilter(_loc4_)];
         §_-F1Z§.addEventListener(GameEvent.CHANGED,this.§_-v8§);
         this.§_-v8§(null);
         this.setBgHeight = 323;
      }
      
      override protected function set setBgHeight(param1:int) : void
      {
         super.setBgHeight = param1;
         if(this.§_-f21§)
         {
            this.§_-f21§.y = param1 - 242;
         }
         if(Boolean(this.§_-Y1w§) && Boolean(this.§_-J1j§))
         {
            this.§_-Y1w§.y = this.§_-J1j§.y = param1 - 279;
         }
      }
      
      private function §_-v8§(param1:GameEvent = null) : void
      {
         this.§_-J1j§.visible = !§_-F1Z§.§_-O1u§;
         this.§_-Y1w§.visible = this.state != 4;
         this.§_-Y1w§.x = §_-F1Z§.§_-O1u§ ? (§_-M2N§.WIDTH - this.§_-Y1w§.width) * 0.5 : 210;
         this.§_-L1V§ = this.state != 3 && !this.§_-72a§;
         this.§_-41r§.htmlText = this.§_-z1c§[this.state]["text"];
      }
      
      public function set §_-L1V§(param1:Boolean) : void
      {
         this.§_-Y1w§.enabled = param1;
      }
      
      public function update(param1:int) : void
      {
         this.state = param1;
         this.§_-v8§();
         this.topOffset = this.state != §_-v2F§ ? -90 : -128;
         this.setBgHeight = this.state == §_-v2F§ ? 323 : 280;
         this.§_-t6§.visible = this.state == §_-v2F§;
      }
      
      private function §_-J1z§(param1:MouseEvent) : void
      {
         var _loc2_:Function = this.§_-z1c§[this.state]["function"];
         if(_loc2_ != null)
         {
            _loc2_();
         }
      }
      
      private function §_-M1D§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-O7§);
      }
      
      private function §_-u2e§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-c1a§);
      }
      
      private function §_-v2A§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-31a§);
      }
      
      private function §_-G1Q§(param1:MouseEvent = null) : void
      {
         §_-N10§.used(§_-N10§.§_-L2z§);
         if(§_-F1Z§.buy(§_-F1Z§.§_-43p§))
         {
            §_-F1Z§.§_-53T§ = true;
         }
      }
      
      public function set §_-I2C§(param1:Boolean) : void
      {
         this.§_-72a§ = param1;
         this.§_-v8§();
      }
   }
}

