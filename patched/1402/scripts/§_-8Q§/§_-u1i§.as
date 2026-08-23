package §_-8Q§
{
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-WS§;
   import flash.display.DisplayObject;
   import game.§_-53v§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-u1i§ extends §_-r2M§
   {
      
      public static const §_-13j§:int = 0;
      
      protected static const §_-f1j§:int = 100;
      
      private var §_-W1u§:§_-11u§;
      
      private var §_-OD§:int = -1;
      
      public var §_-Gk§:int = 0;
      
      public function §_-u1i§()
      {
         super(§_-42H§.§_-D1U§(1));
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.itemId,this.index,this.§_-Gk§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-Gk§ = param1[2][2];
         this.itemId = param1[2][0];
         this.index = param1[2][1];
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-kF§];
      }
      
      public function set index(param1:int) : void
      {
         this.§_-Km§ = param1;
      }
      
      public function get itemId() : int
      {
         return this.§_-OD§;
      }
      
      public function set itemId(param1:int) : void
      {
         var _loc2_:Boolean = false;
         if(this.§_-OD§ == param1)
         {
            return;
         }
         this.§_-OD§ = param1;
         _loc2_ = this.view.isPlaying;
         removeChildStarling(this.view);
         var _loc3_:Class = this.§_-Gk§ == §_-13j§ ? §_-42H§.§_-D1U§(this.itemId) : DisplayObject;
         var _loc4_:DisplayObject = new _loc3_();
         this.view = new §_-53v§(_loc4_);
         this.view.x = -15;
         this.view.y = -15;
         this.view.scaleXY(0.5);
         §_-J2J§(this.view);
         if(!_loc2_)
         {
            return;
         }
         this.view.play();
      }
      
      override protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc3_:int = 0;
         if(param1.hero.id != Game.selfId && param1.hero.id > 0)
         {
            return;
         }
         if(!this.available)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.shaman)
         {
            return;
         }
         if(this.itemId < 0)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-Gk§ == §_-13j§ ? §_-WS§.§_-2P§[this.itemId].count >= §_-f1j§ : false;
         if(this.§_-D27§ || _loc2_ || this.§_-21H§.squirrels.§_-o1w§)
         {
            return;
         }
         if(param1.hero.isHare)
         {
            _loc3_ = Math.random() * §_-RH§.§_-R1c§.length;
            GameSounds.play(§_-RH§.§_-c21§[_loc3_]);
         }
         else
         {
            _loc3_ = Math.random() * §_-RH§.§_-R22§.length;
            GameSounds.play(§_-RH§.§_-R22§[_loc3_]);
         }
         Connection.§_-e2T§(§_-u1O§.§_-kF§,this.index);
         this.§_-D27§ = true;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.body == null)
         {
            return;
         }
         if(this.index != param1[3])
         {
            return;
         }
         this.§_-th§();
      }
      
      override protected function §_-th§() : void
      {
         super.§_-th§();
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

