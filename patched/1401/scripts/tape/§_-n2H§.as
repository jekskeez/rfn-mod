package tape
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-X2T§;
   import §_-RI§.§_-v2j§;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   import utils.§_-x1Z§;
   
   public class §_-n2H§ extends §_-K2k§
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
      
      private var §_-4A§:int = -1;
      
      public var §_-74§:int = -1;
      
      public var blocked:Boolean = false;
      
      public var §_-J6§:Sprite = null;
      
      public var §_-71t§:Sprite = null;
      
      public function §_-n2H§()
      {
         super();
         this.init();
      }
      
      public function §_-Y2D§() : void
      {
         this.button.enabled = false;
         this.button.mouseEnabled = false;
         this.filters = §_-x1Z§.§_-c2G§;
         this.blocked = true;
      }
      
      public function §_-MW§() : void
      {
         this.filters = [];
         this.button.enabled = true;
         this.button.mouseEnabled = true;
         this.blocked = false;
      }
      
      public function set id(param1:int) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.§_-p1q§);
         while(this.numChildren > 1)
         {
            removeChildAt(1);
         }
         this.§_-74§ = param1;
         if(param1 == -1)
         {
            this.§_-4A§ = -1;
            return;
         }
         this.button.addEventListener(MouseEvent.CLICK,this.§_-p1q§);
         this.§_-4A§ = §_-Y5§.§_-W1n§[param1]["id"];
         var _loc2_:Class = §_-X2T§.§_-D2L§(this.id);
         var _loc3_:* = new _loc2_();
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).gotoAndStop(0);
         }
         _loc3_.scaleX = DATA[param1]["scaleX"];
         _loc3_.scaleY = DATA[param1]["scaleY"];
         if(_loc3_ is §_-v2j§)
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
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,2298880,true);
         this.§_-J6§ = new Sprite();
         this.§_-J6§.mouseEnabled = false;
         this.§_-J6§.mouseChildren = false;
         var _loc5_:§_-22V§ = new §_-22V§("",28,-2,new TextFormat(§_-22V§.§_-F2z§,12,8397108,true));
         _loc5_.text = "+" + §_-8S§.§_-bF§;
         this.§_-J6§.addChild(_loc5_);
         var _loc6_:§_-22V§ = new §_-22V§("",0,23,_loc4_);
         _loc6_.text = §_-8S§.§_-D2a§(this.id) + " *";
         _loc6_.x = this.button.width - _loc6_.width - 5;
         this.§_-J6§.addChild(_loc6_);
         §_-jB§.§_-fG§(_loc6_,"*",ImageIconNut,0.4,0.4,-_loc6_.x - 1,-_loc6_.y,false,false);
         addChild(this.§_-J6§);
         this.§_-J6§.cacheAsBitmap = true;
         this.§_-71t§ = new Sprite();
         this.§_-71t§.mouseEnabled = false;
         this.§_-71t§.mouseChildren = false;
         var _loc7_:§_-22V§ = new §_-22V§("",28,-2,new TextFormat(§_-22V§.§_-F2z§,12,8397108,true));
         _loc7_.text = "+" + §_-8S§.§_-lO§(this.id);
         this.§_-71t§.addChild(_loc7_);
         var _loc8_:§_-22V§ = new §_-22V§("",0,22,_loc4_);
         _loc8_.text = §_-8S§.§_-CM§(this.id) + " .";
         _loc8_.x = this.button.width - _loc8_.width - 7;
         this.§_-71t§.addChild(_loc8_);
         §_-jB§.§_-fG§(_loc8_,".",ImageIconCoins,0.4,0.4,-_loc8_.x + 2,-_loc8_.y - 2,false,false);
         addChild(this.§_-71t§);
         this.§_-71t§.cacheAsBitmap = true;
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      private function §_-p1q§(param1:MouseEvent) : void
      {
         var _loc2_:int = Game.§_-DJ§ >= §_-8S§.§_-CM§(this.id) ? §_-8S§.§_-CM§(this.id) : 0;
         var _loc3_:int = Game.§_-DJ§ >= §_-8S§.§_-CM§(this.id) ? 0 : §_-8S§.§_-D2a§(this.id);
         if(!Game.§_-K2t§(§_-h2B§.§_-h29§,_loc2_,_loc3_,Game.selfId,this.id))
         {
            return;
         }
         this.§_-Y2D§();
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

