package §_-CF§
{
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-ct§;
   import §_-e1G§.§_-ie§;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-m1H§;
   
   public class §_-43v§ extends Sprite
   {
      
      private var §_-Y1t§:§_-m1H§;
      
      private var §_-I2K§:Boolean = false;
      
      private var §_-93E§:int;
      
      private var §_-XW§:§_-ie§;
      
      private var §_-S2o§:§_-22V§;
      
      public function §_-43v§()
      {
         super();
         this.init();
      }
      
      public function setData(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = §_-ct§.§_-A1x§(param1);
         var _loc3_:int = §_-ct§.§_-7p§(param1);
         if(_loc2_ > 1)
         {
            _loc4_ = §_-ct§.get(_loc2_) - §_-ct§.get(_loc2_ - 1);
         }
         else
         {
            _loc4_ = §_-ct§.get(_loc2_);
         }
         this.§_-Y1t§.§_-B1n§(_loc4_ - _loc3_,_loc4_);
         this.§_-93E§ = §_-ct§.get(_loc2_) - param1;
         this.§_-XW§.§_-O2§(this.§_-93E§);
         this.§_-S2o§.text = String(Math.floor(Number(_loc4_ - _loc3_) * 100 / _loc4_)) + "%";
      }
      
      private function init() : void
      {
         this.§_-Y1t§ = new §_-m1H§([{
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
         addChild(this.§_-Y1t§);
         this.§_-XW§ = new §_-ie§(this.§_-Y1t§);
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,18,16777215,true);
         _loc1_.align = TextFormatAlign.CENTER;
         this.§_-S2o§ = new §_-22V§("0%",292,-1,_loc1_);
         this.§_-S2o§.width = 100;
         this.§_-S2o§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-S2o§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-S2o§.filters = [new DropShadowFilter(0,0,0,1,2,2,1)];
         this.§_-S2o§.mouseEnabled = false;
         addChild(this.§_-S2o§);
         this.§_-J2M§ = §_-Br§.§_-f2k§;
         this.setData(§_-ct§.experience);
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-v2D§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-v2D§);
      }
      
      private function §_-A3k§(param1:Event) : void
      {
         removeChild(param1.target as MovieClip);
         var _loc2_:ShamanBarLightning = new ShamanBarLightning();
         _loc2_.x = 695;
         _loc2_.addEventListener(Event.CHANGE,this.§_-jQ§);
         addChild(_loc2_);
      }
      
      private function §_-jQ§(param1:Event) : void
      {
         removeChild(param1.target as MovieClip);
      }
      
      private function set §_-J2M§(param1:Boolean) : void
      {
         this.§_-I2K§ = param1;
         this.§_-Y1t§.§_-g1E§(param1);
         this.§_-XW§.§_-O2§(this.§_-93E§);
      }
      
      private function set §_-h1Z§(param1:Boolean) : void
      {
         if(this.§_-I2K§ == param1)
         {
            return;
         }
         var _loc2_:int = this.§_-Y1t§.§_-41n§();
         this.§_-J2M§ = param1;
         if(!param1)
         {
            return;
         }
         var _loc3_:ShamanBarGlow = new ShamanBarGlow();
         _loc3_.movieMask.width = _loc2_;
         _loc3_.movieMask.x = -width;
         _loc3_.x = _loc2_;
         _loc3_.addEventListener(Event.CHANGE,this.§_-A3k§);
         addChild(_loc3_);
      }
      
      private function §_-v2D§(param1:GameEvent) : void
      {
         this.§_-h1Z§ = §_-Br§.§_-f2k§;
      }
   }
}

