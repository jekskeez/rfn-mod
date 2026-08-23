package §_-Q2§
{
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-F5§.§_-QT§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-k1z§.§_-bh§;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-Il§ extends §_-bh§ implements §_-QT§, §_-71b§, §_-F1c§
   {
      
      private static const §_-a1F§:int = 60000;
      
      private static const §_-w1v§:int = 100;
      
      public static var §_-6Z§:int = 0;
      
      private var view:§_-f1u§ = null;
      
      private var §_-q19§:int;
      
      private var §_-n2L§:§_-aS§ = null;
      
      public var radius:Number = 100;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 60000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-21H§:SquirrelGame = null;
      
      private var §_-u0§:Boolean = false;
      
      public function §_-Il§()
      {
         super(null);
         this.view = new §_-f1u§(new TotemImg());
         this.view.stop();
         this.view.§_-i18§();
         this.view.x = -13;
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         this.§_-21H§ = param1.userData as SquirrelGame;
         this.view.play();
         this.§_-n2L§ = new §_-aS§(new PerkRadius());
         this.§_-n2L§.scaleXY(this.radius * 2 / this.§_-n2L§.width);
         §_-J2J§(this.§_-n2L§);
         this.§_-u0§ = true;
         if(this.playerId == Game.selfId)
         {
            ++§_-6Z§;
            §_-p2U§.add("TOTEMS +",§_-6Z§);
         }
      }
      
      override public function dispose() : void
      {
         if(this.playerId == Game.selfId && this.§_-u0§)
         {
            --§_-6Z§;
            §_-p2U§.add("TOTEMS -",§_-6Z§);
         }
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.radius,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         var _loc2_:Array = param1.pop();
         this.playerId = _loc2_[0];
         this.radius = _loc2_[1];
         this.aging = Boolean(_loc2_[2]);
         this.lifeTime = _loc2_[3];
         super.§_-o2I§(param1);
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         this.§_-Q26§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      public function get playerId() : int
      {
         return this.§_-q19§;
      }
      
      public function set playerId(param1:int) : void
      {
         this.§_-q19§ = param1;
      }
      
      public function §_-q1G§(param1:Point) : Boolean
      {
         return globalToLocal(param1).length < this.radius;
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

