package §_-s2u§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-P2b§.§_-6L§;
   import §_-e1G§.§_-Hb§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import tape.§_-K2k§;
   
   public class §_-l2n§ extends §_-K2k§
   {
      
      protected var id:int = -1;
      
      protected var tween:TweenMax = null;
      
      protected var image:DisplayObject = null;
      
      protected var §_-l2h§:DisplayObject = null;
      
      protected var §_-XW§:§_-Hb§ = null;
      
      public function §_-l2n§(param1:int = -1)
      {
         super();
         this.id = param1;
         this.image = §_-6L§.§_-Gi§(param1);
         this.image.x = 25;
         this.image.y = 25;
         addChild(this.image);
         this.§_-l2h§ = new ImageLocationLock();
         this.§_-l2h§.scaleX = this.§_-l2h§.scaleY = 0.35;
         this.§_-l2h§.x = 40;
         this.§_-l2h§.y = 40;
         this.§_-l2h§.filters = [new GlowFilter(0,1,4,4,8)];
         addChild(this.§_-l2h§);
         var _loc2_:String = "<body><b>" + §_-6L§.getName(param1) + "</b>\n" + §_-6L§.§_-l7§(param1) + "</body>";
         this.§_-XW§ = new §_-Hb§(this,_loc2_,false,true);
         addEventListener(MouseEvent.ROLL_OVER,this.§_-Q20§);
         addEventListener(MouseEvent.ROLL_OUT,this.§_-9c§);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         this.update();
      }
      
      protected function update(param1:GameEvent = null) : void
      {
         var _loc2_:int = §_-g2W§.§_-N2b§(this.id);
         var _loc3_:Boolean = §_-h1f§.§_-i21§(_loc2_,§_-h1f§.§_-A3r§);
         _loc3_ &&= §_-g2W§.§_-32z§(_loc2_,this.id) <= §_-h1f§.§_-p1s§(_loc2_);
         this.image.alpha = _loc3_ ? 1 : 0.5;
         this.§_-l2h§.visible = !_loc3_;
      }
      
      protected function §_-9c§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this.image,0.2,{"glowFilter":{
            "color":16763955,
            "alpha":1,
            "blurX":0,
            "blurY":0,
            "strength":1
         }});
      }
      
      protected function §_-Q20§(param1:MouseEvent) : void
      {
         if(this.tween)
         {
            this.tween.§_-h2r§();
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

