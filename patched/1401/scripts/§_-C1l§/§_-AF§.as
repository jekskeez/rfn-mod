package §_-C1l§
{
   import §_-1T§.DisplayObjectManager;
   import §_-RI§.§_-d2d§;
   import flash.utils.getDefinitionByName;
   
   public class §_-AF§
   {
      
      private static var instance:§_-AF§ = null;
      
      private var §_-22T§:Array;
      
      public function §_-AF§()
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:§_-d2d§ = null;
         this.§_-22T§ = [AcornEffectLight,AcornContactMovie,AcornsVector,Bubble,BombExplode,BombPrepere,BubbleBurst,ImmortalityBubble,ActiveAura,HollowContactMovie,HollowWow,HollowEyes,Hollow,HollowBlue,HollowRed,HollowDoor,BridgeLeft,BridgeMiddle,BridgeRight,IceGroundLeft,IceGroundMiddle,IceGroundRight,SwampLeft,SwampMiddle,SwampRight,OilLeft,OilMiddle,OilRight,OilBlackLeft,OilBlackMiddle,OilBlackRight];
         super();
         if(!instance)
         {
            _loc1_ = 0;
            _loc2_ = int(this.§_-22T§.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = new §_-d2d§(new this.§_-22T§[_loc1_]());
               _loc3_.removeFromParent(false);
               _loc1_++;
            }
            DisplayObjectManager.getInstance().§_-Q1y§ = DisplayObjectManager.getInstance().length;
         }
         instance = this;
      }
   }
}

