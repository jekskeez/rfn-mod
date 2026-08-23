package §_-cm§
{
   import §_-X2V§.CastEvent;
   import §_-td§.§_-z2w§;
   import flash.events.TimerEvent;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-Cd§;
   import game.mainGame.§_-v1N§;
   import game.mainGame.entity.§_-f1§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-sn§;
   import protocol.§_-u1O§;
   
   public class §_-Tv§ extends §_-z2w§
   {
      
      private static const §_-u10§:int = 25;
      
      private var reloadTime:Number = 0;
      
      public function §_-Tv§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-G2O§ = §_-u10§;
         if(this.§_-kH§.parentStarling)
         {
            this.§_-kH§.removeFromParent();
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.reloadTime -= param1;
      }
      
      override public function §_-03o§() : Boolean
      {
         var _loc1_:Class = null;
         var _loc2_:Hero = null;
         var _loc3_:§_-v1N§ = null;
         if(!game || !game.squirrels)
         {
            return false;
         }
         if(this.castObject is §_-sn§)
         {
            if(this.reloadTime > 0 || Boolean(this.aimCursor) && Boolean(!this.aimCursor.visible))
            {
               return false;
            }
            _loc1_ = §_-f1b§.§_-N1m§(§_-f1b§.§_-q2W§(this.castObject));
            if(_loc1_ == null)
            {
               return false;
            }
            _loc2_ = game.squirrels.get(Game.selfId);
            if(_loc2_ == null || _loc2_.§_-h1z§ == null)
            {
               return false;
            }
            _loc3_ = game.squirrels.get(Game.selfId).§_-h1z§.§_-815§(_loc1_,§_-v1N§.§_-W29§);
            if(_loc3_ == null || _loc3_.count <= 0)
            {
               return false;
            }
         }
         return super.§_-03o§();
      }
      
      override protected function §_-Va§(param1:TimerEvent = null) : void
      {
         var _loc5_:§_-v1N§ = null;
         §_-tT§(§_-u1O§.§_-gQ§,§_-u1O§.§_-3q§);
         if(this.castObject is §_-f1§)
         {
            this.reloadTime = (this.castObject as §_-f1§).reloadTime;
         }
         this.§_-Q25§ = false;
         if(this.castObject != null && Hero.self != null)
         {
            Hero.self.§_-C2u§(true);
         }
         var _loc2_:Class = §_-f1b§.§_-N1m§(§_-f1b§.§_-q2W§(this.castObject));
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:§_-Cd§ = game.squirrels.get(Game.selfId).§_-h1z§;
         var _loc4_:§_-v1N§ = _loc3_.§_-815§(_loc2_,§_-v1N§.§_-W29§);
         if(_loc4_.count == 1)
         {
            if(_loc3_.items.length != 0)
            {
               for each(_loc5_ in _loc3_.items)
               {
                  if(_loc4_ != _loc5_)
                  {
                     if(_loc5_.type == §_-v1N§.§_-W29§)
                     {
                        if(_loc5_.count > 0)
                        {
                           §_-ff§(new CastEvent(CastEvent.SELECT,_loc5_.§_-IA§));
                           return;
                        }
                     }
                  }
               }
            }
         }
         if(this.castObject is §_-sn§ && !§_-Zy§.§_-e2k§)
         {
            this.§_-uO§ = true;
         }
      }
      
      override protected function §_-S1W§() : void
      {
      }
   }
}

