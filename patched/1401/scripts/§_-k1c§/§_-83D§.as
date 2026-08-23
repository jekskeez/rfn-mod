package §_-k1c§
{
   import §_-91§.§_-DD§;
   import §_-D2e§.§_-k1n§;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-Bg§;
   import §_-Q1P§.§_-f1t§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-ac§;
   import §_-T2y§.§_-cG§;
   import §_-T2y§.§_-s1i§;
   import §_-dc§.§_-e2W§;
   import §_-em§.§_-I1p§;
   import §_-em§.§_-S2c§;
   import §_-t1F§.§_-oT§;
   import events.GameEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §_-83D§
   {
      
      public static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static const §_-72M§:Array = [§_-z1T§,§_-k1n§,§_-9f§,§_-S2c§,§_-I1p§,§_-F2X§,§_-f1q§,DialogRepost,§_-Q13§,§_-f1t§,§_-e15§,§_-T2m§];
      
      private static const §_-lm§:Array = [§_-oT§,§_-DD§,§_-f1q§,DialogRepost];
      
      private static var §_-X28§:Array = [];
      
      private static var §_-N1G§:Vector.<Object> = new Vector.<Object>();
      
      private static var §_-P20§:Boolean = false;
      
      public function §_-83D§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-P20§)
         {
            return;
         }
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,onStageResize);
         §_-P20§ = true;
      }
      
      public static function §_-11Y§() : void
      {
         init();
         §_-e2W§.§_-v1v§();
         §_-Bg§.§_-g2K§();
         NuttyPassManager.§_-n1N§();
         §_-9f§.show();
      }
      
      public static function show(param1:Object) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(§_-K2T§(param1))
         {
            if(!§_-y1W§(param1))
            {
               _loc2_ = §_-X28§.indexOf(param1);
               if(_loc2_ != -1)
               {
                  §_-X28§.splice(_loc2_,1);
                  present(param1);
                  return;
               }
            }
            §_-X28§.push(param1);
            if(§_-X28§.length > 1)
            {
               return;
            }
         }
         present(param1);
      }
      
      public static function hide(param1:Object) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.hideDialog();
         if(§_-v1L§(param1))
         {
            §_-T1v§();
         }
         if(!§_-K2T§(param1))
         {
            return;
         }
         var _loc2_:int = §_-X28§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         if(_loc2_ != 0)
         {
            §_-X28§.splice(_loc2_,1);
            return;
         }
         §_-X28§.shift();
         if(§_-71o§.active is §_-cG§)
         {
            return;
         }
         if(§_-X28§.length > 0)
         {
            present(§_-X28§[0]);
         }
      }
      
      public static function §_-W2P§() : void
      {
         §_-7D§();
         if(§_-X28§.length == 0)
         {
            return;
         }
         var _loc1_:Object = §_-X28§[0];
         if(!(§_-71o§.active is §_-5K§ || §_-71o§.active is §_-5B§ || §_-71o§.active is §_-ac§))
         {
            _loc1_.hideDialog();
            return;
         }
         if(!_loc1_.visible)
         {
            _loc1_.showDialog();
         }
      }
      
      public static function get §_-K0§() : Boolean
      {
         return §_-N1G§.length > 0;
      }
      
      private static function present(param1:Object) : void
      {
         init();
         var _loc2_:Boolean = §_-B2b§(param1);
         param1.showDialog();
         if(_loc2_)
         {
            §_-T1v§();
         }
      }
      
      private static function §_-B2b§(param1:Object) : Boolean
      {
         if(§_-N1G§.indexOf(param1) != -1)
         {
            return false;
         }
         §_-N1G§.push(param1);
         return true;
      }
      
      private static function §_-v1L§(param1:Object) : Boolean
      {
         var _loc2_:int = §_-N1G§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return false;
         }
         §_-N1G§.splice(_loc2_,1);
         return true;
      }
      
      private static function §_-T1v§() : void
      {
         §_-7D§();
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CHANGED));
      }
      
      private static function §_-7D§() : void
      {
         §_-s1i§.§_-i2A§ = §_-71o§.active is §_-5K§ && §_-K0§;
      }
      
      private static function onStageResize(param1:Event = null) : void
      {
         var _loc3_:Dialog = null;
         var _loc2_:int = 0;
         while(_loc2_ < §_-N1G§.length)
         {
            _loc3_ = §_-N1G§[_loc2_] as Dialog;
            if(_loc3_ != null)
            {
               _loc3_.onStageResize();
            }
            _loc2_++;
         }
      }
      
      private static function §_-K2T§(param1:Object) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-72M§.length)
         {
            if(param1 is §_-72M§[_loc2_])
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private static function §_-y1W§(param1:Object) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-lm§.length)
         {
            if(param1 is §_-lm§[_loc2_])
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}

