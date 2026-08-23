package tape
{
   import §_-S1D§.§_-O1M§;
   import §_-d10§.§_-02M§;
   import §_-e1G§.§_-N2L§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.§_-bM§;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-63z§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 48;
      
      private static const §_-R1K§:int = 38;
      
      private var §_-3r§:TapeEditActive = null;
      
      protected var button:DisplayObject;
      
      protected var §_-XW§:§_-N2L§ = null;
      
      public var §_-L1z§:§_-bM§;
      
      public var icon:DisplayObject;
      
      public function §_-63z§(param1:§_-bM§)
      {
         var _loc2_:int = 0;
         super();
         this.tabEnabled = false;
         this.§_-L1z§ = param1;
         this.§_-3r§ = new TapeEditActive();
         this.§_-3r§.visible = false;
         this.§_-3r§.stop();
         addChild(this.§_-3r§);
         this.button = new TapeEditButton() as DisplayObject;
         (this.button as SimpleButton).tabEnabled = false;
         addChild(this.button);
         this.icon = §_-03s§.§_-a2D§(param1.§_-D28§);
         this.icon.x += int((§_-r2u§ - this.icon.width) * 0.5);
         this.icon.y += int((§_-R1K§ - this.icon.height) * 0.5);
         this.icon.cacheAsBitmap = true;
         if(this.icon is MovieClip)
         {
            (this.icon as MovieClip).stopAllMovieClips();
            (this.icon as MovieClip).mouseEnabled = false;
            (this.icon as MovieClip).mouseChildren = false;
         }
         addChild(this.icon);
         if(§_-03s§.§_-X21§(param1.§_-D28§) != -1)
         {
            _loc2_ = §_-03s§.§_-bh§(this.§_-L1z§.§_-D28§).length * 7 + 30;
            this.§_-XW§ = new §_-N2L§(this,_loc2_ > 200 ? 200 : _loc2_,§_-03s§.§_-bh§(this.§_-L1z§.§_-D28§),false,new Point(0,§_-O1M§.§_-Ir§));
         }
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
         this.§_-V1Q§();
         this.§_-w1u§();
      }
      
      private function §_-V1Q§(param1:Event = null) : void
      {
         if(this.§_-XW§ == null)
         {
            return;
         }
         this.§_-w1u§();
      }
      
      private function §_-w1u§(param1:Event = null) : void
      {
         if(this.§_-XW§ == null)
         {
            return;
         }
         var _loc2_:Point = this.parent ? this.parent.localToGlobal(new Point(this.x,this.y)) : new Point(this.x,this.y);
         this.§_-XW§.setPosition(_loc2_.x - (this.§_-XW§.width + this.width) * 0.5,_loc2_.y - this.§_-XW§.height - 10);
      }
      
      public function §_-P1l§(param1:int) : void
      {
         if(§_-03s§.§_-X21§(this.§_-L1z§.§_-D28§) == -1)
         {
            return;
         }
         if(this.§_-XW§ != null)
         {
            this.§_-XW§.§_-b2m§([new §_-02M§(String(param1))]);
            this.§_-w1u§();
         }
      }
      
      public function §_-73h§() : void
      {
         if(§_-03s§.§_-X21§(this.§_-L1z§.§_-D28§) == -1)
         {
            return;
         }
         if(this.§_-XW§ != null)
         {
            this.§_-XW§.§_-b2m§([]);
            this.§_-w1u§();
         }
      }
      
      public function dispose() : void
      {
         if(this.§_-XW§ == null)
         {
            return;
         }
         this.§_-XW§.remove();
         this.§_-XW§ = null;
      }
      
      public function §_-82I§() : void
      {
         this.§_-3r§.visible = true;
         this.§_-3r§.play();
      }
      
      public function §_-Pu§() : void
      {
         this.§_-3r§.visible = false;
         this.§_-3r§.stop();
      }
   }
}

