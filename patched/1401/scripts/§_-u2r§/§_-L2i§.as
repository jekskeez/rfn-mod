package §_-u2r§
{
   import §_-83V§.GameBody;
   import §_-83V§.PoiseRight;
   import §_-83V§.§_-e2B§;
   import §_-P2b§.§_-6L§;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-L2i§ extends §_-e2B§
   {
      
      private var §_-U1Y§:Boolean = false;
      
      private var delay:Number = 2;
      
      private var _direction:Boolean = true;
      
      private var §_-01O§:Boolean = false;
      
      public function §_-L2i§()
      {
         super();
         this.view = new §_-d2d§(new PirateCannonView());
         this.view.play();
         this.view.scaleXY(-0.5,0.5);
         this.view.y = 30;
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         §_-83v§(this.view);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != §_-6L§.§_-322§)
         {
            return;
         }
         GameSounds.play("canon");
      }
      
      private function §_-r5§(param1:Event) : void
      {
         if(this.§_-U1Y§)
         {
            if(this.view.currentFrame == 28)
            {
               this.view.stop();
               this.§_-b16§();
            }
         }
         else if(this.view.currentFrame == 5)
         {
            this.view.gotoAndPlay(0);
         }
      }
      
      public function set direction(param1:Boolean) : void
      {
         if(this._direction == param1)
         {
            return;
         }
         this._direction = param1;
         this.view.scaleXY(this._direction ? -0.5 : 0.5,0.5);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.delay,this._direction,this.playerId,this.§_-U1Y§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.delay = param1[1][0];
         this.direction = Boolean(param1[1][1]);
         this.playerId = param1[1][2];
         this.§_-U1Y§ = Boolean(param1[1][3]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.playerId != Game.selfId)
         {
            return;
         }
         this.delay -= param1;
         if(this.delay > 0 || this.§_-U1Y§)
         {
            return;
         }
         this.§_-U1Y§ = true;
         var _loc2_:GameBody = new PoiseRight();
         _loc2_.position = this.position;
         _loc2_.angle = this.angle + (this._direction ? 0 : 180 * Game.D2R);
         this.§_-H2D§.map.§_-nA§(_loc2_,true);
         Connection.§_-Li§(§_-h2B§.§_-Q1g§,§_-6L§.§_-322§,this.playerId);
         this.view.gotoAndPlay(7);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
         if(this.view)
         {
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         }
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

