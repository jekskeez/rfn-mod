package §_-8Q§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.entity.§_-L1d§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   import sounds.GameSounds;
   
   public class §_-DF§ extends §_-aS§ implements §_-hQ§, §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-L1d§, §_-Q2d§
   {
      
      private static const §_-D1F§:Number = 50 / Game.§_-12A§;
      
      private var hole0:§_-B2L§ = null;
      
      private var hole1:§_-B2L§ = null;
      
      private var world:b2World = null;
      
      private var §_-F1K§:Boolean = false;
      
      private var view:§_-aS§ = new §_-aS§(new HolesView());
      
      private var §_-91P§:§_-aS§ = new §_-aS§();
      
      private var §_-1c§:Boolean = false;
      
      public function §_-DF§()
      {
         super();
         §_-J2J§(this.§_-91P§);
         §_-J2J§(this.view);
         this.hole0 = new §_-B2L§(this);
         this.hole1 = new §_-B2L§(this);
      }
      
      override public function get rotation() : Number
      {
         return 0;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         §_-J2J§(this.§_-91P§);
         param1.add(this.hole0);
         param1.add(this.hole1);
         if(this.hole0.position.x != 0 || this.hole0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-16.15 / Game.§_-12A§,0));
         this.hole0.position = _loc2_;
         _loc2_.Add(new b2Vec2(16.15 * 2 / Game.§_-12A§,0));
         this.hole1.position = _loc2_;
         this.hole1.angle = Math.PI;
         this.showDebug = false;
         this.update();
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
         while(this.§_-91P§.numChildren > 0)
         {
            this.§_-91P§.§_-av§(0);
         }
         this.§_-91P§.removeFromParent();
         param1.remove(this.hole0);
         this.hole0.dispose();
         param1.remove(this.hole1);
         this.hole1.dispose();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
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
         this.world = param1;
         this.showDebug = false;
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.hole0.position.x,this.hole0.position.y]);
         _loc1_.push(this.hole0.angle);
         _loc1_.push([this.hole1.position.x,this.hole1.position.y]);
         _loc1_.push(this.hole1.angle);
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.hole0.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.hole0.angle = param1[1];
         this.hole1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.hole1.angle = param1[3];
      }
      
      public function dispose() : void
      {
         this.graphics.clear();
         while(this.§_-91P§.numChildren > 0)
         {
            this.§_-91P§.§_-av§(0);
         }
         this.§_-91P§.removeFromParent();
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         if(this.hole0 != null)
         {
            this.hole0.dispose();
         }
         this.hole0 = null;
         if(this.hole1 != null)
         {
            this.hole1.dispose();
         }
         this.hole1 = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc4_:b2Vec2 = null;
         var _loc5_:b2Vec2 = null;
         var _loc6_:b2Vec2 = null;
         var _loc7_:Shape = null;
         this.graphics.clear();
         if(this.visible)
         {
            this.rotation = 0;
            _loc4_ = this.hole0.position;
            _loc4_.Multiply(Game.§_-12A§);
            _loc5_ = this.hole1.position;
            _loc5_.Multiply(Game.§_-12A§);
            _loc6_ = new b2Vec2((_loc4_.x + _loc5_.x) * 0.5,(_loc4_.y + _loc5_.y) * 0.5);
            this.x = _loc6_.x;
            this.y = _loc6_.y;
            _loc4_.Subtract(_loc6_);
            _loc5_.Subtract(_loc6_);
            if(!this.§_-F1K§)
            {
               return;
            }
            _loc7_ = new Shape();
            _loc7_.graphics.lineStyle(3,8421376);
            _loc7_.graphics.moveTo(_loc4_.x,_loc4_.y);
            _loc7_.graphics.lineTo(_loc5_.x,_loc5_.y);
            while(this.§_-91P§.numChildren > 0)
            {
               this.§_-91P§.§_-av§(0);
            }
            this.§_-91P§.§_-J2J§(new §_-aS§(_loc7_));
            return;
         }
         if(!this.world || !Hero.self)
         {
            return;
         }
         var _loc2_:b2Vec2 = Hero.self.velocity.Copy();
         _loc2_.Normalize();
         var _loc3_:b2Vec2 = Hero.self.position.Copy();
         _loc3_.Subtract(this.hole0.position);
         if(_loc3_.Length() < §_-D1F§)
         {
            if(b2Math.Dot(_loc2_,this.hole0.direction) < 0)
            {
               this.§_-KL§(Hero.self,this.hole1);
            }
            return;
         }
         _loc3_ = Hero.self.position.Copy();
         _loc3_.Subtract(this.hole1.position);
         if(_loc3_.Length() < §_-D1F§)
         {
            if(b2Math.Dot(_loc2_,this.hole1.direction) < 0)
            {
               this.§_-KL§(Hero.self,this.hole0);
            }
            return;
         }
         this.§_-1c§ = false;
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
         param1.add(this.hole0);
         param1.add(this.hole1);
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.§_-F1K§ = param1;
         this.visible = param1;
         this.hole0.arrow.visible = param1;
         this.hole1.arrow.visible = param1;
         this.update();
      }
      
      private function §_-KL§(param1:Hero, param2:§_-B2L§) : void
      {
         if(this.§_-1c§)
         {
            return;
         }
         this.§_-1c§ = true;
         var _loc3_:Number = Number(param1.velocity.Length());
         param1.velocity = param2.direction;
         param1.velocity.Multiply(_loc3_);
         param1.position = param2.§_-v24§;
         param1.sendLocation(Keyboard.UP);
         param1.dispatchEvent(new Event(Hero.§_-N2i§));
         param1.dispatchEvent(new Event(Hero.§_-J2F§));
         param1.dispatchEvent(new Event(Hero.§_-y2S§));
         if(param1.id == Game.selfId || param1.id == -1)
         {
            GameSounds.play("hole");
         }
      }
   }
}

