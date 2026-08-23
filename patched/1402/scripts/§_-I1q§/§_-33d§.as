package §_-I1q§
{
   import §_-8Q§.GameBody;
   import §_-8Q§.PoiseRight;
   import §_-8Q§.§_-7A§;
   import §_-TK§.§_-f1u§;
   import §_-j2E§.§_-A11§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-33d§ extends §_-7A§
   {
      
      private var §_-T1Q§:Boolean = false;
      
      private var delay:Number = 2;
      
      private var _direction:Boolean = true;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-33d§()
      {
         super();
         this.view = new §_-f1u§(new PirateCannonView());
         this.view.play();
         this.view.scaleXY(-0.5,0.5);
         this.view.y = 30;
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         §_-J2J§(this.view);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-u22§]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != §_-A11§.§_-1C§)
         {
            return;
         }
         GameSounds.play("canon");
      }
      
      private function §_-52w§(param1:Event) : void
      {
         if(this.§_-T1Q§)
         {
            if(this.view.currentFrame == 28)
            {
               this.view.stop();
               this.§_-th§();
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
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.delay,this._direction,this.playerId,this.§_-T1Q§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.delay = param1[1][0];
         this.direction = Boolean(param1[1][1]);
         this.playerId = param1[1][2];
         this.§_-T1Q§ = Boolean(param1[1][3]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.playerId != Game.selfId)
         {
            return;
         }
         this.delay -= param1;
         if(this.delay > 0 || this.§_-T1Q§)
         {
            return;
         }
         this.§_-T1Q§ = true;
         var _loc2_:GameBody = new PoiseRight();
         _loc2_.position = this.position;
         _loc2_.angle = this.angle + (this._direction ? 0 : 180 * Game.D2R);
         this.§_-21H§.map.§_-TP§(_loc2_,true);
         Connection.§_-e2T§(§_-u1O§.§_-u22§,§_-A11§.§_-1C§,this.playerId);
         this.view.gotoAndPlay(7);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-u22§]);
         if(this.view)
         {
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         }
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

