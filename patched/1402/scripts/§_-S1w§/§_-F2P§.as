package §_-S1w§
{
   import §_-S1n§.§_-1e§;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-F1Z§;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-e2x§;
   
   public class §_-F2P§ extends Sprite
   {
      
      private var §_-hX§:§_-e2x§;
      
      private var §_-O2r§:Boolean = false;
      
      private var §_-lP§:int;
      
      private var §_-oj§:§_-1e§;
      
      private var §_-u2G§:§_-i5§;
      
      public function §_-F2P§()
      {
         super();
         this.init();
      }
      
      public function setData(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = §_-4v§.§_-82P§(param1);
         var _loc3_:int = §_-4v§.§_-Q2y§(param1);
         if(_loc2_ > 1)
         {
            _loc4_ = §_-4v§.get(_loc2_) - §_-4v§.get(_loc2_ - 1);
         }
         else
         {
            _loc4_ = §_-4v§.get(_loc2_);
         }
         this.§_-hX§.§_-d1Z§(_loc4_ - _loc3_,_loc4_);
         this.§_-lP§ = §_-4v§.get(_loc2_) - param1;
         this.§_-oj§.§_-Y26§(this.§_-lP§);
         this.§_-u2G§.text = String(Math.floor(Number(_loc4_ - _loc3_) * 100 / _loc4_)) + "%";
      }
      
      private function init() : void
      {
         this.§_-hX§ = new §_-e2x§([{
            "image":new ShamanBarBackground(),
            "X":0,
            "Y":0
         },{
            "image":new ShamanBarOrange(),
            "X":2,
            "Y":2,
            "width":680
         },{
            "image":new ShamanBarViolet(),
            "X":2,
            "Y":2,
            "width":680
         }],false);
         addChild(this.§_-hX§);
         this.§_-oj§ = new §_-1e§(this.§_-hX§);
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-c10§,18,16777215,true);
         _loc1_.align = TextFormatAlign.CENTER;
         this.§_-u2G§ = new §_-i5§("0%",292,-1,_loc1_);
         this.§_-u2G§.width = 100;
         this.§_-u2G§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-u2G§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-u2G§.filters = [new DropShadowFilter(0,0,0,1,2,2,1)];
         this.§_-u2G§.mouseEnabled = false;
         addChild(this.§_-u2G§);
         this.§_-f24§ = §_-F1Z§.§_-O1u§;
         this.setData(§_-4v§.experience);
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-P2v§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-P2v§);
      }
      
      private function §_-f1n§(param1:Event) : void
      {
         removeChild(param1.target as MovieClip);
         var _loc2_:ShamanBarLightning = new ShamanBarLightning();
         _loc2_.x = 695;
         _loc2_.addEventListener(Event.CHANGE,this.§_-z2b§);
         addChild(_loc2_);
      }
      
      private function §_-z2b§(param1:Event) : void
      {
         removeChild(param1.target as MovieClip);
      }
      
      private function set §_-f24§(param1:Boolean) : void
      {
         this.§_-O2r§ = param1;
         this.§_-hX§.§_-638§(param1);
         this.§_-oj§.§_-Y26§(this.§_-lP§);
      }
      
      private function set §_-R1O§(param1:Boolean) : void
      {
         if(this.§_-O2r§ == param1)
         {
            return;
         }
         var _loc2_:int = this.§_-hX§.§_-a2L§();
         this.§_-f24§ = param1;
         if(!param1)
         {
            return;
         }
         var _loc3_:ShamanBarGlow = new ShamanBarGlow();
         _loc3_.movieMask.width = _loc2_;
         _loc3_.movieMask.x = -width;
         _loc3_.x = _loc2_;
         _loc3_.addEventListener(Event.CHANGE,this.§_-f1n§);
         addChild(_loc3_);
      }
      
      private function §_-P2v§(param1:GameEvent) : void
      {
         this.§_-R1O§ = §_-F1Z§.§_-O1u§;
      }
   }
}

