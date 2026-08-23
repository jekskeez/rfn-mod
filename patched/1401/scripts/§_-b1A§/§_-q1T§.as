package §_-b1A§
{
   import §_-Rj§.§_-W28§;
   
   public class §_-q1T§ extends §_-W28§
   {
      
      public function §_-q1T§()
      {
         super();
      }
      
      override public function §_-NJ§() : int
      {
         var _loc1_:int = §_-l26§.§_-Sv§.§_-I1y§;
         return _loc1_ + (§_-A3x§() ? 1 : 0);
      }
      
      override public function §_-e1I§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = §_-f12§();
         _loc1_.sort(Array.NUMERIC);
         if(§_-A3x§())
         {
            _loc2_ = _loc1_.shift();
            if(_loc1_.length > 0)
            {
               §_-GM§(_loc1_);
            }
            §_-M13§([_loc2_]);
            return;
         }
         §_-GM§(_loc1_);
      }
   }
}

