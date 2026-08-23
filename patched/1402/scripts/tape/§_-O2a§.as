package tape
{
   import §_-S1n§.§_-kr§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-O2a§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 48;
      
      private static const §_-u1l§:int = 38;
      
      protected var button:DisplayObject;
      
      public var §_-oj§:§_-kr§ = null;
      
      public var className:Class;
      
      public function §_-O2a§(param1:Class, param2:Class = null)
      {
         super();
         this.className = param1;
         if(param2 == null)
         {
            param2 = TapeEditButton;
         }
         var _loc3_:* = §_-f1b§.§_-425§(param1);
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).stopAllMovieClips();
         }
         _loc3_.x += int((§_-B1t§ - _loc3_.width) * 0.5);
         _loc3_.y += int((§_-u1l§ - _loc3_.height) * 0.5);
         addChild(_loc3_);
         this.button = new param2() as DisplayObject;
         addChild(this.button);
         this.§_-oj§ = new §_-kr§(this,§_-f1b§.§_-3f§(param1),false);
      }
   }
}

