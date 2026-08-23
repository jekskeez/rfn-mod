package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-u2r§.§_-620§;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-h1w§ extends §_-XT§
   {
      
      private static const §_-p2O§:Number = 5;
      
      private static const §_-S1d§:Array = [30,28,26,24,22,22,22,22,22,22,20];
      
      private var §_-v1H§:Object = {};
      
      public function §_-h1w§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-Y1q§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:String = null;
         super.update(param1);
         for(_loc2_ in this.§_-v1H§)
         {
            this.§_-v1H§[_loc2_] -= param1;
            if(this.§_-v1H§[_loc2_] <= 0)
            {
               Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc2_,1);
               delete this.§_-v1H§[_loc2_];
            }
         }
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-j2Y§ > §_-S1d§.length ? Number(§_-S1d§[§_-S1d§.length - 1]) : Number(§_-S1d§[this.§_-j2Y§]);
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-Q1g§]);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         for(_loc1_ in this.§_-v1H§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.changeView();
               _loc2_.isStopped = false;
            }
         }
         this.§_-v1H§ = {};
         super.dispose();
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-i2D§ || param1[1] != this.hero.id)
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.get(param1[2]);
               if(_loc2_ == null)
               {
                  return;
               }
               if(param1[3] == 0)
               {
                  if(_loc2_.isStopped)
                  {
                     return;
                  }
                  _loc2_.changeView(this.§_-C17§);
                  _loc2_.isStopped = true;
                  this.§_-v1H§[_loc2_.id] = §_-p2O§;
                  GameSounds.play("sheep_bomb");
               }
               else
               {
                  _loc2_.changeView();
                  _loc2_.isStopped = false;
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function get §_-C17§() : Sprite
      {
         var _loc1_:§_-h2I§ = new §_-h2I§();
         var _loc2_:§_-d2d§ = new §_-d2d§(new SheepView());
         _loc2_.x = -int(_loc2_.width * 0.5);
         _loc2_.y = -int(_loc2_.height);
         _loc2_.play();
         _loc1_.§_-83v§(_loc2_);
         return _loc1_;
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-620§();
      }
   }
}

