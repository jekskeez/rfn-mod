package §_-83V§
{
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-d2d§;
   import game.mainGame.SquirrelGame;
   
   public class §_-e2B§ extends GameBody
   {
      
      protected var view:§_-d2d§ = null;
      
      public function §_-e2B§(param1:Class = null, param2:int = 0, param3:int = 0)
      {
         super();
         if(!param1)
         {
            return;
         }
         this.view = new §_-d2d§(new param1());
         this.view.x = -this.view.width * 0.5 + param2;
         this.view.y = -this.view.height + param3;
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-H2D§ = param1.userData as SquirrelGame;
         super.showDebug = false;
      }
      
      override public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         if(this.parentStarling != null)
         {
            this.removeChildStarling(this);
         }
      }
   }
}

