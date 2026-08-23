package §_-A3e§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-hu§;
   import §_-83V§.GameBody;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-32M§ extends §_-C1§
   {
      
      protected var §_-V2Y§:b2Vec2 = null;
      
      protected var §_-o2b§:Boolean = false;
      
      protected var §_-c2f§:String = "";
      
      public function §_-32M§(param1:Hero)
      {
         super(param1);
         this.hero.addEventListener(Hero.§_-aj§,this.§_-62x§);
      }
      
      override public function get totalCooldown() : Number
      {
         return 25;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         this.§_-V2Y§ = param1.position.Copy();
      }
      
      private function §_-62x§(param1:Event) : void
      {
         if(this.§_-V2Y§ == null || this.§_-o2b§)
         {
            return;
         }
         if(this.hero.immortal || this.hero.behaviourController.getState(§_-hu§) != null)
         {
            return;
         }
         if(!this.hero.isSquirrel || this.hero.isDead)
         {
            return;
         }
         setTimeout(this.§_-91i§,0);
         this.hero.§_-E2§();
         Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,this.hero.id);
         this.§_-o2b§ = true;
      }
      
      private function §_-91i§() : void
      {
         this.hero.teleportTo(this.§_-V2Y§);
         this.§_-V2Y§ = null;
         this.§_-o2b§ = false;
         GameSounds.play(this.§_-c2f§);
      }
   }
}

