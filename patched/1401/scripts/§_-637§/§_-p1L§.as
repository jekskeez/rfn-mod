package §_-637§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8I§.HollowEvent;
   import §_-A2x§.§_-01J§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-Rn§.§_-as§;
   import §_-T2y§.§_-s1i§;
   import §_-Y22§.§_-C2x§;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-U1N§;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-p1L§ extends §_-h2I§ implements §_-J14§, §_-63Q§, §_-C2x§, §_-03u§, §_-U1N§, §_-Tm§
   {
      
      public static const §_-J2L§:int = 16777215;
      
      private static const §_-l1s§:Number = 1;
      
      private static const §_-b23§:GlowFilter = new GlowFilter(10157824,1,12,12,2);
      
      private var §_-41m§:§_-as§ = null;
      
      private var §_-j1O§:SquirrelGame;
      
      private var §_-82s§:Boolean;
      
      private var §_-A1H§:Array = [];
      
      private var §_-x1s§:Number = 0;
      
      private var §_-N26§:Hero;
      
      private var §_-L2X§:Point = new Point(0,0);
      
      public function §_-p1L§()
      {
         super();
         Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-T2E§,false,0,true);
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-31c§);
         this.touchable = false;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-82s§)
         {
            return;
         }
         this.§_-x1s§ += param1;
         if(this.§_-x1s§ < §_-l1s§)
         {
            return;
         }
         this.§_-x1s§ = 0;
         this.§_-p2u§();
      }
      
      public function §_-31c§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(§_-s1i§.instance);
         if(!_loc2_)
         {
            return;
         }
         if(this.§_-u1B§ != null && !this.§_-u1B§.isSelf)
         {
            return;
         }
         this.§_-v1D§(_loc2_);
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§ && !this.§_-82s§)
         {
            this.§_-H1B§ = null;
         }
         this.redraw();
      }
      
      public function §_-v1D§(param1:§_-e2m§) : void
      {
         var _loc4_:§_-as§ = null;
         var _loc5_:Point = null;
         if(this.§_-u1B§ != null && !this.§_-u1B§.isSelf || this.§_-82s§ || !this.§_-j1O§ || !this.§_-j1O§.map)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.§_-n2h§,param1.§_-Zv§);
         if(this.§_-L2X§.x == _loc2_.x && this.§_-L2X§.y == _loc2_.y)
         {
            return;
         }
         this.§_-L2X§ = _loc2_;
         var _loc3_:Number = §_-a9§.§_-O1z§ ? 25 : 5;
         for each(_loc4_ in this.§_-j1O§.map.get(§_-as§))
         {
            _loc5_ = _loc4_.globalToLocal(_loc2_);
            if(!(_loc5_.x < -_loc3_ || _loc5_.x > _loc3_ || _loc5_.y < -_loc3_ || _loc5_.y > _loc3_))
            {
               this.§_-H1B§ = _loc4_;
               return;
            }
         }
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         var _loc3_:b2Vec2 = null;
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
         if(!this.§_-j1O§ || !this.§_-j1O§.map || !this.§_-82s§ || this.§_-H1B§ == null)
         {
            return;
         }
         if(Boolean(this.§_-u1B§) && this.§_-u1B§.isSelf)
         {
            _loc3_ = b2Math.SubtractVV(this.§_-u1B§.position,param1);
            if(_loc3_.Length() - this.§_-j1O§.cast.radius / Game.§_-x2P§ > 0.01)
            {
               _loc3_.Normalize();
               _loc3_.Multiply(-this.§_-j1O§.cast.radius / Game.§_-x2P§);
               _loc3_.Add(this.§_-u1B§.position);
               this.position = _loc3_;
            }
         }
         var _loc2_:b2Vec2 = this.position;
         if(this.§_-H1B§.§_-m1h§.x != _loc2_.x || this.§_-H1B§.§_-m1h§.y != _loc2_.y)
         {
            this.§_-A1H§.push([getTimer(),[_loc2_.x,_loc2_.y]]);
         }
         this.§_-H1B§.active = true;
         this.§_-H1B§.§_-m1h§ = _loc2_;
         if(this.§_-A1H§.length > 0)
         {
            this.§_-x1s§ = 0;
            this.§_-p2u§();
         }
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-j1O§ = param1;
      }
      
      public function get §_-H1B§() : §_-as§
      {
         return this.§_-41m§;
      }
      
      public function set §_-H1B§(param1:§_-as§) : void
      {
         if(this.§_-41m§ == param1)
         {
            return;
         }
         if(this.§_-41m§ != null)
         {
            this.§_-41m§.§_-ds§();
         }
         this.§_-41m§ = param1;
      }
      
      public function get §_-u1B§() : Hero
      {
         return this.§_-N26§;
      }
      
      public function set §_-u1B§(param1:Hero) : void
      {
         this.§_-N26§ = param1;
         if(this.§_-N26§ == null)
         {
            return;
         }
         this.§_-N26§.addEventListener(HollowEvent.§_-63s§,this.onHollow);
      }
      
      public function §_-qB§() : void
      {
         this.§_-82s§ = true;
         this.§_-x1s§ = 0;
         if(this.§_-H1B§)
         {
            this.§_-H1B§.active = true;
         }
      }
      
      public function §_-PS§() : void
      {
         this.§_-p2u§();
         this.§_-82s§ = false;
         this.§_-x1s§ = 0;
         this.§_-H1B§ = null;
         this.§_-A1H§ = [];
         this.position = this.position;
      }
      
      public function §_-23§() : void
      {
         this.§_-p2u§();
         this.§_-82s§ = false;
         this.§_-x1s§ = 0;
         this.§_-H1B§ = null;
         this.§_-A1H§ = [];
      }
      
      public function dispose() : void
      {
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-31c§);
         this.game = null;
         this.§_-H1B§ = null;
         if(this.§_-u1B§ != null)
         {
            this.§_-u1B§.removeEventListener(HollowEvent.§_-63s§,this.onHollow);
         }
         this.§_-u1B§ = null;
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         this.removeFromParent(true);
         Game.stage.removeEventListener(Event.ENTER_FRAME,this.§_-T2E§);
      }
      
      public function §_-A1X§() : *
      {
         if(this.§_-A1H§.length == 0)
         {
            this.§_-A1H§.push([getTimer(),[this.position.x,this.position.y]]);
         }
         var _loc1_:int = Boolean(this.§_-41m§ != null) && Boolean(this.§_-j1O§) && Boolean(this.§_-j1O§.map) ? this.§_-j1O§.map.§_-F2W§(this.§_-41m§) : -1;
         var _loc2_:Array = [this.§_-82s§,_loc1_,this.§_-A1H§];
         this.§_-A1H§ = [];
         return _loc2_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         if(!this.§_-j1O§ || !this.§_-j1O§.map)
         {
            return;
         }
         var _loc2_:§_-as§ = int(param1[1]) >= 0 ? this.§_-j1O§.map.getObject(param1[1]) as §_-as§ : null;
         this.§_-H1B§ = _loc2_;
         if(_loc2_ == null)
         {
            this.§_-82s§ = false;
            return;
         }
         this.§_-82s§ = Boolean(param1[0]);
         if(this.§_-82s§)
         {
            _loc2_.active = true;
         }
         else
         {
            this.§_-H1B§ = null;
         }
         if(param1[2] is Array && param1[2].length > 0 && param1[2][0] is Array && param1[2][0][1] is Array)
         {
            this.position = new b2Vec2(param1[2][0][1][0],param1[2][0][1][1]);
         }
         if(param1[2] is Array)
         {
            _loc2_.§_-A1H§ = param1[2];
         }
      }
      
      private function onHollow(param1:HollowEvent) : void
      {
         this.dispose();
      }
      
      private function §_-p2u§() : void
      {
         if(!this.§_-j1O§ || !(this.§_-j1O§.cast is §_-01J§) || !Hero.self || this.§_-u1B§ != Hero.self || !this.§_-82s§)
         {
            return;
         }
         if(this.§_-A1H§.length == 0)
         {
            this.§_-A1H§.push([getTimer(),[this.position.x,this.position.y]]);
         }
         (this.§_-j1O§.cast as §_-01J§).§_-Li§();
      }
      
      private function redraw() : void
      {
         var _loc1_:Shape = new Shape();
         while(numChildren > 0)
         {
            §_-n2T§(0,true);
         }
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(16777215,0.2);
         _loc1_.graphics.drawCircle(0,0,10);
         _loc1_.graphics.endFill();
         _loc1_.filters = [§_-b23§];
         var _loc2_:§_-h2I§ = new §_-h2I§(_loc1_);
         _loc2_.touchable = false;
         §_-83v§(_loc2_);
         if(!this.§_-u1B§ || !this.§_-H1B§ || !this.§_-82s§)
         {
            return;
         }
         var _loc3_:Point = this.§_-u1B§.localToGlobal(new Point(this.§_-u1B§.heroView.direction ? -20 : 20,-20));
         _loc3_ = this.globalToLocal(_loc3_);
         var _loc4_:Point = this.globalToLocal(this.§_-H1B§.localToGlobal(new Point(0,0)));
         _loc1_.graphics.lineStyle(5,this.§_-u1B§.§_-xv§,0.7);
         _loc1_.graphics.moveTo(_loc3_.x,_loc3_.y);
         _loc1_.graphics.curveTo(0,0,_loc4_.x,_loc4_.y);
         _loc1_.graphics.lineStyle();
         var _loc5_:§_-h2I§ = new §_-h2I§(_loc1_);
         _loc5_.touchable = false;
         §_-83v§(_loc5_);
         this.touchable = false;
      }
      
      private function §_-T2E§(param1:Event) : void
      {
         this.redraw();
      }
   }
}

