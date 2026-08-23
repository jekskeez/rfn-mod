package §_-f17§
{
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import utils.§_-Z1S§;
   
   public class §_-G16§ extends §_-h2I§ implements §_-C2x§
   {
      
      private var §_-j1g§:§_-h2I§;
      
      private var §_-O1S§:§_-h2I§;
      
      private var §_-J1p§:§_-h2I§;
      
      private var §_-P2R§:Number;
      
      private var §_-p1p§:Boolean;
      
      private var §_-J2q§:Number = 1;
      
      private var §_-Q2K§:Hero = null;
      
      private var §_-52m§:Point = new Point();
      
      private var §_-R2t§:§_-h2I§;
      
      public function §_-G16§(param1:DisplayObject, param2:DisplayObject, param3:DisplayObject, param4:Number)
      {
         super();
         this.§_-j1g§ = new §_-h2I§(param1);
         this.§_-O1S§ = new §_-h2I§(param2);
         this.§_-J1p§ = new §_-h2I§(param3);
         this.§_-P2R§ = param4;
         this.§_-J1p§.§_-6i§ = false;
         §_-83v§(this.§_-j1g§);
         §_-83v§(this.§_-O1S§);
         §_-83v§(this.§_-J1p§);
      }
      
      override public function get alpha() : Number
      {
         return super.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-j1g§.alpha = this.§_-O1S§.alpha = this.§_-J1p§.alpha = super.alpha = param1;
      }
      
      override public function set filters(param1:Array) : void
      {
         this.§_-j1g§.filters = this.§_-O1S§.filters = this.§_-J1p§.filters = super.filters = param1;
      }
      
      public function §_-j1i§(param1:Hero, param2:Hero) : void
      {
         this.§_-J1p§.y = this.§_-O1S§.y = this.§_-j1g§.y = -20;
         param1.heroView.§_-83v§(this.§_-O1S§);
         param2.heroView.§_-83v§(this.§_-j1g§);
         if(param2.parentStarling.getChildStarlingIndex(param2) > param1.parentStarling.getChildStarlingIndex(param1))
         {
            this.§_-p1p§ = false;
            param2.heroView.§_-83v§(this.§_-J1p§);
            this.§_-Q2K§ = param2;
            this.§_-R2t§ = this.§_-j1g§;
         }
         else
         {
            this.§_-p1p§ = true;
            param1.heroView.§_-83v§(this.§_-J1p§);
            this.§_-Q2K§ = param1;
            this.§_-R2t§ = this.§_-O1S§;
         }
         Game.stage.addEventListener(Event.EXIT_FRAME,this.onUpdate,false,0,true);
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
         if(this.§_-j1g§.parentStarling)
         {
            this.§_-j1g§.parentStarling.removeChildStarling(this.§_-j1g§);
         }
      }
      
      private function redraw() : void
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
         this.§_-J1p§.getStarlingView().scaleX = (_loc3_.length - 5) / this.§_-P2R§;
         this.§_-J1p§.getStarlingView().scaleY = _loc3_.x > 0 ? -1 : 1;
         if(this.§_-Q2K§ != null && this.§_-Q2K§.scale != this.§_-J2q§)
         {
            this.§_-J2q§ = this.§_-Q2K§.scale;
            this.§_-J1p§.y = this.§_-R2t§.y = -20 * this.§_-Q2K§.scale;
         }
         this.§_-J1p§.rotation = §_-Z1S§.getAngle(_loc1_,_loc2_) - 90 + (this.§_-p1p§ ? 180 : 0) - this.§_-J1p§.parentStarling.parentStarling.rotation;
      }
      
      private function onUpdate(param1:Event) : void
      {
         this.redraw();
      }
   }
}

