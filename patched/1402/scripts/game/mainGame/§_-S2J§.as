package game.mainGame
{
   import §_-61C§.§_-im§;
   import §_-J1i§.§_-H1z§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-t2c§;
   import chat.§_-O1y§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-S2J§
   {
      
      private static var §_-j14§:Point = new Point();
      
      public var §_-b2y§:DisplayObjectContainer = null;
      
      public function §_-S2J§()
      {
         super();
      }
      
      private static function §_-m1t§(param1:Point, param2:DisplayObjectContainer) : Boolean
      {
         var _loc3_:Dialog = null;
         if(§_-Na§(§_-O1y§.instance,param1))
         {
            return false;
         }
         for each(_loc3_ in §_-t2c§.§_-w22§())
         {
            if(§_-Na§(_loc3_,param1))
            {
               return false;
            }
         }
         if(!§_-b1m§(param1,param2))
         {
            return true;
         }
         if(§_-Na§(§_-im§.instance,param1))
         {
            return false;
         }
         if(§_-Na§(§_-H1z§.instance,param1))
         {
            return false;
         }
         if(§_-Na§(Game.chat as DisplayObjectContainer,param1))
         {
            return false;
         }
         if(Boolean(param2) && §_-Na§(param2,param1))
         {
            return false;
         }
         return true;
      }
      
      private static function §_-b1m§(param1:Point, param2:DisplayObjectContainer) : Boolean
      {
         if(§_-v1u§(§_-im§.instance,param1))
         {
            return true;
         }
         if(§_-v1u§(§_-H1z§.instance,param1))
         {
            return true;
         }
         if(§_-v1u§(Game.chat as DisplayObjectContainer,param1))
         {
            return true;
         }
         if(Boolean(param2) && §_-v1u§(param2,param1))
         {
            return true;
         }
         return false;
      }
      
      private static function §_-v1u§(param1:DisplayObjectContainer, param2:Point) : Boolean
      {
         if(!param1 || !param1.visible || !param1.stage)
         {
            return false;
         }
         var _loc3_:Rectangle = param1.getBounds(param1.stage);
         return _loc3_.contains(param2.x,param2.y);
      }
      
      private static function §_-Na§(param1:DisplayObjectContainer, param2:Point) : Boolean
      {
         var _loc5_:DisplayObject = null;
         if(!§_-v1u§(param1,param2))
         {
            return false;
         }
         var _loc3_:Array = param1.getObjectsUnderPoint(param2);
         var _loc4_:* = int(_loc3_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = _loc3_[_loc4_];
            while(Boolean(_loc5_) && _loc5_ != param1)
            {
               if(!_loc5_.visible || _loc5_.alpha <= 0.01)
               {
                  break;
               }
               _loc5_ = _loc5_.parent;
            }
            if(_loc5_ == param1)
            {
               return true;
            }
            _loc4_--;
         }
         return false;
      }
      
      public function §_-M6§() : Boolean
      {
         if(!Game.stage)
         {
            return false;
         }
         §_-j14§.setTo(Game.stage.mouseX,Game.stage.mouseY);
         return this.§_-gL§(§_-j14§);
      }
      
      public function §_-gL§(param1:Point) : Boolean
      {
         return §_-m1t§(param1,this.§_-b2y§);
      }
   }
}

