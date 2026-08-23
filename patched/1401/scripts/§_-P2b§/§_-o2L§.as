package §_-P2b§
{
   import flash.display.MovieClip;
   import game.mainGame.SquirrelGame;
   
   public class §_-o2L§ extends §_-H2N§
   {
      
      public static var count:int = 0;
      
      private var §_-72v§:MovieClip = null;
      
      public function §_-o2L§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "deadpool";
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return true;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-72v§ != null && this.§_-72v§.parent != null)
         {
            this.§_-72v§.parent.removeChild(this.§_-72v§);
         }
         this.§_-72v§ = null;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-72v§ == null)
         {
            this.§_-72v§ = new DeadpoolPerkView();
         }
         this.§_-72v§.mouseEnabled = false;
         this.§_-72v§.mouseChildren = false;
         this.§_-72v§.scaleX = count % 2 == 0 ? 1 : -1;
         this.§_-72v§.x = count % 2 == 0 ? 0 : §_-a9§.§_-9o§;
         if(!SquirrelGame.instance.contains(this.§_-72v§))
         {
            SquirrelGame.instance.addChild(this.§_-72v§);
         }
         ++count;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-72v§ != null && this.§_-72v§.parent != null)
         {
            this.§_-72v§.parent.removeChild(this.§_-72v§);
         }
         this.§_-72v§ = null;
      }
   }
}

