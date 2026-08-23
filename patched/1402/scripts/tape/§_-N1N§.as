package tape
{
   import §_-61C§.§_-a2p§;
   import §_-Qy§.§_-U2K§;
   import §_-S1n§.§_-K1y§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.§_-v1N§;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-N1N§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 48;
      
      private static const §_-u1l§:int = 38;
      
      private var §_-a1o§:TapeEditActive = null;
      
      protected var button:DisplayObject;
      
      protected var §_-oj§:§_-K1y§ = null;
      
      public var §_-i1H§:§_-v1N§;
      
      public var icon:DisplayObject;
      
      public function §_-N1N§(param1:§_-v1N§)
      {
         var _loc2_:int = 0;
         super();
         this.tabEnabled = false;
         this.§_-i1H§ = param1;
         this.§_-a1o§ = new TapeEditActive();
         this.§_-a1o§.visible = false;
         this.§_-a1o§.stop();
         addChild(this.§_-a1o§);
         this.button = new TapeEditButton() as DisplayObject;
         (this.button as SimpleButton).tabEnabled = false;
         addChild(this.button);
         this.icon = §_-f1b§.§_-425§(param1.§_-IA§);
         this.icon.x += int((§_-B1t§ - this.icon.width) * 0.5);
         this.icon.y += int((§_-u1l§ - this.icon.height) * 0.5);
         this.icon.cacheAsBitmap = true;
         if(this.icon is MovieClip)
         {
            (this.icon as MovieClip).stopAllMovieClips();
            (this.icon as MovieClip).mouseEnabled = false;
            (this.icon as MovieClip).mouseChildren = false;
         }
         addChild(this.icon);
         if(§_-f1b§.§_-q2W§(param1.§_-IA§) != -1)
         {
            _loc2_ = §_-f1b§.§_-3f§(this.§_-i1H§.§_-IA§).length * 7 + 30;
            this.§_-oj§ = new §_-K1y§(this,_loc2_ > 200 ? 200 : _loc2_,§_-f1b§.§_-3f§(this.§_-i1H§.§_-IA§),false,new Point(0,§_-a2p§.§_-X1y§));
         }
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
         this.§_-22v§();
         this.§_-lV§();
      }
      
      private function §_-22v§(param1:Event = null) : void
      {
         if(this.§_-oj§ == null)
         {
            return;
         }
         this.§_-lV§();
      }
      
      private function §_-lV§(param1:Event = null) : void
      {
         if(this.§_-oj§ == null)
         {
            return;
         }
         var _loc2_:Point = this.parent ? this.parent.localToGlobal(new Point(this.x,this.y)) : new Point(this.x,this.y);
         this.§_-oj§.setPosition(_loc2_.x - (this.§_-oj§.width + this.width) * 0.5,_loc2_.y - this.§_-oj§.height - 10);
      }
      
      public function §_-G2m§(param1:int) : void
      {
         if(§_-f1b§.§_-q2W§(this.§_-i1H§.§_-IA§) == -1)
         {
            return;
         }
         if(this.§_-oj§ != null)
         {
            this.§_-oj§.§_-qL§([new §_-U2K§(String(param1))]);
            this.§_-lV§();
         }
      }
      
      public function §_-h2l§() : void
      {
         if(§_-f1b§.§_-q2W§(this.§_-i1H§.§_-IA§) == -1)
         {
            return;
         }
         if(this.§_-oj§ != null)
         {
            this.§_-oj§.§_-qL§([]);
            this.§_-lV§();
         }
      }
      
      public function dispose() : void
      {
         if(this.§_-oj§ == null)
         {
            return;
         }
         this.§_-oj§.remove();
         this.§_-oj§ = null;
      }
      
      public function §_-22p§() : void
      {
         this.§_-a1o§.visible = true;
         this.§_-a1o§.play();
      }
      
      public function §_-4Y§() : void
      {
         this.§_-a1o§.visible = false;
         this.§_-a1o§.stop();
      }
   }
}

