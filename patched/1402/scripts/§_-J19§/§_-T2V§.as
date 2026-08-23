package §_-J19§
{
   import §_-22D§.TweenMax;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-x2y§;
   import buttons.§_-K2G§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import utils.§_-p1r§;
   import views.§_-Y2D§;
   
   public class §_-T2V§ extends Dialog
   {
      
      private var id:int = -1;
      
      private var back:MovieClip = null;
      
      private var container:MovieClip = null;
      
      public function §_-T2V§(param1:int)
      {
         super("",false);
         this.id = param1;
         this.back = addChildAt(new DialogSkinBuyBack(),0) as MovieClip;
         this.back.addFrameScript(30,this.§_-329§);
         this.back.gotoAndPlay(1);
         addChild(new §_-i5§(§_-P2x§.§_-01H§(this.id),0,12,Dialog.FORMAT_CAPTION_18_CENTER,362)).filters = Dialog.§_-q2I§;
         var _loc2_:§_-Y2D§ = new §_-Y2D§(this.id);
         this.container = new MovieClip();
         this.container.addChild(_loc2_);
         this.container.x = 182;
         this.container.y = 185;
         addChild(this.container);
         _loc2_.x = -_loc2_.width * 0.5;
         _loc2_.y = -_loc2_.height * 0.5;
         this.container.scaleX = this.container.scaleY = 0;
         var _loc3_:§_-p1r§ = new §_-p1r§();
         _loc3_.§_-xC§(200,0,0,0);
         this.container.filters = [new ColorMatrixFilter(_loc3_)];
         this.container.alpha = 0.1;
         var _loc4_:Number = 24;
         TweenMax.to(this.container,21 / _loc4_,{
            "rotation":2 * 360,
            "scaleX":1,
            "scaleY":1,
            "alpha":1,
            "colorMatrixFilter":{"brightness":1}
         });
         TweenMax.to(this.container,4 / _loc4_,{
            "delay":21 / _loc4_,
            "scaleX":1,
            "scaleY":0.9,
            "y":195,
            "repeat":1,
            "yoyo":true
         });
         var _loc5_:§_-K2G§ = new §_-K2G§(gls("Надеть"));
         _loc5_.x = int((this.back.width - _loc5_.width) * 0.5);
         _loc5_.y = 382;
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(_loc5_);
         place();
         this.§_-x2T§.x -= 15;
         this.§_-x2T§.y += 5;
      }
      
      private function §_-329§() : void
      {
         this.back.stopAllMovieClips();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 0;
         this.§_-7N§ = 0;
         this.topOffset = 0;
         this.§_-f2d§ = 0;
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         §_-51A§.§_-h2w§(Game.selfId);
         §_-t2c§.show(§_-x2y§.instance);
         §_-534§.instance.hide();
         hide();
         §_-L1o§.§_-AY§(§_-L1o§.§_-U1v§,this.id);
         §_-x2y§.§_-R2f§(§_-L1o§.§_-U1v§,this.id);
      }
   }
}

