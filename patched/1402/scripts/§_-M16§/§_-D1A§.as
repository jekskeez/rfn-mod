package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import §_-82h§.§_-YL§;
   import flash.filters.ColorMatrixFilter;
   
   public class §_-D1A§ extends §_-33O§
   {
      
      private static const §_-O2C§:Array = [new ColorMatrixFilter([0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0]),new ColorMatrixFilter([3,-1,0,0,0,-1,1,0,0,0,0,-1,3,0,0,0,0,0,1,0])];
      
      public function §_-D1A§(param1:Boolean = false)
      {
         this.§_-D11§ = new §_-YL§();
         super();
         if(!param1)
         {
            return;
         }
         this.§_-D11§.filters = §_-O2C§;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         if(this.§_-dZ§)
         {
            return _loc1_;
         }
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         _loc1_.push([this.frequency,this.damping]);
         if(this.§_-cJ§ != null)
         {
            _loc1_.push([this.hero1 ? this.hero1.id : -1,this.hero0 ? this.hero0.id : -1,§_-dZ§]);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         if(param1.length == 0)
         {
            this.§_-dZ§ = true;
            return;
         }
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.anchor1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.frequency = param1[3][0];
         this.damping = param1[3][1];
         if(!(4 in param1))
         {
            return;
         }
         this.§_-cJ§ = new b2DistanceJointDef();
         this.body0Id = param1[4][0];
         this.body1Id = param1[4][1];
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(!param1)
         {
         }
         if(this.§_-dZ§)
         {
            this.visible = false;
            return;
         }
         this.rotation = 0;
      }
      
      override protected function §_-g2E§() : void
      {
         this.hero0.addEventListener(Hero.§_-V§,§_-D1p§,false,0,true);
         this.hero1.addEventListener(Hero.§_-V§,§_-D1p§,false,0,true);
      }
   }
}

