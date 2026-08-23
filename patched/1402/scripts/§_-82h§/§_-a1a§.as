package §_-82h§
{
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import utils.§_-iZ§;
   
   public class §_-a1a§ extends §_-aS§ implements §_-l2r§
   {
      
      private var §_-72G§:§_-aS§;
      
      private var §_-J2E§:§_-aS§;
      
      private var §_-56§:§_-aS§;
      
      private var §_-L2l§:Number;
      
      private var §_-Z2v§:Boolean;
      
      private var §_-M1Q§:Number = 1;
      
      private var §_-C29§:Hero = null;
      
      private var §_-j14§:Point = new Point();
      
      private var §_-x2P§:§_-aS§;
      
      public function §_-a1a§(param1:DisplayObject, param2:DisplayObject, param3:DisplayObject, param4:Number)
      {
         super();
         this.§_-72G§ = new §_-aS§(param1);
         this.§_-J2E§ = new §_-aS§(param2);
         this.§_-56§ = new §_-aS§(param3);
         this.§_-L2l§ = param4;
         this.§_-56§.§_-dv§ = false;
         §_-J2J§(this.§_-72G§);
         §_-J2J§(this.§_-J2E§);
         §_-J2J§(this.§_-56§);
      }
      
      override public function get alpha() : Number
      {
         return super.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-72G§.alpha = this.§_-J2E§.alpha = this.§_-56§.alpha = super.alpha = param1;
      }
      
      override public function set filters(param1:Array) : void
      {
         this.§_-72G§.filters = this.§_-J2E§.filters = this.§_-56§.filters = super.filters = param1;
      }
      
      public function §_-n1D§(param1:Hero, param2:Hero) : void
      {
         this.§_-56§.y = this.§_-J2E§.y = this.§_-72G§.y = -20;
         param1.heroView.§_-J2J§(this.§_-J2E§);
         param2.heroView.§_-J2J§(this.§_-72G§);
         if(param2.parentStarling.getChildStarlingIndex(param2) > param1.parentStarling.getChildStarlingIndex(param1))
         {
            this.§_-Z2v§ = false;
            param2.heroView.§_-J2J§(this.§_-56§);
            this.§_-C29§ = param2;
            this.§_-x2P§ = this.§_-72G§;
         }
         else
         {
            this.§_-Z2v§ = true;
            param1.heroView.§_-J2J§(this.§_-56§);
            this.§_-C29§ = param1;
            this.§_-x2P§ = this.§_-J2E§;
         }
         Game.stage.addEventListener(Event.EXIT_FRAME,this.onUpdate,false,0,true);
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
         if(this.§_-72G§.parentStarling)
         {
            this.§_-72G§.parentStarling.removeChildStarling(this.§_-72G§);
         }
      }
      
      private function redraw() : void
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
         this.§_-56§.getStarlingView().scaleX = (_loc3_.length - 5) / this.§_-L2l§;
         this.§_-56§.getStarlingView().scaleY = _loc3_.x > 0 ? -1 : 1;
         if(this.§_-C29§ != null && this.§_-C29§.scale != this.§_-M1Q§)
         {
            this.§_-M1Q§ = this.§_-C29§.scale;
            this.§_-56§.y = this.§_-x2P§.y = -20 * this.§_-C29§.scale;
         }
         this.§_-56§.rotation = §_-iZ§.getAngle(_loc1_,_loc2_) - 90 + (this.§_-Z2v§ ? 180 : 0) - this.§_-56§.parentStarling.parentStarling.rotation;
      }
      
      private function onUpdate(param1:Event) : void
      {
         this.redraw();
      }
   }
}

