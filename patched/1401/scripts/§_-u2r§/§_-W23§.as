package §_-u2r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-e2B§;
   import §_-83V§.§_-n19§;
   import §_-83V§.§_-r1o§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   
   public class §_-W23§ extends §_-e2B§
   {
      
      public static const §_-01b§:uint = 300 / Game.§_-x2P§;
      
      public static const §_-c1F§:uint = 50 / Game.§_-x2P§;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-e2N§:int;
      
      private var §_-Fq§:§_-d2d§;
      
      public var points:Array;
      
      public function §_-W23§()
      {
         super();
         this.view = new §_-d2d§(new EasterChickenView());
         this.view.loop = true;
         this.view.play();
         §_-83v§(this.view);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.points,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.points = param1[1][0];
         this.playerId = param1[1][1];
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc8_:§_-r1o§ = null;
         super.update(param1);
         if(this.§_-e2N§ >= this.points.length)
         {
            this.§_-b16§();
            return;
         }
         var _loc2_:b2Vec2 = new b2Vec2(this.points[this.§_-e2N§].x / Game.§_-x2P§,this.points[this.§_-e2N§].y / Game.§_-x2P§);
         _loc2_.Subtract(this.position);
         var _loc3_:Number = Number(_loc2_.Length());
         if(_loc3_ <= §_-01b§ * param1)
         {
            ++this.§_-e2N§;
         }
         var _loc4_:Number = Math.min(§_-01b§ * param1,_loc3_);
         var _loc5_:Number = this.position.x + _loc4_ * _loc2_.x / _loc3_;
         var _loc6_:Number = this.position.y + _loc4_ * _loc2_.y / _loc3_;
         this.position = new b2Vec2(_loc5_,_loc6_);
         this.view.scaleX = _loc2_.x > 0 ? -1 : 1;
         if(this.playerId != Game.selfId || !this.§_-H2D§ || !this.§_-H2D§.squirrels)
         {
            return;
         }
         var _loc7_:Hero = this.§_-H2D§.squirrels.get(this.playerId);
         if(!_loc7_)
         {
            return;
         }
         for each(_loc8_ in this.§_-H2D§.map.elements)
         {
            if(_loc8_.§_-V2K§ != null)
            {
               if(_loc8_ is §_-n19§)
               {
                  _loc8_.§_-V2K§.dispatchEvent(new DetectHeroEvent(_loc7_));
               }
               else
               {
                  _loc2_ = _loc8_.position.Copy();
                  _loc2_.Subtract(this.position);
                  if(_loc2_.Length() <= §_-c1F§)
                  {
                     _loc8_.§_-V2K§.dispatchEvent(new DetectHeroEvent(_loc7_));
                  }
               }
            }
         }
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.view.visible = false;
         this.§_-Fq§ = new §_-d2d§(new EasterChickenDestroy());
         this.§_-Fq§.loop = false;
         this.§_-Fq§.play();
         this.§_-Fq§.addEventListener(Event.COMPLETE,this.§_-Hp§);
         §_-83v§(this.§_-Fq§);
      }
      
      private function §_-Hp§(param1:Event) : void
      {
         this.§_-Fq§.removeEventListener(Event.COMPLETE,this.§_-Hp§);
         if(Boolean(this.§_-Fq§) && Boolean(this.§_-Fq§.parentStarling))
         {
            removeChildStarling(this.§_-Fq§);
         }
         this.§_-Fq§ = null;
         if(!this.§_-H2D§)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

