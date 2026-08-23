package §_-Y1A§
{
   import §_-Kr§.ScrollPane;
   import §_-T2y§.§_-92z§;
   import §_-k1c§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import utils.§_-Y1S§;
   import utils.§_-ex§;
   import utils.§_-x1Z§;
   
   public class §_-I1f§ extends Dialog
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,18,11379600,true,null,null,null,null,"center");
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #A4734B;","font-weight: bold;","}",".self {","color: #FF873F;","}","a {","text-decoration: none;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var §_-53o§:Array = [];
      
      private var images:Array = [];
      
      private var §_-4R§:§_-22V§ = null;
      
      private var §_-Lr§:Sprite = null;
      
      private var §_-U2c§:SimpleButton = null;
      
      private var §_-M1N§:ScrollPane = null;
      
      private var §_-sa§:Sprite = null;
      
      public function §_-I1f§()
      {
         super(gls("Результаты раунда"));
         this.init();
      }
      
      public function §_-sZ§(param1:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:§_-22V§ = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:int = 0;
         while(this.§_-53o§.length > 0)
         {
            this.§_-sa§.removeChild(this.§_-53o§.pop());
         }
         while(this.images.length > 0)
         {
            this.§_-sa§.removeChild(this.images.pop());
         }
         var _loc2_:Object = param1["time"];
         var _loc3_:Object = param1["health"];
         this.§_-03n§(!(Game.selfId in _loc3_) || _loc3_[Game.selfId] == 0);
         var _loc4_:Array = [];
         for(_loc5_ in _loc2_)
         {
            _loc4_.push({
               "id":_loc5_,
               "health":(_loc5_ in _loc3_ ? _loc3_[_loc5_] : 0),
               "score":(_loc2_[_loc5_] == 0 ? "-" : §_-ex§.§_-p1x§(_loc2_[_loc5_])),
               "sort":(_loc2_[_loc5_] == 0 ? int.MAX_VALUE : _loc2_[_loc5_])
            });
         }
         _loc4_.sort(this.sort);
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc7_ = new §_-22V§("",30,20 * _loc6_,this.style);
            _loc7_.name = _loc4_[_loc6_]["id"];
            this.§_-sa§.addChild(_loc7_);
            if(_loc4_[_loc6_]["id"] != Game.selfId)
            {
               §_-Y1S§.§_-uc§(_loc7_,Game.getPlayer(_loc4_[_loc6_]["id"]),150,true,true,true,true);
               _loc7_.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
            }
            else
            {
               §_-Y1S§.§_-uc§(_loc7_,Game.self,150,false,false,false,true);
               _loc7_.text = "<body><span class=\'self\'>" + _loc7_.text + "</span></body>";
            }
            this.§_-53o§.push(_loc7_);
            _loc7_ = new §_-22V§((_loc6_ + 1).toString() + ".",10,20 * _loc6_,new TextFormat(null,14,5972480,true));
            this.§_-sa§.addChild(_loc7_);
            this.§_-53o§.push(_loc7_);
            if(_loc4_[_loc6_]["health"] == 0)
            {
               _loc8_ = new IsDeathIcon();
               _loc8_.x = 215;
               _loc8_.y = 5 + 20 * _loc6_;
               this.§_-sa§.addChild(_loc8_);
               this.images.push(_loc8_);
            }
            else
            {
               _loc9_ = 0;
               while(_loc9_ < int((_loc4_[_loc6_]["health"] + 1) * 0.5))
               {
                  _loc8_ = _loc4_[_loc6_]["health"] - _loc9_ * 2 == 1 ? new HitPointRedHalf() : new HitPointRed();
                  _loc8_.x = 220 - 6 * (int(_loc4_[_loc6_]["health"] * 0.5) - 1) + 12 * _loc9_;
                  _loc8_.y = 10 + 20 * _loc6_;
                  this.§_-sa§.addChild(_loc8_);
                  this.images.push(_loc8_);
                  _loc9_++;
               }
            }
            _loc7_ = new §_-22V§(_loc4_[_loc6_]["score"],0,20 * _loc6_,new TextFormat(null,14,5972480,true));
            _loc7_.x = 273 - int(_loc7_.textWidth * 0.5);
            this.§_-sa§.addChild(_loc7_);
            this.§_-53o§.push(_loc7_);
            _loc6_++;
         }
         this.§_-M1N§.update();
      }
      
      public function set §_-W2y§(param1:Boolean) : void
      {
         this.§_-4R§.visible = param1;
         this.§_-Lr§.visible = !param1;
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,22,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.topOffset = 12;
         this.§_-4n§ = 5;
         this.§_-R1Y§ = 5;
         this.§_-JZ§ = 30;
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         if(!this.§_-O2e§)
         {
            return;
         }
         this.§_-O2e§.x -= 15;
         this.§_-O2e§.y -= 5;
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(310,285,Math.PI * 0.5,162,10);
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         _loc2_.graphics.drawRect(0,0,310,285);
         addChild(_loc2_);
         addChild(new §_-22V§(gls("Имя"),25,0,new TextFormat(null,11,8746579,true)));
         addChild(new §_-22V§(gls("Здоровье"),190,0,new TextFormat(null,11,14253605,true)));
         addChild(new §_-22V§(gls("Время"),255,0,new TextFormat(null,11,14253605,true)));
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.x = 0;
         this.§_-M1N§.y = 20;
         this.§_-M1N§.setSize(308,260);
         addChild(this.§_-M1N§);
         this.§_-sa§ = new Sprite();
         this.§_-M1N§.source = this.§_-sa§;
         this.§_-4R§ = new §_-22V§(gls("Следующий раунд\nскоро начнется..."),0,295,§_-i2c§);
         this.§_-4R§.x = 150 - int(this.§_-4R§.textWidth * 0.5);
         addChild(this.§_-4R§);
         this.§_-Lr§ = new Sprite();
         this.§_-Lr§.y = 295;
         this.§_-Lr§.addChild(new §_-22V§(gls("Перейти в другую\nкомнату"),15,0,§_-i2c§));
         addChild(this.§_-Lr§);
         this.§_-U2c§ = new ButtonChangeRoom();
         this.§_-U2c§.x = 295 - this.§_-U2c§.width;
         this.§_-U2c§.addEventListener(MouseEvent.CLICK,this.§_-V2l§);
         this.§_-Lr§.addChild(this.§_-U2c§);
         place();
         this.height += 15;
         this.§_-zl§.y -= 10;
      }
      
      private function §_-03n§(param1:Boolean) : void
      {
         this.§_-U2c§.mouseEnabled = param1;
         this.§_-U2c§.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
      }
      
      private function §_-V2l§(param1:MouseEvent) : void
      {
         §_-92z§.§_-V2l§();
         this.§_-03n§(false);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(param1.target.name);
      }
      
      private function sort(param1:Object, param2:Object) : int
      {
         if(param1["sort"] == param2["sort"])
         {
            return param1["health"] > param2["health"] ? -1 : 1;
         }
         return param1["sort"] > param2["sort"] ? -1 : 1;
      }
   }
}

