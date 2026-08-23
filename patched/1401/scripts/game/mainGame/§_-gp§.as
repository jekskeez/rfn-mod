package game.mainGame
{
   import §_-S1D§.§_-3m§;
   import §_-T2y§.§_-71o§;
   import §_-e2w§.§_-B1d§;
   import §_-k1c§.Dialog;
   import chat.§_-r0§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-gp§
   {
      
      private static var §_-52m§:Point = new Point();
      
      public var §_-813§:DisplayObjectContainer = null;
      
      public function §_-gp§()
      {
         super();
      }
      
      private static function §_-F1p§(param1:Point, param2:DisplayObjectContainer) : Boolean
      {
         var _loc3_:Dialog = null;
         if(§_-vf§(§_-r0§.instance,param1))
         {
            return false;
         }
         for each(_loc3_ in §_-71o§.§_-S21§())
         {
            if(§_-vf§(_loc3_,param1))
            {
               return false;
            }
         }
         if(!§_-Vg§(param1,param2))
         {
            return true;
         }
         if(§_-vf§(§_-3m§.instance,param1))
         {
            return false;
         }
         if(§_-vf§(§_-B1d§.instance,param1))
         {
            return false;
         }
         if(§_-vf§(Game.chat as DisplayObjectContainer,param1))
         {
            return false;
         }
         if(Boolean(param2) && §_-vf§(param2,param1))
         {
            return false;
         }
         return true;
      }
      
      private static function §_-Vg§(param1:Point, param2:DisplayObjectContainer) : Boolean
      {
         if(§_-pe§(§_-3m§.instance,param1))
         {
            return true;
         }
         if(§_-pe§(§_-B1d§.instance,param1))
         {
            return true;
         }
         if(§_-pe§(Game.chat as DisplayObjectContainer,param1))
         {
            return true;
         }
         if(Boolean(param2) && §_-pe§(param2,param1))
         {
            return true;
         }
         return false;
      }
      
      private static function §_-pe§(param1:DisplayObjectContainer, param2:Point) : Boolean
      {
         if(!param1 || !param1.visible || !param1.stage)
         {
            return false;
         }
         var _loc3_:Rectangle = param1.getBounds(param1.stage);
         return _loc3_.contains(param2.x,param2.y);
      }
      
      private static function §_-vf§(param1:DisplayObjectContainer, param2:Point) : Boolean
      {
         var _loc5_:DisplayObject = null;
         if(!§_-pe§(param1,param2))
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
      
      public function §_-W2H§() : Boolean
      {
         if(!Game.stage)
         {
            return false;
         }
         §_-52m§.setTo(Game.stage.mouseX,Game.stage.mouseY);
         return this.§_-Q1B§(§_-52m§);
      }
      
      public function §_-Q1B§(param1:Point) : Boolean
      {
         return §_-F1p§(param1,this.§_-813§);
      }
   }
}

