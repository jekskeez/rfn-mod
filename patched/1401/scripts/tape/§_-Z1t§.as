package tape
{
   import game.mainGame.§_-03u§;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-Z1t§ extends §_-Mt§ implements §_-03u§
   {
      
      public function §_-Z1t§(param1:Array)
      {
         super(16,2,32,8,false);
         this.§_-J28§(param1);
      }
      
      public function §_-f12§() : Array
      {
         var _loc3_:§_-T10§ = null;
         var _loc4_:Class = null;
         var _loc5_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            _loc3_ = this.data.objects[_loc2_] as §_-T10§;
            _loc4_ = _loc3_.className;
            if(_loc3_.state)
            {
               _loc5_ = §_-03s§.§_-X21§(_loc4_);
               _loc1_.push(_loc5_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function reset() : void
      {
         var _loc2_:§_-T10§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            _loc2_ = this.data.objects[_loc1_] as §_-T10§;
            _loc2_.state = false;
            _loc1_++;
         }
      }
      
      public function load(param1:Array) : void
      {
         var _loc3_:§_-T10§ = null;
         var _loc4_:int = 0;
         var _loc5_:Class = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            _loc3_ = this.data.objects[_loc2_] as §_-T10§;
            _loc3_.state = false;
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = §_-03s§.§_-F1T§(param1[_loc4_]);
               if(_loc5_ == _loc3_.className)
               {
                  _loc3_.state = true;
               }
               _loc4_++;
            }
            _loc2_++;
         }
         §_-bX§();
         update();
      }
      
      public function §_-A1X§() : *
      {
         return this.§_-f12§();
      }
      
      public function §_-41M§(param1:*) : void
      {
      }
      
      public function §_-J28§(param1:Array) : void
      {
         setData(new §_-IT§(param1));
      }
   }
}

