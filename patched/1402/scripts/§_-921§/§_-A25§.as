package §_-921§
{
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-j2E§.§_-A11§;
   import com.api.Player;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-K1G§;
   
   public class §_-A25§ extends Hero
   {
      
      private static const §_-RJ§:int = 30;
      
      private static const §_-P2h§:int = 35;
      
      private static const §_-lM§:int = 45;
      
      public var §_-F16§:Boolean = false;
      
      public var §_-81F§:Boolean = false;
      
      private var §_-q9§:int = 0;
      
      private var §_-g26§:int;
      
      private var §_-b2b§:§_-aS§;
      
      private var §_-N1u§:Boolean = false;
      
      public function §_-A25§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this.§_-g26§ = this.§_-3A§;
         if(this.isSelf)
         {
            this.heroView.§_-P1K§ = new §_-K1G§(false,true);
            this.§_-h1G§ = false;
         }
         this.§_-b2b§ = new §_-aS§(new WaterAura());
         this.§_-b2b§.touchable = false;
         this.§_-b2b§.visible = false;
         (this.world.userData as SquirrelGame).§_-J2J§(this.§_-b2b§);
      }
      
      override public function remove() : void
      {
         if(this.§_-b2b§.parentStarling)
         {
            this.§_-b2b§.removeChildStarling(this.§_-b2b§);
         }
         super.remove();
      }
      
      override public function reset() : void
      {
         super.reset();
         this.§_-5I§();
      }
      
      override public function respawn(param1:int = 0) : void
      {
         super.respawn(param1);
         this.§_-5I§();
      }
      
      override public function set shaman(param1:Boolean) : void
      {
         super.shaman = param1;
         this.§_-i23§();
      }
      
      override public function set dead(param1:Boolean) : void
      {
         super.dead = param1;
         this.§_-i23§();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-i23§();
      }
      
      override public function hide(param1:Boolean = false) : void
      {
         super.hide(param1);
         this.§_-i23§();
      }
      
      public function set §_-h1G§(param1:Boolean) : void
      {
         this.§_-q9§ = param1 ? int(Math.max(0,this.§_-q9§ - 1)) : this.§_-g26§;
         if(this.§_-q9§ <= this.§_-g26§ * 0.5)
         {
            this.§_-F16§ = true;
         }
         if(!param1)
         {
            this.§_-81F§ = true;
         }
         if(this.§_-q9§ == 0)
         {
            this.§_-b2d§ = Hero.§_-gR§;
            this.dead = true;
         }
         else if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.update(this.§_-q9§,this.§_-g26§);
         }
      }
      
      override protected function §_-l1n§() : void
      {
         super.§_-l1n§();
         if(!this.§_-b2b§ || !this.§_-b2b§.visible)
         {
            return;
         }
         var _loc1_:Point = (this.world.userData as SquirrelGame).globalToLocal(this.localToGlobal(new Point(-240,this.heroView.y - 250)));
         this.§_-b2b§.x = _loc1_.x;
         this.§_-b2b§.y = _loc1_.y;
         this.§_-b2b§.rotation = this.rotation;
      }
      
      override protected function §_-K16§(param1:Player) : void
      {
         super.§_-K16§(param1);
         if(param1.worn == null)
         {
            return;
         }
         this.§_-N1u§ = this.perkController.§_-S1Q§(§_-A11§.§_-u11§) != -1;
         this.§_-g26§ = this.§_-3A§;
      }
      
      private function get §_-3A§() : int
      {
         if(this.isDragon)
         {
            return §_-P2h§ / §_-x1c§.§_-K27§;
         }
         if(this.§_-N1u§ && this.isSquirrel)
         {
            return §_-lM§ / §_-x1c§.§_-K27§;
         }
         return §_-RJ§ / §_-x1c§.§_-K27§;
      }
      
      private function §_-5I§() : void
      {
         this.§_-h1G§ = false;
         this.§_-F16§ = false;
         this.§_-81F§ = false;
      }
      
      private function §_-i23§() : void
      {
         if(this.heroView.§_-P1K§)
         {
            this.heroView.§_-P1K§.visible = !this.shaman && this.heroView.visible && !this.isDead && !this.isHare;
         }
         if(this.§_-b2b§)
         {
            this.§_-b2b§.visible = this.shaman && this.heroView.visible && !this.isDead;
         }
      }
   }
}

