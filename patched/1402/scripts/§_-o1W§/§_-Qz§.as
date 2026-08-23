package §_-o1W§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-j2H§.§_-31P§;
   import §_-l2u§.§_-62b§;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-Qz§ extends Hero
   {
      
      private static const §_-17§:Number = 4;
      
      public var §_-21§:Number = 0;
      
      public var first:Boolean = false;
      
      private var §_-s2o§:§_-11u§;
      
      private var §_-E2d§:§_-11u§;
      
      private var §_-53m§:Boolean = false;
      
      private var animation:MovieClip = null;
      
      public function §_-Qz§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function get viewClass() : Class
      {
         return §_-A3p§;
      }
      
      override public function set dead(param1:Boolean) : void
      {
         if(this.animation)
         {
            this.animation.visible = !param1;
         }
         if(param1 && this.§_-Gm§)
         {
            this.§_-G2P§.reset();
            this.§_-G2P§.start();
            this.§_-Y1o§();
            setTimeout(this.§_-U2H§,0);
            if(this.isSelf && !(this.game is §_-62b§))
            {
               Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"ZombieStun":this.id}));
            }
            return;
         }
         if(this.§_-s2o§)
         {
            this.§_-s2o§.view.visible = !param1;
         }
         if(this.§_-E2d§)
         {
            this.§_-E2d§.view.visible = !param1;
         }
         var _loc2_:Boolean = this.isDead;
         if(param1)
         {
            this.§_-e21§();
         }
         super.dead = param1;
         if(!param1 && _loc2_)
         {
            this.§_-e21§();
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
         this.§_-U2H§();
      }
      
      override public function get isSquirrel() : Boolean
      {
         return !(this.isDragon || this.isScrat || this.isHare || this.shaman || this.§_-Gm§ || this.§_-21§ > 0);
      }
      
      override public function get isScrat() : Boolean
      {
         return this.§_-yp§ && !this.isDragon && !this.isHare && !this.shaman && !this.§_-Gm§ && this.§_-21§ == 0;
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         if(this.§_-s2o§)
         {
            this.§_-s2o§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-s2o§);
            this.§_-s2o§ = null;
         }
         if(this.§_-E2d§)
         {
            this.§_-E2d§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-E2d§);
            this.§_-E2d§ = null;
         }
      }
      
      override public function reset() : void
      {
         this.§_-Gm§ = false;
         super.reset();
         this.§_-e21§();
         if(this.first)
         {
            this.infect(true);
         }
         this.first = false;
      }
      
      override public function get actualSpeed() : Number
      {
         if(!this.§_-Gm§)
         {
            return super.actualSpeed;
         }
         var _loc1_:§_-i11§ = this.game.squirrels as §_-i11§;
         if(_loc1_)
         {
            return super.actualSpeed * _loc1_.§_-53C§;
         }
         var _loc2_:§_-I21§ = this.game.squirrels as §_-I21§;
         if(_loc2_)
         {
            return super.actualSpeed * _loc2_.§_-53C§;
         }
         return super.actualSpeed * 1.5;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-Gm§ && this.§_-21§ <= 0 && !this.isDead)
         {
            this.§_-f2z§();
         }
         if(this.§_-21§ > 0 && !this.isDead)
         {
            this.§_-21§ -= param1;
            if(this.§_-21§ <= 0)
            {
               this.§_-e21§();
               this.§_-Gm§ = true;
            }
         }
      }
      
      public function infect(param1:Boolean = false) : void
      {
         if(this.§_-Gm§ || this.§_-21§ > 0)
         {
            return;
         }
         if(!this.first)
         {
            GameSounds.play("zombie_infect" + int(Math.random() * 3));
         }
         if(param1)
         {
            setTimeout(this.§_-U2H§,0);
         }
         this.§_-Y1o§();
      }
      
      public function get §_-Gm§() : Boolean
      {
         return this.§_-53m§;
      }
      
      public function set §_-Gm§(param1:Boolean) : void
      {
         if(param1 == this.§_-53m§)
         {
            return;
         }
         this.§_-53m§ = param1;
         this.heroView.§_-I2s§ = !param1;
         (this.heroView as §_-A3p§).§_-Gm§ = this.§_-Gm§;
         if(this.§_-Gm§)
         {
            this.viewChanged = true;
         }
         if(this.§_-s2o§)
         {
            this.§_-s2o§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-s2o§);
            this.§_-s2o§ = null;
         }
         if(this.§_-E2d§)
         {
            this.§_-E2d§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-E2d§);
            this.§_-E2d§ = null;
         }
         if(param1)
         {
            this.§_-s2o§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-PW§);
            this.§_-s2o§.view.visible = true;
            this.§_-s2o§.view.y = -10;
            this.§_-s2o§.start();
            §_-D2f§(this.§_-s2o§.view,0);
         }
         if(this.§_-Gm§ && this.isSelf)
         {
            this.perkController.§_-F1U§();
         }
      }
      
      private function §_-f2z§() : void
      {
         var _loc1_:Hero = null;
         if(this.game is §_-62b§)
         {
            for each(_loc1_ in this.game.squirrels.players)
            {
               if(!(_loc1_ == this || !this.§_-2s§(_loc1_) || !this.§_-827§(_loc1_)))
               {
                  §_-Qz§(_loc1_).infect();
               }
            }
            return;
         }
         if(this == Hero.self)
         {
            return;
         }
         if(!this.§_-2s§(Hero.self) || !this.§_-827§(Hero.self))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-U20§,this.id);
         (Hero.self as §_-Qz§).infect();
      }
      
      private function §_-2s§(param1:Hero) : Boolean
      {
         if(param1 == null || param1 == this || param1.shaman || param1.isDead)
         {
            return false;
         }
         var _loc2_:§_-Qz§ = param1 as §_-Qz§;
         if(_loc2_ == null || _loc2_.§_-Gm§ || _loc2_.§_-21§ > 0)
         {
            return false;
         }
         return this.§_-Gm§ && this.§_-21§ <= 0;
      }
      
      private function §_-827§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = param1.position.Copy();
         _loc2_.Subtract(this.position);
         return _loc2_.Length() < 4;
      }
      
      private function §_-U2H§() : void
      {
         if(!this.game || !this.game.map)
         {
            return;
         }
         this.teleportTo(this.game.map.get(§_-31P§).length > 0 ? this.game.map.get(§_-31P§)[0].position : null);
         if(this.isSelf)
         {
            sendLocation();
         }
      }
      
      private function §_-e21§() : void
      {
         this.§_-21§ = 0;
         this.§_-S2v§ = 0;
         if(this.controller)
         {
            this.controller.§_-22g§ = false;
         }
         if(this.§_-E2d§)
         {
            this.§_-E2d§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-E2d§);
            this.§_-E2d§ = null;
         }
         if(Boolean(this.animation) && Boolean(this.animation.parent))
         {
            this.heroView.removeChild(this.animation);
         }
      }
      
      private function §_-Y1o§() : void
      {
         var _loc1_:Boolean = this.§_-21§ > 0;
         this.§_-21§ = §_-17§;
         if(!_loc1_)
         {
            this.isStopped = true;
         }
         if(!this.§_-Gm§)
         {
            this.§_-E2d§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-A2o§);
            this.§_-E2d§.view.visible = !this.isDead;
            this.§_-E2d§.start();
            §_-J2J§(this.§_-E2d§.view);
         }
         if(!this.animation)
         {
            this.animation = new ZombieStunView();
            this.animation.y = -60;
         }
         this.animation.visible = !this.isDead;
         this.heroView.addChild(this.animation);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != this.id || this.isSelf)
         {
            return;
         }
         if(!("ZombieStun" in param1[1]))
         {
            return;
         }
         this.§_-Y1o§();
      }
   }
}

