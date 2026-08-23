package §_-k1c§
{
   import §_-I10§.§_-3U§;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-Bm§;
   import §_-T2y§.§_-5K§;
   import buttons.§_-hH§;
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import protocol.§_-T2o§;
   import tape.§_-52L§;
   import utils.§_-jB§;
   import utils.§_-r2N§;
   import utils.§_-x1Z§;
   
   public class §_-T2m§ extends Dialog
   {
      
      private static var _instance:§_-T2m§ = null;
      
      private var timer:Timer = new Timer(5000);
      
      private var §_-53C§:String = "";
      
      private var button:§_-j18§;
      
      private var §_-H2H§:§_-52L§;
      
      public function §_-T2m§()
      {
         super(gls("Выполни задания за награду"));
         var _loc1_:Object = §_-k2X§.loaderInfo.parameters as Object;
         if("useApiType" in _loc1_)
         {
            this.§_-53C§ = _loc1_["useApiType"];
         }
         else if("useapitype" in _loc1_)
         {
            this.§_-53C§ = _loc1_["useapitype"];
         }
         else
         {
            this.§_-53C§ = §_-a9§.§_-63Z§;
         }
         this.init();
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-T2m§();
         }
         _instance.show();
      }
      
      public static function get §_-P20§() : Boolean
      {
         return _instance != null;
      }
      
      public static function §_-e2t§(param1:uint) : void
      {
         _instance.§_-e2t§(param1);
         if(§_-3U§.§_-IY§)
         {
            _instance.dispose();
         }
      }
      
      override public function showDialog() : void
      {
         super.showDialog();
         this.§_-U1g§();
         this.timer.reset();
         this.timer.start();
      }
      
      override public function hideDialog() : void
      {
         super.hideDialog();
         this.timer.stop();
      }
      
      private function init() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-82T§);
         var _loc1_:ViralityQuestImage = new ViralityQuestImage();
         _loc1_.y = -37;
         _loc1_.x = -15;
         addChildAt(_loc1_,0);
         var _loc2_:§_-22V§ = new §_-22V§(gls("монеты").toUpperCase(),154,27,new TextFormat(§_-22V§.§_-pJ§,20,5178121,true,null,null,null,null,TextFormatAlign.CENTER),143);
         _loc2_.mouseEnabled = false;
         addChild(_loc2_);
         _loc2_ = new §_-22V§(gls("бесплатно").toUpperCase(),154,_loc2_.y + _loc2_.textHeight,new TextFormat(§_-22V§.§_-pJ§,20,16733220,true,null,null,null,null,TextFormatAlign.CENTER),143);
         _loc2_.mouseEnabled = false;
         addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§(§_-3U§.§_-113§.toString() + "  -  ",135,_loc2_.y + _loc2_.textHeight - 2,new TextFormat(§_-22V§.§_-pJ§,33,16711320,true,null,null,null,null,TextFormatAlign.CENTER),143);
         _loc3_.filters = [new DropShadowFilter(0,0,5178121,1,4,4,10,1)];
         _loc3_.mouseEnabled = false;
         addChild(_loc3_);
         §_-jB§.§_-fG§(_loc3_,"-",ImageIconCoinsBig,1.2,1.2,-_loc3_.x - 3,-_loc3_.y - 1,true,true);
         this.§_-H2H§ = new §_-52L§(this.§_-53C§);
         this.§_-H2H§.x = 100;
         this.§_-H2H§.y = 35;
         addChild(this.§_-H2H§);
         this.button = new §_-hH§(gls("Получить {0} -",20).toUpperCase(),180,15,null,1.3);
         this.button.x = 418;
         this.button.y = this.§_-H2H§.y + this.§_-H2H§.height + 9;
         this.button.enabled = §_-3U§.§_-IY§;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         this.button.scaleX = this.button.scaleY = 1.2;
         addChild(this.button);
         §_-jB§.§_-fG§(this.button.field,"-",ImageIconCoins,0.9,0.9,-this.button.field.x - 2,-5,true);
         place();
         hide();
         this.width = 739;
         this.height = 475;
      }
      
      private function §_-e1b§(param1:MouseEvent) : void
      {
         var _loc2_:Array = §_-3U§.§_-QA§;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += _loc2_[_loc4_].toString() + "-" + §_-3U§.§_-81g§(_loc2_[_loc4_]).toString() + ", ";
            _loc4_++;
         }
         §_-TQ§.add("viral flags " + _loc3_);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         var _loc2_:§_-T2o§ = §_-Bm§.§_-z1M§(§_-T2o§.§_-71z§);
         _loc2_.§_-r1g§(_loc2_.value | §_-3U§.§_-o1p§);
         §_-5K§.§_-b1W§();
         this.§_-H2q§();
         this.hideDialog();
      }
      
      private function §_-H2q§() : void
      {
         this.button.visible = false;
         §_-r2N§.§_-A3v§(this.x + this.button.x,this.y + this.button.y,§_-3U§.§_-113§,§_-428§.§_-113§,ImageIconCoins,1,new TextFormat(§_-22V§.§_-F2z§,20,16774444,true));
      }
      
      private function §_-U1g§() : void
      {
         var _loc1_:Array = §_-3U§.§_-x2g§[this.§_-53C§] || §_-3U§.§_-x2g§["default"];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.§_-e2t§(_loc1_[_loc2_]);
            §_-3U§.§_-42§(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      private function §_-e2t§(param1:uint) : void
      {
         this.§_-H2H§.§_-e2t§(param1,§_-3U§.§_-81g§(param1));
         this.button.enabled = §_-3U§.§_-BH§;
         this.button.filters = §_-3U§.§_-BH§ ? [] : §_-x1Z§.§_-c2G§;
      }
      
      private function §_-82T§(param1:TimerEvent) : void
      {
         var _loc2_:Array = §_-3U§.§_-x2g§[this.§_-53C§] || §_-3U§.§_-x2g§["default"];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-3U§.§_-42§(_loc2_[_loc3_]);
            _loc3_++;
         }
      }
      
      private function dispose() : void
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.§_-82T§);
      }
   }
}

