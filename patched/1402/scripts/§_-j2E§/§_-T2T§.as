package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-X20§;
   import game.mainGame.SquirrelCollection;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-T2T§ extends §_-92f§
   {
      
      private static const §_-A2L§:Number = 12;
      
      private var squirrels:SquirrelCollection = null;
      
      public function §_-T2T§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "cthulhu_call";
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 15;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§]);
      }
      
      override protected function activate() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         if(!this.hero.game || this.hero.game.paused || this.hero.isDead || this.hero.inHollow)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(this.hero.id != Game.selfId)
         {
            return;
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(_loc2_.shaman || _loc2_.isHare || _loc2_.isDead || _loc2_.inHollow || _loc2_.hover || _loc2_.isStopped))
            {
               if(_loc2_.id != this.hero.id)
               {
                  _loc3_ = this.hero.position.Copy();
                  _loc3_.Subtract(_loc2_.position);
                  if(_loc3_.Length() <= §_-A2L§)
                  {
                     _loc1_.push(_loc2_.id);
                  }
               }
            }
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"cthulhu":[this.hero.id,_loc1_]}));
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Hero = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(!("cthulhu" in _loc2_))
               {
                  return;
               }
               if(!this.hero || this.hero.isDead || _loc2_["cthulhu"][0] != this.hero.id)
               {
                  return;
               }
               _loc3_ = _loc2_["cthulhu"][1];
               this.squirrels = this.hero.game.squirrels;
               for each(_loc4_ in this.squirrels.players)
               {
                  if(_loc3_.indexOf(_loc4_.id) != -1)
                  {
                     if(!(_loc4_.shaman || _loc4_.isHare || _loc4_.isDead || _loc4_.inHollow || _loc4_.hover))
                     {
                        if(!(_loc4_.isSquirrel && _loc4_.perkController.§_-S1Q§(this.§_-T2a§) != -1))
                        {
                           GameSounds.play(§_-7d§);
                           _loc4_.behaviourController.§_-W10§(new §_-X20§(7));
                        }
                     }
                  }
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}

