package §_-J21§
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-j2E§.§_-A11§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import tape.§_-QN§;
   
   public class §_-Q1j§ extends §_-QN§
   {
      
      protected var id:int = -1;
      
      protected var tween:TweenMax = null;
      
      protected var image:DisplayObject = null;
      
      protected var §_-v2C§:DisplayObject = null;
      
      protected var §_-oj§:§_-kr§ = null;
      
      public function §_-Q1j§(param1:int = -1)
      {
         super();
         this.id = param1;
         this.image = §_-A11§.§_-51T§(param1);
         this.image.x = 25;
         this.image.y = 25;
         addChild(this.image);
         this.§_-v2C§ = new ImageLocationLock();
         this.§_-v2C§.scaleX = this.§_-v2C§.scaleY = 0.35;
         this.§_-v2C§.x = 40;
         this.§_-v2C§.y = 40;
         this.§_-v2C§.filters = [new GlowFilter(0,1,4,4,8)];
         addChild(this.§_-v2C§);
         var _loc2_:String = "<body><b>" + §_-A11§.getName(param1) + "</b>\n" + §_-A11§.§_-ya§(param1) + "</body>";
         this.§_-oj§ = new §_-kr§(this,_loc2_,false,true);
         addEventListener(MouseEvent.ROLL_OVER,this.§_-T2H§);
         addEventListener(MouseEvent.ROLL_OUT,this.§_-k2s§);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         this.update();
      }
      
      protected function update(param1:GameEvent = null) : void
      {
         var _loc2_:int = §_-P2x§.§_-c1K§(this.id);
         var _loc3_:Boolean = §_-L1o§.§_-J2p§(_loc2_,§_-L1o§.§_-U1v§);
         _loc3_ &&= §_-P2x§.§_-eJ§(_loc2_,this.id) <= §_-L1o§.§_-51J§(_loc2_);
         this.image.alpha = _loc3_ ? 1 : 0.5;
         this.§_-v2C§.visible = !_loc3_;
      }
      
      protected function §_-k2s§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this.image,0.2,{"glowFilter":{
            "color":16763955,
            "alpha":1,
            "blurX":0,
            "blurY":0,
            "strength":1
         }});
      }
      
      protected function §_-T2H§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this.image,0.2,{"glowFilter":{
            "color":16763955,
            "alpha":1,
            "blurX":10,
            "blurY":10,
            "strength":1
         }});
      }
   }
}

