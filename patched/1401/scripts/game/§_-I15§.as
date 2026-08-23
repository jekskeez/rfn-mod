package game
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-I15§ extends MovieClip
   {
      
      private var §_-tA§:SpitAnimationView;
      
      public function §_-I15§()
      {
         super();
         this.§_-tA§ = new SpitAnimationView();
         this.§_-tA§.visible = false;
         this.§_-tA§.addEventListener(Event.CHANGE,this.reset);
         addChild(this.§_-tA§);
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      public function activate() : void
      {
         this.center();
         this.reset();
         this.§_-tA§.visible = true;
         this.§_-tA§.gotoAndPlay(0);
      }
      
      public function reset(param1:Event = null) : void
      {
         this.§_-tA§.visible = false;
      }
      
      public function center() : void
      {
         var _loc1_:Number = Math.min(Game.starling.stage.stageWidth / §_-a9§.§_-9o§,Game.starling.stage.stageHeight / §_-a9§.§_-31m§);
         var _loc2_:Number = 20 * _loc1_;
         this.§_-tA§.scaleX = this.§_-tA§.scaleY = _loc1_;
         this.§_-tA§.x = (Game.starling.stage.stageWidth - this.§_-tA§.width) * 0.5 - _loc2_;
         this.§_-tA§.y = (Game.starling.stage.stageHeight - this.§_-tA§.height) * 0.5 - _loc2_;
      }
   }
}

