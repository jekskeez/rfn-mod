package §_-82O§
{
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import starling.textures.§_-a1g§;
   
   public class §_-92W§
   {
      
      public function §_-92W§()
      {
         super();
      }
      
      public static function §_-LI§(param1:§_-E1r§, param2:String, param3:Array) : void
      {
         var _loc6_:§_-TH§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(param3.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1.§_-M1s§(param3[_loc4_]);
            if(Boolean(_loc6_) && Boolean(_loc6_.display) && _loc6_.display.smoothing != §_-a1g§.§_-C2m§)
            {
               _loc6_.display.smoothing = param2;
            }
            _loc4_++;
         }
      }
   }
}

