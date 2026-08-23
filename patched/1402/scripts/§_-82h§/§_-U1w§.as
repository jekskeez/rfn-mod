package §_-82h§
{
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.events.Event;
   import flash.geom.Point;
   import utils.§_-iZ§;
   
   public class §_-U1w§ extends §_-aS§ implements §_-l2r§
   {
      
      private var §_-72G§:§_-aS§;
      
      private var §_-J2E§:§_-aS§;
      
      private var §_-56§:§_-aS§;
      
      private var §_-L2l§:Number;
      
      private var §_-Z2v§:Boolean;
      
      private var §_-M1Q§:Number = 1;
      
      private var §_-j14§:Point = new Point();
      
      private var §_-x2P§:§_-aS§;
      
      private var hero:Hero = null;
      
      public function §_-U1w§(param1:Class = null, param2:Class = null)
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
         this.§_-J2E§ = new §_-aS§(new param1());
         this.§_-56§ = new §_-aS§(new param2());
         this.§_-L2l§ = 90.5;
         this.§_-56§.§_-dv§ = false;
         §_-J2J§(this.§_-J2E§);
         §_-J2J§(this.§_-56§);
      }
      
      override public function get alpha() : Number
      {
         return super.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-J2E§.alpha = this.§_-56§.alpha = super.alpha = param1;
      }
      
      public function dispose() : void
      {
         if(this.§_-56§.parentStarling)
         {
            this.§_-56§.parentStarling.removeChildStarling(this.§_-56§);
         }
         if(this.§_-J2E§.parentStarling)
         {
            this.§_-J2E§.parentStarling.removeChildStarling(this.§_-J2E§);
         }
      }
      
      public function §_-91w§(param1:GameBody, param2:Hero) : void
      {
         this.§_-72G§ = param1 as §_-aS§;
         this.§_-56§.y = this.§_-J2E§.y = -20;
         param2.heroView.§_-J2J§(this.§_-J2E§);
         this.§_-x2P§ = this.§_-J2E§;
         this.§_-Z2v§ = true;
         param2.heroView.§_-J2J§(this.§_-56§);
         this.hero = param2;
         Game.stage.addEventListener(Event.EXIT_FRAME,this.onUpdate,false,0,true);
      }
      
      protected function redraw() : void
      {
         if(!this.§_-56§.parentStarling)
         {
            return;
         }
         this.§_-j14§.setTo(0,0);
         var _loc1_:Point = this.§_-72G§.localToGlobal(this.§_-j14§);
         this.§_-j14§.setTo(0,0);
         var _loc2_:Point = this.§_-J2E§.localToGlobal(this.§_-j14§);
         var _loc3_:Point = _loc1_.subtract(_loc2_);
         this.§_-56§.getStarlingView().scaleX = (_loc3_.length - 5) / this.§_-L2l§ / this.hero.scale;
         this.§_-56§.getStarlingView().scaleY = _loc3_.x > 0 ? -1 : 1;
         if(this.hero != null && this.hero.scale != this.§_-M1Q§)
         {
            this.§_-M1Q§ = this.hero.scale;
            this.§_-56§.y = this.§_-x2P§.y = -20 * this.hero.scale;
         }
         this.§_-56§.rotation = §_-iZ§.getAngle(_loc1_,_loc2_) - 90 + (this.§_-Z2v§ ? 180 : 0) - this.§_-56§.parentStarling.parentStarling.rotation;
      }
      
      protected function onUpdate(param1:Event) : void
      {
         this.redraw();
      }
   }
}

