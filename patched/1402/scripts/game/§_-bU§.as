package game
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-bU§ extends MovieClip
   {
      
      private var §_-m1l§:SpitAnimationView;
      
      public function §_-bU§()
      {
         super();
         this.§_-m1l§ = new SpitAnimationView();
         this.§_-m1l§.visible = false;
         this.§_-m1l§.addEventListener(Event.CHANGE,this.reset);
         addChild(this.§_-m1l§);
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      public function activate() : void
      {
         this.center();
         this.reset();
         this.§_-m1l§.visible = true;
         this.§_-m1l§.gotoAndPlay(0);
      }
      
      public function reset(param1:Event = null) : void
      {
         this.§_-m1l§.visible = false;
      }
      
      public function center() : void
      {
         var _loc1_:Number = Math.min(Game.starling.stage.stageWidth / §_-Zy§.§_-21V§,Game.starling.stage.stageHeight / §_-Zy§.§_-02T§);
         var _loc2_:Number = 20 * _loc1_;
         this.§_-m1l§.scaleX = this.§_-m1l§.scaleY = _loc1_;
         this.§_-m1l§.x = (Game.starling.stage.stageWidth - this.§_-m1l§.width) * 0.5 - _loc2_;
         this.§_-m1l§.y = (Game.starling.stage.stageHeight - this.§_-m1l§.height) * 0.5 - _loc2_;
      }
   }
}

