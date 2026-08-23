package §_-l26§
{
   import §_-T1L§.§_-B3i§;
   import §_-T1L§.§_-fE§;
   import §_-p1f§.§_-6Y§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   import protocol.§_-h2B§;
   import utils.§_-c10§;
   
   public class §_-MZ§
   {
      
      private static var §_-Ok§:Vector.<§_-B3i§> = new Vector.<§_-B3i§>(0);
      
      public function §_-MZ§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         Connection.listen(§_-o2C§,[§_-S2I§.§_-X12§,§_-S2I§.§_-Y2C§]);
      }
      
      public static function §_-g26§(param1:Number, param2:int = -1) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         if(param2 == -1)
         {
            Connection.§_-Li§(§_-h2B§.§_-RS§,param1,§_-6Y§.§_-a2u§);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-9C§,param2,param1,§_-6Y§.§_-a2u§);
         }
      }
      
      public static function §_-b2§(param1:Number) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-fd§,param1,§_-z2g§.§_-g2n§);
      }
      
      public static function §_-oE§(param1:int, param2:int, param3:§_-U1M§) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-v1O§,param1,param2,param3);
      }
      
      public static function §_-w2w§(param1:int, param2:int, param3:§_-U1M§) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-sl§,param1,param2,param3);
      }
      
      public static function §_-t2r§(param1:int) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-t1C§,param1);
      }
      
      public static function sendMessage(param1:String, param2:int = 0, param3:int = 0) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
            return;
         }
         if(param3 != 0)
         {
            Connection.§_-Li§(§_-h2B§.§_-o7§,param2,param1,param3);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-o7§,param2,param1);
         }
      }
      
      public static function §_-U1y§(param1:§_-s18§, param2:int) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         if(!param1 || param1.§_-mi§(param2) == null)
         {
            return;
         }
         var _loc3_:§_-fE§ = new §_-fE§();
         _loc3_.§_-f25§(param1.formNames[param2],param2,param1.§_-mi§(param2),param1.isClan,param1.entityId);
      }
      
      public static function §_-834§(param1:§_-B3i§) : void
      {
         var _loc2_:int = §_-Ok§.indexOf(param1);
         if(_loc2_ != -1)
         {
            §_-Ok§.splice(_loc2_,1);
         }
      }
      
      private static function §_-x1p§(param1:int, param2:Boolean) : §_-B3i§
      {
         var _loc3_:§_-B3i§ = null;
         for each(_loc3_ in §_-Ok§)
         {
            if(Boolean(_loc3_.entity) && Boolean(_loc3_.entity.entityId == param1) && _loc3_.entity.isClan == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private static function §_-U2u§(param1:§_-s18§) : §_-B3i§
      {
         var _loc2_:§_-B3i§ = new §_-B3i§(param1);
         §_-Ok§.push(_loc2_);
         return _loc2_;
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-i1a§ = null;
         var _loc4_:§_-B3i§ = null;
         var _loc5_:int = 0;
         var _loc6_:§_-z2g§ = null;
         var _loc7_:§_-B3i§ = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-X12§:
               _loc2_ = int(param1[§_-i1a§.§_-22B§]);
               _loc3_ = §_-i1a§.§_-82d§(param1);
               _loc4_ = §_-x1p§(_loc2_,false);
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
                  _loc4_ = §_-U2u§(_loc3_);
                  _loc4_.show();
               }
               break;
            case §_-S2I§.§_-Y2C§:
               _loc5_ = int(param1[§_-z2g§.§_-H2R§]);
               _loc6_ = §_-z2g§.§_-82d§(param1);
               _loc7_ = §_-x1p§(_loc5_,true);
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
                  _loc7_ = §_-U2u§(_loc6_);
                  _loc7_.show();
               }
         }
      }
   }
}

