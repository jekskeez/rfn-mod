package §_-83V§
{
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import §_-R1w§.DetectHeroEvent;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.display.DisplayObject;
   import game.§_-s2v§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-o29§ extends §_-r1o§
   {
      
      public static const §_-Y1l§:int = 0;
      
      protected static const §_-e2Z§:int = 100;
      
      private var §_-A38§:§_-f1G§;
      
      private var §_-z1K§:int = -1;
      
      public var §_-y2u§:int = 0;
      
      public function §_-o29§()
      {
         super(§_-vy§.§_-z2p§(1));
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.itemId,this.index,this.§_-y2u§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-y2u§ = param1[2][2];
         this.itemId = param1[2][0];
         this.index = param1[2][1];
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-63o§];
      }
      
      public function set index(param1:int) : void
      {
         this.§_-U2q§ = param1;
      }
      
      public function get itemId() : int
      {
         return this.§_-z1K§;
      }
      
      public function set itemId(param1:int) : void
      {
         var _loc2_:Boolean = false;
         if(this.§_-z1K§ == param1)
         {
            return;
         }
         this.§_-z1K§ = param1;
         _loc2_ = this.view.isPlaying;
         removeChildStarling(this.view);
         var _loc3_:Class = this.§_-y2u§ == §_-Y1l§ ? §_-vy§.§_-z2p§(this.itemId) : DisplayObject;
         var _loc4_:DisplayObject = new _loc3_();
         this.view = new §_-s2v§(_loc4_);
         this.view.x = -15;
         this.view.y = -15;
         this.view.scaleXY(0.5);
         §_-83v§(this.view);
         if(!_loc2_)
         {
            return;
         }
         this.view.play();
      }
      
      override protected function §_-5d§(param1:DetectHeroEvent) : void
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
         var _loc2_:Boolean = this.§_-y2u§ == §_-Y1l§ ? §_-k1C§.§_-G1c§[this.itemId].count >= §_-e2Z§ : false;
         if(this.§_-42S§ || _loc2_ || this.§_-H2D§.squirrels.§_-g14§)
         {
            return;
         }
         if(param1.hero.isHare)
         {
            _loc3_ = Math.random() * §_-43Z§.§_-83l§.length;
            GameSounds.play(§_-43Z§.§_-I2z§[_loc3_]);
         }
         else
         {
            _loc3_ = Math.random() * §_-43Z§.§_-K1K§.length;
            GameSounds.play(§_-43Z§.§_-K1K§[_loc3_]);
         }
         Connection.§_-Li§(§_-h2B§.§_-63o§,this.index);
         this.§_-42S§ = true;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.body == null)
         {
            return;
         }
         if(this.index != param1[3])
         {
            return;
         }
         this.§_-b16§();
      }
      
      override protected function §_-b16§() : void
      {
         super.§_-b16§();
         if(!this.§_-A38§)
         {
            return;
         }
         this.§_-A38§.stop();
         §_-93d§.instance.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}

