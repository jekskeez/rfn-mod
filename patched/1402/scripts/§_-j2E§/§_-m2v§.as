package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-r21§;
   import §_-I1q§.§_-l2J§;
   import flash.events.Event;
   
   public class §_-m2v§ extends §_-92f§
   {
      
      protected var §_-Q2s§:Boolean = true;
      
      protected var §_-K1b§:Number = 0;
      
      protected var §_-L9§:§_-r21§ = null;
      
      public function §_-m2v§(param1:Hero)
      {
         super(param1);
         this.§_-L9§ = new §_-r21§(0);
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      protected function get useCooldown() : Number
      {
         return 2;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-K1b§ > 0)
         {
            this.§_-K1b§ -= param1;
            if(this.§_-K1b§ <= 0)
            {
               this.§_-W2b§();
            }
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero.game)
         {
            return;
         }
         this.hero.removeEventListener(Hero.§_-21z§,this.§_-Ue§);
         if(this.§_-Q2s§)
         {
            --this.hero.§_-d22§;
         }
         this.§_-Q2s§ = true;
         this.hero.behaviourController.removeState(this.§_-L9§);
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         ++this.hero.§_-d22§;
         this.hero.behaviourController.§_-W10§(this.§_-L9§);
         this.hero.addEventListener(Hero.§_-21z§,this.§_-Ue§);
      }
      
      protected function §_-Ue§(param1:Event) : void
      {
         if(!this.hero || !this.§_-Q2s§)
         {
            return;
         }
         --this.hero.§_-d22§;
         this.§_-Q2s§ = false;
         this.§_-K1b§ = this.useCooldown;
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc2_:§_-l2J§ = new §_-l2J§();
         _loc2_.angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         _loc2_.x = this.hero.x;
         _loc2_.y = this.hero.y + hero.§_-A1w§(new b2Vec2(0,35)).y;
         _loc2_.playerId = this.hero.id;
         this.hero.game.map.§_-TP§(_loc2_,true);
      }
      
      protected function §_-W2b§() : void
      {
         if(this.§_-Q2s§ || !this.hero)
         {
            return;
         }
         this.§_-Q2s§ = true;
         ++this.hero.§_-d22§;
      }
   }
}

