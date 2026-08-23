package §_-93q§
{
   import §_-l2u§.§_-Rp§;
   
   public class §_-A1T§ extends §_-Rp§
   {
      
      public function §_-A1T§()
      {
         super();
      }
      
      override public function §_-A3b§() : int
      {
         var _loc1_:int = §_-E1v§.§_-LL§.§_-e1W§;
         return _loc1_ + (§_-V1w§() ? 1 : 0);
      }
      
      override public function §_-V25§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = §_-n2K§();
         _loc1_.sort(Array.NUMERIC);
         if(§_-V1w§())
         {
            _loc2_ = _loc1_.shift();
            if(_loc1_.length > 0)
            {
               §_-8r§(_loc1_);
            }
            §_-Jg§([_loc2_]);
            return;
         }
         §_-8r§(_loc1_);
      }
   }
}

