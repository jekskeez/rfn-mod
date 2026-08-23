package game.mainGame
{
   import Box2D.Dynamics.b2Body;
   
   public class §_-w2F§
   {
      
      public static var §_-O2v§:Array = [];
      
      public function §_-w2F§()
      {
         super();
      }
      
      public static function §_-aE§(param1:b2Body) : void
      {
         if(§_-O2v§.indexOf(param1) != -1)
         {
            return;
         }
         §_-O2v§.push(param1);
      }
      
      public static function §_-41c§(param1:b2Body) : void
      {
         var _loc2_:int = §_-O2v§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         §_-O2v§.splice(_loc2_,1);
      }
      
      public static function clear() : void
      {
         §_-O2v§.splice(0);
      }
   }
}

