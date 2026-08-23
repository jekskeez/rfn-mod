package §_-f17§
{
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.events.Event;
   import flash.geom.Point;
   import utils.§_-Z1S§;
   
   public class §_-k1y§ extends §_-h2I§ implements §_-C2x§
   {
      
      private var §_-j1g§:§_-h2I§;
      
      private var §_-O1S§:§_-h2I§;
      
      private var §_-J1p§:§_-h2I§;
      
      private var §_-P2R§:Number;
      
      private var §_-p1p§:Boolean;
      
      private var §_-J2q§:Number = 1;
      
      private var §_-52m§:Point = new Point();
      
      private var §_-R2t§:§_-h2I§;
      
      private var hero:Hero = null;
      
      public function §_-k1y§(param1:Class = null, param2:Class = null)
      {
         super();
         if(param1 == null)
         {
            param1 = StickyEnd;
         }
         if(param2 == null)
         {
            param2 = StickyMiddle;
         }
         this.§_-O1S§ = new §_-h2I§(new param1());
         this.§_-J1p§ = new §_-h2I§(new param2());
         this.§_-P2R§ = 90.5;
         this.§_-J1p§.§_-6i§ = false;
         §_-83v§(this.§_-O1S§);
         §_-83v§(this.§_-J1p§);
      }
      
      override public function get alpha() : Number
      {
         return super.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-O1S§.alpha = this.§_-J1p§.alpha = super.alpha = param1;
      }
      
      public function dispose() : void
      {
         if(this.§_-J1p§.parentStarling)
         {
            this.§_-J1p§.parentStarling.removeChildStarling(this.§_-J1p§);
         }
         if(this.§_-O1S§.parentStarling)
         {
            this.§_-O1S§.parentStarling.removeChildStarling(this.§_-O1S§);
         }
      }
      
      public function §_-2i§(param1:GameBody, param2:Hero) : void
      {
         this.§_-j1g§ = param1 as §_-h2I§;
         this.§_-J1p§.y = this.§_-O1S§.y = -20;
         param2.heroView.§_-83v§(this.§_-O1S§);
         this.§_-R2t§ = this.§_-O1S§;
         this.§_-p1p§ = true;
         param2.heroView.§_-83v§(this.§_-J1p§);
         this.hero = param2;
         Game.stage.addEventListener(Event.EXIT_FRAME,this.onUpdate,false,0,true);
      }
      
      protected function redraw() : void
      {
         if(!this.§_-J1p§.parentStarling)
         {
            return;
         }
         this.§_-52m§.setTo(0,0);
         var _loc1_:Point = this.§_-j1g§.localToGlobal(this.§_-52m§);
         this.§_-52m§.setTo(0,0);
         var _loc2_:Point = this.§_-O1S§.localToGlobal(this.§_-52m§);
         var _loc3_:Point = _loc1_.subtract(_loc2_);
         this.§_-J1p§.getStarlingView().scaleX = (_loc3_.length - 5) / this.§_-P2R§ / this.hero.scale;
         this.§_-J1p§.getStarlingView().scaleY = _loc3_.x > 0 ? -1 : 1;
         if(this.hero != null && this.hero.scale != this.§_-J2q§)
         {
            this.§_-J2q§ = this.hero.scale;
            this.§_-J1p§.y = this.§_-R2t§.y = -20 * this.hero.scale;
         }
         this.§_-J1p§.rotation = §_-Z1S§.getAngle(_loc1_,_loc2_) - 90 + (this.§_-p1p§ ? 180 : 0) - this.§_-J1p§.parentStarling.parentStarling.rotation;
      }
      
      protected function onUpdate(param1:Event) : void
      {
         this.redraw();
      }
   }
}

