package §_-I10§
{
   import §_-68§.§_-EI§;
   import §_-H7§.§_-521§;
   import §_-t1F§.§_-oT§;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-A29§
   {
      
      private static var rewards:Array = [];
      
      private static var §_-dK§:Object = {};
      
      private static var §_-83C§:int = §_-428§.§_-523§;
      
      public function §_-A29§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-w2A§,§_-S2I§.§_-a2e§]);
      }
      
      public static function §_-A3l§(param1:int, param2:int = 1) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-N2S§,param1,param2);
      }
      
      public static function §_-nT§(param1:int) : Boolean
      {
         return Boolean(§_-dK§[param1]) && §_-dK§[param1].length > 0;
      }
      
      public static function §_-w2E§(param1:int) : int
      {
         return §_-nT§(param1) ? int(§_-dK§[param1].length) : 0;
      }
      
      public static function §_-m12§() : void
      {
         §_-D9§();
         NuttyPassManager.§_-zG§();
      }
      
      public static function §_-63i§(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         for each(_loc3_ in param1)
         {
            if(§_-dK§[_loc3_])
            {
               delete §_-dK§[_loc3_];
               _loc2_ = true;
            }
         }
         if(_loc2_)
         {
            next();
         }
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-w2A§:
               §_-k2H§(param1[0]);
               break;
            case §_-S2I§.§_-a2e§:
               _loc2_ = int(param1[1]);
               if(_loc2_ == §_-83C§)
               {
                  §_-83C§ = §_-428§.§_-523§;
                  §_-V1m§(_loc2_);
                  next();
               }
               else if(§_-nT§(_loc2_))
               {
                  §_-V1m§(_loc2_);
               }
         }
      }
      
      private static function §_-k2H§(param1:Array) : void
      {
         rewards = param1;
         §_-1Z§();
         NuttyPassManager.§_-zG§();
         next();
      }
      
      private static function §_-1Z§() : void
      {
         §_-dK§ = {};
         var _loc1_:int = 0;
         while(_loc1_ < rewards.length)
         {
            if(§_-i2q§(rewards[_loc1_]))
            {
               §_-41f§(rewards[_loc1_],rewards[_loc1_ + 1]);
            }
            _loc1_ += 2;
         }
      }
      
      private static function §_-D9§() : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc1_:Object = NuttyPassManager.§_-GU§();
         var _loc2_:Array = [];
         for(_loc3_ in §_-dK§)
         {
            _loc4_ = int(_loc3_);
            if(!(!NuttyPassManager.§_-m2i§(_loc4_) || Boolean(_loc1_[_loc4_])))
            {
               _loc2_.push(_loc4_);
            }
         }
         §_-63i§(_loc2_);
      }
      
      private static function next() : void
      {
         var _loc2_:Object = null;
         if(§_-83C§ != §_-428§.§_-523§)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < rewards.length)
         {
            if(!§_-nT§(rewards[_loc1_]))
            {
               _loc2_ = §_-428§.§_-d1u§(rewards[_loc1_]);
               if(!(!_loc2_ || !_loc2_.contentItems || _loc2_.contentItems.length == 0))
               {
                  if(§_-N2x§(_loc2_))
                  {
                     return;
                  }
                  §_-83C§ = _loc2_.id;
                  if(§_-D20§(_loc2_))
                  {
                     return;
                  }
                  §_-da§(_loc2_);
                  return;
               }
            }
            _loc1_ += 2;
         }
      }
      
      private static function §_-i2q§(param1:int) : Boolean
      {
         var _loc2_:Object = §_-428§.§_-d1u§(param1);
         return Boolean(_loc2_) && _loc2_.source == §_-428§.§_-71H§;
      }
      
      private static function §_-41f§(param1:int, param2:int = 1) : void
      {
         var _loc3_:Object = §_-428§.§_-d1u§(param1);
         if(!_loc3_)
         {
            return;
         }
         if(!§_-dK§[param1])
         {
            §_-dK§[param1] = [];
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            §_-dK§[param1].push(_loc3_);
            _loc4_++;
         }
      }
      
      private static function §_-N2x§(param1:Object) : Boolean
      {
         if(!param1.silent)
         {
            return false;
         }
         §_-A3l§(param1.id);
         return true;
      }
      
      private static function §_-D20§(param1:Object) : Boolean
      {
         var reward:Object = param1;
         if(!reward.animation_class)
         {
            return false;
         }
         §_-EI§.load(function():void
         {
            new §_-521§(reward,getDefinitionByName(reward.animation_class) as Class);
         },true);
         return true;
      }
      
      private static function §_-da§(param1:Object) : void
      {
         var reward:Object = param1;
         §_-EI§.load(function():void
         {
            var _loc1_:§_-oT§ = new §_-oT§(reward);
            _loc1_.show();
         },true);
      }
      
      private static function §_-V1m§(param1:int) : void
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
               if(§_-nT§(param1))
               {
                  §_-dK§[param1].pop();
                  NuttyPassManager.§_-5y§();
               }
               return;
            }
            _loc2_ += 2;
         }
      }
   }
}

