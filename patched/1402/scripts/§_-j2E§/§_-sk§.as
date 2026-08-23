package §_-j2E§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-j2P§;
   import §_-p2L§.§_-t2P§;
   import flash.display.MovieClip;
   
   public class §_-sk§ extends §_-t2P§
   {
      
      public function §_-sk§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
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
         this.view.animation.addFrameScript(this.view.animation.totalFrames - 1,this.§_-52w§);
      }
      
      override protected function §_-o2B§() : MovieClip
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
         _loc3_ = new §_-j2P§();
         _loc3_.angle = this.hero.angle;
         var _loc4_:b2Vec2 = this.hero.§_-11E§;
         _loc4_.Multiply(this.hero.heroView.direction ? -_loc1_ : _loc1_);
         var _loc5_:b2Vec2 = this.hero.§_-d2u§;
         _loc5_.Multiply(_loc2_);
         _loc4_.Add(_loc5_);
         _loc3_.position = b2Math.AddVV(this.hero.position,_loc4_);
         _loc3_.playerId = this.hero.id;
         (_loc3_ as §_-j2P§).lifeTime = 10 * 1000;
         this.hero.game.map.§_-TP§(_loc3_,true);
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
      
      private function §_-52w§() : void
      {
         if(this.view)
         {
            this.view.animation.stop();
         }
      }
   }
}

