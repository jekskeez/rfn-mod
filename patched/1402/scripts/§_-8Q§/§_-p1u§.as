package §_-8Q§
{
   import §_-TK§.§_-f1u§;
   import flash.events.Event;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-p1u§ extends §_-7A§ implements §_-71b§
   {
      
      protected var §_-837§:Boolean = true;
      
      protected var §_-Q26§:Number = 10000;
      
      protected var §_-C1L§:Boolean = false;
      
      public function §_-p1u§(param1:Class, param2:int, param3:int)
      {
         super();
         if(!param1)
         {
            return;
         }
         this.view = new §_-f1u§(new param1());
         this.view.play();
         this.view.x = param2;
         this.view.y = param3;
         §_-J2J§(this.view);
         if(this.stopInEnd)
         {
            this.view.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         }
      }
      
      public function get stopInEnd() : Boolean
      {
         return false;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
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
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
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
      
      protected function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      protected function §_-52w§(param1:Event) : void
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
         this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
      }
   }
}

