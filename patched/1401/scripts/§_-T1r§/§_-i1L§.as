package §_-T1r§
{
   import Box2D.Dynamics.b2World;
   import §_-8I§.CastEvent;
   import §_-D2k§.§_-z2u§;
   import §_-I10§.§_-g2W§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-d11§.§_-4P§;
   import game.mainGame.§_-YI§;
   import game.mainGame.§_-bM§;
   import game.mainGame.§_-v0§;
   import game.mainGame.entity.§_-03s§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-i1L§ extends Hero implements §_-v0§
   {
      
      public static const §_-V6§:int = 10;
      
      public static const §_-i1T§:int = 5;
      
      public static const §_-Z2L§:Number = 1.45;
      
      public static const §_-mc§:Number = 2;
      
      public static const §_-W2B§:Number = 0.25;
      
      public static const §_-z2A§:Number = 10;
      
      public static const §_-x8§:Number = 10;
      
      private var §_-43r§:§_-NO§ = new §_-NO§();
      
      private var §_-Lb§:§_-03i§ = new §_-03i§(new GodModeImage(),1,0.5,gls("Неуязвимость"),4,3,6750207);
      
      private var §_-VG§:§_-h2I§ = new §_-h2I§(new ExtraDamageImage());
      
      private var §_-C2Q§:§_-03i§ = new §_-03i§(new ExtraDamageImage(),0.8,0.5,gls("Двойной урон"),1,5.5,16711680);
      
      private var §_-81J§:§_-Q2L§ = new §_-Q2L§();
      
      private var §_-J2b§:uint;
      
      private var §_-O2y§:Boolean = false;
      
      private var §_-43N§:Boolean = false;
      
      private var §_-C2t§:Number = 0;
      
      private var §_-Q2y§:Number = 0;
      
      private var reloadTime:Number = 0;
      
      private var §_-K2M§:Boolean = false;
      
      public function §_-i1L§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this.heroView.§_-E2U§ = new §_-YI§();
         if(!(this.game is §_-b1U§))
         {
            this.team = this.§_-p1D§(param1);
         }
         this.jumpVelocity *= §_-Z2L§;
         this.health = §_-V6§;
         this.§_-R1o§ = false;
         this.§_-47§ = false;
         this.§_-43r§.§_-x2x§();
         §_-83v§(this.§_-43r§);
         this.§_-VG§.x = -18;
         this.§_-VG§.y = this.heroView.§_-E2U§.y - 60;
         this.§_-VG§.alpha = 0.5;
         §_-83v§(this.§_-VG§);
         this.§_-81J§.x = this.§_-81J§.y = -30;
         addChild(this.§_-81J§);
      }
      
      private static function §_-yf§(param1:int) : int
      {
         return Math.abs(param1) % 2 == 1 ? Hero.§_-17§ : Hero.§_-114§;
      }
      
      override public function get viewClass() : Class
      {
         return §_-91q§;
      }
      
      override public function remove() : void
      {
         super.remove();
         this.§_-43r§.dispose();
         this.§_-43r§.removeFromParent(true);
         this.§_-VG§.removeFromParent();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-C2t§ > 0)
         {
            this.§_-C2t§ -= param1;
            this.§_-C2Q§.update(100 - 100 * (this.§_-C2t§ / §_-z2A§));
            if(this.§_-C2t§ <= 0)
            {
               this.§_-R1o§ = false;
            }
         }
         if(this.§_-Q2y§ > 0)
         {
            this.§_-Q2y§ -= param1;
            this.§_-Lb§.update(100 - 100 * (this.§_-Q2y§ / §_-x8§));
            this.§_-43r§.update(this.§_-Q2y§ > 6 ? 0 : (this.§_-Q2y§ > 3 ? 1 : 2));
            if(this.§_-Q2y§ <= 0)
            {
               this.§_-47§ = false;
            }
         }
         this.reloadTime += param1;
         if(this.reloadTime >= §_-mc§)
         {
            this.reloadTime = 0;
            this.§_-c2x§();
         }
      }
      
      override public function set team(param1:int) : void
      {
         if(this.§_-Z3§ == param1)
         {
            return;
         }
         super.team = param1;
         this.§_-L7§();
      }
      
      override public function sendLocation(param1:int = 0) : void
      {
         if(this.id != Game.selfId || this.isDead || !this.§_-HQ§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-325§,param1,this.position.x,this.position.y,this.velocity.x,this.velocity.y,this.health);
      }
      
      override public function set dead(param1:Boolean) : void
      {
         super.dead = param1;
         this.§_-R1o§ = false;
         this.§_-47§ = false;
         this.§_-W2I§();
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         this.§_-W2I§();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-j4§();
      }
      
      override public function reset() : void
      {
         var _loc1_:int = this.team;
         super.reset();
         if((this.game is §_-b1U§ || this.game is §_-A32§) && _loc1_ != Hero.§_-JL§)
         {
            this.team = _loc1_;
         }
         else
         {
            this.team = this.§_-p1D§(this.id);
         }
         this.health = §_-V6§;
         this.§_-R1o§ = false;
         this.§_-47§ = false;
         this.§_-K2M§ = false;
      }
      
      override public function respawn(param1:int = 0) : void
      {
         super.respawn(param1);
         this.health = §_-V6§;
         this.§_-K2M§ = false;
         this.§_-j4§();
      }
      
      public function get health() : int
      {
         return this.§_-J2b§;
      }
      
      public function set health(param1:int) : void
      {
         if(this.§_-12l§.running && param1 != §_-V6§)
         {
            return;
         }
         if(param1 == this.health && param1 != §_-V6§)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-J2b§ > param1;
         this.§_-J2b§ = Math.min(Math.max(param1,0),§_-V6§);
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.update(this.§_-J2b§,§_-V6§);
         }
         if(!_loc2_)
         {
            return;
         }
         this.sendLocation();
         this.§_-81J§.play();
      }
      
      public function get §_-R1o§() : Boolean
      {
         return this.§_-O2y§;
      }
      
      public function set §_-R1o§(param1:Boolean) : void
      {
         this.§_-O2y§ = this.§_-VG§.visible = param1;
         if(!this.§_-O2y§)
         {
            removeBuff(this.§_-C2Q§);
            this.§_-C2t§ = 0;
            return;
         }
         if(this.isSelf)
         {
            §_-Aj§(this.§_-C2Q§);
         }
         this.§_-C2t§ = §_-z2A§;
      }
      
      public function get §_-47§() : Boolean
      {
         return this.§_-43N§;
      }
      
      public function set §_-47§(param1:Boolean) : void
      {
         this.§_-43N§ = this.§_-43r§.visible = param1;
         if(!this.§_-43N§)
         {
            removeBuff(this.§_-Lb§);
            this.§_-Q2y§ = 0;
            return;
         }
         if(this.isSelf)
         {
            §_-Aj§(this.§_-Lb§);
         }
         this.§_-Q2y§ = §_-z2A§;
      }
      
      public function §_-61i§(param1:int, param2:int) : void
      {
         if(!(this.game is §_-b1U§))
         {
            return;
         }
         if(param2 <= 0 || param1 < 0 || param1 == this.id)
         {
            return;
         }
         if(this.§_-K2M§)
         {
            return;
         }
         if(param1 == Game.selfId)
         {
            this.§_-K2M§ = true;
         }
      }
      
      public function get §_-p21§() : Boolean
      {
         return this.§_-K2M§;
      }
      
      private function §_-c2x§() : void
      {
         if(isDead)
         {
            return;
         }
         var _loc1_:§_-bM§ = this.§_-l2U§.§_-43X§(§_-4P§,§_-bM§.§_-t2G§);
         if(_loc1_ != null && _loc1_.count >= §_-i1T§ || this.game is §_-z2u§)
         {
            return;
         }
         this.§_-l2U§.add(new §_-bM§(§_-4P§,§_-bM§.§_-t2G§,1));
         var _loc2_:§_-bM§ = this.§_-l2U§.§_-43X§(§_-03s§.§_-F1T§(§_-03s§.§_-X21§(this.game.cast.castObject)),§_-bM§.§_-t2G§);
         if(_loc2_ == null)
         {
            return;
         }
         if(this.game.cast.castObject == null || _loc2_.count == 0)
         {
            this.game.cast.§_-52I§(new CastEvent(CastEvent.SELECT,§_-4P§));
         }
      }
      
      private function §_-W2I§() : void
      {
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.visible = false;
         }
         this.§_-43r§.visible = false;
         this.§_-VG§.visible = false;
         this.§_-81J§.visible = false;
      }
      
      private function §_-j4§() : void
      {
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.visible = true;
         }
         this.§_-81J§.visible = true;
      }
      
      private function §_-L7§() : void
      {
         if(!this.heroView)
         {
            return;
         }
         var _loc1_:Boolean = this.team != Hero.§_-JL§;
         var _loc2_:Boolean = this.team == Hero.§_-114§;
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.§_-b2f§(_loc2_,true);
         }
         if(Boolean(!_loc1_) && Boolean(this.player) && this.player["worn"] != null)
         {
            this.heroView.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
            return;
         }
         this.heroView.setClothing([],[_loc2_ ? §_-g2W§.§_-114§ : §_-g2W§.§_-17§]);
      }
      
      private function §_-p1D§(param1:int) : int
      {
         if(this.game is §_-A32§)
         {
            return §_-yf§(param1);
         }
         if(Hero.self != null)
         {
            return param1 == Hero.§_-74§ ? Hero.§_-17§ : Hero.§_-114§;
         }
         return param1 == Game.selfId ? Hero.§_-17§ : Hero.§_-114§;
      }
   }
}

