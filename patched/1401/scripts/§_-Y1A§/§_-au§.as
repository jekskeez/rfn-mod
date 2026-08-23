package §_-Y1A§
{
   import §_-Kr§.ScrollPane;
   import §_-k1c§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import utils.§_-Y1S§;
   
   public class §_-au§ extends Dialog
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #A4734B;","font-weight: bold;","}",".self {","color: #FF873F;","}","a {","text-decoration: none;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var §_-53o§:Array = [];
      
      private var §_-4R§:§_-22V§ = null;
      
      private var §_-62§:Vector.<ScrollPane> = new Vector.<ScrollPane>(0);
      
      private var §_-q9§:Vector.<Sprite> = new Vector.<Sprite>(0);
      
      public function §_-au§()
      {
         super(gls("Результаты раунда"));
         this.init();
      }
      
      public function §_-sZ§(param1:Array) : void
      {
         var _loc3_:§_-22V§ = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:§_-22V§ = null;
         while(this.§_-53o§.length > 0)
         {
            _loc3_ = this.§_-53o§.pop();
            _loc3_.parent.removeChild(_loc3_);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_ = [];
            for(_loc5_ in param1[_loc2_])
            {
               _loc4_.push({
                  "id":_loc5_,
                  "score":param1[_loc2_][_loc5_]
               });
            }
            _loc4_.sortOn("score",Array.NUMERIC | Array.DESCENDING);
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               _loc7_ = new §_-22V§("",30,20 * _loc6_,this.style);
               _loc7_.name = _loc4_[_loc6_]["id"];
               this.§_-q9§[_loc2_].addChild(_loc7_);
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
               this.§_-q9§[_loc2_].addChild(_loc7_);
               this.§_-53o§.push(_loc7_);
               _loc7_ = new §_-22V§(_loc4_[_loc6_]["score"],210,20 * _loc6_,new TextFormat(null,14,5972480,true));
               this.§_-q9§[_loc2_].addChild(_loc7_);
               this.§_-53o§.push(_loc7_);
               _loc6_++;
            }
            this.§_-62§[_loc2_].update();
            _loc2_++;
         }
      }
      
      public function set §_-W2y§(param1:Boolean) : void
      {
         this.§_-4R§.visible = param1;
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
         var _loc6_:ScrollPane = null;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,8746579);
         addChild(new §_-22V§(gls("Лучшие белки"),85,0,_loc1_));
         var _loc2_:DisplayObject = new ImageIconSquirrel();
         _loc2_.x = 45;
         _loc2_.y = -5;
         addChild(_loc2_);
         addChild(new §_-22V§(gls("Лучшие зомби"),335,0,_loc1_));
         _loc2_ = new ImageIconZombie();
         _loc2_.x = 295;
         _loc2_.y = -5;
         addChild(_loc2_);
         var _loc3_:Matrix = new Matrix();
         _loc3_.createGradientBox(500,245,Math.PI * 0.5,162,10);
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc3_);
         _loc4_.graphics.drawRect(0,35,500,245);
         _loc4_.graphics.lineStyle(1,15589835);
         _loc4_.graphics.moveTo(250,0);
         _loc4_.graphics.lineTo(250,280);
         addChild(_loc4_);
         addChild(new §_-22V§(gls("Имя"),25,35,new TextFormat(null,11,8746579,true)));
         addChild(new §_-22V§(gls("Имя"),275,35,new TextFormat(null,11,8746579,true)));
         addChild(new §_-22V§(gls("Продержался"),170,35,new TextFormat(null,11,14253605,true)));
         addChild(new §_-22V§(gls("Заразил"),445,35,new TextFormat(null,11,4750126,true)));
         var _loc5_:int = 0;
         while(_loc5_ < 2)
         {
            _loc6_ = new ScrollPane();
            _loc6_.x = 250 * _loc5_;
            _loc6_.y = 55;
            _loc6_.setSize(248,220);
            addChild(_loc6_);
            _loc4_ = new Sprite();
            _loc6_.source = _loc4_;
            this.§_-62§.push(_loc6_);
            this.§_-q9§.push(_loc4_);
            _loc5_++;
         }
         this.§_-4R§ = new §_-22V§(gls("следующий раунд скоро начнется... "),0,290,new TextFormat(§_-22V§.§_-pJ§,16,11379600));
         this.§_-4R§.x = 250 - int(this.§_-4R§.textWidth * 0.5);
         addChild(this.§_-4R§);
         place();
         this.height += 15;
         this.§_-zl§.y -= 10;
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(param1.target.name);
      }
   }
}

