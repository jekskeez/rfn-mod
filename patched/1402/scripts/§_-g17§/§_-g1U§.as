package §_-g17§
{
   import §_-B1G§.ScrollPane;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-u24§;
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import utils.§_-B1d§;
   import utils.§_-S1m§;
   import utils.§_-y1l§;
   
   public class §_-g1U§ extends Dialog
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,18,11379600,true,null,null,null,null,"center");
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #A4734B;","font-weight: bold;","}",".self {","color: #FF873F;","}","a {","text-decoration: none;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var §_-23Z§:Array = [];
      
      private var images:Array = [];
      
      private var §_-71t§:§_-i5§ = null;
      
      private var §_-J2l§:Sprite = null;
      
      private var §_-s2z§:SimpleButton = null;
      
      private var §_-W18§:ScrollPane = null;
      
      private var §_-61v§:Sprite = null;
      
      public function §_-g1U§()
      {
         super(gls("Результаты раунда"));
         this.init();
      }
      
      public function §_-C1k§(param1:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:§_-i5§ = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:int = 0;
         while(this.§_-23Z§.length > 0)
         {
            this.§_-61v§.removeChild(this.§_-23Z§.pop());
         }
         while(this.images.length > 0)
         {
            this.§_-61v§.removeChild(this.images.pop());
         }
         var _loc2_:Object = param1["time"];
         var _loc3_:Object = param1["health"];
         this.§_-N1H§(!(Game.selfId in _loc3_) || _loc3_[Game.selfId] == 0);
         var _loc4_:Array = [];
         for(_loc5_ in _loc2_)
         {
            _loc4_.push({
               "id":_loc5_,
               "health":(_loc5_ in _loc3_ ? _loc3_[_loc5_] : 0),
               "score":(_loc2_[_loc5_] == 0 ? "-" : §_-B1d§.§_-z2d§(_loc2_[_loc5_])),
               "sort":(_loc2_[_loc5_] == 0 ? int.MAX_VALUE : _loc2_[_loc5_])
            });
         }
         _loc4_.sort(this.sort);
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc7_ = new §_-i5§("",30,20 * _loc6_,this.style);
            _loc7_.name = _loc4_[_loc6_]["id"];
            this.§_-61v§.addChild(_loc7_);
            if(_loc4_[_loc6_]["id"] != Game.selfId)
            {
               §_-S1m§.§_-hB§(_loc7_,Game.getPlayer(_loc4_[_loc6_]["id"]),150,true,true,true,true);
               _loc7_.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
            }
            else
            {
               §_-S1m§.§_-hB§(_loc7_,Game.self,150,false,false,false,true);
               _loc7_.text = "<body><span class=\'self\'>" + _loc7_.text + "</span></body>";
            }
            this.§_-23Z§.push(_loc7_);
            _loc7_ = new §_-i5§((_loc6_ + 1).toString() + ".",10,20 * _loc6_,new TextFormat(null,14,5972480,true));
            this.§_-61v§.addChild(_loc7_);
            this.§_-23Z§.push(_loc7_);
            if(_loc4_[_loc6_]["health"] == 0)
            {
               _loc8_ = new IsDeathIcon();
               _loc8_.x = 215;
               _loc8_.y = 5 + 20 * _loc6_;
               this.§_-61v§.addChild(_loc8_);
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
                  this.§_-61v§.addChild(_loc8_);
                  this.images.push(_loc8_);
                  _loc9_++;
               }
            }
            _loc7_ = new §_-i5§(_loc4_[_loc6_]["score"],0,20 * _loc6_,new TextFormat(null,14,5972480,true));
            _loc7_.x = 273 - int(_loc7_.textWidth * 0.5);
            this.§_-61v§.addChild(_loc7_);
            this.§_-23Z§.push(_loc7_);
            _loc6_++;
         }
         this.§_-W18§.update();
      }
      
      public function set §_-xE§(param1:Boolean) : void
      {
         this.§_-71t§.visible = param1;
         this.§_-J2l§.visible = !param1;
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,22,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.topOffset = 12;
         this.§_-7N§ = 5;
         this.§_-01q§ = 5;
         this.§_-f2d§ = 30;
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         if(!this.§_-x2T§)
         {
            return;
         }
         this.§_-x2T§.x -= 15;
         this.§_-x2T§.y -= 5;
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(310,285,Math.PI * 0.5,162,10);
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         _loc2_.graphics.drawRect(0,0,310,285);
         addChild(_loc2_);
         addChild(new §_-i5§(gls("Имя"),25,0,new TextFormat(null,11,8746579,true)));
         addChild(new §_-i5§(gls("Здоровье"),190,0,new TextFormat(null,11,14253605,true)));
         addChild(new §_-i5§(gls("Время"),255,0,new TextFormat(null,11,14253605,true)));
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.x = 0;
         this.§_-W18§.y = 20;
         this.§_-W18§.setSize(308,260);
         addChild(this.§_-W18§);
         this.§_-61v§ = new Sprite();
         this.§_-W18§.source = this.§_-61v§;
         this.§_-71t§ = new §_-i5§(gls("Следующий раунд\nскоро начнется..."),0,295,§_-W2P§);
         this.§_-71t§.x = 150 - int(this.§_-71t§.textWidth * 0.5);
         addChild(this.§_-71t§);
         this.§_-J2l§ = new Sprite();
         this.§_-J2l§.y = 295;
         this.§_-J2l§.addChild(new §_-i5§(gls("Перейти в другую\nкомнату"),15,0,§_-W2P§));
         addChild(this.§_-J2l§);
         this.§_-s2z§ = new ButtonChangeRoom();
         this.§_-s2z§.x = 295 - this.§_-s2z§.width;
         this.§_-s2z§.addEventListener(MouseEvent.CLICK,this.§_-Wg§);
         this.§_-J2l§.addChild(this.§_-s2z§);
         place();
         this.height += 15;
         this.§_-Y1T§.y -= 10;
      }
      
      private function §_-N1H§(param1:Boolean) : void
      {
         this.§_-s2z§.mouseEnabled = param1;
         this.§_-s2z§.filters = param1 ? [] : §_-y1l§.§_-Tk§;
      }
      
      private function §_-Wg§(param1:MouseEvent) : void
      {
         §_-u24§.§_-Wg§();
         this.§_-N1H§(false);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(param1.target.name);
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

