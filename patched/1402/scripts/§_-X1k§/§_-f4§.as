package §_-X1k§
{
   import §_-6f§.§_-y1G§;
   import §_-s2e§.§_-U2d§;
   import §_-u1R§.§_-s1f§;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-f4§
   {
      
      private static var rewards:Array = [];
      
      private static var §_-C3k§:Object = {};
      
      private static var §_-13F§:int = §_-A3y§.§_-137§;
      
      public function §_-f4§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-23J§,§_-s2l§.§_-PZ§]);
      }
      
      public static function §_-6M§(param1:int, param2:int = 1) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-X2s§,param1,param2);
      }
      
      public static function §_-a1M§(param1:int) : Boolean
      {
         return Boolean(§_-C3k§[param1]) && §_-C3k§[param1].length > 0;
      }
      
      public static function §_-P§(param1:int) : int
      {
         return §_-a1M§(param1) ? int(§_-C3k§[param1].length) : 0;
      }
      
      public static function §_-31y§() : void
      {
         §_-M27§();
         NuttyPassManager.§_-Po§();
      }
      
      public static function §_-DT§(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         for each(_loc3_ in param1)
         {
            if(§_-C3k§[_loc3_])
            {
               delete §_-C3k§[_loc3_];
               _loc2_ = true;
            }
         }
         if(_loc2_)
         {
            next();
         }
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-23J§:
               §_-DS§(param1[0]);
               break;
            case §_-s2l§.§_-PZ§:
               _loc2_ = int(param1[1]);
               if(_loc2_ == §_-13F§)
               {
                  §_-13F§ = §_-A3y§.§_-137§;
                  §_-S2y§(_loc2_);
                  next();
               }
               else if(§_-a1M§(_loc2_))
               {
                  §_-S2y§(_loc2_);
               }
         }
      }
      
      private static function §_-DS§(param1:Array) : void
      {
         rewards = param1;
         §_-l2B§();
         NuttyPassManager.§_-Po§();
         next();
      }
      
      private static function §_-l2B§() : void
      {
         §_-C3k§ = {};
         var _loc1_:int = 0;
         while(_loc1_ < rewards.length)
         {
            if(§_-V2V§(rewards[_loc1_]))
            {
               §_-FZ§(rewards[_loc1_],rewards[_loc1_ + 1]);
            }
            _loc1_ += 2;
         }
      }
      
      private static function §_-M27§() : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc1_:Object = NuttyPassManager.§_-33X§();
         var _loc2_:Array = [];
         for(_loc3_ in §_-C3k§)
         {
            _loc4_ = int(_loc3_);
            if(!(!NuttyPassManager.§_-v2f§(_loc4_) || Boolean(_loc1_[_loc4_])))
            {
               _loc2_.push(_loc4_);
            }
         }
         §_-DT§(_loc2_);
      }
      
      private static function next() : void
      {
         var _loc2_:Object = null;
         if(§_-13F§ != §_-A3y§.§_-137§)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < rewards.length)
         {
            if(!§_-a1M§(rewards[_loc1_]))
            {
               _loc2_ = §_-A3y§.§_-B3F§(rewards[_loc1_]);
               if(!(!_loc2_ || !_loc2_.contentItems || _loc2_.contentItems.length == 0))
               {
                  if(§_-T1T§(_loc2_))
                  {
                     return;
                  }
                  §_-13F§ = _loc2_.id;
                  if(§_-E1j§(_loc2_))
                  {
                     return;
                  }
                  §_-42X§(_loc2_);
                  return;
               }
            }
            _loc1_ += 2;
         }
      }
      
      private static function §_-V2V§(param1:int) : Boolean
      {
         var _loc2_:Object = §_-A3y§.§_-B3F§(param1);
         return Boolean(_loc2_) && _loc2_.source == §_-A3y§.§_-y1s§;
      }
      
      private static function §_-FZ§(param1:int, param2:int = 1) : void
      {
         var _loc3_:Object = §_-A3y§.§_-B3F§(param1);
         if(!_loc3_)
         {
            return;
         }
         if(!§_-C3k§[param1])
         {
            §_-C3k§[param1] = [];
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            §_-C3k§[param1].push(_loc3_);
            _loc4_++;
         }
      }
      
      private static function §_-T1T§(param1:Object) : Boolean
      {
         if(!param1.silent)
         {
            return false;
         }
         §_-6M§(param1.id);
         return true;
      }
      
      private static function §_-E1j§(param1:Object) : Boolean
      {
         var reward:Object = param1;
         if(!reward.animation_class)
         {
            return false;
         }
         §_-U2d§.load(function():void
         {
            new §_-s1f§(reward,getDefinitionByName(reward.animation_class) as Class);
         },true);
         return true;
      }
      
      private static function §_-42X§(param1:Object) : void
      {
         var reward:Object = param1;
         §_-U2d§.load(function():void
         {
            var _loc1_:§_-y1G§ = new §_-y1G§(reward);
            _loc1_.show();
         },true);
      }
      
      private static function §_-S2y§(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < rewards.length)
         {
            if(rewards[_loc2_] == param1)
            {
               if(rewards[_loc2_ + 1] > 1)
               {
                  rewards[_loc2_ + 1] = rewards[_loc2_ + 1] - 1;
               }
               else
               {
                  rewards.splice(_loc2_,2);
               }
               if(§_-a1M§(param1))
               {
                  §_-C3k§[param1].pop();
                  NuttyPassManager.§_-WX§();
               }
               return;
            }
            _loc2_ += 2;
         }
      }
   }
}

