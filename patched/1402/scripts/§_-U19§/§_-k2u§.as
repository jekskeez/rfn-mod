package §_-U19§
{
   import flash.events.EventDispatcher;
   import game.mainGame.§_-F1c§;
   
   public class §_-k2u§ extends EventDispatcher implements §_-F1c§
   {
      
      protected var §_-s19§:int = -1;
      
      protected var hero:Hero = null;
      
      public var bonus:int = 0;
      
      public function §_-k2u§(param1:Hero, param2:int)
      {
         this.hero = param1;
         this.bonus = param2;
         super();
      }
      
      public function get id() : int
      {
         return this.§_-s19§;
      }
      
      public function dispose() : void
      {
         this.hero = null;
      }
      
      public function update(param1:Number = 0) : void
      {
      }
   }
}

