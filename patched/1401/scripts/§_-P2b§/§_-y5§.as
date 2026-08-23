package §_-P2b§
{
   import §_-33r§.§_-hu§;
   import flash.events.Event;
   import flash.geom.Point;
   import sounds.GameSounds;
   
   public class §_-y5§ extends §_-H2N§
   {
      
      public function §_-y5§(param1:Hero)
      {
         super(param1);
         this.hero.addEventListener(Hero.§_-aj§,this.§_-62x§);
         this.§_-it§ = "moneys";
         this.§_-mw§ = true;
      }
      
      override public function get available() : Boolean
      {
         return false;
      }
      
      override protected function get packets() : Array
      {
         return [];
      }
      
      private function §_-62x§(param1:Event) : void
      {
         if(this.hero.immortal || this.hero.behaviourController.getState(§_-hu§) != null)
         {
            return;
         }
         if(this.§_-D1n§ > 0 || !this.hero.isSquirrel || this.hero.isDead)
         {
            return;
         }
         var _loc2_:SonicProtectMagicView = new SonicProtectMagicView();
         var _loc3_:Point = this.hero.getPosition();
         _loc2_.x = _loc3_.x;
         _loc2_.y = _loc3_.y;
         this.hero.game.map.userUpperSprite.addChild(_loc2_);
         GameSounds.play("sonic_spikes");
         this.hero.§_-E2§();
         ++this.§_-D1n§;
      }
   }
}

