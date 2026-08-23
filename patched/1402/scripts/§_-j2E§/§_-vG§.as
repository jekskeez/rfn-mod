package §_-j2E§
{
   import flash.display.MovieClip;
   import game.mainGame.SquirrelGame;
   
   public class §_-vG§ extends §_-92f§
   {
      
      public static var count:int = 0;
      
      private var §_-e16§:MovieClip = null;
      
      public function §_-vG§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "deadpool";
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
         if(this.§_-e16§ != null && this.§_-e16§.parent != null)
         {
            this.§_-e16§.parent.removeChild(this.§_-e16§);
         }
         this.§_-e16§ = null;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-e16§ == null)
         {
            this.§_-e16§ = new DeadpoolPerkView();
         }
         this.§_-e16§.mouseEnabled = false;
         this.§_-e16§.mouseChildren = false;
         this.§_-e16§.scaleX = count % 2 == 0 ? 1 : -1;
         this.§_-e16§.x = count % 2 == 0 ? 0 : §_-Zy§.§_-21V§;
         if(!SquirrelGame.instance.contains(this.§_-e16§))
         {
            SquirrelGame.instance.addChild(this.§_-e16§);
         }
         ++count;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-e16§ != null && this.§_-e16§.parent != null)
         {
            this.§_-e16§.parent.removeChild(this.§_-e16§);
         }
         this.§_-e16§ = null;
      }
   }
}

