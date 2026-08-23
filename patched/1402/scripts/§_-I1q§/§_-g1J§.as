package §_-I1q§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-01S§;
   import §_-8Q§.§_-7A§;
   import §_-8Q§.§_-r2M§;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import flash.events.Event;
   
   public class §_-g1J§ extends §_-7A§
   {
      
      public static const §_-Bs§:uint = 300 / Game.§_-12A§;
      
      public static const §_-A2L§:uint = 50 / Game.§_-12A§;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-x1w§:int;
      
      private var §_-23c§:§_-f1u§;
      
      public var points:Array;
      
      public function §_-g1J§()
      {
         super();
         this.view = new §_-f1u§(new EasterChickenView());
         this.view.loop = true;
         this.view.play();
         §_-J2J§(this.view);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.points,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.points = param1[1][0];
         this.playerId = param1[1][1];
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc8_:§_-r2M§ = null;
         super.update(param1);
         if(this.§_-x1w§ >= this.points.length)
         {
            this.§_-th§();
            return;
         }
         var _loc2_:b2Vec2 = new b2Vec2(this.points[this.§_-x1w§].x / Game.§_-12A§,this.points[this.§_-x1w§].y / Game.§_-12A§);
         _loc2_.Subtract(this.position);
         var _loc3_:Number = Number(_loc2_.Length());
         if(_loc3_ <= §_-Bs§ * param1)
         {
            ++this.§_-x1w§;
         }
         var _loc4_:Number = Math.min(§_-Bs§ * param1,_loc3_);
         var _loc5_:Number = this.position.x + _loc4_ * _loc2_.x / _loc3_;
         var _loc6_:Number = this.position.y + _loc4_ * _loc2_.y / _loc3_;
         this.position = new b2Vec2(_loc5_,_loc6_);
         this.view.scaleX = _loc2_.x > 0 ? -1 : 1;
         if(this.playerId != Game.selfId || !this.§_-21H§ || !this.§_-21H§.squirrels)
         {
            return;
         }
         var _loc7_:Hero = this.§_-21H§.squirrels.get(this.playerId);
         if(!_loc7_)
         {
            return;
         }
         for each(_loc8_ in this.§_-21H§.map.elements)
         {
            if(_loc8_.§_-b1J§ != null)
            {
               if(_loc8_ is §_-01S§)
               {
                  _loc8_.§_-b1J§.dispatchEvent(new DetectHeroEvent(_loc7_));
               }
               else
               {
                  _loc2_ = _loc8_.position.Copy();
                  _loc2_.Subtract(this.position);
                  if(_loc2_.Length() <= §_-A2L§)
                  {
                     _loc8_.§_-b1J§.dispatchEvent(new DetectHeroEvent(_loc7_));
                  }
               }
            }
         }
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.view.visible = false;
         this.§_-23c§ = new §_-f1u§(new EasterChickenDestroy());
         this.§_-23c§.loop = false;
         this.§_-23c§.play();
         this.§_-23c§.addEventListener(Event.COMPLETE,this.§_-w1T§);
         §_-J2J§(this.§_-23c§);
      }
      
      private function §_-w1T§(param1:Event) : void
      {
         this.§_-23c§.removeEventListener(Event.COMPLETE,this.§_-w1T§);
         if(Boolean(this.§_-23c§) && Boolean(this.§_-23c§.parentStarling))
         {
            removeChildStarling(this.§_-23c§);
         }
         this.§_-23c§ = null;
         if(!this.§_-21H§)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

