package §_-j2E§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-f6§;
   import §_-I1q§.§_-rB§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-331§ extends §_-92f§
   {
      
      private var tornado:§_-rB§;
      
      private var view:MovieClip;
      
      private var §_-m1f§:Boolean = false;
      
      private var §_-ET§:§_-f6§;
      
      public function §_-331§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "tornado";
         this.§_-ET§ = new §_-f6§(0);
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 60;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get available() : Boolean
      {
         if(!Game.toggle)
         {
            return super.available;
         }
         return super.available && (this.active ? true : !this.hero.heroView.§_-52A§);
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:Sprite = new Sprite();
         this.view = new PharaonMagicView();
         this.view.addFrameScript(this.view.totalFrames - 1,this.§_-92C§);
         this.view.play();
         _loc1_.addChild(this.view);
         this.hero.changeView(_loc1_);
         this.hero.behaviourController.§_-W10§(this.§_-ET§);
         this.hero.body.SetLinearVelocity(new b2Vec2());
         this.hero.body.SetAngularVelocity(0);
         this.hero.angle = 0;
         this.hero.rotation = 0;
         this.hero.isStopped = true;
         this.hero.perksAvailable = false;
         this.hero.dispatchEvent(new Event(Hero.§_-N2i§));
         this.hero.dispatchEvent(new Event(Hero.§_-J2F§));
         this.§_-m1f§ = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.view)
         {
            this.view.stop();
         }
         this.view = null;
         this.§_-m1f§ = false;
         if(this.hero)
         {
            this.hero.perksAvailable = true;
         }
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.isStopped = false;
         this.hero.behaviourController.removeState(this.§_-ET§);
         this.hero.changeView();
      }
      
      private function §_-92C§() : void
      {
         if(this.view)
         {
            this.view.stop();
         }
         this.view = null;
         this.§_-m1f§ = false;
         if(!this.hero)
         {
            return;
         }
         this.hero.isStopped = false;
         if(this.hero.isDead || this.hero.inHollow || this.hero.shaman)
         {
            return;
         }
         this.hero.changeView(new Sprite());
         if(!this.hero.game || this.hero.id != Game.selfId)
         {
            return;
         }
         this.hero.body.SetLinearVelocity(new b2Vec2());
         this.hero.body.SetAngularVelocity(0);
         this.hero.angle = 0;
         this.hero.rotation = 0;
         this.tornado = new §_-rB§();
         this.tornado.playerId = this.hero.id;
         var _loc1_:b2Vec2 = this.hero.§_-11E§.Copy();
         var _loc2_:b2Vec2 = this.hero.§_-d2u§.Copy();
         _loc2_.Multiply(-5);
         _loc1_.Add(_loc2_);
         this.tornado.position = b2Math.AddVV(this.hero.position,_loc1_);
         this.hero.game.map.§_-TP§(this.tornado,true);
      }
   }
}

