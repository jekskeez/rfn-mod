package §_-P2b§
{
   import flash.display.MovieClip;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import sounds.GameSounds;
   import starling.filters.ColorMatrixFilter;
   
   public class §_-3k§ extends §_-H2N§
   {
      
      private static var _enabled:int = 0;
      
      private static var §_-6D§:MovieClip = null;
      
      public function §_-3k§(param1:Hero)
      {
         super(param1);
      }
      
      private static function §_-939§() : ColorMatrixFilter
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter();
         _loc1_.§_-K2N§(-1);
         return _loc1_;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return true;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.enabled;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         _enabled = 0;
         if(§_-6D§ != null && §_-6D§.parent != null)
         {
            §_-6D§.parent.removeChild(§_-6D§);
         }
         §_-6D§ = null;
         if(!SquirrelCollection.instance || !GameMap.instance)
         {
            return;
         }
         SquirrelCollection.instance.filters = [];
         GameMap.instance.filters = [];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(§_-6D§ != null && §_-6D§.parent != null)
         {
            §_-6D§.parent.removeChild(§_-6D§);
         }
         §_-6D§ = null;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.enabled = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.enabled = false;
      }
      
      private function set enabled(param1:Boolean) : void
      {
         var _loc2_:Boolean = this.enabled;
         _enabled += param1 ? 1 : -1;
         if(_loc2_ == this.enabled)
         {
            return;
         }
         if(!SquirrelCollection.instance || !GameMap.instance)
         {
            return;
         }
         SquirrelCollection.instance.filters = this.enabled ? [§_-939§()] : [];
         GameMap.instance.filters = this.enabled ? [§_-939§()] : [];
         if(this.enabled)
         {
            if(§_-6D§ == null)
            {
               §_-6D§ = new CharliPerkView();
            }
            §_-6D§.mouseEnabled = false;
            §_-6D§.mouseChildren = false;
            §_-6D§.width = Game.starling.stage.stageWidth;
            §_-6D§.height = Game.starling.stage.stageHeight * 1.06;
            if(!SquirrelGame.instance.contains(§_-6D§))
            {
               SquirrelGame.instance.addChild(§_-6D§);
            }
            GameSounds.play("perk_chaplin");
         }
         else if(§_-6D§ != null && SquirrelGame.instance.contains(§_-6D§))
         {
            SquirrelGame.instance.removeChild(§_-6D§);
         }
      }
      
      private function get enabled() : Boolean
      {
         return _enabled > 0;
      }
   }
}

