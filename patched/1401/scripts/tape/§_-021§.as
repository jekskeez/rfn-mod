package tape
{
   import §_-e1G§.§_-Hb§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-021§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 48;
      
      private static const §_-R1K§:int = 38;
      
      protected var button:DisplayObject;
      
      public var §_-XW§:§_-Hb§ = null;
      
      public var className:Class;
      
      public function §_-021§(param1:Class, param2:Class = null)
      {
         super();
         this.className = param1;
         if(param2 == null)
         {
            param2 = TapeEditButton;
         }
         var _loc3_:* = §_-03s§.§_-a2D§(param1);
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).stopAllMovieClips();
         }
         _loc3_.x += int((§_-r2u§ - _loc3_.width) * 0.5);
         _loc3_.y += int((§_-R1K§ - _loc3_.height) * 0.5);
         addChild(_loc3_);
         this.button = new param2() as DisplayObject;
         addChild(this.button);
         this.§_-XW§ = new §_-Hb§(this,§_-03s§.§_-bh§(param1),false);
      }
   }
}

