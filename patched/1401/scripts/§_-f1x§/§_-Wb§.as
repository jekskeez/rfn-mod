package §_-f1x§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-vy§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-Wb§ extends Sprite
   {
      
      public function §_-Wb§(param1:int)
      {
         super();
         var _loc2_:Class = §_-vy§.§_-R2S§(param1);
         var _loc3_:DisplayObject = new _loc2_();
         _loc3_.scaleX = _loc3_.scaleY = 2;
         addChild(_loc3_);
         TweenMax.to(_loc3_,1,{"alpha":0});
         var _loc4_:CollectionAssembleHideMovie = new CollectionAssembleHideMovie();
         _loc4_.scaleX = _loc4_.scaleY = 2.4;
         _loc4_.x = _loc3_.width * 0.5;
         _loc4_.y = _loc3_.height * 0.5;
         _loc4_.addEventListener(Event.COMPLETE,this.onComplete);
         addChild(_loc4_);
      }
      
      private function onComplete(param1:Event) : void
      {
         if(!this.parent)
         {
            return;
         }
         this.parent.removeChild(this);
      }
   }
}

