package §_-I18§
{
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-72U§;
   import utils.§_-K1Y§;
   
   public class §_-BK§ extends Dialog
   {
      
      private static const §_-A3C§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #000000;","}","a {","margin-right: 0px;","font-size: 12px;","}","a:hover {","text-decoration: underline;","color: #FF1B00;","}",".small {","text-decoration: underline;","color: #0069EC;","}",".center {","text-align: center;","}",".cost {","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-BK§ = null;
      
      private var §_-F18§:§_-K2G§ = null;
      
      private var §_-EC§:§_-72U§ = null;
      
      private var §_-FD§:§_-i5§ = null;
      
      private var §_-I2I§:§_-i5§ = null;
      
      private var §_-e2u§:Boolean = false;
      
      public function §_-BK§()
      {
         super(gls("Создать клан"));
         _instance = this;
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-R1X§]);
      }
      
      public static function get block() : Boolean
      {
         return _instance.§_-fg§;
      }
      
      public static function set block(param1:Boolean) : void
      {
         _instance.§_-fg§ = param1;
      }
      
      public static function show(param1:MouseEvent = null) : void
      {
         if(_instance == null)
         {
            _instance = new §_-BK§();
         }
         _instance.show();
      }
      
      public static function hide() : void
      {
         if(_instance == null || !_instance.visible)
         {
            return;
         }
         _instance.hide();
      }
      
      public static function set §_-83s§(param1:String) : void
      {
         if(!_instance.visible)
         {
            return;
         }
         _instance.§_-FD§.text = param1;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         this.§_-FD§.text = "";
         this.§_-EC§.text = "";
         this.§_-fg§ = false;
      }
      
      private function get §_-fg§() : Boolean
      {
         return this.§_-e2u§;
      }
      
      private function set §_-fg§(param1:Boolean) : void
      {
         if(this.§_-e2u§ == param1)
         {
            return;
         }
         this.§_-e2u§ = param1;
         this.§_-F18§.enabled = !param1;
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-I2I§ = new §_-i5§("",§_-A3C§,3,_loc1_);
         this.§_-I2I§.htmlText = gls("<body>Ты можешь создать свой клан за <span class = \'cost\'>{0} </span> @ </body>",this.price);
         addChild(this.§_-I2I§);
         §_-K1Y§.§_-P2W§(this.§_-I2I§,"@",ImageIconCoins,0.65,0.65,-this.§_-I2I§.x,-this.§_-I2I§.y,true);
         addChild(new §_-i5§(gls("<body>Название:</body>"),§_-A3C§,30,_loc1_));
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,0,true);
         this.§_-EC§ = new §_-72U§("",§_-A3C§ + 75,30,188,19,_loc2_,_loc2_,§_-Zy§.§_-u2H§);
         this.§_-EC§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         addChild(this.§_-EC§);
         this.§_-FD§ = new §_-i5§("",§_-A3C§,49,new TextFormat(null,12,16711680));
         addChild(this.§_-FD§);
         var _loc3_:§_-i5§ = new §_-i5§(gls("<body><a><span class = \'center\'><b>Информация о кланах</b></span><br/>Создавая свой клан, ты становишься вождем клана. Ты сможешь принимать белок в клан, выгонять, и распоряжаться казной клана.</a><br/></body>"),§_-A3C§,105,_loc1_);
         _loc3_.width = 293;
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         addChild(_loc3_);
         this.§_-F18§ = new §_-K2G§(gls("Создать"));
         this.§_-F18§.x = §_-A3C§ + 10;
         this.§_-F18§.y = 69;
         this.§_-F18§.addEventListener(MouseEvent.CLICK,this.create);
         addChild(this.§_-F18§);
         var _loc4_:§_-K2G§ = new §_-K2G§(gls("Отмена"));
         _loc4_.x = §_-A3C§ + 170;
         _loc4_.y = 69;
         _loc4_.addEventListener(MouseEvent.CLICK,this.hide);
         addChild(_loc4_);
         place();
         this.width -= 20;
         this.height = 220;
      }
      
      private function get price() : int
      {
         return Game.§_-63u§;
      }
      
      private function create(param1:MouseEvent) : void
      {
         if(this.§_-EC§.text == "")
         {
            return;
         }
         if(Game.§_-I20§ < this.price)
         {
            this.hide();
            Services.bank.open();
            return;
         }
         this.§_-fg§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-53e§,this.§_-EC§.text);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1[0])
         {
            case §_-s2l§.§_-YU§:
               this.hide();
               break;
            case §_-s2l§.§_-K1O§:
               §_-BK§.block = false;
               §_-BK§.§_-83s§ = gls("Клан с таким именем уже существует!\n ");
               break;
            case §_-s2l§.§_-h2L§:
               §_-BK§.block = false;
               §_-BK§.§_-83s§ = gls("Не удалось создать клан!");
         }
      }
   }
}

