package §_-T2y§
{
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-83D§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class §_-71o§ extends Sprite
   {
      
      public static const TV:int = 1;
      
      public static const §_-T2Z§:int = 2;
      
      public static const §_-6n§:int = 3;
      
      private static var _instance:§_-71o§;
      
      private static var §_-XW§:int = 0;
      
      private static var §_-VN§:Array = [];
      
      private var §_-IC§:Object = {};
      
      private var §_-k1c§:Dictionary = new Dictionary();
      
      private var active:Screen = null;
      
      private var §_-L13§:Boolean = false;
      
      private var §_-Iv§:Boolean = false;
      
      private var §_-n2M§:Vector.<Screen> = new Vector.<Screen>();
      
      public function §_-71o§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-71o§
      {
         return _instance;
      }
      
      public static function setStatus(param1:int) : void
      {
         var _loc2_:int = §_-XW§;
         §_-XW§ |= param1;
         if(_loc2_ == §_-6n§ || §_-XW§ != §_-6n§)
         {
            return;
         }
         while(§_-VN§.length > 0)
         {
            (§_-VN§.pop() as Function)();
         }
      }
      
      public static function §_-U21§(param1:int) : void
      {
         §_-XW§ &= ~param1;
      }
      
      public static function addCallback(param1:Function) : void
      {
         if(§_-XW§ == §_-6n§)
         {
            param1();
         }
         else
         {
            §_-VN§.push(param1);
         }
      }
      
      public static function get active() : Screen
      {
         if(!_instance)
         {
            return null;
         }
         return _instance.active;
      }
      
      public static function get §_-n2M§() : Screen
      {
         return _instance.§_-n2M§.length == 0 ? _instance.§_-IC§["Location"] : _instance.§_-n2M§[0];
      }
      
      public static function getName(param1:*) : String
      {
         var _loc2_:String = null;
         for(_loc2_ in _instance.§_-IC§)
         {
            if(_instance.§_-IC§[_loc2_] == param1)
            {
               return _loc2_;
            }
         }
         return "";
      }
      
      public static function §_-P2Y§(param1:String, param2:Screen) : void
      {
         _instance.§_-P2Y§(param1,param2);
      }
      
      public static function §_-D1O§(param1:String) : Screen
      {
         if(!_instance || !(param1 in _instance.§_-IC§))
         {
            return null;
         }
         return _instance.§_-IC§[param1] as Screen;
      }
      
      public static function show(param1:*) : void
      {
         _instance.show(param1);
      }
      
      public static function §_-Sl§(param1:*) : void
      {
         _instance.§_-Sl§(param1);
      }
      
      public static function hide() : void
      {
         _instance.hide();
      }
      
      public static function §_-rH§(param1:Boolean) : void
      {
         _instance.§_-rH§(param1);
      }
      
      public static function §_-5o§(param1:Dialog) : void
      {
         _instance.§_-5o§(param1);
      }
      
      public static function §_-S21§() : Vector.<Dialog>
      {
         var _loc2_:* = undefined;
         var _loc3_:Dialog = null;
         var _loc1_:Vector.<Dialog> = new Vector.<Dialog>();
         if(!_instance)
         {
            return _loc1_;
         }
         for(_loc2_ in _instance.§_-k1c§)
         {
            _loc3_ = _loc2_ as Dialog;
            if(Boolean(_loc3_) && Boolean(_loc3_.visible) && Boolean(_loc3_.stage))
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public static function §_-M1d§() : void
      {
         _instance.§_-M1d§();
      }
      
      public static function set §_-L13§(param1:Boolean) : void
      {
         _instance.§_-L13§ = param1;
      }
      
      public static function get §_-L13§() : Boolean
      {
         return _instance.§_-L13§;
      }
      
      public static function set §_-Iv§(param1:Boolean) : void
      {
         _instance.§_-Iv§ = param1;
      }
      
      public static function get §_-Iv§() : Boolean
      {
         return _instance.§_-Iv§;
      }
      
      private function §_-5o§(param1:Dialog) : void
      {
         this.§_-k1c§[param1] = true;
      }
      
      private function §_-P2Y§(param1:String, param2:Screen) : void
      {
         if(param1 in this.§_-IC§)
         {
            return;
         }
         if(param2 is §_-5K§)
         {
            this.§_-n2M§.push(param2);
         }
         this.§_-IC§[param1] = param2;
      }
      
      private function show(param1:*) : void
      {
         if(param1 is String)
         {
            if(!(param1 in this.§_-IC§))
            {
               return;
            }
            param1 = this.§_-IC§[param1];
         }
         if(this.active == param1)
         {
            return;
         }
         if(this.active != null)
         {
            if(param1 == §_-71o§.§_-n2M§)
            {
               this.§_-n2M§.shift();
            }
            else
            {
               if(this.§_-n2M§.indexOf(this.active) != -1)
               {
                  this.§_-n2M§.splice(this.§_-n2M§.indexOf(this.active),1);
               }
               this.§_-n2M§.unshift(this.active);
            }
         }
         this.hide();
         addChild(param1);
         dispatchEvent(new ScreenEvent(ScreenEvent.SHOW,param1));
         this.active = param1;
         this.active.show();
         if(this.active is §_-92z§ || this.active is §_-F29§ || this.active is §_-w17§)
         {
            §_-U21§(§_-T2Z§);
         }
         else
         {
            setStatus(§_-T2Z§);
         }
         §_-83D§.§_-W2P§();
      }
      
      private function §_-Sl§(param1:*) : void
      {
         this.hide();
         this.show(param1);
      }
      
      private function hide() : void
      {
         if(this.active == null)
         {
            return;
         }
         this.§_-M1d§();
         this.active.hide();
         removeChild(this.active);
         dispatchEvent(new ScreenEvent(ScreenEvent.HIDE,this.active));
         this.active = null;
      }
      
      private function §_-M1d§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§_-k1c§)
         {
            if(!(!(_loc1_ as Dialog).visible || (_loc1_ as Dialog).captured))
            {
               (_loc1_ as Dialog).hide();
            }
         }
      }
      
      private function §_-rH§(param1:Boolean) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.numChildren)
         {
            _loc3_ = getChildAt(_loc2_);
            if(!(_loc3_ is Screen))
            {
               _loc3_.visible = param1;
            }
            _loc2_++;
         }
      }
   }
}

