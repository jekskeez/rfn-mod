package §_-I1q§
{
   import §_-TK§.§_-aS§;
   import §_-X1k§.§_-A3y§;
   import §_-c2C§.§_-u24§;
   import §_-j2E§.§_-A11§;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import protocol.§_-s2l§;
   import utils.§_-o1Q§;
   
   public class §_-OW§ extends §_-Z2G§ implements §_-jC§
   {
      
      private static const §_-Bm§:Array = [{
         "count":3,
         "image":ImageIconNut,
         "reward":§_-A3y§.§_-l2X§,
         "text":gls("получил орешки")
      },{
         "count":1,
         "image":ImageIconCoins,
         "reward":§_-A3y§.§_-M1U§,
         "text":gls("получил монетку")
      },{
         "count":2,
         "image":ImageIconMana,
         "reward":§_-A3y§.§_-fz§,
         "text":gls("получил ману")
      },{
         "count":2,
         "image":ImageIconEnergy,
         "reward":§_-A3y§.§_-W27§,
         "text":gls("получил энергию")
      },{"text":gls("ничего не получил")}];
      
      private var §_-Z2g§:Boolean = false;
      
      public function §_-OW§()
      {
         this.§_-o1r§ = §_-A11§.§_-J1u§;
         this.§_-i1D§ = §_-g1j§.§_-JS§;
         super();
      }
      
      override protected function get animation() : MovieClip
      {
         return new GoldSackView();
      }
      
      override protected function get beginAnimation() : MovieClip
      {
         return new GoldSackBegin();
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Hero = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-o1r§)
               {
                  return;
               }
               if(param1[2] != this.playerId)
               {
                  return;
               }
               if(!this.§_-21H§)
               {
                  return;
               }
               _loc2_ = this.§_-21H§.squirrels.get(param1[1]);
               _loc3_ = this.§_-21H§.squirrels.get(param1[2]);
               _loc2_.heroView.§_-Y15§(new this.animation.constructor());
               if("3" in param1)
               {
                  §_-u24§.sendMessage(param1[1],§_-Bm§[param1[3]]["text"],this.§_-i1D§);
                  this.§_-B1V§(param1[3],_loc2_);
                  if(_loc3_ != null && _loc3_ != _loc2_ && !_loc3_.isDead)
                  {
                     this.§_-B1V§(param1[3],_loc3_);
                  }
               }
               if(!this.§_-21H§.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-21H§.map.§_-Y1E§(this,true);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-B1V§(param1:int, param2:Hero) : void
      {
         if(!("count" in §_-Bm§[param1]))
         {
            return;
         }
         var _loc3_:Object = §_-Bm§[param1];
         var _loc4_:MovieClip = new (_loc3_.image as Class)() as MovieClip;
         this.§_-n26§(_loc4_);
         var _loc5_:Number = Math.min(20 / Math.max(_loc4_.width,1),20 / Math.max(_loc4_.height,1));
         if(!isFinite(_loc5_) || _loc5_ <= 0)
         {
            _loc5_ = 1;
         }
         §_-o1Q§.§_-K2u§(param2.x,param2.y,_loc3_.count,_loc3_.reward,_loc4_,_loc5_);
      }
      
      private function §_-n26§(param1:MovieClip) : void
      {
         if(param1.totalFrames < 1)
         {
            return;
         }
         var _loc2_:Rectangle = param1.getBounds(param1);
         if(_loc2_.width >= 1 && _loc2_.height >= 1)
         {
            return;
         }
         param1.gotoAndStop(1);
         _loc2_ = param1.getBounds(param1);
         if(_loc2_.width < 1 && _loc2_.height < 1 && param1.totalFrames > 1)
         {
            param1.gotoAndStop(param1.totalFrames);
         }
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-S27§,§_-D1m§.§_-xH§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
   }
}

