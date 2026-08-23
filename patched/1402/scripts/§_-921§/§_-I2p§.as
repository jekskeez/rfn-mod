package §_-921§
{
   import §_-X2V§.HollowEvent;
   import §_-td§.GameMapNet;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-636§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-I2p§ extends GameMapNet
   {
      
      public function §_-I2p§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-q1X§ = true;
      }
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         super.onHollow(param1);
         if(!(param1.player is §_-A25§))
         {
            return;
         }
         if(!(param1.player as §_-A25§).§_-81F§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-63z§,1);
         }
         if((param1.player as §_-A25§).§_-F16§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-Y1G§,1);
         }
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         if(param1 is §_-636§)
         {
            (this.game.squirrels as §_-u1h§).thirstController.add(param1);
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
            if(_loc3_ is §_-636§)
            {
               (this.game.squirrels as §_-u1h§).thirstController.remove(_loc3_);
            }
         }
         else if(param1 is §_-636§)
         {
            (this.game.squirrels as §_-u1h§).thirstController.remove(param1);
         }
         super.remove(param1,param2);
      }
      
      override public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.objects.length);
         while(_loc1_ < _loc2_)
         {
            if(this.objects[_loc1_] is §_-636§)
            {
               (this.game.squirrels as §_-u1h§).thirstController.remove(this.objects[_loc1_]);
            }
            _loc1_++;
         }
         super.clear();
      }
   }
}

