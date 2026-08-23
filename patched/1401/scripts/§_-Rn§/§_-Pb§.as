package §_-Rn§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import §_-T2y§.§_-92z§;
   import §_-f17§.§_-03y§;
   
   public class §_-Pb§ extends §_-q2A§
   {
      
      public var §_-gq§:Boolean = true;
      
      public var lifeTime:Number = §_-92z§.mode == §_-q1p§.§_-13I§ ? 10 : 30;
      
      public function §_-Pb§()
      {
         this.§_-21L§ = new §_-03y§();
         super();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = [];
         if(this.§_-1N§)
         {
            return _loc1_;
         }
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         _loc1_.push([this.frequency,this.damping]);
         _loc1_.push([this.lifeTime,this.§_-gq§]);
         if(this.§_-f1B§ != null)
         {
            _loc1_.push([this.hero1 ? this.hero1.id : -1,this.hero0 ? this.hero0.id : -1,§_-1N§]);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         if(param1.length == 0)
         {
            this.§_-1N§ = true;
            return;
         }
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.anchor1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.frequency = param1[3][0];
         this.damping = param1[3][1];
         this.lifeTime = param1[4][0];
         this.§_-gq§ = Boolean(param1[4][1]);
         if(!(4 in param1))
         {
            return;
         }
         this.§_-f1B§ = new b2DistanceJointDef();
         this.body0Id = param1[4][0];
         this.body1Id = param1[4][1];
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.§_-1N§)
         {
            this.visible = false;
            return;
         }
         this.rotation = 0;
         if(this.§_-gq§)
         {
            this.lifeTime -= param1;
            this.§_-21L§.alpha = b2Math.Clamp(this.lifeTime,0,1);
            if(this.lifeTime <= 0)
            {
               this.§_-41K§();
            }
         }
      }
      
      override protected function §_-70§() : void
      {
         this.hero0.addEventListener(Hero.§_-n2S§,§_-41K§,false,0,true);
         this.hero1.addEventListener(Hero.§_-n2S§,§_-41K§,false,0,true);
      }
   }
}

