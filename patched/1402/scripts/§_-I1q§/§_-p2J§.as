package §_-I1q§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-81P§.§_-61P§;
   import §_-81P§.§_-f1D§;
   import §_-8Q§.§_-7A§;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-Cc§.§_-va§;
   import game.mainGame.entity.§_-71b§;
   import starling.core.Starling;
   
   public class §_-p2J§ extends §_-7A§ implements §_-71b§
   {
      
      public static const §_-A2L§:Number = 10;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 3000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-p2J§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         if(this.§_-W1u§)
         {
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-21q§);
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.§_-L2Z§ = this.x;
         this.§_-W1u§.view.§_-2F§ = this.y;
         this.§_-W1u§.view.maxRadius = §_-A2L§ * Game.§_-12A§;
         this.§_-W1u§.view.minRadius = §_-A2L§ * Game.§_-12A§ * 0.95;
         this.§_-W1u§.start();
         Hero.self.getStarlingView().parent.addChild(this.§_-W1u§.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         this.§_-g2W§();
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-L1c§();
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
      
      private function §_-g2W§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         if(!this.§_-21H§ || !this.§_-21H§.squirrels || !this.§_-21H§.squirrels.players)
         {
            return;
         }
         for each(_loc1_ in this.§_-21H§.squirrels.players)
         {
            if(_loc1_.id != this.playerId)
            {
               _loc2_ = _loc1_.position.Copy();
               _loc2_.Subtract(this.position);
               if(_loc2_.Length() <= §_-A2L§)
               {
                  _loc1_.behaviourController.§_-W10§(new §_-va§(0.25,0.6));
               }
            }
         }
      }
      
      private function §_-th§() : void
      {
         var _loc1_:§_-f1D§ = null;
         if(this.§_-C1L§)
         {
            return;
         }
         if(this.§_-W1u§)
         {
            _loc1_ = new §_-f1D§(this.§_-W1u§.view,2,§_-61P§.§_-fq§);
            _loc1_.§_-02Q§("alpha",0);
            _loc1_.onComplete = this.§_-L1c§;
            Starling.§_-zb§.add(_loc1_);
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      private function §_-L1c§() : void
      {
         if(!this.§_-W1u§)
         {
            return;
         }
         this.§_-W1u§.stop();
         §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
   }
}

