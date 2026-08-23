package §_-TX§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-B1O§.§_-F2A§;
   import §_-Rj§.§_-A32§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-LR§ extends Hero
   {
      
      private static const §_-p2O§:Number = 4;
      
      public var §_-DE§:Number = 0;
      
      public var first:Boolean = false;
      
      private var §_-41T§:§_-f1G§;
      
      private var §_-w2g§:§_-f1G§;
      
      private var §_-45§:Boolean = false;
      
      private var animation:MovieClip = null;
      
      public function §_-LR§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function get viewClass() : Class
      {
         return §_-Ku§;
      }
      
      override public function set dead(param1:Boolean) : void
      {
         if(this.animation)
         {
            this.animation.visible = !param1;
         }
         if(param1 && this.§_-uT§)
         {
            this.§_-12l§.reset();
            this.§_-12l§.start();
            this.§_-9d§();
            setTimeout(this.§_-T1Y§,0);
            if(this.isSelf && !(this.game is §_-A32§))
            {
               Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"ZombieStun":this.id}));
            }
            return;
         }
         if(this.§_-41T§)
         {
            this.§_-41T§.view.visible = !param1;
         }
         if(this.§_-w2g§)
         {
            this.§_-w2g§.view.visible = !param1;
         }
         var _loc2_:Boolean = this.isDead;
         if(param1)
         {
            this.§_-H12§();
         }
         super.dead = param1;
         if(!param1 && _loc2_)
         {
            this.§_-H12§();
         }
      }
      
      override public function respawn(param1:int = 0) : void
      {
         if(this.first)
         {
            this.reset();
            return;
         }
         super.respawn(param1);
      }
      
      override public function teleport(param1:int, param2:b2Vec2 = null) : void
      {
         this.§_-T1Y§();
      }
      
      override public function get isSquirrel() : Boolean
      {
         return !(this.isDragon || this.isScrat || this.isHare || this.shaman || this.§_-uT§ || this.§_-DE§ > 0);
      }
      
      override public function get isScrat() : Boolean
      {
         return this.§_-t1f§ && !this.isDragon && !this.isHare && !this.shaman && !this.§_-uT§ && this.§_-DE§ == 0;
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         if(this.§_-41T§)
         {
            this.§_-41T§.stop();
            §_-93d§.instance.§_-ms§(this.§_-41T§);
            this.§_-41T§ = null;
         }
         if(this.§_-w2g§)
         {
            this.§_-w2g§.stop();
            §_-93d§.instance.§_-ms§(this.§_-w2g§);
            this.§_-w2g§ = null;
         }
      }
      
      override public function reset() : void
      {
         this.§_-uT§ = false;
         super.reset();
         this.§_-H12§();
         if(this.first)
         {
            this.infect(true);
         }
         this.first = false;
      }
      
      override public function get actualSpeed() : Number
      {
         if(!this.§_-uT§)
         {
            return super.actualSpeed;
         }
         var _loc1_:§_-uw§ = this.game.squirrels as §_-uw§;
         if(_loc1_)
         {
            return super.actualSpeed * _loc1_.§_-D2Y§;
         }
         var _loc2_:§_-I24§ = this.game.squirrels as §_-I24§;
         if(_loc2_)
         {
            return super.actualSpeed * _loc2_.§_-D2Y§;
         }
         return super.actualSpeed * 1.5;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-uT§ && this.§_-DE§ <= 0 && !this.isDead)
         {
            this.§_-33k§();
         }
         if(this.§_-DE§ > 0 && !this.isDead)
         {
            this.§_-DE§ -= param1;
            if(this.§_-DE§ <= 0)
            {
               this.§_-H12§();
               this.§_-uT§ = true;
            }
         }
      }
      
      public function infect(param1:Boolean = false) : void
      {
         if(this.§_-uT§ || this.§_-DE§ > 0)
         {
            return;
         }
         if(!this.first)
         {
            GameSounds.play("zombie_infect" + int(Math.random() * 3));
         }
         if(param1)
         {
            setTimeout(this.§_-T1Y§,0);
         }
         this.§_-9d§();
      }
      
      public function get §_-uT§() : Boolean
      {
         return this.§_-45§;
      }
      
      public function set §_-uT§(param1:Boolean) : void
      {
         if(param1 == this.§_-45§)
         {
            return;
         }
         this.§_-45§ = param1;
         this.heroView.§_-91I§ = !param1;
         (this.heroView as §_-Ku§).§_-uT§ = this.§_-uT§;
         if(this.§_-uT§)
         {
            this.viewChanged = true;
         }
         if(this.§_-41T§)
         {
            this.§_-41T§.stop();
            §_-93d§.instance.§_-ms§(this.§_-41T§);
            this.§_-41T§ = null;
         }
         if(this.§_-w2g§)
         {
            this.§_-w2g§.stop();
            §_-93d§.instance.§_-ms§(this.§_-w2g§);
            this.§_-w2g§ = null;
         }
         if(param1)
         {
            this.§_-41T§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-k1d§);
            this.§_-41T§.view.visible = true;
            this.§_-41T§.view.y = -10;
            this.§_-41T§.start();
            §_-d2R§(this.§_-41T§.view,0);
         }
         if(this.§_-uT§ && this.isSelf)
         {
            this.perkController.§_-vg§();
         }
      }
      
      private function §_-33k§() : void
      {
         var _loc1_:Hero = null;
         if(this.game is §_-A32§)
         {
            for each(_loc1_ in this.game.squirrels.players)
            {
               if(!(_loc1_ == this || !this.§_-xR§(_loc1_) || !this.§_-Q1N§(_loc1_)))
               {
                  §_-LR§(_loc1_).infect();
               }
            }
            return;
         }
         if(this == Hero.self)
         {
            return;
         }
         if(!this.§_-xR§(Hero.self) || !this.§_-Q1N§(Hero.self))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b2Z§,this.id);
         (Hero.self as §_-LR§).infect();
      }
      
      private function §_-xR§(param1:Hero) : Boolean
      {
         if(param1 == null || param1 == this || param1.shaman || param1.isDead)
         {
            return false;
         }
         var _loc2_:§_-LR§ = param1 as §_-LR§;
         if(_loc2_ == null || _loc2_.§_-uT§ || _loc2_.§_-DE§ > 0)
         {
            return false;
         }
         return this.§_-uT§ && this.§_-DE§ <= 0;
      }
      
      private function §_-Q1N§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = param1.position.Copy();
         _loc2_.Subtract(this.position);
         return _loc2_.Length() < 4;
      }
      
      private function §_-T1Y§() : void
      {
         if(!this.game || !this.game.map)
         {
            return;
         }
         this.teleportTo(this.game.map.get(§_-F2A§).length > 0 ? this.game.map.get(§_-F2A§)[0].position : null);
         if(this.isSelf)
         {
            sendLocation();
         }
      }
      
      private function §_-H12§() : void
      {
         this.§_-DE§ = 0;
         this.§_-01y§ = 0;
         if(this.controller)
         {
            this.controller.§_-i1y§ = false;
         }
         if(this.§_-w2g§)
         {
            this.§_-w2g§.stop();
            §_-93d§.instance.§_-ms§(this.§_-w2g§);
            this.§_-w2g§ = null;
         }
         if(Boolean(this.animation) && Boolean(this.animation.parent))
         {
            this.heroView.removeChild(this.animation);
         }
      }
      
      private function §_-9d§() : void
      {
         var _loc1_:Boolean = this.§_-DE§ > 0;
         this.§_-DE§ = §_-p2O§;
         if(!_loc1_)
         {
            this.isStopped = true;
         }
         if(!this.§_-uT§)
         {
            this.§_-w2g§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-k2s§);
            this.§_-w2g§.view.visible = !this.isDead;
            this.§_-w2g§.start();
            §_-83v§(this.§_-w2g§.view);
         }
         if(!this.animation)
         {
            this.animation = new ZombieStunView();
            this.animation.y = -60;
         }
         this.animation.visible = !this.isDead;
         this.heroView.addChild(this.animation);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != this.id || this.isSelf)
         {
            return;
         }
         if(!("ZombieStun" in param1[1]))
         {
            return;
         }
         this.§_-9d§();
      }
   }
}

