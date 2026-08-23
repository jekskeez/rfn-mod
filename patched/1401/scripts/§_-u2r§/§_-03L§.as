package §_-u2r§
{
   import §_-I10§.§_-428§;
   import §_-P2b§.§_-6L§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import protocol.§_-S2I§;
   import utils.§_-r2N§;
   
   public class §_-03L§ extends §_-R1r§ implements §_-jP§
   {
      
      private static const §_-rG§:Array = [{
         "count":3,
         "image":ImageIconNut,
         "reward":§_-428§.§_-wG§,
         "text":gls("получил орешки")
      },{
         "count":1,
         "image":ImageIconCoins,
         "reward":§_-428§.§_-113§,
         "text":gls("получил монетку")
      },{
         "count":2,
         "image":ImageIconMana,
         "reward":§_-428§.§_-a1H§,
         "text":gls("получил ману")
      },{
         "count":2,
         "image":ImageIconEnergy,
         "reward":§_-428§.§_-61Q§,
         "text":gls("получил энергию")
      },{"text":gls("ничего не получил")}];
      
      private var §_-Q2t§:Boolean = false;
      
      public function §_-03L§()
      {
         this.§_-WN§ = §_-6L§.§_-D14§;
         this.§_-pV§ = §_-A1n§.§_-71L§;
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
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Hero = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-WN§)
               {
                  return;
               }
               if(param1[2] != this.playerId)
               {
                  return;
               }
               if(!this.§_-H2D§)
               {
                  return;
               }
               _loc2_ = this.§_-H2D§.squirrels.get(param1[1]);
               _loc3_ = this.§_-H2D§.squirrels.get(param1[2]);
               _loc2_.heroView.§_-634§(new this.animation.constructor());
               if("3" in param1)
               {
                  §_-92z§.sendMessage(param1[1],§_-rG§[param1[3]]["text"],this.§_-pV§);
                  this.§_-IZ§(param1[3],_loc2_);
                  if(_loc3_ != null && _loc3_ != _loc2_ && !_loc3_.isDead)
                  {
                     this.§_-IZ§(param1[3],_loc3_);
                  }
               }
               if(!this.§_-H2D§.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-H2D§.map.§_-Qc§(this,true);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-IZ§(param1:int, param2:Hero) : void
      {
         if(!("count" in §_-rG§[param1]))
         {
            return;
         }
         var _loc3_:Object = §_-rG§[param1];
         var _loc4_:MovieClip = new (_loc3_.image as Class)() as MovieClip;
         this.§_-6k§(_loc4_);
         var _loc5_:Number = Math.min(20 / Math.max(_loc4_.width,1),20 / Math.max(_loc4_.height,1));
         if(!isFinite(_loc5_) || _loc5_ <= 0)
         {
            _loc5_ = 1;
         }
         §_-r2N§.§_-A3v§(param2.x,param2.y,_loc3_.count,_loc3_.reward,_loc4_,_loc5_);
      }
      
      private function §_-6k§(param1:MovieClip) : void
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
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-F2F§,§_-1s§.§_-Bk§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
   }
}

