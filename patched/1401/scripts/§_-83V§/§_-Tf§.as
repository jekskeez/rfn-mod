package §_-83V§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-A2f§;
   import sounds.GameSounds;
   
   public class §_-Tf§ extends §_-h2I§ implements §_-72o§, §_-63Q§, §_-03u§, §_-C2x§, §_-Tm§, §_-A2f§, §_-8B§
   {
      
      private static const §_-92H§:Number = 50 / Game.§_-x2P§;
      
      private var hole0:§_-pM§ = null;
      
      private var hole1:§_-pM§ = null;
      
      private var world:b2World = null;
      
      private var §_-u13§:Boolean = false;
      
      private var view:§_-h2I§ = new §_-h2I§(new HolesView());
      
      private var §_-j2k§:§_-h2I§ = new §_-h2I§();
      
      private var §_-Y0§:Boolean = false;
      
      public function §_-Tf§()
      {
         super();
         §_-83v§(this.§_-j2k§);
         §_-83v§(this.view);
         this.hole0 = new §_-pM§(this);
         this.hole1 = new §_-pM§(this);
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
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         §_-83v§(this.§_-j2k§);
         param1.add(this.hole0);
         param1.add(this.hole1);
         if(this.hole0.position.x != 0 || this.hole0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-16.15 / Game.§_-x2P§,0));
         this.hole0.position = _loc2_;
         _loc2_.Add(new b2Vec2(16.15 * 2 / Game.§_-x2P§,0));
         this.hole1.position = _loc2_;
         this.hole1.angle = Math.PI;
         this.showDebug = false;
         this.update();
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
         while(this.§_-j2k§.numChildren > 0)
         {
            this.§_-j2k§.§_-n2T§(0);
         }
         this.§_-j2k§.removeFromParent();
         param1.remove(this.hole0);
         this.hole0.dispose();
         param1.remove(this.hole1);
         this.hole1.dispose();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
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
      
      public function §_-A1X§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.hole0.position.x,this.hole0.position.y]);
         _loc1_.push(this.hole0.angle);
         _loc1_.push([this.hole1.position.x,this.hole1.position.y]);
         _loc1_.push(this.hole1.angle);
         return _loc1_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.hole0.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.hole0.angle = param1[1];
         this.hole1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.hole1.angle = param1[3];
      }
      
      public function dispose() : void
      {
         this.graphics.clear();
         while(this.§_-j2k§.numChildren > 0)
         {
            this.§_-j2k§.§_-n2T§(0);
         }
         this.§_-j2k§.removeFromParent();
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
            _loc4_.Multiply(Game.§_-x2P§);
            _loc5_ = this.hole1.position;
            _loc5_.Multiply(Game.§_-x2P§);
            _loc6_ = new b2Vec2((_loc4_.x + _loc5_.x) * 0.5,(_loc4_.y + _loc5_.y) * 0.5);
            this.x = _loc6_.x;
            this.y = _loc6_.y;
            _loc4_.Subtract(_loc6_);
            _loc5_.Subtract(_loc6_);
            if(!this.§_-u13§)
            {
               return;
            }
            _loc7_ = new Shape();
            _loc7_.graphics.lineStyle(3,8421376);
            _loc7_.graphics.moveTo(_loc4_.x,_loc4_.y);
            _loc7_.graphics.lineTo(_loc5_.x,_loc5_.y);
            while(this.§_-j2k§.numChildren > 0)
            {
               this.§_-j2k§.§_-n2T§(0);
            }
            this.§_-j2k§.§_-83v§(new §_-h2I§(_loc7_));
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
         if(_loc3_.Length() < §_-92H§)
         {
            if(b2Math.Dot(_loc2_,this.hole0.direction) < 0)
            {
               this.§_-T2c§(Hero.self,this.hole1);
            }
            return;
         }
         _loc3_ = Hero.self.position.Copy();
         _loc3_.Subtract(this.hole1.position);
         if(_loc3_.Length() < §_-92H§)
         {
            if(b2Math.Dot(_loc2_,this.hole1.direction) < 0)
            {
               this.§_-T2c§(Hero.self,this.hole0);
            }
            return;
         }
         this.§_-Y0§ = false;
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
         param1.add(this.hole0);
         param1.add(this.hole1);
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.§_-u13§ = param1;
         this.visible = param1;
         this.hole0.arrow.visible = param1;
         this.hole1.arrow.visible = param1;
         this.update();
      }
      
      private function §_-T2c§(param1:Hero, param2:§_-pM§) : void
      {
         if(this.§_-Y0§)
         {
            return;
         }
         this.§_-Y0§ = true;
         var _loc3_:Number = Number(param1.velocity.Length());
         param1.velocity = param2.direction;
         param1.velocity.Multiply(_loc3_);
         param1.position = param2.§_-a18§;
         param1.sendLocation(Keyboard.UP);
         param1.dispatchEvent(new Event(Hero.§_-g1O§));
         param1.dispatchEvent(new Event(Hero.§_-n2S§));
         param1.dispatchEvent(new Event(Hero.§_-Y1J§));
         if(param1.id == Game.selfId || param1.id == -1)
         {
            GameSounds.play("hole");
         }
      }
   }
}

