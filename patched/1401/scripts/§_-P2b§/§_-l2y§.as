package §_-P2b§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-A3e§.§_-rl§;
   import §_-u2r§.§_-gd§;
   import flash.display.MovieClip;
   
   public class §_-l2y§ extends §_-rl§
   {
      
      public function §_-l2y§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.game.paused && !this.hero.acornShare;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.view.animation.addFrameScript(this.view.animation.totalFrames - 1,this.§_-r5§);
      }
      
      override protected function §_-Y2U§() : MovieClip
      {
         return new LoveSquirrelsMagicAnimation();
      }
      
      private function castObject() : void
      {
         var _loc3_:GameBody = null;
         if(!this.isSelf)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         _loc3_ = new §_-gd§();
         _loc3_.angle = this.hero.angle;
         var _loc4_:b2Vec2 = this.hero.§_-s1l§;
         _loc4_.Multiply(this.hero.heroView.direction ? -_loc1_ : _loc1_);
         var _loc5_:b2Vec2 = this.hero.§_-x2h§;
         _loc5_.Multiply(_loc2_);
         _loc4_.Add(_loc5_);
         _loc3_.position = b2Math.AddVV(this.hero.position,_loc4_);
         _loc3_.playerId = this.hero.id;
         (_loc3_ as §_-gd§).lifeTime = 10 * 1000;
         this.hero.game.map.§_-nA§(_loc3_,true);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.active || !this.hero.heroView.running)
         {
            return;
         }
         this.castObject();
         this.active = false;
      }
      
      private function §_-r5§() : void
      {
         if(this.view)
         {
            this.view.animation.stop();
         }
      }
   }
}

