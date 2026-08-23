package §_-dc§
{
   import flash.events.EventDispatcher;
   import game.mainGame.§_-Tm§;
   
   public class §_-V17§ extends EventDispatcher implements §_-Tm§
   {
      
      protected var §_-Qp§:int = -1;
      
      protected var hero:Hero = null;
      
      public var bonus:int = 0;
      
      public function §_-V17§(param1:Hero, param2:int)
      {
         this.hero = param1;
         this.bonus = param2;
         super();
      }
      
      public function get id() : int
      {
         return this.§_-Qp§;
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

