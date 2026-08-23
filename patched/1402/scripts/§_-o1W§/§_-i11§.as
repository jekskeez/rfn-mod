package §_-o1W§
{
   import §_-G2y§.ControllerHeroLocal;
   import §_-c2C§.§_-u24§;
   import §_-td§.§_-N2w§;
   import chat.§_-g1j§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-i11§ extends §_-N2w§
   {
      
      private static const §_-53V§:Number = 1.5;
      
      private static const §_-2a§:Array = [{
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
      
      private var §_-X1i§:Object = {};
      
      private var §_-f22§:Object = {};
      
      public var §_-53C§:Number = 1.5;
      
      public function §_-i11§()
      {
         super();
         this.§_-71Y§ = §_-Qz§;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-U20§],1);
      }
      
      public function get §_-F2B§() : Array
      {
         return [this.§_-f22§,this.§_-X1i§];
      }
      
      override protected function §_-g5§() : void
      {
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         if(param1[0] == §_-s2l§.ROUND_START)
         {
            ControllerHeroLocal.§_-T16§ = true;
         }
      }
      
      override public function reset() : void
      {
         var _loc1_:Hero = null;
         super.reset();
         this.§_-X1i§ = {};
         this.§_-f22§ = {};
         for each(_loc1_ in this.players)
         {
            this.§_-X1i§[_loc1_.id] = 0;
            this.§_-f22§[_loc1_.id] = 0;
         }
         this.§_-I26§();
      }
      
      override public function §_-I26§(param1:Boolean = true) : void
      {
         var _loc4_:§_-Qz§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         for each(_loc4_ in this.players)
         {
            _loc2_ += !_loc4_.isDead ? 1 : 0;
            _loc3_ += !_loc4_.isDead && (_loc4_.§_-Gm§ || _loc4_.§_-21§ > 0) ? 1 : 0;
         }
         if(_loc3_ == 1)
         {
            this.§_-53C§ = §_-53V§;
            return;
         }
         var _loc5_:Number = (_loc2_ + 1 - _loc3_) / _loc2_;
         var _loc6_:int = 0;
         while(_loc6_ < §_-2a§.length)
         {
            if(_loc5_ >= §_-2a§[_loc6_]["value"])
            {
               this.§_-53C§ = §_-2a§[_loc6_]["speed"];
               break;
            }
            _loc6_++;
         }
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:§_-Qz§ = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-U20§:
               if(param1[1] == 0)
               {
                  this.§_-NC§ = param1[0];
               }
               if("2" in param1)
               {
                  this.§_-K1X§ = param1[2];
               }
               _loc2_ = get(param1[0]) as §_-Qz§;
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
                     §_-u24§.sendMessage(Game.selfId,gls("Ты заразил игрока {0}. Скоро он превратится в зомби.",_loc2_.playerName),§_-g1j§.§_-O2n§);
                  }
                  else if(param1[0] == Game.selfId)
                  {
                     §_-u24§.sendMessage(Game.selfId,gls("Игрок {0} заразил тебя. Лови других белок и заражай их!",get(param1[2]).playerName),§_-g1j§.§_-O2n§);
                  }
               }
               else if(param1[0] == Game.selfId)
               {
                  §_-u24§.sendMessage(Game.selfId,gls("Ты стал зомби. Лови других белок и заражай их!"),§_-g1j§.§_-O2n§);
               }
               else
               {
                  §_-u24§.sendMessage(Game.selfId,gls("Игрок {0} стал зомби. Не дай зомби себя заразить.",_loc2_.playerName),§_-g1j§.§_-O2n§);
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-N1Y§:
               super.§_-x2f§(param1);
               this.§_-I26§();
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function set §_-K1X§(param1:int) : void
      {
         if(!(param1 in this.§_-X1i§))
         {
            this.§_-X1i§[param1] = 0;
         }
         ++this.§_-X1i§[param1];
      }
      
      private function set §_-NC§(param1:int) : void
      {
         var _loc2_:Hero = null;
         for each(_loc2_ in this.players)
         {
            if(!(_loc2_.id == param1 || !_loc2_.isSquirrel))
            {
               if(!(_loc2_.id in this.§_-f22§))
               {
                  this.§_-f22§[_loc2_.id] = 0;
               }
               ++this.§_-f22§[_loc2_.id];
            }
         }
      }
   }
}

