package §_-u2r§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-e2B§;
   import §_-83V§.§_-n19§;
   import §_-83V§.§_-r1o§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import game.mainGame.entity.§_-FD§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-G1D§ extends §_-e2B§ implements §_-FD§
   {
      
      public static const §_-01b§:int = 15;
      
      public static const §_-c1F§:int = 3;
      
      public static const §_-eg§:int = 60;
      
      private static const NONE:int = 0;
      
      private static const §_-62z§:int = 1;
      
      private static const §_-33i§:int = 2;
      
      private static var images:Array = null;
      
      private static var §_-u17§:Array = null;
      
      public var lifeTime:Number = 0;
      
      public var §_-V1D§:Boolean = false;
      
      private var views:Array;
      
      private var §_-m1u§:Array;
      
      private var §_-Sa§:Number = 270;
      
      private var moveLeft:Boolean = false;
      
      private var moveRight:Boolean = false;
      
      private var §_-O13§:int = 0;
      
      private var §_-v2z§:§_-r1o§ = null;
      
      private var destroyed:Boolean = false;
      
      public function §_-G1D§()
      {
         var _loc2_:Class = null;
         var _loc3_:§_-d2d§ = null;
         this.views = [];
         this.§_-m1u§ = [];
         super();
         if(images == null)
         {
            images = [IceDragonHead,IceDragonBody1,IceDragonBody2,IceDragonBody3,IceDragonBody4,IceDragonBody5,IceDragonBody6,IceDragonTail];
         }
         var _loc1_:int = 0;
         while(_loc1_ < images.length)
         {
            _loc2_ = images[_loc1_];
            _loc3_ = new §_-d2d§(new _loc2_());
            _loc3_.y = _loc1_ * 15;
            _loc3_.loop = true;
            _loc3_.play();
            §_-83v§(_loc3_);
            this.views.push(_loc3_);
            this.§_-m1u§.push(new Point(_loc3_.x,_loc3_.y));
            _loc1_++;
         }
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-91U§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-Sa§ += §_-eg§ * param1 * ((this.moveLeft ? -1 : 0) + (this.moveRight ? 1 : 0));
         var _loc2_:b2Vec2 = new b2Vec2(param1 * §_-01b§ * Math.cos(this.§_-Sa§ * Game.D2R),param1 * §_-01b§ * Math.sin(this.§_-Sa§ * Game.D2R));
         var _loc3_:Number = this.position.x + _loc2_.x;
         var _loc4_:Number = this.position.y + _loc2_.y;
         this.position = new b2Vec2(_loc3_,_loc4_);
         this.§_-FR§(_loc2_);
         this.§_-X1K§();
         if(this.destroyed || this.lifeTime <= 0)
         {
            return;
         }
         this.lifeTime -= param1;
         var _loc5_:Hero = this.§_-H2D§.squirrels.get(this.playerId);
         if(this.lifeTime <= 0 || !_loc5_ || _loc5_.inHollow || _loc5_.isDead || _loc5_.shaman)
         {
            if(!this.§_-GV§())
            {
               return;
            }
            this.destroyed = true;
            if(this.§_-v2z§ != null)
            {
               this.§_-v2z§.position = this.position.Copy();
               this.§_-v2z§.§_-c20§ = false;
            }
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.§_-Sa§,this.moveLeft,this.moveRight,this.§_-V1D§,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
         this.§_-Sa§ = param1[1][1];
         this.moveLeft = param1[1][2];
         this.moveRight = param1[1][3];
         this.§_-V1D§ = Boolean(param1[1][4]);
         this.lifeTime = param1[1][5];
      }
      
      override public function dispose() : void
      {
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-91U§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         var _loc1_:Hero = this.§_-H2D§.squirrels.get(this.playerId);
         if(_loc1_)
         {
            _loc1_.isStopped = false;
            _loc1_.changeView();
         }
         super.dispose();
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
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
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"iceDragon":[this.id,this.moveLeft,this.moveRight,this.x,this.y]}));
      }
      
      private function §_-91U§(param1:KeyboardEvent) : void
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
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"iceDragon":[this.id,this.moveLeft,this.moveRight,this.x,this.y]}));
      }
      
      private function §_-X1K§() : void
      {
         var _loc3_:§_-r1o§ = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:§_-P2o§ = null;
         if(this.playerId != Game.selfId || !this.§_-H2D§ || !this.§_-H2D§.squirrels || !this.§_-H2D§.map)
         {
            return;
         }
         var _loc1_:Hero = this.§_-H2D§.squirrels.get(this.playerId);
         if(!_loc1_)
         {
            return;
         }
         if(this.§_-O13§ != NONE)
         {
            _loc4_ = _loc1_.position.Copy();
            _loc4_.Subtract(this.position);
            if(_loc4_.Length() > §_-c1F§)
            {
               return;
            }
            switch(this.§_-O13§)
            {
               case §_-62z§:
                  _loc1_.§_-4j§(Hero.§_-517§);
                  Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
                  break;
               case §_-33i§:
                  if(this.§_-v2z§ == null)
                  {
                     return;
                  }
                  this.§_-v2z§.position = this.position.Copy();
                  this.§_-v2z§.§_-c20§ = false;
                  if(!this.§_-H2D§.squirrels.§_-g14§)
                  {
                     this.§_-v2z§.§_-V2K§.dispatchEvent(new DetectHeroEvent(_loc1_));
                  }
                  this.§_-v2z§ = null;
            }
            this.lifeTime = 0;
            this.destroyed = true;
            this.§_-H2D§.map.§_-Qc§(this,true);
            return;
         }
         var _loc2_:Array = this.§_-H2D§.map.get(§_-P2o§);
         if(!_loc1_.§_-426§)
         {
            for each(_loc5_ in _loc2_)
            {
               _loc4_ = _loc5_.position.Copy();
               _loc4_.Subtract(this.position);
               if(_loc4_.Length() <= §_-c1F§)
               {
                  this.§_-O13§ = §_-62z§;
                  Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"iceDragonCarry":[this.id,-1]}));
                  this.changeView();
                  return;
               }
            }
         }
         if(!this.§_-V1D§)
         {
            return;
         }
         for each(_loc3_ in this.§_-H2D§.map.elements)
         {
            if(_loc3_.§_-V2K§ != null)
            {
               _loc4_ = _loc3_.position.Copy();
               _loc4_.Subtract(this.position);
               if(_loc4_.Length() <= §_-c1F§)
               {
                  if(!(_loc3_ is §_-n19§))
                  {
                     this.§_-v2z§ = _loc3_;
                     this.§_-v2z§.§_-c20§ = true;
                     this.§_-O13§ = §_-33i§;
                     Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"iceDragonCarry":[this.id,this.§_-v2z§.id]}));
                     this.changeView();
                     return;
                  }
                  _loc3_.§_-V2K§.dispatchEvent(new DetectHeroEvent(_loc1_));
               }
            }
         }
      }
      
      private function changeView() : void
      {
         var _loc2_:Class = null;
         var _loc3_:§_-d2d§ = null;
         if(§_-u17§ == null)
         {
            §_-u17§ = [IceDragonHeadGlow,IceDragonBody1Glow,IceDragonBody2Glow,IceDragonBody3Glow,IceDragonBody4Glow,IceDragonBody5Glow,IceDragonBody6Glow,IceDragonTailGlow];
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.views.length)
         {
            _loc2_ = §_-u17§[_loc1_];
            _loc3_ = new §_-d2d§(new _loc2_());
            _loc3_.x = this.views[_loc1_].x;
            _loc3_.y = this.views[_loc1_].y;
            _loc3_.loop = true;
            _loc3_.play();
            §_-83v§(_loc3_);
            removeChildStarling(this.views[_loc1_]);
            this.views[_loc1_] = _loc3_;
            _loc1_++;
         }
      }
      
      private function §_-FR§(param1:b2Vec2) : void
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         this.views[0].x += param1.x * Game.§_-x2P§;
         this.views[0].y += param1.y * Game.§_-x2P§;
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
            this.views[_loc2_].x += this.views[_loc2_].x - this.§_-m1u§[_loc2_].x;
            this.views[_loc2_].y += this.views[_loc2_].y - this.§_-m1u§[_loc2_].y;
            this.§_-m1u§[_loc2_].x = this.views[_loc2_].x - (this.views[_loc2_].x - _loc8_) * 0.9;
            this.§_-m1u§[_loc2_].y = this.views[_loc2_].y - (this.views[_loc2_].y - _loc9_) * 0.9;
            this.views[_loc2_].rotation = this.getAngle(_loc2_) * Game.R2D - 90;
            this.views[_loc2_].x -= param1.x * Game.§_-x2P§;
            this.views[_loc2_].y -= param1.y * Game.§_-x2P§;
            this.§_-m1u§[_loc2_].x -= param1.x * Game.§_-x2P§;
            this.§_-m1u§[_loc2_].y -= param1.y * Game.§_-x2P§;
            _loc2_++;
         }
         this.views[0].x = 0;
         this.views[0].y = 0;
         this.§_-m1u§[0].x = 0;
         this.§_-m1u§[0].y = 0;
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
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc3_:§_-r1o§ = null;
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
            _loc3_ = this.§_-H2D§.map.getObject(_loc2_["iceDragonCarry"][1]) as §_-r1o§;
            if(_loc3_ == null)
            {
               return;
            }
            this.§_-v2z§ = _loc3_;
            this.§_-v2z§.§_-c20§ = true;
         }
      }
      
      private function §_-GV§() : Boolean
      {
         if(this.playerId == Game.selfId)
         {
            return true;
         }
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return false;
         }
         return this.§_-H2D§.squirrels.get(this.playerId) == null;
      }
   }
}

