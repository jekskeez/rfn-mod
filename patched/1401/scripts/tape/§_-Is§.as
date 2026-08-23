package tape
{
   import §_-e1G§.§_-Hb§;
   import flash.display.MovieClip;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-Is§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 50;
      
      private static const §_-R1K§:int = 40;
      
      public var className:Class;
      
      public function §_-Is§(param1:Class, param2:int = 145)
      {
         this.className = param1;
         super();
         addChild(new TapeEditButton());
         var _loc3_:* = §_-03s§.§_-a2D§(param1);
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).stopAllMovieClips();
         }
         _loc3_.x += int((§_-r2u§ - _loc3_.width) * 0.5);
         _loc3_.y += int((§_-R1K§ - _loc3_.height) * 0.5);
         addChild(_loc3_);
         var _loc4_:§_-Hb§ = new §_-Hb§(this,§_-03s§.§_-bh§(param1));
         _loc4_.maxWidth = param2;
      }
   }
}

