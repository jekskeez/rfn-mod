package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-Q17§;
   import §_-u2r§.§_-ZU§;
   import flash.events.Event;
   
   public class §_-z5§ extends §_-H2N§
   {
      
      protected var §_-C2B§:Boolean = true;
      
      protected var §_-KI§:Number = 0;
      
      protected var §_-QF§:§_-Q17§ = null;
      
      public function §_-z5§(param1:Hero)
      {
         super(param1);
         this.§_-QF§ = new §_-Q17§(0);
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
         if(this.§_-KI§ > 0)
         {
            this.§_-KI§ -= param1;
            if(this.§_-KI§ <= 0)
            {
               this.§_-lj§();
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
         this.hero.removeEventListener(Hero.§_-mh§,this.§_-6X§);
         if(this.§_-C2B§)
         {
            --this.hero.§_-e2I§;
         }
         this.§_-C2B§ = true;
         this.hero.behaviourController.removeState(this.§_-QF§);
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         ++this.hero.§_-e2I§;
         this.hero.behaviourController.§_-gz§(this.§_-QF§);
         this.hero.addEventListener(Hero.§_-mh§,this.§_-6X§);
      }
      
      protected function §_-6X§(param1:Event) : void
      {
         if(!this.hero || !this.§_-C2B§)
         {
            return;
         }
         --this.hero.§_-e2I§;
         this.§_-C2B§ = false;
         this.§_-KI§ = this.useCooldown;
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc2_:§_-ZU§ = new §_-ZU§();
         _loc2_.angle = (this.hero.heroView.direction ? 0 : Math.PI) + this.hero.angle;
         _loc2_.x = this.hero.x;
         _loc2_.y = this.hero.y + hero.§_-n2Y§(new b2Vec2(0,35)).y;
         _loc2_.playerId = this.hero.id;
         this.hero.game.map.§_-nA§(_loc2_,true);
      }
      
      protected function §_-lj§() : void
      {
         if(this.§_-C2B§ || !this.hero)
         {
            return;
         }
         this.§_-C2B§ = true;
         ++this.hero.§_-e2I§;
      }
   }
}

