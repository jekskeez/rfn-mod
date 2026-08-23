package §_-bN§
{
   import §_-6f§.§_-y1G§;
   import §_-U19§.§_-B2U§;
   import §_-U2T§.§_-L1B§;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-i2a§;
   import §_-ZL§.§_-82w§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-817§;
   import §_-c2C§.§_-gc§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-x2y§;
   import §_-l2f§.§_-I2u§;
   import §_-l2f§.§_-eH§;
   import §_-xr§.§_-j1X§;
   import events.GameEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §_-33Q§
   {
      
      public static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static const §_-h2c§:Array = [§_-c2O§,§_-j1X§,§_-RY§,§_-eH§,§_-I2u§,§_-YP§,§_-nx§,DialogRepost,§_-Fk§,§_-82w§,§_-UK§,§_-710§];
      
      private static const §_-Le§:Array = [§_-y1G§,§_-L1B§,§_-nx§,DialogRepost];
      
      private static var §_-63Z§:Array = [];
      
      private static var §_-A22§:Vector.<Object> = new Vector.<Object>();
      
      private static var §_-u21§:Boolean = false;
      
      public function §_-33Q§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-u21§)
         {
            return;
         }
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,onStageResize);
         §_-u21§ = true;
      }
      
      public static function §_-T1k§() : void
      {
         init();
         §_-B2U§.§_-Js§();
         §_-i2a§.§_-t1Y§();
         NuttyPassManager.§_-63Q§();
         §_-RY§.show();
      }
      
      public static function show(param1:Object) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(§_-d27§(param1))
         {
            if(!§_-vx§(param1))
            {
               _loc2_ = §_-63Z§.indexOf(param1);
               if(_loc2_ != -1)
               {
                  §_-63Z§.splice(_loc2_,1);
                  present(param1);
                  return;
               }
            }
            §_-63Z§.push(param1);
            if(§_-63Z§.length > 1)
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
         if(§_-R2H§(param1))
         {
            §_-71X§();
         }
         if(!§_-d27§(param1))
         {
            return;
         }
         var _loc2_:int = §_-63Z§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         if(_loc2_ != 0)
         {
            §_-63Z§.splice(_loc2_,1);
            return;
         }
         §_-63Z§.shift();
         if(§_-t2c§.active is §_-gc§)
         {
            return;
         }
         if(§_-63Z§.length > 0)
         {
            present(§_-63Z§[0]);
         }
      }
      
      public static function §_-T14§() : void
      {
         §_-u2V§();
         if(§_-63Z§.length == 0)
         {
            return;
         }
         var _loc1_:Object = §_-63Z§[0];
         if(!(§_-t2c§.active is §_-si§ || §_-t2c§.active is §_-51A§ || §_-t2c§.active is §_-x2y§))
         {
            _loc1_.hideDialog();
            return;
         }
         if(!_loc1_.visible)
         {
            _loc1_.showDialog();
         }
      }
      
      public static function get §_-G1P§() : Boolean
      {
         return §_-A22§.length > 0;
      }
      
      private static function present(param1:Object) : void
      {
         init();
         var _loc2_:Boolean = §_-F23§(param1);
         param1.showDialog();
         if(_loc2_)
         {
            §_-71X§();
         }
      }
      
      private static function §_-F23§(param1:Object) : Boolean
      {
         if(§_-A22§.indexOf(param1) != -1)
         {
            return false;
         }
         §_-A22§.push(param1);
         return true;
      }
      
      private static function §_-R2H§(param1:Object) : Boolean
      {
         var _loc2_:int = §_-A22§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return false;
         }
         §_-A22§.splice(_loc2_,1);
         return true;
      }
      
      private static function §_-71X§() : void
      {
         §_-u2V§();
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.CHANGED));
      }
      
      private static function §_-u2V§() : void
      {
         §_-817§.§_-R1J§ = §_-t2c§.active is §_-si§ && §_-G1P§;
      }
      
      private static function onStageResize(param1:Event = null) : void
      {
         var _loc3_:Dialog = null;
         var _loc2_:int = 0;
         while(_loc2_ < §_-A22§.length)
         {
            _loc3_ = §_-A22§[_loc2_] as Dialog;
            if(_loc3_ != null)
            {
               _loc3_.onStageResize();
            }
            _loc2_++;
         }
      }
      
      private static function §_-d27§(param1:Object) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-h2c§.length)
         {
            if(param1 is §_-h2c§[_loc2_])
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private static function §_-vx§(param1:Object) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-Le§.length)
         {
            if(param1 is §_-Le§[_loc2_])
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}

