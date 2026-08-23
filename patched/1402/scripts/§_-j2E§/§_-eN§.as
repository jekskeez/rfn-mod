package §_-j2E§
{
   import §_-Cc§.§_-73t§;
   import flash.events.Event;
   import flash.geom.Point;
   import sounds.GameSounds;
   
   public class §_-eN§ extends §_-92f§
   {
      
      public function §_-eN§(param1:Hero)
      {
         super(param1);
         this.hero.addEventListener(Hero.§_-G0§,this.§_-L2M§);
         this.§_-S2A§ = "moneys";
         this.§_-i1J§ = true;
      }
      
      override public function get available() : Boolean
      {
         return false;
      }
      
      override protected function get packets() : Array
      {
         return [];
      }
      
      private function §_-L2M§(param1:Event) : void
      {
         if(this.hero.immortal || this.hero.behaviourController.getState(§_-73t§) != null)
         {
            return;
         }
         if(this.§_-v2d§ > 0 || !this.hero.isSquirrel || this.hero.isDead)
         {
            return;
         }
         var _loc2_:SonicProtectMagicView = new SonicProtectMagicView();
         var _loc3_:Point = this.hero.getPosition();
         _loc2_.x = _loc3_.x;
         _loc2_.y = _loc3_.y;
         this.hero.game.map.userUpperSprite.addChild(_loc2_);
         GameSounds.play("sonic_spikes");
         this.hero.§_-h2e§();
         ++this.§_-v2d§;
      }
   }
}

