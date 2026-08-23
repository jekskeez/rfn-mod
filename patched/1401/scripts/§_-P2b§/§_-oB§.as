package §_-P2b§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-b2w§;
   import §_-u2r§.§_-vI§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-oB§ extends §_-H2N§
   {
      
      private var tornado:§_-vI§;
      
      private var view:MovieClip;
      
      private var §_-a2s§:Boolean = false;
      
      private var §_-r2Z§:§_-b2w§;
      
      public function §_-oB§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "tornado";
         this.§_-r2Z§ = new §_-b2w§(0);
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
         return super.available && (this.active ? true : !this.hero.heroView.§_-k2P§);
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:Sprite = new Sprite();
         this.view = new PharaonMagicView();
         this.view.addFrameScript(this.view.totalFrames - 1,this.§_-t23§);
         this.view.play();
         _loc1_.addChild(this.view);
         this.hero.changeView(_loc1_);
         this.hero.behaviourController.§_-gz§(this.§_-r2Z§);
         this.hero.body.SetLinearVelocity(new b2Vec2());
         this.hero.body.SetAngularVelocity(0);
         this.hero.angle = 0;
         this.hero.rotation = 0;
         this.hero.isStopped = true;
         this.hero.perksAvailable = false;
         this.hero.dispatchEvent(new Event(Hero.§_-g1O§));
         this.hero.dispatchEvent(new Event(Hero.§_-n2S§));
         this.§_-a2s§ = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.view)
         {
            this.view.stop();
         }
         this.view = null;
         this.§_-a2s§ = false;
         if(this.hero)
         {
            this.hero.perksAvailable = true;
         }
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.isStopped = false;
         this.hero.behaviourController.removeState(this.§_-r2Z§);
         this.hero.changeView();
      }
      
      private function §_-t23§() : void
      {
         if(this.view)
         {
            this.view.stop();
         }
         this.view = null;
         this.§_-a2s§ = false;
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
         this.tornado = new §_-vI§();
         this.tornado.playerId = this.hero.id;
         var _loc1_:b2Vec2 = this.hero.§_-s1l§.Copy();
         var _loc2_:b2Vec2 = this.hero.§_-x2h§.Copy();
         _loc2_.Multiply(-5);
         _loc1_.Add(_loc2_);
         this.tornado.position = b2Math.AddVV(this.hero.position,_loc1_);
         this.hero.game.map.§_-nA§(this.tornado,true);
      }
   }
}

