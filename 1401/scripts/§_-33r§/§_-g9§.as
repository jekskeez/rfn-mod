package §_-33r§
{
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   
   public class §_-g9§ extends §_-AP§
   {
      
      private var controller:b2ConstantAccelController = null;
      
      private var §_-xi§:Hero;
      
      public function §_-g9§(param1:Number, param2:Hero)
      {
         super(param1);
         this.§_-xi§ = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.followId = 0;
            this.hero.armadillo = false;
            this.hero.isStopped = false;
            this.hero.visible = true;
            this.hero.perksAvailable = true;
            this.hero.game.world.RemoveController(this.controller);
            this.controller.Clear();
            this.controller = null;
            this.§_-xi§ = null;
         }
         else
         {
            if(param1.id == Game.selfId)
            {
               param1.followId = this.§_-xi§.id;
            }
            param1.armadillo = true;
            param1.isStopped = true;
            param1.visible = false;
            param1.perksAvailable = false;
            this.controller = new b2ConstantAccelController();
            this.controller.A = param1.game.world.GetGravity().GetNegative();
            this.controller.AddBody(param1.body);
            param1.game.world.AddController(this.controller);
         }
         super.hero = param1;
      }
   }
}

