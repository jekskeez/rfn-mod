package §_-u2r§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-T1V§;
   import §_-83V§.§_-e2B§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-m1z§.§_-529§;
   import §_-m1z§.§_-Mk§;
   import game.mainGame.entity.§_-Q2k§;
   import starling.core.Starling;
   
   public class §_-23b§ extends §_-e2B§ implements §_-Q2k§
   {
      
      public static const §_-c1F§:Number = 10;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 3000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-23b§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         if(this.§_-A38§)
         {
            §_-93d§.instance.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-WJ§);
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y;
         this.§_-A38§.view.maxRadius = §_-c1F§ * Game.§_-x2P§;
         this.§_-A38§.view.minRadius = §_-c1F§ * Game.§_-x2P§ * 0.95;
         this.§_-A38§.start();
         Hero.self.getStarlingView().parent.addChild(this.§_-A38§.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         this.§_-f2e§();
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-ms§();
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
      
      private function §_-f2e§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         if(!this.§_-H2D§ || !this.§_-H2D§.squirrels || !this.§_-H2D§.squirrels.players)
         {
            return;
         }
         for each(_loc1_ in this.§_-H2D§.squirrels.players)
         {
            if(_loc1_.id != this.playerId)
            {
               _loc2_ = _loc1_.position.Copy();
               _loc2_.Subtract(this.position);
               if(_loc2_.Length() <= §_-c1F§)
               {
                  _loc1_.behaviourController.§_-gz§(new §_-T1V§(0.25,0.6));
               }
            }
         }
      }
      
      private function §_-b16§() : void
      {
         var _loc1_:§_-529§ = null;
         if(this.§_-01O§)
         {
            return;
         }
         if(this.§_-A38§)
         {
            _loc1_ = new §_-529§(this.§_-A38§.view,2,§_-Mk§.§_-Y16§);
            _loc1_.§_-42i§("alpha",0);
            _loc1_.onComplete = this.§_-ms§;
            Starling.§_-A3B§.add(_loc1_);
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      private function §_-ms§() : void
      {
         if(!this.§_-A38§)
         {
            return;
         }
         this.§_-A38§.stop();
         §_-93d§.instance.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}

