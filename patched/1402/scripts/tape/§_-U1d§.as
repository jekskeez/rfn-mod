package tape
{
   import game.mainGame.§_-3l§;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-U1d§ extends §_-71i§ implements §_-3l§
   {
      
      public function §_-U1d§(param1:Array)
      {
         super(16,2,32,8,false);
         this.§_-C3b§(param1);
      }
      
      public function §_-n2K§() : Array
      {
         var _loc3_:§_-nc§ = null;
         var _loc4_:Class = null;
         var _loc5_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            _loc3_ = this.data.objects[_loc2_] as §_-nc§;
            _loc4_ = _loc3_.className;
            if(_loc3_.state)
            {
               _loc5_ = §_-f1b§.§_-q2W§(_loc4_);
               _loc1_.push(_loc5_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function reset() : void
      {
         var _loc2_:§_-nc§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            _loc2_ = this.data.objects[_loc1_] as §_-nc§;
            _loc2_.state = false;
            _loc1_++;
         }
      }
      
      public function load(param1:Array) : void
      {
         var _loc3_:§_-nc§ = null;
         var _loc4_:int = 0;
         var _loc5_:Class = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            _loc3_ = this.data.objects[_loc2_] as §_-nc§;
            _loc3_.state = false;
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = §_-f1b§.§_-N1m§(param1[_loc4_]);
               if(_loc5_ == _loc3_.className)
               {
                  _loc3_.state = true;
               }
               _loc4_++;
            }
            _loc2_++;
         }
         §_-j2y§();
         update();
      }
      
      public function §_-m1Y§() : *
      {
         return this.§_-n2K§();
      }
      
      public function §_-o2I§(param1:*) : void
      {
      }
      
      public function §_-C3b§(param1:Array) : void
      {
         setData(new §_-G2N§(param1));
      }
   }
}

