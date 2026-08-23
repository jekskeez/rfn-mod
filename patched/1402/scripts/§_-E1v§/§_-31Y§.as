package §_-E1v§
{
   import §_-Al§.§_-K1K§;
   import §_-V2X§.§_-4E§;
   import §_-V2X§.§_-Wq§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import protocol.§_-z1i§;
   import utils.§_-33I§;
   
   public class §_-31Y§
   {
      
      private static var §_-I1H§:Vector.<§_-Wq§> = new Vector.<§_-Wq§>(0);
      
      public function §_-31Y§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         Connection.listen(§_-x2f§,[§_-s2l§.§_-P1J§,§_-s2l§.§_-83w§]);
      }
      
      public static function §_-03p§(param1:Number, param2:int = -1) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         if(param2 == -1)
         {
            Connection.§_-e2T§(§_-u1O§.§_-02t§,param1,§_-K1K§.§_-C1Z§);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-N18§,param2,param1,§_-K1K§.§_-C1Z§);
         }
      }
      
      public static function §_-f2C§(param1:Number) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-bF§,param1,§_-w1k§.§_-P26§);
      }
      
      public static function §_-g28§(param1:int, param2:int, param3:§_-z1i§) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-4P§,param1,param2,param3);
      }
      
      public static function §_-n2O§(param1:int, param2:int, param3:§_-z1i§) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-a1E§,param1,param2,param3);
      }
      
      public static function §_-51o§(param1:int) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-U1Q§,param1);
      }
      
      public static function sendMessage(param1:String, param2:int = 0, param3:int = 0) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
            return;
         }
         if(param3 != 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-A19§,param2,param1,param3);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-A19§,param2,param1);
         }
      }
      
      public static function §_-QG§(param1:§_-J2w§, param2:int) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         if(!param1 || param1.§_-Is§(param2) == null)
         {
            return;
         }
         var _loc3_:§_-4E§ = new §_-4E§();
         _loc3_.§_-lR§(param1.formNames[param2],param2,param1.§_-Is§(param2),param1.isClan,param1.entityId);
      }
      
      public static function §_-fk§(param1:§_-Wq§) : void
      {
         var _loc2_:int = §_-I1H§.indexOf(param1);
         if(_loc2_ != -1)
         {
            §_-I1H§.splice(_loc2_,1);
         }
      }
      
      private static function §_-i2y§(param1:int, param2:Boolean) : §_-Wq§
      {
         var _loc3_:§_-Wq§ = null;
         for each(_loc3_ in §_-I1H§)
         {
            if(Boolean(_loc3_.entity) && Boolean(_loc3_.entity.entityId == param1) && _loc3_.entity.isClan == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private static function §_-721§(param1:§_-J2w§) : §_-Wq§
      {
         var _loc2_:§_-Wq§ = new §_-Wq§(param1);
         §_-I1H§.push(_loc2_);
         return _loc2_;
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-823§ = null;
         var _loc4_:§_-Wq§ = null;
         var _loc5_:int = 0;
         var _loc6_:§_-w1k§ = null;
         var _loc7_:§_-Wq§ = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-P1J§:
               _loc2_ = int(param1[§_-823§.§_-dy§]);
               _loc3_ = §_-823§.§_-h2Z§(param1);
               _loc4_ = §_-i2y§(_loc2_,false);
               if(_loc4_)
               {
                  _loc4_.entity = _loc3_;
                  if(!_loc4_.visible)
                  {
                     _loc4_.show();
                  }
               }
               else
               {
                  _loc4_ = §_-721§(_loc3_);
                  _loc4_.show();
               }
               break;
            case §_-s2l§.§_-83w§:
               _loc5_ = int(param1[§_-w1k§.§_-R§]);
               _loc6_ = §_-w1k§.§_-h2Z§(param1);
               _loc7_ = §_-i2y§(_loc5_,true);
               if(_loc7_)
               {
                  _loc7_.entity = _loc6_;
                  if(!_loc7_.visible)
                  {
                     _loc7_.show();
                  }
               }
               else
               {
                  _loc7_ = §_-721§(_loc6_);
                  _loc7_.show();
               }
         }
      }
   }
}

