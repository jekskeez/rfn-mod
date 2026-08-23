package
{
   import §_-X1k§.§_-1K§;
   import §_-c2C§.§_-817§;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.display3D.Context3DProfile;
   import flash.display3D.Context3DRenderMode;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import starling.core.Starling;
   
   public class Main extends Sprite
   {
      
      public function Main()
      {
         super();
         if(this.stage != null)
         {
            this.init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      private function init(param1:Event = null) : void
      {
         Starling.§_-B2f§ = true;
         Starling.§_-72h§ = true;
         var _loc2_:Boolean = Capabilities.screenResolutionX * this.stage.contentsScaleFactor > 2047 || Capabilities.screenResolutionY * this.stage.contentsScaleFactor > 2047 || §_-Zy§.§_-e2k§;
         var _loc3_:Rectangle = new Rectangle(0,0,§_-Zy§.§_-21V§,§_-Zy§.§_-02T§);
         var _loc4_:Starling = new Starling(§_-817§,this.stage,_loc3_,null,Context3DRenderMode.AUTO,_loc2_ ? Context3DProfile.BASELINE_EXTENDED : Context3DProfile.BASELINE);
         _loc4_.§_-84§ = true;
         _loc4_.antiAliasing = 0;
         _loc4_.§_-yL§ = false;
         _loc4_.start();
         this.§_-W2D§();
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.stage.align = StageAlign.TOP_LEFT;
         Game.§_-q1L§ = new Sprite();
         Game.§_-q1L§.tabChildren = false;
         addChild(Game.§_-q1L§);
         Game.starling = _loc4_;
         Game.starling.§_-yL§ = false;
         Game.starling.stage.color = 23728;
         §_-1K§.init();
         §_-1K§.onLoaded = this.§_-d2Q§;
      }
      
      private function §_-d2Q§() : void
      {
         Game.§_-q1L§.addChild(new Game());
         Game.stage.color = 23728;
      }
      
      private function §_-W2D§(param1:Event = null) : void
      {
         if(!§_-Zy§.§_-e2k§)
         {
            return;
         }
      }
   }
}

