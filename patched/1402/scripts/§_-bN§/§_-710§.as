package §_-bN§
{
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-Q2l§;
   import §_-X1k§.§_-r12§;
   import §_-c2C§.§_-si§;
   import buttons.§_-K2G§;
   import buttons.§_-j2x§;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import protocol.§_-n2E§;
   import tape.§_-42T§;
   import utils.§_-K1Y§;
   import utils.§_-o1Q§;
   import utils.§_-y1l§;
   
   public class §_-710§ extends Dialog
   {
      
      private static var _instance:§_-710§ = null;
      
      private var timer:Timer = new Timer(5000);
      
      private var §_-G1U§:String = "";
      
      private var button:§_-K2G§;
      
      private var §_-Q1q§:§_-42T§;
      
      public function §_-710§()
      {
         super(gls("Выполни задания за награду"));
         var _loc1_:Object = §_-uR§.loaderInfo.parameters as Object;
         if("useApiType" in _loc1_)
         {
            this.§_-G1U§ = _loc1_["useApiType"];
         }
         else if("useapitype" in _loc1_)
         {
            this.§_-G1U§ = _loc1_["useapitype"];
         }
         else
         {
            this.§_-G1U§ = §_-Zy§.§_-R1A§;
         }
         this.init();
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-710§();
         }
         _instance.show();
      }
      
      public static function get §_-u21§() : Boolean
      {
         return _instance != null;
      }
      
      public static function §_-71G§(param1:uint) : void
      {
         _instance.§_-71G§(param1);
         if(§_-Q2l§.§_-A34§)
         {
            _instance.dispose();
         }
      }
      
      override public function showDialog() : void
      {
         super.showDialog();
         this.§_-zu§();
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
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-r22§);
         var _loc1_:ViralityQuestImage = new ViralityQuestImage();
         _loc1_.y = -37;
         _loc1_.x = -15;
         addChildAt(_loc1_,0);
         var _loc2_:§_-i5§ = new §_-i5§(gls("монеты").toUpperCase(),154,27,new TextFormat(§_-i5§.§_-p1s§,20,5178121,true,null,null,null,null,TextFormatAlign.CENTER),143);
         _loc2_.mouseEnabled = false;
         addChild(_loc2_);
         _loc2_ = new §_-i5§(gls("бесплатно").toUpperCase(),154,_loc2_.y + _loc2_.textHeight,new TextFormat(§_-i5§.§_-p1s§,20,16733220,true,null,null,null,null,TextFormatAlign.CENTER),143);
         _loc2_.mouseEnabled = false;
         addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§(§_-Q2l§.§_-M1U§.toString() + "  -  ",135,_loc2_.y + _loc2_.textHeight - 2,new TextFormat(§_-i5§.§_-p1s§,33,16711320,true,null,null,null,null,TextFormatAlign.CENTER),143);
         _loc3_.filters = [new DropShadowFilter(0,0,5178121,1,4,4,10,1)];
         _loc3_.mouseEnabled = false;
         addChild(_loc3_);
         §_-K1Y§.§_-P2W§(_loc3_,"-",ImageIconCoinsBig,1.2,1.2,-_loc3_.x - 3,-_loc3_.y - 1,true,true);
         this.§_-Q1q§ = new §_-42T§(this.§_-G1U§);
         this.§_-Q1q§.x = 100;
         this.§_-Q1q§.y = 35;
         addChild(this.§_-Q1q§);
         this.button = new §_-j2x§(gls("Получить {0} -",20).toUpperCase(),180,15,null,1.3);
         this.button.x = 418;
         this.button.y = this.§_-Q1q§.y + this.§_-Q1q§.height + 9;
         this.button.enabled = §_-Q2l§.§_-A34§;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         this.button.scaleX = this.button.scaleY = 1.2;
         addChild(this.button);
         §_-K1Y§.§_-P2W§(this.button.field,"-",ImageIconCoins,0.9,0.9,-this.button.field.x - 2,-5,true);
         place();
         hide();
         this.width = 739;
         this.height = 475;
      }
      
      private function §_-83V§(param1:MouseEvent) : void
      {
         var _loc2_:Array = §_-Q2l§.§_-U8§;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += _loc2_[_loc4_].toString() + "-" + §_-Q2l§.§_-J2§(_loc2_[_loc4_]).toString() + ", ";
            _loc4_++;
         }
         §_-p2U§.add("viral flags " + _loc3_);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         var _loc2_:§_-n2E§ = §_-r12§.§_-73x§(§_-n2E§.§_-F2s§);
         _loc2_.§_-i2T§(_loc2_.value | §_-Q2l§.§_-I2y§);
         §_-si§.§_-m1x§();
         this.§_-l7§();
         this.hideDialog();
      }
      
      private function §_-l7§() : void
      {
         this.button.visible = false;
         §_-o1Q§.§_-K2u§(this.x + this.button.x,this.y + this.button.y,§_-Q2l§.§_-M1U§,§_-A3y§.§_-M1U§,ImageIconCoins,1,new TextFormat(§_-i5§.§_-c10§,20,16774444,true));
      }
      
      private function §_-zu§() : void
      {
         var _loc1_:Array = §_-Q2l§.§_-pY§[this.§_-G1U§] || §_-Q2l§.§_-pY§["default"];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.§_-71G§(_loc1_[_loc2_]);
            §_-Q2l§.§_-h0§(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      private function §_-71G§(param1:uint) : void
      {
         this.§_-Q1q§.§_-71G§(param1,§_-Q2l§.§_-J2§(param1));
         this.button.enabled = §_-Q2l§.§_-12q§;
         this.button.filters = §_-Q2l§.§_-12q§ ? [] : §_-y1l§.§_-Tk§;
      }
      
      private function §_-r22§(param1:TimerEvent) : void
      {
         var _loc2_:Array = §_-Q2l§.§_-pY§[this.§_-G1U§] || §_-Q2l§.§_-pY§["default"];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-Q2l§.§_-h0§(_loc2_[_loc3_]);
            _loc3_++;
         }
      }
      
      private function dispose() : void
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.§_-r22§);
      }
   }
}

