package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   
   public class §_-wR§ extends §_-K17§
   {
      
      private static const §_-O1N§:int = 100;
      
      private var radius:Number;
      
      private var §_-VQ§:§_-h2I§ = null;
      
      public function §_-wR§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-C7§;
         this.radius = §_-O1N§ * (1 + §_-Nu§() / 100);
      }
      
      override public function get maxCountUse() : int
      {
         return §_-OD§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.§_-VQ§ && this.isSelf)
         {
            this.§_-VQ§ = new §_-h2I§(new PerkRadius());
            this.§_-VQ§.touchable = false;
         }
         this.§_-VQ§.scaleXY(1);
         this.§_-VQ§.scaleXY(int(this.radius * 2) / this.§_-VQ§.height);
         this.§_-VQ§.y = -Hero.§_-YH§;
         this.hero.§_-83v§(this.§_-VQ§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.§_-VQ§) && Boolean(this.§_-VQ§.parentStarling) && this.isSelf)
         {
            this.§_-VQ§.parentStarling.removeChildStarling(this.§_-VQ§,false);
         }
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_ || !this.§_-w1q§(_loc2_))
         {
            return;
         }
         super.selectedHero = param1;
         _loc2_.§_-s1§(this.hero.position);
         §_-92z§.sendMessage(_loc2_.player.id,"",§_-A1n§.§_-t1U§);
      }
      
      private function §_-w1q§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1.position.Copy());
         return _loc2_.Length() < this.radius / Game.§_-x2P§;
      }
   }
}

