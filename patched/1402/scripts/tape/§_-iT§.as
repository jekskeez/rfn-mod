package tape
{
   import §_-S1n§.§_-kr§;
   import flash.display.MovieClip;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-iT§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 50;
      
      private static const §_-u1l§:int = 40;
      
      public var className:Class;
      
      public function §_-iT§(param1:Class, param2:int = 145)
      {
         this.className = param1;
         super();
         addChild(new TapeEditButton());
         var _loc3_:* = §_-f1b§.§_-425§(param1);
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).stopAllMovieClips();
         }
         _loc3_.x += int((§_-B1t§ - _loc3_.width) * 0.5);
         _loc3_.y += int((§_-u1l§ - _loc3_.height) * 0.5);
         addChild(_loc3_);
         var _loc4_:§_-kr§ = new §_-kr§(this,§_-f1b§.§_-3f§(param1));
         _loc4_.maxWidth = param2;
      }
   }
}

