package §_-I1q§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.§_-01S§;
   import §_-8Q§.§_-7A§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-r2M§;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import game.mainGame.entity.§_-L1q§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-B2H§ extends §_-7A§ implements §_-L1q§
   {
      
      public static const §_-Bs§:int = 15;
      
      public static const §_-A2L§:int = 3;
      
      public static const §_-G1s§:int = 60;
      
      private static const NONE:int = 0;
      
      private static const §_-Xw§:int = 1;
      
      private static const §_-h1F§:int = 2;
      
      private static var images:Array = null;
      
      private static var §_-8v§:Array = null;
      
      public var lifeTime:Number = 0;
      
      public var §_-G1p§:Boolean = false;
      
      private var views:Array;
      
      private var §_-42O§:Array;
      
      private var §_-A1S§:Number = 270;
      
      private var moveLeft:Boolean = false;
      
      private var moveRight:Boolean = false;
      
      private var §_-a4§:int = 0;
      
      private var §_-q2P§:§_-r2M§ = null;
      
      private var destroyed:Boolean = false;
      
      public function §_-B2H§()
      {
         var _loc2_:Class = null;
         var _loc3_:§_-f1u§ = null;
         this.views = [];
         this.§_-42O§ = [];
         super();
         if(images == null)
         {
            images = [IceDragonHead,IceDragonBody1,IceDragonBody2,IceDragonBody3,IceDragonBody4,IceDragonBody5,IceDragonBody6,IceDragonTail];
         }
         var _loc1_:int = 0;
         while(_loc1_ < images.length)
         {
            _loc2_ = images[_loc1_];
            _loc3_ = new §_-f1u§(new _loc2_());
            _loc3_.y = _loc1_ * 15;
            _loc3_.loop = true;
            _loc3_.play();
            §_-J2J§(_loc3_);
            this.views.push(_loc3_);
            this.§_-42O§.push(new Point(_loc3_.x,_loc3_.y));
            _loc1_++;
         }
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-P1D§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-A1S§ += §_-G1s§ * param1 * ((this.moveLeft ? -1 : 0) + (this.moveRight ? 1 : 0));
         var _loc2_:b2Vec2 = new b2Vec2(param1 * §_-Bs§ * Math.cos(this.§_-A1S§ * Game.D2R),param1 * §_-Bs§ * Math.sin(this.§_-A1S§ * Game.D2R));
         var _loc3_:Number = this.position.x + _loc2_.x;
         var _loc4_:Number = this.position.y + _loc2_.y;
         this.position = new b2Vec2(_loc3_,_loc4_);
         this.§_-h1U§(_loc2_);
         this.§_-zH§();
         if(this.destroyed || this.lifeTime <= 0)
         {
            return;
         }
         this.lifeTime -= param1;
         var _loc5_:Hero = this.§_-21H§.squirrels.get(this.playerId);
         if(this.lifeTime <= 0 || !_loc5_ || _loc5_.inHollow || _loc5_.isDead || _loc5_.shaman)
         {
            if(!this.§_-w1P§())
            {
               return;
            }
            this.destroyed = true;
            if(this.§_-q2P§ != null)
            {
               this.§_-q2P§.position = this.position.Copy();
               this.§_-q2P§.§_-3D§ = false;
            }
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.§_-A1S§,this.moveLeft,this.moveRight,this.§_-G1p§,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
         this.§_-A1S§ = param1[1][1];
         this.moveLeft = param1[1][2];
         this.moveRight = param1[1][3];
         this.§_-G1p§ = Boolean(param1[1][4]);
         this.lifeTime = param1[1][5];
      }
      
      override public function dispose() : void
      {
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-P1D§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         var _loc1_:Hero = this.§_-21H§.squirrels.get(this.playerId);
         if(_loc1_)
         {
            _loc1_.isStopped = false;
            _loc1_.changeView();
         }
         super.dispose();
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(this.personalId != Game.selfId)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.A:
            case Keyboard.LEFT:
               this.moveLeft = true;
               break;
            case Keyboard.D:
            case Keyboard.RIGHT:
               this.moveRight = true;
               break;
            default:
               return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"iceDragon":[this.id,this.moveLeft,this.moveRight,this.x,this.y]}));
      }
      
      private function §_-P1D§(param1:KeyboardEvent) : void
      {
         if(this.personalId != Game.selfId)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.A:
            case Keyboard.LEFT:
               this.moveLeft = false;
               break;
            case Keyboard.D:
            case Keyboard.RIGHT:
               this.moveRight = false;
               break;
            default:
               return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"iceDragon":[this.id,this.moveLeft,this.moveRight,this.x,this.y]}));
      }
      
      private function §_-zH§() : void
      {
         var _loc3_:§_-r2M§ = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:§_-O2k§ = null;
         if(this.playerId != Game.selfId || !this.§_-21H§ || !this.§_-21H§.squirrels || !this.§_-21H§.map)
         {
            return;
         }
         var _loc1_:Hero = this.§_-21H§.squirrels.get(this.playerId);
         if(!_loc1_)
         {
            return;
         }
         if(this.§_-a4§ != NONE)
         {
            _loc4_ = _loc1_.position.Copy();
            _loc4_.Subtract(this.position);
            if(_loc4_.Length() > §_-A2L§)
            {
               return;
            }
            switch(this.§_-a4§)
            {
               case §_-Xw§:
                  _loc1_.§_-I1u§(Hero.§_-43e§);
                  Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
                  break;
               case §_-h1F§:
                  if(this.§_-q2P§ == null)
                  {
                     return;
                  }
                  this.§_-q2P§.position = this.position.Copy();
                  this.§_-q2P§.§_-3D§ = false;
                  if(!this.§_-21H§.squirrels.§_-o1w§)
                  {
                     this.§_-q2P§.§_-b1J§.dispatchEvent(new DetectHeroEvent(_loc1_));
                  }
                  this.§_-q2P§ = null;
            }
            this.lifeTime = 0;
            this.destroyed = true;
            this.§_-21H§.map.§_-Y1E§(this,true);
            return;
         }
         var _loc2_:Array = this.§_-21H§.map.get(§_-O2k§);
         if(!_loc1_.§_-62F§)
         {
            for each(_loc5_ in _loc2_)
            {
               _loc4_ = _loc5_.position.Copy();
               _loc4_.Subtract(this.position);
               if(_loc4_.Length() <= §_-A2L§)
               {
                  this.§_-a4§ = §_-Xw§;
                  Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"iceDragonCarry":[this.id,-1]}));
                  this.changeView();
                  return;
               }
            }
         }
         if(!this.§_-G1p§)
         {
            return;
         }
         for each(_loc3_ in this.§_-21H§.map.elements)
         {
            if(_loc3_.§_-b1J§ != null)
            {
               _loc4_ = _loc3_.position.Copy();
               _loc4_.Subtract(this.position);
               if(_loc4_.Length() <= §_-A2L§)
               {
                  if(!(_loc3_ is §_-01S§))
                  {
                     this.§_-q2P§ = _loc3_;
                     this.§_-q2P§.§_-3D§ = true;
                     this.§_-a4§ = §_-h1F§;
                     Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"iceDragonCarry":[this.id,this.§_-q2P§.id]}));
                     this.changeView();
                     return;
                  }
                  _loc3_.§_-b1J§.dispatchEvent(new DetectHeroEvent(_loc1_));
               }
            }
         }
      }
      
      private function changeView() : void
      {
         var _loc2_:Class = null;
         var _loc3_:§_-f1u§ = null;
         if(§_-8v§ == null)
         {
            §_-8v§ = [IceDragonHeadGlow,IceDragonBody1Glow,IceDragonBody2Glow,IceDragonBody3Glow,IceDragonBody4Glow,IceDragonBody5Glow,IceDragonBody6Glow,IceDragonTailGlow];
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            _loc2_ = §_-8v§[_loc1_];
            _loc3_ = new §_-f1u§(new _loc2_());
            _loc3_.x = this.views[_loc1_].x;
            _loc3_.y = this.views[_loc1_].y;
            _loc3_.loop = true;
            _loc3_.play();
            §_-J2J§(_loc3_);
            removeChildStarling(this.views[_loc1_]);
            this.views[_loc1_] = _loc3_;
            _loc1_++;
         }
      }
      
      private function §_-h1U§(param1:b2Vec2) : void
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         this.views[0].x += param1.x * Game.§_-12A§;
         this.views[0].y += param1.y * Game.§_-12A§;
         var _loc2_:int = 1;
         while(_loc2_ < this.views.length)
         {
            _loc3_ = new Point(this.views[_loc2_ - 1].x,this.views[_loc2_ - 1].y);
            _loc4_ = new Point(this.views[_loc2_].x,this.views[_loc2_].y);
            _loc5_ = _loc4_.subtract(_loc3_);
            _loc6_ = _loc5_.length;
            if(_loc6_ == 0)
            {
               _loc7_ = 0.1;
               _loc3_.x -= _loc7_ * 0.5;
               _loc4_.x += _loc7_ * 0.5;
               _loc6_ = _loc7_;
            }
            _loc5_.normalize((15 - _loc6_) * 0.5);
            this.views[_loc2_ - 1].x -= _loc5_.x;
            this.views[_loc2_ - 1].y -= _loc5_.y;
            this.views[_loc2_].x += _loc5_.x;
            this.views[_loc2_].y += _loc5_.y;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.views.length)
         {
            _loc8_ = Number(this.views[_loc2_].x);
            _loc9_ = Number(this.views[_loc2_].y);
            this.views[_loc2_].x += this.views[_loc2_].x - this.§_-42O§[_loc2_].x;
            this.views[_loc2_].y += this.views[_loc2_].y - this.§_-42O§[_loc2_].y;
            this.§_-42O§[_loc2_].x = this.views[_loc2_].x - (this.views[_loc2_].x - _loc8_) * 0.9;
            this.§_-42O§[_loc2_].y = this.views[_loc2_].y - (this.views[_loc2_].y - _loc9_) * 0.9;
            this.views[_loc2_].rotation = this.getAngle(_loc2_) * Game.R2D - 90;
            this.views[_loc2_].x -= param1.x * Game.§_-12A§;
            this.views[_loc2_].y -= param1.y * Game.§_-12A§;
            this.§_-42O§[_loc2_].x -= param1.x * Game.§_-12A§;
            this.§_-42O§[_loc2_].y -= param1.y * Game.§_-12A§;
            _loc2_++;
         }
         this.views[0].x = 0;
         this.views[0].y = 0;
         this.§_-42O§[0].x = 0;
         this.§_-42O§[0].y = 0;
      }
      
      private function getAngle(param1:int) : Number
      {
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc2_:Point = new Point(this.views[param1].x,this.views[param1].y);
         var _loc3_:Point = new Point();
         var _loc4_:int = 0;
         if(param1 > 0)
         {
            _loc5_ = new Point(this.views[param1 - 1].x,this.views[param1 - 1].y);
            _loc3_.x += _loc5_.x - _loc2_.x;
            _loc3_.y += _loc5_.y - _loc2_.y;
            _loc4_++;
         }
         if(param1 + 1 < this.views.length)
         {
            _loc6_ = new Point(this.views[param1 + 1].x,this.views[param1 + 1].y);
            _loc3_.x += _loc2_.x - _loc6_.x;
            _loc3_.y += _loc2_.y - _loc6_.y;
            _loc4_++;
         }
         _loc3_.x /= _loc4_;
         _loc3_.y /= _loc4_;
         _loc3_.normalize(1);
         return Math.atan2(_loc3_.y,_loc3_.x);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc3_:§_-r2M§ = null;
         if(this.personalId == Game.selfId)
         {
            return;
         }
         var _loc2_:Object = param1[1];
         if("iceDragon" in _loc2_ && _loc2_["iceDragon"][0] == this.id)
         {
            this.moveLeft = _loc2_["iceDragon"][1];
            this.moveRight = _loc2_["iceDragon"][2];
            if(Math.abs(this.x - _loc2_["iceDragon"][3]) >= 30 || Math.abs(this.y - _loc2_["iceDragon"][4]) >= 30)
            {
               this.x = _loc2_["iceDragon"][3];
               this.y = _loc2_["iceDragon"][4];
            }
         }
         if("iceDragonCarry" in _loc2_ && _loc2_["iceDragonCarry"][0] == this.id)
         {
            this.changeView();
            if(_loc2_["iceDragonCarry"][1] == -1)
            {
               return;
            }
            _loc3_ = this.§_-21H§.map.getObject(_loc2_["iceDragonCarry"][1]) as §_-r2M§;
            if(_loc3_ == null)
            {
               return;
            }
            this.§_-q2P§ = _loc3_;
            this.§_-q2P§.§_-3D§ = true;
         }
      }
      
      private function §_-w1P§() : Boolean
      {
         if(this.playerId == Game.selfId)
         {
            return true;
         }
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return false;
         }
         return this.§_-21H§.squirrels.get(this.playerId) == null;
      }
   }
}

