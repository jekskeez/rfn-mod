package §_-b1B§
{
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-637§.§_-cW§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-p2H§.§_-Q1c§;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-N1s§ extends §_-Q1c§ implements §_-cW§, §_-Q2k§, §_-Tm§
   {
      
      private static const §_-A3F§:int = 60000;
      
      private static const §_-O1N§:int = 100;
      
      public static var §_-w16§:int = 0;
      
      private var view:§_-d2d§ = null;
      
      private var §_-q26§:int;
      
      private var §_-VQ§:§_-h2I§ = null;
      
      public var radius:Number = 100;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 60000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-H2D§:SquirrelGame = null;
      
      private var §_-k16§:Boolean = false;
      
      public function §_-N1s§()
      {
         super(null);
         this.view = new §_-d2d§(new TotemImg());
         this.view.stop();
         this.view.§_-x2x§();
         this.view.x = -13;
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         this.§_-H2D§ = param1.userData as SquirrelGame;
         this.view.play();
         this.§_-VQ§ = new §_-h2I§(new PerkRadius());
         this.§_-VQ§.scaleXY(this.radius * 2 / this.§_-VQ§.width);
         §_-83v§(this.§_-VQ§);
         this.§_-k16§ = true;
         if(this.playerId == Game.selfId)
         {
            ++§_-w16§;
            §_-TQ§.add("TOTEMS +",§_-w16§);
         }
      }
      
      override public function dispose() : void
      {
         if(this.playerId == Game.selfId && this.§_-k16§)
         {
            --§_-w16§;
            §_-TQ§.add("TOTEMS -",§_-w16§);
         }
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.radius,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         var _loc2_:Array = param1.pop();
         this.playerId = _loc2_[0];
         this.radius = _loc2_[1];
         this.aging = Boolean(_loc2_[2]);
         this.lifeTime = _loc2_[3];
         super.§_-41M§(param1);
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
      
      public function get playerId() : int
      {
         return this.§_-q26§;
      }
      
      public function set playerId(param1:int) : void
      {
         this.§_-q26§ = param1;
      }
      
      public function §_-W1U§(param1:Point) : Boolean
      {
         return globalToLocal(param1).length < this.radius;
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
         if(!this.§_-H2D§)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

