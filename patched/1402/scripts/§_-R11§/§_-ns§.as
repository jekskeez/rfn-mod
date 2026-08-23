package §_-R11§
{
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import starling.textures.§_-RS§;
   
   public class §_-ns§
   {
      
      public function §_-ns§()
      {
         super();
      }
      
      public static function §_-s2E§(param1:§_-833§, param2:String, param3:Array) : void
      {
         var _loc6_:§_-83b§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(param3.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1.§_-i2v§(param3[_loc4_]);
            if(Boolean(_loc6_) && Boolean(_loc6_.display) && _loc6_.display.smoothing != §_-RS§.§_-ww§)
            {
               _loc6_.display.smoothing = param2;
            }
            _loc4_++;
         }
      }
   }
}

