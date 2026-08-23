package §_-u2r§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-81N§.§_-j2G§;
   import §_-83V§.GameBody;
   import §_-B1O§.§_-22r§;
   import game.mainGame.entity.§_-FD§;
   
   public class §_-n1f§ extends §_-22r§ implements §_-FD§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,3,§_-52X§,§_-FN§,0);
      
      public static const §_-01b§:Number = 40 / Game.§_-x2P§;
      
      private var §_-E22§:Number = 3;
      
      private var §_-B2i§:Number = 3;
      
      private var §_-Y2S§:Number = 3;
      
      private var lifeTime:Number = 9;
      
      private var §_-01O§:Boolean = false;
      
      public function §_-n1f§()
      {
         super();
         this.§_-s1Y§ = new b2Vec2(5,5);
         this.§_-I4§ = 50;
         this.§_-eH§ = true;
         this.§_-93b§ = false;
         this.§_-91O§ = 50;
         this.§_-OL§ = true;
         this.skins = [SailorMoonPlanetView];
         this.fixed = true;
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override protected function get fixture() : b2FixtureDef
      {
         return §_-03A§;
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         (this.controller as §_-j2G§).playerId = this.playerId;
      }
      
      override protected function get controllerClass() : Class
      {
         return §_-j2G§;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:int = GameBody.§_-u1P§(param1) ? 4 : 2;
         this.playerId = param1[_loc2_][0];
         this.lifeTime = param1[_loc2_][1];
         this.§_-Y2S§ = Math.max(Math.min(3,this.lifeTime),0);
         this.§_-B2i§ = Math.max(Math.min(3,this.lifeTime - this.§_-Y2S§),0);
         this.§_-E22§ = Math.max(Math.min(3,this.lifeTime - this.§_-B2i§ - this.§_-Y2S§),0);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-E22§ > 0)
         {
            this.§_-E22§ -= param1;
            return;
         }
         if(this.§_-B2i§ > 0)
         {
            this.position = new b2Vec2(this.position.x,this.position.y - §_-01b§ * param1);
            this.§_-B2i§ -= param1;
            return;
         }
         if(this.§_-Y2S§ > 0)
         {
            this.§_-Y2S§ -= param1;
            return;
         }
         this.§_-b16§();
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

