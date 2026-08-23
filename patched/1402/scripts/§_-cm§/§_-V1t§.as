package §_-cm§
{
   import Box2D.Dynamics.b2World;
   import §_-M1h§.§_-p1U§;
   import §_-TK§.§_-aS§;
   import §_-X1k§.§_-P2x§;
   import §_-X2V§.CastEvent;
   import §_-g16§.§_-w3§;
   import §_-l2u§.§_-62b§;
   import game.mainGame.§_-K1G§;
   import game.mainGame.§_-R2k§;
   import game.mainGame.§_-v1N§;
   import game.mainGame.entity.§_-f1b§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-V1t§ extends Hero implements §_-R2k§
   {
      
      public static const §_-c2Z§:int = 10;
      
      public static const §_-633§:int = 5;
      
      public static const §_-A2h§:Number = 1.45;
      
      public static const §_-91p§:Number = 2;
      
      public static const §_-hw§:Number = 0.25;
      
      public static const §_-Y5§:Number = 10;
      
      public static const §_-p1§:Number = 10;
      
      private var §_-21Q§:§_-s1m§ = new §_-s1m§();
      
      private var §_-Rh§:§_-Q2h§ = new §_-Q2h§(new GodModeImage(),1,0.5,gls("Неуязвимость"),4,3,6750207);
      
      private var §_-m2y§:§_-aS§ = new §_-aS§(new ExtraDamageImage());
      
      private var §_-B3O§:§_-Q2h§ = new §_-Q2h§(new ExtraDamageImage(),0.8,0.5,gls("Двойной урон"),1,5.5,16711680);
      
      private var §_-9s§:§_-r2F§ = new §_-r2F§();
      
      private var §_-J2Q§:uint;
      
      private var §_-61K§:Boolean = false;
      
      private var §_-w2z§:Boolean = false;
      
      private var §_-BR§:Number = 0;
      
      private var §_-A2t§:Number = 0;
      
      private var reloadTime:Number = 0;
      
      private var §_-k8§:Boolean = false;
      
      public function §_-V1t§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this.heroView.§_-P1K§ = new §_-K1G§();
         if(!(this.game is §_-cV§))
         {
            this.team = this.§_-02i§(param1);
         }
         this.jumpVelocity *= §_-A2h§;
         this.health = §_-c2Z§;
         this.§_-a1n§ = false;
         this.§_-91W§ = false;
         this.§_-21Q§.§_-i18§();
         §_-J2J§(this.§_-21Q§);
         this.§_-m2y§.x = -18;
         this.§_-m2y§.y = this.heroView.§_-P1K§.y - 60;
         this.§_-m2y§.alpha = 0.5;
         §_-J2J§(this.§_-m2y§);
         this.§_-9s§.x = this.§_-9s§.y = -30;
         addChild(this.§_-9s§);
      }
      
      private static function §_-32R§(param1:int) : int
      {
         return Math.abs(param1) % 2 == 1 ? Hero.§_-l1B§ : Hero.§_-i1Y§;
      }
      
      override public function get viewClass() : Class
      {
         return §_-A12§;
      }
      
      override public function remove() : void
      {
         super.remove();
         this.§_-21Q§.dispose();
         this.§_-21Q§.removeFromParent(true);
         this.§_-m2y§.removeFromParent();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-BR§ > 0)
         {
            this.§_-BR§ -= param1;
            this.§_-B3O§.update(100 - 100 * (this.§_-BR§ / §_-Y5§));
            if(this.§_-BR§ <= 0)
            {
               this.§_-a1n§ = false;
            }
         }
         if(this.§_-A2t§ > 0)
         {
            this.§_-A2t§ -= param1;
            this.§_-Rh§.update(100 - 100 * (this.§_-A2t§ / §_-p1§));
            this.§_-21Q§.update(this.§_-A2t§ > 6 ? 0 : (this.§_-A2t§ > 3 ? 1 : 2));
            if(this.§_-A2t§ <= 0)
            {
               this.§_-91W§ = false;
            }
         }
         this.reloadTime += param1;
         if(this.reloadTime >= §_-91p§)
         {
            this.reloadTime = 0;
            this.§_-He§();
         }
      }
      
      override public function set team(param1:int) : void
      {
         if(this.§_-6n§ == param1)
         {
            return;
         }
         super.team = param1;
         this.§_-o2V§();
      }
      
      override public function sendLocation(param1:int = 0) : void
      {
         if(this.id != Game.selfId || this.isDead || !this.§_-vs§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-D1P§,param1,this.position.x,this.position.y,this.velocity.x,this.velocity.y,this.health);
      }
      
      override public function set dead(param1:Boolean) : void
      {
         super.dead = param1;
         this.§_-a1n§ = false;
         this.§_-91W§ = false;
         this.§_-DN§();
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         this.§_-DN§();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-41q§();
      }
      
      override public function reset() : void
      {
         var _loc1_:int = this.team;
         super.reset();
         if((this.game is §_-cV§ || this.game is §_-62b§) && _loc1_ != Hero.§_-PM§)
         {
            this.team = _loc1_;
         }
         else
         {
            this.team = this.§_-02i§(this.id);
         }
         this.health = §_-c2Z§;
         this.§_-a1n§ = false;
         this.§_-91W§ = false;
         this.§_-k8§ = false;
      }
      
      override public function respawn(param1:int = 0) : void
      {
         super.respawn(param1);
         this.health = §_-c2Z§;
         this.§_-k8§ = false;
         this.§_-41q§();
      }
      
      public function get health() : int
      {
         return this.§_-J2Q§;
      }
      
      public function set health(param1:int) : void
      {
         if(this.§_-G2P§.running && param1 != §_-c2Z§)
         {
            return;
         }
         if(param1 == this.health && param1 != §_-c2Z§)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-J2Q§ > param1;
         this.§_-J2Q§ = Math.min(Math.max(param1,0),§_-c2Z§);
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.update(this.§_-J2Q§,§_-c2Z§);
         }
         if(!_loc2_)
         {
            return;
         }
         this.sendLocation();
         this.§_-9s§.play();
      }
      
      public function get §_-a1n§() : Boolean
      {
         return this.§_-61K§;
      }
      
      public function set §_-a1n§(param1:Boolean) : void
      {
         this.§_-61K§ = this.§_-m2y§.visible = param1;
         if(!this.§_-61K§)
         {
            removeBuff(this.§_-B3O§);
            this.§_-BR§ = 0;
            return;
         }
         if(this.isSelf)
         {
            §_-W1T§(this.§_-B3O§);
         }
         this.§_-BR§ = §_-Y5§;
      }
      
      public function get §_-91W§() : Boolean
      {
         return this.§_-w2z§;
      }
      
      public function set §_-91W§(param1:Boolean) : void
      {
         this.§_-w2z§ = this.§_-21Q§.visible = param1;
         if(!this.§_-w2z§)
         {
            removeBuff(this.§_-Rh§);
            this.§_-A2t§ = 0;
            return;
         }
         if(this.isSelf)
         {
            §_-W1T§(this.§_-Rh§);
         }
         this.§_-A2t§ = §_-Y5§;
      }
      
      public function §_-A1c§(param1:int, param2:int) : void
      {
         if(!(this.game is §_-cV§))
         {
            return;
         }
         if(param2 <= 0 || param1 < 0 || param1 == this.id)
         {
            return;
         }
         if(this.§_-k8§)
         {
            return;
         }
         if(param1 == Game.selfId)
         {
            this.§_-k8§ = true;
         }
      }
      
      public function get §_-N2N§() : Boolean
      {
         return this.§_-k8§;
      }
      
      private function §_-He§() : void
      {
         if(isDead)
         {
            return;
         }
         var _loc1_:§_-v1N§ = this.§_-h1z§.§_-815§(§_-w3§,§_-v1N§.§_-W29§);
         if(_loc1_ != null && _loc1_.count >= §_-633§ || this.game is §_-p1U§)
         {
            return;
         }
         this.§_-h1z§.add(new §_-v1N§(§_-w3§,§_-v1N§.§_-W29§,1));
         var _loc2_:§_-v1N§ = this.§_-h1z§.§_-815§(§_-f1b§.§_-N1m§(§_-f1b§.§_-q2W§(this.game.cast.castObject)),§_-v1N§.§_-W29§);
         if(_loc2_ == null)
         {
            return;
         }
         if(this.game.cast.castObject == null || _loc2_.count == 0)
         {
            this.game.cast.§_-ff§(new CastEvent(CastEvent.SELECT,§_-w3§));
         }
      }
      
      private function §_-DN§() : void
      {
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.visible = false;
         }
         this.§_-21Q§.visible = false;
         this.§_-m2y§.visible = false;
         this.§_-9s§.visible = false;
      }
      
      private function §_-41q§() : void
      {
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.visible = true;
         }
         this.§_-9s§.visible = true;
      }
      
      private function §_-o2V§() : void
      {
         if(!this.heroView)
         {
            return;
         }
         var _loc1_:Boolean = this.team != Hero.§_-PM§;
         var _loc2_:Boolean = this.team == Hero.§_-i1Y§;
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.§_-o1q§(_loc2_,true);
         }
         if(Boolean(!_loc1_) && Boolean(this.player) && this.player["worn"] != null)
         {
            this.heroView.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
            return;
         }
         this.heroView.setClothing([],[_loc2_ ? §_-P2x§.§_-i1Y§ : §_-P2x§.§_-l1B§]);
      }
      
      private function §_-02i§(param1:int) : int
      {
         if(this.game is §_-62b§)
         {
            return §_-32R§(param1);
         }
         if(Hero.self != null)
         {
            return param1 == Hero.§_-M1O§ ? Hero.§_-l1B§ : Hero.§_-i1Y§;
         }
         return param1 == Game.selfId ? Hero.§_-l1B§ : Hero.§_-i1Y§;
      }
   }
}

