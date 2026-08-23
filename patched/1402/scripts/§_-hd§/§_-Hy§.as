package §_-hd§
{
   import §_-Mq§.DisplayObjectManager;
   import §_-TK§.§_-f1u§;
   import flash.utils.getDefinitionByName;
   
   public class §_-Hy§
   {
      
      private static var instance:§_-Hy§ = null;
      
      private var §_-e1B§:Array;
      
      public function §_-Hy§()
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:§_-f1u§ = null;
         this.§_-e1B§ = [AcornEffectLight,AcornContactMovie,AcornsVector,Bubble,BombExplode,BombPrepere,BubbleBurst,ImmortalityBubble,ActiveAura,HollowContactMovie,HollowWow,HollowEyes,Hollow,HollowBlue,HollowRed,HollowDoor,BridgeLeft,BridgeMiddle,BridgeRight,IceGroundLeft,IceGroundMiddle,IceGroundRight,SwampLeft,SwampMiddle,SwampRight,OilLeft,OilMiddle,OilRight,OilBlackLeft,OilBlackMiddle,OilBlackRight];
         super();
         if(!instance)
         {
            _loc1_ = 0;
            _loc2_ = int(this.§_-e1B§.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = new §_-f1u§(new this.§_-e1B§[_loc1_]());
               _loc3_.removeFromParent(false);
               _loc1_++;
            }
            DisplayObjectManager.getInstance().§_-i16§ = DisplayObjectManager.getInstance().length;
         }
         instance = this;
      }
   }
}

