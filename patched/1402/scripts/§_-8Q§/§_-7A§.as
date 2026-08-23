package §_-8Q§
{
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import game.mainGame.SquirrelGame;
   
   public class §_-7A§ extends GameBody
   {
      
      protected var view:§_-f1u§ = null;
      
      public function §_-7A§(param1:Class = null, param2:int = 0, param3:int = 0)
      {
         super();
         if(!param1)
         {
            return;
         }
         this.view = new §_-f1u§(new param1());
         this.view.x = -this.view.width * 0.5 + param2;
         this.view.y = -this.view.height + param3;
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-21H§ = param1.userData as SquirrelGame;
         super.showDebug = false;
      }
      
      override public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         if(this.parentStarling != null)
         {
            this.removeChildStarling(this);
         }
      }
   }
}

