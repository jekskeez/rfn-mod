package §_-xm§
{
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import com.api.Services;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   import utils.§_-w2j§;
   
   public class §_-32P§ extends Dialog
   {
      
      private static const §_-V0§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #000000;","}","a {","margin-right: 0px;","font-size: 12px;","}","a:hover {","text-decoration: underline;","color: #FF1B00;","}",".small {","text-decoration: underline;","color: #0069EC;","}",".center {","text-align: center;","}",".cost {","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-32P§ = null;
      
      private var §_-Tb§:§_-j18§ = null;
      
      private var §_-V2v§:§_-w2j§ = null;
      
      private var §_-NQ§:§_-22V§ = null;
      
      private var §_-fi§:§_-22V§ = null;
      
      private var §_-f1C§:Boolean = false;
      
      public function §_-32P§()
      {
         super(gls("Создать клан"));
         _instance = this;
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-M1P§]);
      }
      
      public static function get block() : Boolean
      {
         return _instance.§_-E1v§;
      }
      
      public static function set block(param1:Boolean) : void
      {
         _instance.§_-E1v§ = param1;
      }
      
      public static function show(param1:MouseEvent = null) : void
      {
         if(_instance == null)
         {
            _instance = new §_-32P§();
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
      
      public static function set §_-62V§(param1:String) : void
      {
         if(!_instance.visible)
         {
            return;
         }
         _instance.§_-NQ§.text = param1;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         this.§_-NQ§.text = "";
         this.§_-V2v§.text = "";
         this.§_-E1v§ = false;
      }
      
      private function get §_-E1v§() : Boolean
      {
         return this.§_-f1C§;
      }
      
      private function set §_-E1v§(param1:Boolean) : void
      {
         if(this.§_-f1C§ == param1)
         {
            return;
         }
         this.§_-f1C§ = param1;
         this.§_-Tb§.enabled = !param1;
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-fi§ = new §_-22V§("",§_-V0§,3,_loc1_);
         this.§_-fi§.htmlText = gls("<body>Ты можешь создать свой клан за <span class = \'cost\'>{0} </span> @ </body>",this.price);
         addChild(this.§_-fi§);
         §_-jB§.§_-fG§(this.§_-fi§,"@",ImageIconCoins,0.65,0.65,-this.§_-fi§.x,-this.§_-fi§.y,true);
         addChild(new §_-22V§(gls("<body>Название:</body>"),§_-V0§,30,_loc1_));
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,0,true);
         this.§_-V2v§ = new §_-w2j§("",§_-V0§ + 75,30,188,19,_loc2_,_loc2_,§_-a9§.§_-y1i§);
         this.§_-V2v§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         addChild(this.§_-V2v§);
         this.§_-NQ§ = new §_-22V§("",§_-V0§,49,new TextFormat(null,12,16711680));
         addChild(this.§_-NQ§);
         var _loc3_:§_-22V§ = new §_-22V§(gls("<body><a><span class = \'center\'><b>Информация о кланах</b></span><br/>Создавая свой клан, ты становишься вождем клана. Ты сможешь принимать белок в клан, выгонять, и распоряжаться казной клана.</a><br/></body>"),§_-V0§,105,_loc1_);
         _loc3_.width = 293;
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         addChild(_loc3_);
         this.§_-Tb§ = new §_-j18§(gls("Создать"));
         this.§_-Tb§.x = §_-V0§ + 10;
         this.§_-Tb§.y = 69;
         this.§_-Tb§.addEventListener(MouseEvent.CLICK,this.create);
         addChild(this.§_-Tb§);
         var _loc4_:§_-j18§ = new §_-j18§(gls("Отмена"));
         _loc4_.x = §_-V0§ + 170;
         _loc4_.y = 69;
         _loc4_.addEventListener(MouseEvent.CLICK,this.hide);
         addChild(_loc4_);
         place();
         this.width -= 20;
         this.height = 220;
      }
      
      private function get price() : int
      {
         return Game.§_-Rb§;
      }
      
      private function create(param1:MouseEvent) : void
      {
         if(this.§_-V2v§.text == "")
         {
            return;
         }
         if(Game.§_-DJ§ < this.price)
         {
            this.hide();
            Services.bank.open();
            return;
         }
         this.§_-E1v§ = true;
         Connection.§_-Li§(§_-h2B§.§_-h13§,this.§_-V2v§.text);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1[0])
         {
            case §_-S2I§.§_-Wr§:
               this.hide();
               break;
            case §_-S2I§.§_-f1Z§:
               §_-32P§.block = false;
               §_-32P§.§_-62V§ = gls("Клан с таким именем уже существует!\n ");
               break;
            case §_-S2I§.§_-43A§:
               §_-32P§.block = false;
               §_-32P§.§_-62V§ = gls("Не удалось создать клан!");
         }
      }
   }
}

