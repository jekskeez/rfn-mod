package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   
   public class §_-n§ extends §_-aM§
   {
      
      private static const §_-w1v§:int = 100;
      
      private var radius:Number;
      
      private var §_-n2L§:§_-aS§ = null;
      
      public function §_-n§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-q2s§;
         this.radius = §_-w1v§ * (1 + §_-bx§() / 100);
      }
      
      override public function get maxCountUse() : int
      {
         return §_-s2t§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.§_-n2L§ && this.isSelf)
         {
            this.§_-n2L§ = new §_-aS§(new PerkRadius());
            this.§_-n2L§.touchable = false;
         }
         this.§_-n2L§.scaleXY(1);
         this.§_-n2L§.scaleXY(int(this.radius * 2) / this.§_-n2L§.height);
         this.§_-n2L§.y = -Hero.§_-a1A§;
         this.hero.§_-J2J§(this.§_-n2L§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.§_-n2L§) && Boolean(this.§_-n2L§.parentStarling) && this.isSelf)
         {
            this.§_-n2L§.parentStarling.removeChildStarling(this.§_-n2L§,false);
         }
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_ || !this.§_-s1b§(_loc2_))
         {
            return;
         }
         super.selectedHero = param1;
         _loc2_.§_-r1C§(this.hero.position);
         §_-u24§.sendMessage(_loc2_.player.id,"",§_-g1j§.§_-m2§);
      }
      
      private function §_-s1b§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1.position.Copy());
         return _loc2_.Length() < this.radius / Game.§_-12A§;
      }
   }
}

