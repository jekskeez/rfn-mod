package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-r2T§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-T27§ extends §_-52h§
   {
      
      private static const §_-17§:Number = 5;
      
      private static const §_-f1A§:Array = [30,28,26,24,22,22,22,22,22,22,20];
      
      private var §_-fN§:Object = {};
      
      public function §_-T27§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-N2T§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:String = null;
         super.update(param1);
         for(_loc2_ in this.§_-fN§)
         {
            this.§_-fN§[_loc2_] -= param1;
            if(this.§_-fN§[_loc2_] <= 0)
            {
               Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc2_,1);
               delete this.§_-fN§[_loc2_];
            }
         }
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-32l§ > §_-f1A§.length ? Number(§_-f1A§[§_-f1A§.length - 1]) : Number(§_-f1A§[this.§_-32l§]);
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§]);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         for(_loc1_ in this.§_-fN§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.changeView();
               _loc2_.isStopped = false;
            }
         }
         this.§_-fN§ = {};
         super.dispose();
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-T2a§ || param1[1] != this.hero.id)
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
                  _loc2_.changeView(this.§_-J1U§);
                  _loc2_.isStopped = true;
                  this.§_-fN§[_loc2_.id] = §_-17§;
                  GameSounds.play("sheep_bomb");
               }
               else
               {
                  _loc2_.changeView();
                  _loc2_.isStopped = false;
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function get §_-J1U§() : Sprite
      {
         var _loc1_:§_-aS§ = new §_-aS§();
         var _loc2_:§_-f1u§ = new §_-f1u§(new SheepView());
         _loc2_.x = -int(_loc2_.width * 0.5);
         _loc2_.y = -int(_loc2_.height);
         _loc2_.play();
         _loc1_.§_-J2J§(_loc2_);
         return _loc1_;
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-r2T§();
      }
   }
}

