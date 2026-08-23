package §_-U19§
{
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §_-VK§ extends EventDispatcher
   {
      
      public var playerId:int = 0;
      
      public var selected:Boolean = false;
      
      public var level:int = -1;
      
      public var time:int = -1;
      
      public var player:Player = null;
      
      public function §_-VK§(param1:int, param2:int)
      {
         super();
         this.playerId = param1;
         this.time = param2;
         Game.listen(this.§_-Y16§);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.playerId)
         {
            return;
         }
         this.player = _loc2_;
         this.level = _loc2_["level"];
         Game.forget(this.§_-Y16§);
         dispatchEvent(new Event("LOADED"));
      }
   }
}

