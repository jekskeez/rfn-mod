package game.mainGame
{
   import Box2D.Dynamics.b2Body;
   
   public class §_-n2T§
   {
      
      public static var §_-Y1B§:Array = [];
      
      public function §_-n2T§()
      {
         super();
      }
      
      public static function §_-U2D§(param1:b2Body) : void
      {
         if(§_-Y1B§.indexOf(param1) != -1)
         {
            return;
         }
         §_-Y1B§.push(param1);
      }
      
      public static function §_-L4§(param1:b2Body) : void
      {
         var _loc2_:int = §_-Y1B§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         §_-Y1B§.splice(_loc2_,1);
      }
      
      public static function clear() : void
      {
         §_-Y1B§.splice(0);
      }
   }
}

