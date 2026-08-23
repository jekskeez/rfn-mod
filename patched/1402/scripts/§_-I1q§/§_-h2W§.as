package §_-I1q§
{
   import §_-8Q§.§_-m1m§;
   import §_-TK§.§_-f1u§;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-h2W§ extends §_-m1m§ implements §_-71b§
   {
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 15000;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-h2W§()
      {
         super();
         this.view = new §_-f1u§(new NapoleonPerkView());
         this.view.stop();
         this.view.loop = false;
         §_-J2J§(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
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
         this.aging = Boolean(param1[2][0]);
         this.lifeTime = param1[2][1];
         this.playerId = param1[2][2];
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
         if(this.body == null)
         {
            return;
         }
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

