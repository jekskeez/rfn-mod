package §_-p2L§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-Cc§.§_-73t§;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-33k§ extends §_-j1k§
   {
      
      protected var §_-y1A§:b2Vec2 = null;
      
      protected var §_-BN§:Boolean = false;
      
      protected var §_-rq§:String = "";
      
      public function §_-33k§(param1:Hero)
      {
         super(param1);
         this.hero.addEventListener(Hero.§_-G0§,this.§_-L2M§);
      }
      
      override public function get totalCooldown() : Number
      {
         return 25;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         this.§_-y1A§ = param1.position.Copy();
      }
      
      private function §_-L2M§(param1:Event) : void
      {
         if(this.§_-y1A§ == null || this.§_-BN§)
         {
            return;
         }
         if(this.hero.immortal || this.hero.behaviourController.getState(§_-73t§) != null)
         {
            return;
         }
         if(!this.hero.isSquirrel || this.hero.isDead)
         {
            return;
         }
         setTimeout(this.§_-Tb§,0);
         this.hero.§_-h2e§();
         Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,this.hero.id);
         this.§_-BN§ = true;
      }
      
      private function §_-Tb§() : void
      {
         this.hero.teleportTo(this.§_-y1A§);
         this.§_-y1A§ = null;
         this.§_-BN§ = false;
         GameSounds.play(this.§_-rq§);
      }
   }
}

