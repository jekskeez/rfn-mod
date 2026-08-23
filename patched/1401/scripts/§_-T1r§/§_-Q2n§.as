package §_-T1r§
{
   import §_-8I§.CastEvent;
   import §_-A2x§.§_-01J§;
   import flash.events.TimerEvent;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-23Q§;
   import game.mainGame.§_-bM§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-v1e§;
   import protocol.§_-h2B§;
   
   public class §_-Q2n§ extends §_-01J§
   {
      
      private static const §_-W2E§:int = 25;
      
      private var reloadTime:Number = 0;
      
      public function §_-Q2n§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-JG§ = §_-W2E§;
         if(this.§_-n1Q§.parentStarling)
         {
            this.§_-n1Q§.removeFromParent();
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.reloadTime -= param1;
      }
      
      override public function §_-qB§() : Boolean
      {
         var _loc1_:Class = null;
         var _loc2_:Hero = null;
         var _loc3_:§_-bM§ = null;
         if(!game || !game.squirrels)
         {
            return false;
         }
         if(this.castObject is §_-314§)
         {
            if(this.reloadTime > 0 || Boolean(this.aimCursor) && Boolean(!this.aimCursor.visible))
            {
               return false;
            }
            _loc1_ = §_-03s§.§_-F1T§(§_-03s§.§_-X21§(this.castObject));
            if(_loc1_ == null)
            {
               return false;
            }
            _loc2_ = game.squirrels.get(Game.selfId);
            if(_loc2_ == null || _loc2_.§_-l2U§ == null)
            {
               return false;
            }
            _loc3_ = game.squirrels.get(Game.selfId).§_-l2U§.§_-43X§(_loc1_,§_-bM§.§_-t2G§);
            if(_loc3_ == null || _loc3_.count <= 0)
            {
               return false;
            }
         }
         return super.§_-qB§();
      }
      
      override protected function §_-23§(param1:TimerEvent = null) : void
      {
         var _loc5_:§_-bM§ = null;
         §_-T13§(§_-h2B§.§_-C1c§,§_-h2B§.§_-W2S§);
         if(this.castObject is §_-v1e§)
         {
            this.reloadTime = (this.castObject as §_-v1e§).reloadTime;
         }
         this.§_-82s§ = false;
         if(this.castObject != null && Hero.self != null)
         {
            Hero.self.§_-Yn§(true);
         }
         var _loc2_:Class = §_-03s§.§_-F1T§(§_-03s§.§_-X21§(this.castObject));
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:§_-23Q§ = game.squirrels.get(Game.selfId).§_-l2U§;
         var _loc4_:§_-bM§ = _loc3_.§_-43X§(_loc2_,§_-bM§.§_-t2G§);
         if(_loc4_.count == 1)
         {
            if(_loc3_.items.length != 0)
            {
               for each(_loc5_ in _loc3_.items)
               {
                  if(_loc4_ != _loc5_)
                  {
                     if(_loc5_.type == §_-bM§.§_-t2G§)
                     {
                        if(_loc5_.count > 0)
                        {
                           §_-52I§(new CastEvent(CastEvent.SELECT,_loc5_.§_-D28§));
                           return;
                        }
                     }
                  }
               }
            }
         }
         if(this.castObject is §_-314§ && !§_-a9§.§_-O1z§)
         {
            this.§_-kd§ = true;
         }
      }
      
      override protected function §_-j2u§() : void
      {
      }
   }
}

