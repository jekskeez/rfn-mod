package §_-qJ§
{
   import Box2D.Dynamics.b2World;
   import §_-P2b§.§_-6L§;
   import §_-RI§.§_-h2I§;
   import com.api.Player;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-YI§;
   
   public class §_-w1I§ extends Hero
   {
      
      private static const §_-gG§:int = 30;
      
      private static const §_-i1p§:int = 35;
      
      private static const §_-B2x§:int = 45;
      
      public var §_-c2d§:Boolean = false;
      
      public var §_-b1x§:Boolean = false;
      
      private var §_-hR§:int = 0;
      
      private var §_-c1z§:int;
      
      private var §_-r2L§:§_-h2I§;
      
      private var §_-210§:Boolean = false;
      
      public function §_-w1I§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this.§_-c1z§ = this.§_-Q2M§;
         if(this.isSelf)
         {
            this.heroView.§_-E2U§ = new §_-YI§(false,true);
            this.§_-j2T§ = false;
         }
         this.§_-r2L§ = new §_-h2I§(new WaterAura());
         this.§_-r2L§.touchable = false;
         this.§_-r2L§.visible = false;
         (this.world.userData as SquirrelGame).§_-83v§(this.§_-r2L§);
      }
      
      override public function remove() : void
      {
         if(this.§_-r2L§.parentStarling)
         {
            this.§_-r2L§.removeChildStarling(this.§_-r2L§);
         }
         super.remove();
      }
      
      override public function reset() : void
      {
         super.reset();
         this.§_-41z§();
      }
      
      override public function respawn(param1:int = 0) : void
      {
         super.respawn(param1);
         this.§_-41z§();
      }
      
      override public function set shaman(param1:Boolean) : void
      {
         super.shaman = param1;
         this.§_-Qz§();
      }
      
      override public function set dead(param1:Boolean) : void
      {
         super.dead = param1;
         this.§_-Qz§();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-Qz§();
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         this.§_-Qz§();
      }
      
      public function set §_-j2T§(param1:Boolean) : void
      {
         this.§_-hR§ = param1 ? int(Math.max(0,this.§_-hR§ - 1)) : this.§_-c1z§;
         if(this.§_-hR§ <= this.§_-c1z§ * 0.5)
         {
            this.§_-c2d§ = true;
         }
         if(!param1)
         {
            this.§_-b1x§ = true;
         }
         if(this.§_-hR§ == 0)
         {
            this.§_-L1A§ = Hero.§_-S1O§;
            this.dead = true;
         }
         else if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.update(this.§_-hR§,this.§_-c1z§);
         }
      }
      
      override protected function §_-9q§() : void
      {
         super.§_-9q§();
         if(!this.§_-r2L§ || !this.§_-r2L§.visible)
         {
            return;
         }
         var _loc1_:Point = (this.world.userData as SquirrelGame).globalToLocal(this.localToGlobal(new Point(-240,this.heroView.y - 250)));
         this.§_-r2L§.x = _loc1_.x;
         this.§_-r2L§.y = _loc1_.y;
         this.§_-r2L§.rotation = this.rotation;
      }
      
      override protected function §_-rF§(param1:Player) : void
      {
         super.§_-rF§(param1);
         if(param1.worn == null)
         {
            return;
         }
         this.§_-210§ = this.perkController.§_-e4§(§_-6L§.§_-61p§) != -1;
         this.§_-c1z§ = this.§_-Q2M§;
      }
      
      private function get §_-Q2M§() : int
      {
         if(this.isDragon)
         {
            return §_-i1p§ / §_-z1C§.§_-n2L§;
         }
         if(this.§_-210§ && this.isSquirrel)
         {
            return §_-B2x§ / §_-z1C§.§_-n2L§;
         }
         return §_-gG§ / §_-z1C§.§_-n2L§;
      }
      
      private function §_-41z§() : void
      {
         this.§_-j2T§ = false;
         this.§_-c2d§ = false;
         this.§_-b1x§ = false;
      }
      
      private function §_-Qz§() : void
      {
         if(this.heroView.§_-E2U§)
         {
            this.heroView.§_-E2U§.visible = !this.shaman && this.heroView.visible && !this.isDead && !this.isHare;
         }
         if(this.§_-r2L§)
         {
            this.§_-r2L§.visible = this.shaman && this.heroView.visible && !this.isDead;
         }
      }
   }
}

