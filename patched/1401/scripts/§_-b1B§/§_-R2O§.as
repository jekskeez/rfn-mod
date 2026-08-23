package §_-b1B§
{
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-637§.§_-Ft§;
   import §_-RI§.§_-d2d§;
   import §_-p2H§.§_-Q1c§;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-R2O§ extends §_-Q1c§ implements §_-Ft§, §_-Tm§, §_-Q2k§
   {
      
      private static const §_-A3F§:int = 5000;
      
      private var §_-l6§:Boolean = false;
      
      private var scale:Number = 1;
      
      private var view:§_-d2d§ = null;
      
      private var §_-Mf§:Cast = null;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 5000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-H2D§:SquirrelGame = null;
      
      public function §_-R2O§(param1:Number = 1, param2:Boolean = false)
      {
         super(null);
         this.scale = param1;
         this.§_-l6§ = param2;
         var _loc3_:ArrowRed = new ArrowRed();
         _loc3_.scaleX = _loc3_.scaleY = this.scale;
         this.view = new §_-d2d§(_loc3_);
         this.view.rotation = -90;
         this.view.x = -(_loc3_.height * 0.5);
         this.view.y = _loc3_.width * 0.5;
         this.view.stop();
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-H2D§ = param1.userData as SquirrelGame;
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
         this.view.removeFromParent();
         var _loc2_:ArrowRed = new ArrowRed();
         _loc2_.scaleX = _loc2_.scaleY = this.scale;
         this.view = new §_-d2d§(_loc2_);
         this.view.rotation = -90;
         this.view.loop = true;
         this.view.x = -(_loc2_.height * 0.5);
         this.view.y = _loc2_.width * 0.5;
         §_-83v§(this.view);
         if(this.§_-l6§)
         {
            this.view.play();
         }
         else
         {
            this.view.stop();
         }
      }
      
      override public function dispose() : void
      {
         this.§_-Mf§ = null;
         if(this.view)
         {
            this.view.removeFromParent();
            this.view = null;
         }
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.scale,this.§_-l6§,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         var _loc2_:Array = param1.pop();
         this.scale = _loc2_[0];
         this.§_-l6§ = Boolean(_loc2_[1]);
         this.aging = Boolean(_loc2_[2]);
         this.lifeTime = _loc2_[3];
         super.§_-41M§(param1);
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         this.§_-C2o§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Mf§.§_-R1d§ = 0;
         this.§_-Mf§.§_-k1K§ = 0;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-R1d§ = NaN;
         this.§_-Mf§.§_-k1K§ = NaN;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.map))
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
   }
}

