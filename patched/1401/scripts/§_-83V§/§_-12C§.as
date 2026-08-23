package §_-83V§
{
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-12C§ extends §_-e2B§ implements §_-Q2k§
   {
      
      protected var §_-O1u§:Boolean = true;
      
      protected var §_-C2o§:Number = 10000;
      
      protected var §_-01O§:Boolean = false;
      
      public function §_-12C§(param1:Class, param2:int, param3:int)
      {
         super();
         if(!param1)
         {
            return;
         }
         this.view = new §_-d2d§(new param1());
         this.view.play();
         this.view.x = param2;
         this.view.y = param3;
         §_-83v§(this.view);
         if(this.stopInEnd)
         {
            this.view.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         }
      }
      
      public function get stopInEnd() : Boolean
      {
         return false;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
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
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
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
      
      protected function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      protected function §_-r5§(param1:Event) : void
      {
         if(!this.view)
         {
            return;
         }
         if(this.view.currentFrame < this.view.totalFrames - 1)
         {
            return;
         }
         this.view.stop();
         this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
      }
   }
}

