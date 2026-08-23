package
{
   import §_-I10§.§_-539§;
   import §_-T2y§.§_-s1i§;
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
         Starling.§_-m2K§ = true;
         Starling.§_-22F§ = true;
         var _loc2_:Boolean = Capabilities.screenResolutionX * this.stage.contentsScaleFactor > 2047 || Capabilities.screenResolutionY * this.stage.contentsScaleFactor > 2047 || §_-a9§.§_-O1z§;
         var _loc3_:Rectangle = new Rectangle(0,0,§_-a9§.§_-9o§,§_-a9§.§_-31m§);
         var _loc4_:Starling = new Starling(§_-s1i§,this.stage,_loc3_,null,Context3DRenderMode.AUTO,_loc2_ ? Context3DProfile.BASELINE_EXTENDED : Context3DProfile.BASELINE);
         _loc4_.§_-I2T§ = true;
         _loc4_.antiAliasing = 0;
         _loc4_.§_-NM§ = false;
         _loc4_.start();
         this.§_-s2z§();
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.stage.align = StageAlign.TOP_LEFT;
         Game.§_-d2t§ = new Sprite();
         Game.§_-d2t§.tabChildren = false;
         addChild(Game.§_-d2t§);
         Game.starling = _loc4_;
         Game.starling.§_-NM§ = false;
         Game.starling.stage.color = 23728;
         §_-539§.init();
         §_-539§.onLoaded = this.§_-Z1Y§;
      }
      
      private function §_-Z1Y§() : void
      {
         Game.§_-d2t§.addChild(new Game());
         Game.stage.color = 23728;
      }
      
      private function §_-s2z§(param1:Event = null) : void
      {
         if(!§_-a9§.§_-O1z§)
         {
            return;
         }
      }
   }
}

