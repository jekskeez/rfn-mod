package views
{
   import §_-a1J§.§_-M2N§;
   import §_-c2C§.§_-u24§;
   import com.api.Player;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-S1m§;
   
   public class §_-91L§ extends Sprite
   {
      
      private static const §_-C3j§:int = 0;
      
      private static const §_-W2F§:int = 1;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #7E5836;","}",".center {","text-align:center;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static const §_-T2h§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,1208337,true);
      
      private static const §_-Y1h§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,9175040,true);
      
      private static const §_-A24§:int = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§;
      
      private static var _instance:§_-91L§ = null;
      
      private var §_-41w§:int = 0;
      
      private var §_-A3l§:int = 0;
      
      private var §_-133§:int = 0;
      
      private var §_-kE§:Boolean = false;
      
      private var §_-il§:§_-i5§;
      
      private var §_-q2u§:§_-i5§;
      
      private var §_-c2x§:§_-i5§;
      
      private var §_-3v§:SimpleButton = null;
      
      private var §_-k1a§:SimpleButton = null;
      
      private var §_-91C§:§_-i5§ = null;
      
      public function §_-91L§()
      {
         super();
         this.init();
      }
      
      public static function get instance() : §_-91L§
      {
         if(!_instance)
         {
            _instance = new §_-91L§();
         }
         return _instance;
      }
      
      public static function clear() : void
      {
         instance.§_-il§.text = "";
         instance.§_-q2u§.text = "";
         instance.§_-c2x§.text = "";
         instance.§_-3v§.visible = false;
         instance.§_-k1a§.visible = false;
      }
      
      public static function update(param1:Array) : void
      {
         var _loc2_:Player = null;
         instance.§_-41w§ = "2" in param1 ? int(param1[2]) : instance.§_-41w§;
         instance.§_-A3l§ = "4" in param1 ? int(param1[4]) : instance.§_-A3l§;
         instance.§_-133§ = "7" in param1 ? int(param1[7]) : instance.§_-133§;
         instance.§_-kE§ = param1[0] == §_-s2l§.ROUND_PLAYING ? §_-u24§.§_-j2T§ == 0 : (param1[0] == §_-s2l§.ROUND_START ? false : instance.§_-kE§);
         instance.§_-il§.htmlText = gls("<body><b>Карта №: {0}</b></body>",instance.§_-41w§);
         if(instance.§_-A3l§)
         {
            _loc2_ = Game.getPlayer(instance.§_-A3l§);
            _loc2_.addEventListener(§_-A24§,instance.§_-Y16§);
            Game.request(instance.§_-A3l§,§_-A24§);
         }
         instance.§_-z1k§();
      }
      
      public function dispose() : void
      {
         Game.forget(this.§_-Y16§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-il§ = new §_-i5§("",0,0,_loc1_);
         addChild(this.§_-il§);
         this.§_-q2u§ = new §_-i5§("",0,16,_loc1_,§_-M2N§.WIDTH);
         this.§_-q2u§.addEventListener(MouseEvent.MOUSE_UP,this.§_-e25§);
         addChild(this.§_-q2u§);
         this.§_-91C§ = new §_-i5§(gls("<body><b>Оценка: </b></body>"),115,0,_loc1_);
         addChild(this.§_-91C§);
         this.§_-q2u§.htmlText = gls("<body><span class = \'center\'><b>Создатель: </b><a href = \'event:#\'>{0}</a></span></body>","56756");
         this.§_-c2x§ = new §_-i5§("",0,0,§_-T2h§);
         this.§_-c2x§.y = this.§_-91C§.y;
         addChild(this.§_-c2x§);
         this.§_-3v§ = new ButtonRatePositive();
         this.§_-3v§.y = this.§_-c2x§.y + 2;
         this.§_-3v§.addEventListener(MouseEvent.CLICK,this.§_-W2A§);
         addChild(this.§_-3v§);
         this.§_-k1a§ = new ButtonRateNegative();
         this.§_-k1a§.y = this.§_-c2x§.y + 2;
         this.§_-k1a§.addEventListener(MouseEvent.CLICK,this.§_-2y§);
         addChild(this.§_-k1a§);
         this.align();
      }
      
      private function align() : void
      {
         var _loc1_:Number = 10;
         var _loc2_:Number = this.§_-il§.width + _loc1_ + this.§_-91C§.width + _loc1_ + this.§_-c2x§.textWidth + _loc1_ + this.§_-3v§.width;
         var _loc3_:Number = (§_-M2N§.WIDTH - _loc2_) * 0.5;
         this.§_-il§.x = _loc3_;
         this.§_-91C§.x = int(this.§_-il§.textWidth + _loc1_) + this.§_-il§.x;
         this.§_-c2x§.x = int(this.§_-91C§.x + this.§_-91C§.textWidth + _loc1_);
         this.§_-q2u§.x = 0;
         this.§_-3v§.x = this.§_-c2x§.x - 7;
         this.§_-k1a§.x = this.§_-3v§.x + this.§_-3v§.width + 2;
      }
      
      private function §_-W2A§(param1:MouseEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-I1Q§,this.§_-41w§,§_-W2F§);
         ++this.§_-133§;
         this.§_-kE§ = true;
         this.§_-z1k§();
      }
      
      private function §_-2y§(param1:MouseEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-I1Q§,this.§_-41w§,§_-C3j§);
         --this.§_-133§;
         this.§_-kE§ = true;
         this.§_-z1k§();
      }
      
      private function §_-z1k§() : void
      {
         var _loc1_:String = this.§_-133§ > 0 ? "" : "-";
         if(Math.abs(this.§_-133§) > 999999999)
         {
            _loc1_ += int(this.§_-133§ / 1000000) + gls("M");
         }
         else if(Math.abs(this.§_-133§) > 999999)
         {
            _loc1_ += int(this.§_-133§ / 1000) + "K";
         }
         else
         {
            _loc1_ += this.§_-133§;
         }
         this.§_-c2x§.text = _loc1_;
         this.§_-k1a§.visible = !this.§_-kE§;
         this.§_-3v§.visible = !this.§_-kE§;
         this.§_-c2x§.visible = this.§_-kE§;
         this.§_-c2x§.setTextFormat(this.§_-133§ >= 0 ? §_-T2h§ : §_-Y1h§);
         this.align();
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(int(this.§_-q2u§.userData));
      }
      
      private function §_-Y16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-Y16§);
         §_-S1m§.§_-hB§(this.§_-q2u§,param1,150);
         this.§_-q2u§.htmlText = gls("<body><span class = \'center\'><b>Создатель: </b><a href = \'event:#\'>{0}</a></span></body>",this.§_-q2u§.text);
         this.§_-q2u§.userData = param1.id;
         this.align();
      }
   }
}

