package §_-TX§
{
   import §_-A2x§.§_-33A§;
   import §_-T2y§.§_-92z§;
   import §_-s2l§.ControllerHeroLocal;
   import chat.§_-A1n§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-uw§ extends §_-33A§
   {
      
      private static const §_-D1p§:Number = 1.5;
      
      private static const §_-4D§:Array = [{
         "value":0.8,
         "speed":1.25
      },{
         "value":0.6,
         "speed":1
      },{
         "value":0.4,
         "speed":0.9
      },{
         "value":0.3,
         "speed":0.8
      }];
      
      private var §_-N1o§:Object = {};
      
      private var §_-11z§:Object = {};
      
      public var §_-D2Y§:Number = 1.5;
      
      public function §_-uw§()
      {
         super();
         this.§_-Y1k§ = §_-LR§;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b2Z§],1);
      }
      
      public function get §_-pa§() : Array
      {
         return [this.§_-11z§,this.§_-N1o§];
      }
      
      override protected function §_-h14§() : void
      {
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         if(param1[0] == §_-S2I§.ROUND_START)
         {
            ControllerHeroLocal.§_-jL§ = true;
         }
      }
      
      override public function reset() : void
      {
         var _loc1_:Hero = null;
         super.reset();
         this.§_-N1o§ = {};
         this.§_-11z§ = {};
         for each(_loc1_ in this.players)
         {
            this.§_-N1o§[_loc1_.id] = 0;
            this.§_-11z§[_loc1_.id] = 0;
         }
         this.§_-U1m§();
      }
      
      override public function §_-U1m§(param1:Boolean = true) : void
      {
         var _loc4_:§_-LR§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         for each(_loc4_ in this.players)
         {
            _loc2_ += !_loc4_.isDead ? 1 : 0;
            _loc3_ += !_loc4_.isDead && (_loc4_.§_-uT§ || _loc4_.§_-DE§ > 0) ? 1 : 0;
         }
         if(_loc3_ == 1)
         {
            this.§_-D2Y§ = §_-D1p§;
            return;
         }
         var _loc5_:Number = (_loc2_ + 1 - _loc3_) / _loc2_;
         var _loc6_:int = 0;
         while(_loc6_ < §_-4D§.length)
         {
            if(_loc5_ >= §_-4D§[_loc6_]["value"])
            {
               this.§_-D2Y§ = §_-4D§[_loc6_]["speed"];
               break;
            }
            _loc6_++;
         }
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:§_-LR§ = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-b2Z§:
               if(param1[1] == 0)
               {
                  this.§_-yt§ = param1[0];
               }
               if("2" in param1)
               {
                  this.§_-C1S§ = param1[2];
               }
               _loc2_ = get(param1[0]) as §_-LR§;
               if(!_loc2_)
               {
                  return;
               }
               if(param1[1] == 0)
               {
                  _loc2_.infect();
               }
               else
               {
                  _loc2_.first = true;
               }
               if("2" in param1)
               {
                  if(param1[2] == Game.selfId)
                  {
                     §_-92z§.sendMessage(Game.selfId,gls("Ты заразил игрока {0}. Скоро он превратится в зомби.",_loc2_.playerName),§_-A1n§.§_-lZ§);
                  }
                  else if(param1[0] == Game.selfId)
                  {
                     §_-92z§.sendMessage(Game.selfId,gls("Игрок {0} заразил тебя. Лови других белок и заражай их!",get(param1[2]).playerName),§_-A1n§.§_-lZ§);
                  }
               }
               else if(param1[0] == Game.selfId)
               {
                  §_-92z§.sendMessage(Game.selfId,gls("Ты стал зомби. Лови других белок и заражай их!"),§_-A1n§.§_-lZ§);
               }
               else
               {
                  §_-92z§.sendMessage(Game.selfId,gls("Игрок {0} стал зомби. Не дай зомби себя заразить.",_loc2_.playerName),§_-A1n§.§_-lZ§);
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-03G§:
               super.§_-o2C§(param1);
               this.§_-U1m§();
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function set §_-C1S§(param1:int) : void
      {
         if(!(param1 in this.§_-N1o§))
         {
            this.§_-N1o§[param1] = 0;
         }
         ++this.§_-N1o§[param1];
      }
      
      private function set §_-yt§(param1:int) : void
      {
         var _loc2_:Hero = null;
         for each(_loc2_ in this.players)
         {
            if(!(_loc2_.id == param1 || !_loc2_.isSquirrel))
            {
               if(!(_loc2_.id in this.§_-11z§))
               {
                  this.§_-11z§[_loc2_.id] = 0;
               }
               ++this.§_-11z§[_loc2_.id];
            }
         }
      }
   }
}

