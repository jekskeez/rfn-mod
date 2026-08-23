package §_-I1q§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-H1l§.§_-r2u§;
   import §_-j2H§.§_-k2G§;
   import game.mainGame.entity.§_-L1q§;
   
   public class §_-51a§ extends §_-k2G§ implements §_-L1q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,3,§_-53X§,§_-C3c§,0);
      
      public static const §_-Bs§:Number = 40 / Game.§_-12A§;
      
      private var §_-yn§:Number = 3;
      
      private var §_-51r§:Number = 3;
      
      private var §_-M2B§:Number = 3;
      
      private var lifeTime:Number = 9;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-51a§()
      {
         super();
         this.§_-y1d§ = new b2Vec2(5,5);
         this.§_-22J§ = 50;
         this.§_-52W§ = true;
         this.§_-O1m§ = false;
         this.§_-Gz§ = 50;
         this.§_-y1L§ = true;
         this.skins = [SailorMoonPlanetView];
         this.fixed = true;
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override protected function get fixture() : b2FixtureDef
      {
         return §_-ql§;
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         (this.controller as §_-r2u§).playerId = this.playerId;
      }
      
      override protected function get controllerClass() : Class
      {
         return §_-r2u§;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:int = GameBody.§_-W1F§(param1) ? 4 : 2;
         this.playerId = param1[_loc2_][0];
         this.lifeTime = param1[_loc2_][1];
         this.§_-M2B§ = Math.max(Math.min(3,this.lifeTime),0);
         this.§_-51r§ = Math.max(Math.min(3,this.lifeTime - this.§_-M2B§),0);
         this.§_-yn§ = Math.max(Math.min(3,this.lifeTime - this.§_-51r§ - this.§_-M2B§),0);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-yn§ > 0)
         {
            this.§_-yn§ -= param1;
            return;
         }
         if(this.§_-51r§ > 0)
         {
            this.position = new b2Vec2(this.position.x,this.position.y - §_-Bs§ * param1);
            this.§_-51r§ -= param1;
            return;
         }
         if(this.§_-M2B§ > 0)
         {
            this.§_-M2B§ -= param1;
            return;
         }
         this.§_-th§();
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

