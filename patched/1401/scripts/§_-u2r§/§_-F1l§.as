package §_-u2r§
{
   import §_-83V§.§_-z2r§;
   import §_-RI§.§_-d2d§;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-F1l§ extends §_-z2r§ implements §_-Q2k§
   {
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 15000;
      
      private var §_-01O§:Boolean = false;
      
      public function §_-F1l§()
      {
         super();
         this.view = new §_-d2d§(new NapoleonPerkView());
         this.view.stop();
         this.view.loop = false;
         §_-83v§(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
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
         this.aging = Boolean(param1[2][0]);
         this.lifeTime = param1[2][1];
         this.playerId = param1[2][2];
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
         if(this.body == null)
         {
            return;
         }
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

