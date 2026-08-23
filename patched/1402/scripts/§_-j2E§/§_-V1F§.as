package §_-j2E§
{
   import flash.display.MovieClip;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import sounds.GameSounds;
   import starling.filters.ColorMatrixFilter;
   
   public class §_-V1F§ extends §_-92f§
   {
      
      private static var _enabled:int = 0;
      
      private static var §_-L1J§:MovieClip = null;
      
      public function §_-V1F§(param1:Hero)
      {
         super(param1);
      }
      
      private static function §_-yr§() : ColorMatrixFilter
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter();
         _loc1_.§_-M2U§(-1);
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
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         _enabled = 0;
         if(§_-L1J§ != null && §_-L1J§.parent != null)
         {
            §_-L1J§.parent.removeChild(§_-L1J§);
         }
         §_-L1J§ = null;
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
         if(§_-L1J§ != null && §_-L1J§.parent != null)
         {
            §_-L1J§.parent.removeChild(§_-L1J§);
         }
         §_-L1J§ = null;
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
         SquirrelCollection.instance.filters = this.enabled ? [§_-yr§()] : [];
         GameMap.instance.filters = this.enabled ? [§_-yr§()] : [];
         if(this.enabled)
         {
            if(§_-L1J§ == null)
            {
               §_-L1J§ = new CharliPerkView();
            }
            §_-L1J§.mouseEnabled = false;
            §_-L1J§.mouseChildren = false;
            §_-L1J§.width = Game.starling.stage.stageWidth;
            §_-L1J§.height = Game.starling.stage.stageHeight * 1.06;
            if(!SquirrelGame.instance.contains(§_-L1J§))
            {
               SquirrelGame.instance.addChild(§_-L1J§);
            }
            GameSounds.play("perk_chaplin");
         }
         else if(§_-L1J§ != null && SquirrelGame.instance.contains(§_-L1J§))
         {
            SquirrelGame.instance.removeChild(§_-L1J§);
         }
      }
      
      private function get enabled() : Boolean
      {
         return _enabled > 0;
      }
   }
}

