package §_-F5§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-l1g§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.HollowEvent;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-td§.§_-z2w§;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-L1Q§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-63c§ extends §_-aS§ implements §_-Q1r§, §_-xn§, §_-l2r§, §_-3l§, §_-L1Q§, §_-F1c§
   {
      
      public static const §_-B1T§:int = 16777215;
      
      private static const §_-C11§:Number = 1;
      
      private static const §_-21n§:GlowFilter = new GlowFilter(10157824,1,12,12,2);
      
      private var §_-o1V§:§_-l1g§ = null;
      
      private var §_-Y2e§:SquirrelGame;
      
      private var §_-Q25§:Boolean;
      
      private var §_-y2X§:Array = [];
      
      private var §_-jK§:Number = 0;
      
      private var §_-X2y§:Hero;
      
      private var §_-au§:Point = new Point(0,0);
      
      public function §_-63c§()
      {
         super();
         Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-C2m§,false,0,true);
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-3X§);
         this.touchable = false;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-Q25§)
         {
            return;
         }
         this.§_-jK§ += param1;
         if(this.§_-jK§ < §_-C11§)
         {
            return;
         }
         this.§_-jK§ = 0;
         this.§_-03W§();
      }
      
      public function §_-3X§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(§_-817§.instance);
         if(!_loc2_)
         {
            return;
         }
         if(this.§_-P1X§ != null && !this.§_-P1X§.isSelf)
         {
            return;
         }
         this.§_-n1o§(_loc2_);
         if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§ && !this.§_-Q25§)
         {
            this.§_-B2e§ = null;
         }
         this.redraw();
      }
      
      public function §_-n1o§(param1:§_-J1a§) : void
      {
         var _loc4_:§_-l1g§ = null;
         var _loc5_:Point = null;
         if(this.§_-P1X§ != null && !this.§_-P1X§.isSelf || this.§_-Q25§ || !this.§_-Y2e§ || !this.§_-Y2e§.map)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.§_-ca§,param1.§_-n2z§);
         if(this.§_-au§.x == _loc2_.x && this.§_-au§.y == _loc2_.y)
         {
            return;
         }
         this.§_-au§ = _loc2_;
         var _loc3_:Number = §_-Zy§.§_-e2k§ ? 25 : 5;
         for each(_loc4_ in this.§_-Y2e§.map.get(§_-l1g§))
         {
            _loc5_ = _loc4_.globalToLocal(_loc2_);
            if(!(_loc5_.x < -_loc3_ || _loc5_.x > _loc3_ || _loc5_.y < -_loc3_ || _loc5_.y > _loc3_))
            {
               this.§_-B2e§ = _loc4_;
               return;
            }
         }
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         var _loc3_:b2Vec2 = null;
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
         if(!this.§_-Y2e§ || !this.§_-Y2e§.map || !this.§_-Q25§ || this.§_-B2e§ == null)
         {
            return;
         }
         if(Boolean(this.§_-P1X§) && this.§_-P1X§.isSelf)
         {
            _loc3_ = b2Math.SubtractVV(this.§_-P1X§.position,param1);
            if(_loc3_.Length() - this.§_-Y2e§.cast.radius / Game.§_-12A§ > 0.01)
            {
               _loc3_.Normalize();
               _loc3_.Multiply(-this.§_-Y2e§.cast.radius / Game.§_-12A§);
               _loc3_.Add(this.§_-P1X§.position);
               this.position = _loc3_;
            }
         }
         var _loc2_:b2Vec2 = this.position;
         if(this.§_-B2e§.§_-y2P§.x != _loc2_.x || this.§_-B2e§.§_-y2P§.y != _loc2_.y)
         {
            this.§_-y2X§.push([getTimer(),[_loc2_.x,_loc2_.y]]);
         }
         this.§_-B2e§.active = true;
         this.§_-B2e§.§_-y2P§ = _loc2_;
         if(this.§_-y2X§.length > 0)
         {
            this.§_-jK§ = 0;
            this.§_-03W§();
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
         this.§_-Y2e§ = param1;
      }
      
      public function get §_-B2e§() : §_-l1g§
      {
         return this.§_-o1V§;
      }
      
      public function set §_-B2e§(param1:§_-l1g§) : void
      {
         if(this.§_-o1V§ == param1)
         {
            return;
         }
         if(this.§_-o1V§ != null)
         {
            this.§_-o1V§.§_-B3U§();
         }
         this.§_-o1V§ = param1;
      }
      
      public function get §_-P1X§() : Hero
      {
         return this.§_-X2y§;
      }
      
      public function set §_-P1X§(param1:Hero) : void
      {
         this.§_-X2y§ = param1;
         if(this.§_-X2y§ == null)
         {
            return;
         }
         this.§_-X2y§.addEventListener(HollowEvent.§_-h1g§,this.onHollow);
      }
      
      public function §_-03o§() : void
      {
         this.§_-Q25§ = true;
         this.§_-jK§ = 0;
         if(this.§_-B2e§)
         {
            this.§_-B2e§.active = true;
         }
      }
      
      public function §_-t2Q§() : void
      {
         this.§_-03W§();
         this.§_-Q25§ = false;
         this.§_-jK§ = 0;
         this.§_-B2e§ = null;
         this.§_-y2X§ = [];
         this.position = this.position;
      }
      
      public function §_-Va§() : void
      {
         this.§_-03W§();
         this.§_-Q25§ = false;
         this.§_-jK§ = 0;
         this.§_-B2e§ = null;
         this.§_-y2X§ = [];
      }
      
      public function dispose() : void
      {
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-3X§);
         this.game = null;
         this.§_-B2e§ = null;
         if(this.§_-P1X§ != null)
         {
            this.§_-P1X§.removeEventListener(HollowEvent.§_-h1g§,this.onHollow);
         }
         this.§_-P1X§ = null;
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         this.removeFromParent(true);
         Game.stage.removeEventListener(Event.ENTER_FRAME,this.§_-C2m§);
      }
      
      public function §_-m1Y§() : *
      {
         if(this.§_-y2X§.length == 0)
         {
            this.§_-y2X§.push([getTimer(),[this.position.x,this.position.y]]);
         }
         var _loc1_:int = Boolean(this.§_-o1V§ != null) && Boolean(this.§_-Y2e§) && Boolean(this.§_-Y2e§.map) ? this.§_-Y2e§.map.§_-923§(this.§_-o1V§) : -1;
         var _loc2_:Array = [this.§_-Q25§,_loc1_,this.§_-y2X§];
         this.§_-y2X§ = [];
         return _loc2_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         if(!this.§_-Y2e§ || !this.§_-Y2e§.map)
         {
            return;
         }
         var _loc2_:§_-l1g§ = int(param1[1]) >= 0 ? this.§_-Y2e§.map.getObject(param1[1]) as §_-l1g§ : null;
         this.§_-B2e§ = _loc2_;
         if(_loc2_ == null)
         {
            this.§_-Q25§ = false;
            return;
         }
         this.§_-Q25§ = Boolean(param1[0]);
         if(this.§_-Q25§)
         {
            _loc2_.active = true;
         }
         else
         {
            this.§_-B2e§ = null;
         }
         if(param1[2] is Array && param1[2].length > 0 && param1[2][0] is Array && param1[2][0][1] is Array)
         {
            this.position = new b2Vec2(param1[2][0][1][0],param1[2][0][1][1]);
         }
         if(param1[2] is Array)
         {
            _loc2_.§_-y2X§ = param1[2];
         }
      }
      
      private function onHollow(param1:HollowEvent) : void
      {
         this.dispose();
      }
      
      private function §_-03W§() : void
      {
         if(!this.§_-Y2e§ || !(this.§_-Y2e§.cast is §_-z2w§) || !Hero.self || this.§_-P1X§ != Hero.self || !this.§_-Q25§)
         {
            return;
         }
         if(this.§_-y2X§.length == 0)
         {
            this.§_-y2X§.push([getTimer(),[this.position.x,this.position.y]]);
         }
         (this.§_-Y2e§.cast as §_-z2w§).§_-e2T§();
      }
      
      private function redraw() : void
      {
         var _loc1_:Shape = new Shape();
         while(numChildren > 0)
         {
            §_-av§(0,true);
         }
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(16777215,0.2);
         _loc1_.graphics.drawCircle(0,0,10);
         _loc1_.graphics.endFill();
         _loc1_.filters = [§_-21n§];
         var _loc2_:§_-aS§ = new §_-aS§(_loc1_);
         _loc2_.touchable = false;
         §_-J2J§(_loc2_);
         if(!this.§_-P1X§ || !this.§_-B2e§ || !this.§_-Q25§)
         {
            return;
         }
         var _loc3_:Point = this.§_-P1X§.localToGlobal(new Point(this.§_-P1X§.heroView.direction ? -20 : 20,-20));
         _loc3_ = this.globalToLocal(_loc3_);
         var _loc4_:Point = this.globalToLocal(this.§_-B2e§.localToGlobal(new Point(0,0)));
         _loc1_.graphics.lineStyle(5,this.§_-P1X§.§_-11F§,0.7);
         _loc1_.graphics.moveTo(_loc3_.x,_loc3_.y);
         _loc1_.graphics.curveTo(0,0,_loc4_.x,_loc4_.y);
         _loc1_.graphics.lineStyle();
         var _loc5_:§_-aS§ = new §_-aS§(_loc1_);
         _loc5_.touchable = false;
         §_-J2J§(_loc5_);
         this.touchable = false;
      }
      
      private function §_-C2m§(param1:Event) : void
      {
         this.redraw();
      }
   }
}

