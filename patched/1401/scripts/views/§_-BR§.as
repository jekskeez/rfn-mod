package views
{
   import §_-63u§.§_-31r§;
   import §_-T2y§.§_-92z§;
   import com.api.Player;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-Y1S§;
   
   public class §_-BR§ extends Sprite
   {
      
      private static const §_-31j§:int = 0;
      
      private static const §_-z1c§:int = 1;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #7E5836;","}",".center {","text-align:center;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-V1y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,1208337,true);
      
      private static const §_-jU§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,9175040,true);
      
      private static const §_-03g§:int = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§;
      
      private static var _instance:§_-BR§ = null;
      
      private var §_-T1D§:int = 0;
      
      private var §_-M1u§:int = 0;
      
      private var §_-z1U§:int = 0;
      
      private var §_-h1§:Boolean = false;
      
      private var §_-i1M§:§_-22V§;
      
      private var §_-93O§:§_-22V§;
      
      private var §_-p2r§:§_-22V§;
      
      private var §_-k2§:SimpleButton = null;
      
      private var §_-Ho§:SimpleButton = null;
      
      private var §_-63e§:§_-22V§ = null;
      
      public function §_-BR§()
      {
         super();
         this.init();
      }
      
      public static function get instance() : §_-BR§
      {
         if(!_instance)
         {
            _instance = new §_-BR§();
         }
         return _instance;
      }
      
      public static function clear() : void
      {
         instance.§_-i1M§.text = "";
         instance.§_-93O§.text = "";
         instance.§_-p2r§.text = "";
         instance.§_-k2§.visible = false;
         instance.§_-Ho§.visible = false;
      }
      
      public static function update(param1:Array) : void
      {
         var _loc2_:Player = null;
         instance.§_-T1D§ = "2" in param1 ? int(param1[2]) : instance.§_-T1D§;
         instance.§_-M1u§ = "4" in param1 ? int(param1[4]) : instance.§_-M1u§;
         instance.§_-z1U§ = "7" in param1 ? int(param1[7]) : instance.§_-z1U§;
         instance.§_-h1§ = param1[0] == §_-S2I§.ROUND_PLAYING ? §_-92z§.§_-32S§ == 0 : (param1[0] == §_-S2I§.ROUND_START ? false : instance.§_-h1§);
         instance.§_-i1M§.htmlText = gls("<body><b>Карта №: {0}</b></body>",instance.§_-T1D§);
         if(instance.§_-M1u§)
         {
            _loc2_ = Game.getPlayer(instance.§_-M1u§);
            _loc2_.addEventListener(§_-03g§,instance.§_-P9§);
            Game.request(instance.§_-M1u§,§_-03g§);
         }
         instance.§_-WB§();
      }
      
      public function dispose() : void
      {
         Game.forget(this.§_-P9§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-i1M§ = new §_-22V§("",0,0,_loc1_);
         addChild(this.§_-i1M§);
         this.§_-93O§ = new §_-22V§("",0,16,_loc1_,§_-31r§.WIDTH);
         this.§_-93O§.addEventListener(MouseEvent.MOUSE_UP,this.§_-i2I§);
         addChild(this.§_-93O§);
         this.§_-63e§ = new §_-22V§(gls("<body><b>Оценка: </b></body>"),115,0,_loc1_);
         addChild(this.§_-63e§);
         this.§_-93O§.htmlText = gls("<body><span class = \'center\'><b>Создатель: </b><a href = \'event:#\'>{0}</a></span></body>","56756");
         this.§_-p2r§ = new §_-22V§("",0,0,§_-V1y§);
         this.§_-p2r§.y = this.§_-63e§.y;
         addChild(this.§_-p2r§);
         this.§_-k2§ = new ButtonRatePositive();
         this.§_-k2§.y = this.§_-p2r§.y + 2;
         this.§_-k2§.addEventListener(MouseEvent.CLICK,this.§_-B3a§);
         addChild(this.§_-k2§);
         this.§_-Ho§ = new ButtonRateNegative();
         this.§_-Ho§.y = this.§_-p2r§.y + 2;
         this.§_-Ho§.addEventListener(MouseEvent.CLICK,this.§_-Fg§);
         addChild(this.§_-Ho§);
         this.align();
      }
      
      private function align() : void
      {
         var _loc1_:Number = 10;
         var _loc2_:Number = this.§_-i1M§.width + _loc1_ + this.§_-63e§.width + _loc1_ + this.§_-p2r§.textWidth + _loc1_ + this.§_-k2§.width;
         var _loc3_:Number = (§_-31r§.WIDTH - _loc2_) * 0.5;
         this.§_-i1M§.x = _loc3_;
         this.§_-63e§.x = int(this.§_-i1M§.textWidth + _loc1_) + this.§_-i1M§.x;
         this.§_-p2r§.x = int(this.§_-63e§.x + this.§_-63e§.textWidth + _loc1_);
         this.§_-93O§.x = 0;
         this.§_-k2§.x = this.§_-p2r§.x - 7;
         this.§_-Ho§.x = this.§_-k2§.x + this.§_-k2§.width + 2;
      }
      
      private function §_-B3a§(param1:MouseEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-23k§,this.§_-T1D§,§_-z1c§);
         ++this.§_-z1U§;
         this.§_-h1§ = true;
         this.§_-WB§();
      }
      
      private function §_-Fg§(param1:MouseEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-23k§,this.§_-T1D§,§_-31j§);
         --this.§_-z1U§;
         this.§_-h1§ = true;
         this.§_-WB§();
      }
      
      private function §_-WB§() : void
      {
         var _loc1_:String = this.§_-z1U§ > 0 ? "" : "-";
         if(Math.abs(this.§_-z1U§) > 999999999)
         {
            _loc1_ += int(this.§_-z1U§ / 1000000) + gls("M");
         }
         else if(Math.abs(this.§_-z1U§) > 999999)
         {
            _loc1_ += int(this.§_-z1U§ / 1000) + "K";
         }
         else
         {
            _loc1_ += this.§_-z1U§;
         }
         this.§_-p2r§.text = _loc1_;
         this.§_-Ho§.visible = !this.§_-h1§;
         this.§_-k2§.visible = !this.§_-h1§;
         this.§_-p2r§.visible = this.§_-h1§;
         this.§_-p2r§.setTextFormat(this.§_-z1U§ >= 0 ? §_-V1y§ : §_-jU§);
         this.align();
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(int(this.§_-93O§.userData));
      }
      
      private function §_-P9§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-P9§);
         §_-Y1S§.§_-uc§(this.§_-93O§,param1,150);
         this.§_-93O§.htmlText = gls("<body><span class = \'center\'><b>Создатель: </b><a href = \'event:#\'>{0}</a></span></body>",this.§_-93O§.text);
         this.§_-93O§.userData = param1.id;
         this.align();
      }
   }
}

