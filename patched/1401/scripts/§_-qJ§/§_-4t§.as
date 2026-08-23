package §_-qJ§
{
   import §_-8I§.HollowEvent;
   import §_-A2x§.GameMapNet;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-1j§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-4t§ extends GameMapNet
   {
      
      public function §_-4t§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-92w§ = true;
      }
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         super.onHollow(param1);
         if(!(param1.player is §_-w1I§))
         {
            return;
         }
         if(!(param1.player as §_-w1I§).§_-b1x§)
         {
            Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-w15§,1);
         }
         if((param1.player as §_-w1I§).§_-c2d§)
         {
            Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-8u§,1);
         }
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         if(param1 is §_-1j§)
         {
            (this.game.squirrels as §_-J2k§).thirstController.add(param1);
         }
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         var _loc3_:* = undefined;
         if(param1 == null)
         {
            return;
         }
         if(param1 is int)
         {
            if(this.objects[param1] == null)
            {
               return;
            }
            _loc3_ = this.objects[param1];
            if(_loc3_ is §_-1j§)
            {
               (this.game.squirrels as §_-J2k§).thirstController.remove(_loc3_);
            }
         }
         else if(param1 is §_-1j§)
         {
            (this.game.squirrels as §_-J2k§).thirstController.remove(param1);
         }
         super.remove(param1,param2);
      }
      
      override public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.objects.length);
         while(_loc1_ < _loc2_)
         {
            if(this.objects[_loc1_] is §_-1j§)
            {
               (this.game.squirrels as §_-J2k§).thirstController.remove(this.objects[_loc1_]);
            }
            _loc1_++;
         }
         super.clear();
      }
   }
}

