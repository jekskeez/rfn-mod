package §_-D2q§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-ac§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import utils.§_-nO§;
   import views.§_-W1y§;
   
   public class §_-cu§ extends Dialog
   {
      
      private var id:int = -1;
      
      private var back:MovieClip = null;
      
      private var container:MovieClip = null;
      
      public function §_-cu§(param1:int)
      {
         super("",false);
         this.id = param1;
         this.back = addChildAt(new DialogSkinBuyBack(),0) as MovieClip;
         this.back.addFrameScript(30,this.§_-f16§);
         this.back.gotoAndPlay(1);
         addChild(new §_-22V§(§_-g2W§.§_-G1Y§(this.id),0,12,Dialog.FORMAT_CAPTION_18_CENTER,362)).filters = Dialog.§_-m2A§;
         var _loc2_:§_-W1y§ = new §_-W1y§(this.id);
         this.container = new MovieClip();
         this.container.addChild(_loc2_);
         this.container.x = 182;
         this.container.y = 185;
         addChild(this.container);
         _loc2_.x = -_loc2_.width * 0.5;
         _loc2_.y = -_loc2_.height * 0.5;
         this.container.scaleX = this.container.scaleY = 0;
         var _loc3_:§_-nO§ = new §_-nO§();
         _loc3_.§_-bb§(200,0,0,0);
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
         var _loc5_:§_-j18§ = new §_-j18§(gls("Надеть"));
         _loc5_.x = int((this.back.width - _loc5_.width) * 0.5);
         _loc5_.y = 382;
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(_loc5_);
         place();
         this.§_-O2e§.x -= 15;
         this.§_-O2e§.y += 5;
      }
      
      private function §_-f16§() : void
      {
         this.back.stopAllMovieClips();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 0;
         this.§_-4n§ = 0;
         this.topOffset = 0;
         this.§_-JZ§ = 0;
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-5B§.§_-R1G§(Game.selfId);
         §_-71o§.show(§_-ac§.instance);
         §_-m1L§.instance.hide();
         hide();
         §_-h1f§.§_-53U§(§_-h1f§.§_-A3r§,this.id);
         §_-ac§.§_-s1C§(§_-h1f§.§_-A3r§,this.id);
      }
   }
}

