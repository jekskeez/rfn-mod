package tape
{
   import §_-TK§.§_-51g§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-n1C§;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   import utils.§_-y1l§;
   
   public class §_-iq§ extends §_-QN§
   {
      
      private static const DATA:Array = [{
         "iconX":12,
         "iconY":7,
         "scaleX":0.25,
         "scaleY":0.5,
         "rotate":23
      },{
         "iconX":22,
         "iconY":16,
         "scaleX":0.6,
         "scaleY":0.6
      },{
         "iconX":10,
         "iconY":5,
         "scaleX":0.55,
         "scaleY":0.5
      },{
         "iconX":7,
         "iconY":4,
         "scaleX":0.85,
         "scaleY":0.85
      },{
         "iconX":10,
         "iconY":9,
         "scaleX":0.38,
         "scaleY":0.38
      },{
         "iconX":22,
         "iconY":20,
         "scaleX":0.4,
         "scaleY":0.4
      },{
         "iconX":7,
         "iconY":4,
         "scaleX":0.5,
         "scaleY":0.5
      },{
         "iconX":19,
         "iconY":18,
         "scaleX":0.4,
         "scaleY":0.4
      },{
         "iconX":19,
         "iconY":18,
         "scaleX":0.4,
         "scaleY":0.4
      },{
         "iconX":7,
         "iconY":6,
         "scaleX":0.6,
         "scaleY":0.6
      }];
      
      private var button:SimpleButton = null;
      
      private var §_-n2x§:int = -1;
      
      public var §_-M1O§:int = -1;
      
      public var blocked:Boolean = false;
      
      public var §_-D2s§:Sprite = null;
      
      public var §_-zK§:Sprite = null;
      
      public function §_-iq§()
      {
         super();
         this.init();
      }
      
      public function §_-50§() : void
      {
         this.button.enabled = false;
         this.button.mouseEnabled = false;
         this.filters = §_-y1l§.§_-Tk§;
         this.blocked = true;
      }
      
      public function §_-9V§() : void
      {
         this.filters = [];
         this.button.enabled = true;
         this.button.mouseEnabled = true;
         this.blocked = false;
      }
      
      public function set id(param1:int) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.§_-z2Y§);
         while(this.numChildren > 1)
         {
            removeChildAt(1);
         }
         this.§_-M1O§ = param1;
         if(param1 == -1)
         {
            this.§_-n2x§ = -1;
            return;
         }
         this.button.addEventListener(MouseEvent.CLICK,this.§_-z2Y§);
         this.§_-n2x§ = §_-K21§.§_-M1W§[param1]["id"];
         var _loc2_:Class = §_-n1C§.§_-92G§(this.id);
         var _loc3_:* = new _loc2_();
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).gotoAndStop(0);
         }
         _loc3_.scaleX = DATA[param1]["scaleX"];
         _loc3_.scaleY = DATA[param1]["scaleY"];
         if(_loc3_ is §_-51g§)
         {
            _loc3_.scaleFlashX = DATA[param1]["scaleX"];
            _loc3_.scaleFlashY = DATA[param1]["scaleY"];
         }
         _loc3_.x = DATA[param1]["iconX"];
         _loc3_.y = DATA[param1]["iconY"];
         _loc3_.cacheAsBitmap = true;
         _loc3_.mouseEnabled = false;
         _loc3_.rotation = "rotate" in DATA[param1] ? DATA[param1]["rotate"] : 0;
         addChild(_loc3_);
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,2298880,true);
         this.§_-D2s§ = new Sprite();
         this.§_-D2s§.mouseEnabled = false;
         this.§_-D2s§.mouseChildren = false;
         var _loc5_:§_-i5§ = new §_-i5§("",28,-2,new TextFormat(§_-i5§.§_-c10§,12,8397108,true));
         _loc5_.text = "+" + §_-93H§.§_-517§;
         this.§_-D2s§.addChild(_loc5_);
         var _loc6_:§_-i5§ = new §_-i5§("",0,23,_loc4_);
         _loc6_.text = §_-93H§.§_-m2N§(this.id) + " *";
         _loc6_.x = this.button.width - _loc6_.width - 5;
         this.§_-D2s§.addChild(_loc6_);
         §_-K1Y§.§_-P2W§(_loc6_,"*",ImageIconNut,0.4,0.4,-_loc6_.x - 1,-_loc6_.y,false,false);
         addChild(this.§_-D2s§);
         this.§_-D2s§.cacheAsBitmap = true;
         this.§_-zK§ = new Sprite();
         this.§_-zK§.mouseEnabled = false;
         this.§_-zK§.mouseChildren = false;
         var _loc7_:§_-i5§ = new §_-i5§("",28,-2,new TextFormat(§_-i5§.§_-c10§,12,8397108,true));
         _loc7_.text = "+" + §_-93H§.§_-m17§(this.id);
         this.§_-zK§.addChild(_loc7_);
         var _loc8_:§_-i5§ = new §_-i5§("",0,22,_loc4_);
         _loc8_.text = §_-93H§.§_-72A§(this.id) + " .";
         _loc8_.x = this.button.width - _loc8_.width - 7;
         this.§_-zK§.addChild(_loc8_);
         §_-K1Y§.§_-P2W§(_loc8_,".",ImageIconCoins,0.4,0.4,-_loc8_.x + 2,-_loc8_.y - 2,false,false);
         addChild(this.§_-zK§);
         this.§_-zK§.cacheAsBitmap = true;
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      private function §_-z2Y§(param1:MouseEvent) : void
      {
         var _loc2_:int = Game.§_-I20§ >= §_-93H§.§_-72A§(this.id) ? §_-93H§.§_-72A§(this.id) : 0;
         var _loc3_:int = Game.§_-I20§ >= §_-93H§.§_-72A§(this.id) ? 0 : §_-93H§.§_-m2N§(this.id);
         if(!Game.§_-u2z§(§_-u1O§.§_-O27§,_loc2_,_loc3_,Game.selfId,this.id))
         {
            return;
         }
         this.§_-50§();
      }
      
      private function init() : void
      {
         this.button = new ShamanCastShopButton();
         this.button.upState.cacheAsBitmap = true;
         addChild(this.button);
         this.id = -1;
      }
   }
}

