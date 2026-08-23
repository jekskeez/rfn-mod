package §_-c2C§
{
   import §_-bN§.Dialog;
   import §_-bN§.§_-33Q§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class §_-t2c§ extends Sprite
   {
      
      public static const TV:int = 1;
      
      public static const §_-1x§:int = 2;
      
      public static const §_-x2G§:int = 3;
      
      private static var _instance:§_-t2c§;
      
      private static var §_-oj§:int = 0;
      
      private static var §_-uu§:Array = [];
      
      private var §_-ZH§:Object = {};
      
      private var §_-bN§:Dictionary = new Dictionary();
      
      private var active:Screen = null;
      
      private var §_-M1K§:Boolean = false;
      
      private var §_-pK§:Boolean = false;
      
      private var §_-di§:Vector.<Screen> = new Vector.<Screen>();
      
      public function §_-t2c§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-t2c§
      {
         return _instance;
      }
      
      public static function setStatus(param1:int) : void
      {
         var _loc2_:int = §_-oj§;
         §_-oj§ |= param1;
         if(_loc2_ == §_-x2G§ || §_-oj§ != §_-x2G§)
         {
            return;
         }
         while(§_-uu§.length > 0)
         {
            (§_-uu§.pop() as Function)();
         }
      }
      
      public static function §_-53p§(param1:int) : void
      {
         §_-oj§ &= ~param1;
      }
      
      public static function addCallback(param1:Function) : void
      {
         if(§_-oj§ == §_-x2G§)
         {
            param1();
         }
         else
         {
            §_-uu§.push(param1);
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
      
      public static function get §_-di§() : Screen
      {
         return _instance.§_-di§.length == 0 ? _instance.§_-ZH§["Location"] : _instance.§_-di§[0];
      }
      
      public static function getName(param1:*) : String
      {
         var _loc2_:String = null;
         for(_loc2_ in _instance.§_-ZH§)
         {
            if(_instance.§_-ZH§[_loc2_] == param1)
            {
               return _loc2_;
            }
         }
         return "";
      }
      
      public static function §_-a1K§(param1:String, param2:Screen) : void
      {
         _instance.§_-a1K§(param1,param2);
      }
      
      public static function §_-u1Q§(param1:String) : Screen
      {
         if(!_instance || !(param1 in _instance.§_-ZH§))
         {
            return null;
         }
         return _instance.§_-ZH§[param1] as Screen;
      }
      
      public static function show(param1:*) : void
      {
         _instance.show(param1);
      }
      
      public static function §_-U2Y§(param1:*) : void
      {
         _instance.§_-U2Y§(param1);
      }
      
      public static function hide() : void
      {
         _instance.hide();
      }
      
      public static function §_-51H§(param1:Boolean) : void
      {
         _instance.§_-51H§(param1);
      }
      
      public static function §_-yl§(param1:Dialog) : void
      {
         _instance.§_-yl§(param1);
      }
      
      public static function §_-w22§() : Vector.<Dialog>
      {
         var _loc2_:* = undefined;
         var _loc3_:Dialog = null;
         var _loc1_:Vector.<Dialog> = new Vector.<Dialog>();
         if(!_instance)
         {
            return _loc1_;
         }
         for(_loc2_ in _instance.§_-bN§)
         {
            _loc3_ = _loc2_ as Dialog;
            if(Boolean(_loc3_) && Boolean(_loc3_.visible) && Boolean(_loc3_.stage))
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public static function §_-T2P§() : void
      {
         _instance.§_-T2P§();
      }
      
      public static function set §_-M1K§(param1:Boolean) : void
      {
         _instance.§_-M1K§ = param1;
      }
      
      public static function get §_-M1K§() : Boolean
      {
         return _instance.§_-M1K§;
      }
      
      public static function set §_-pK§(param1:Boolean) : void
      {
         _instance.§_-pK§ = param1;
      }
      
      public static function get §_-pK§() : Boolean
      {
         return _instance.§_-pK§;
      }
      
      private function §_-yl§(param1:Dialog) : void
      {
         this.§_-bN§[param1] = true;
      }
      
      private function §_-a1K§(param1:String, param2:Screen) : void
      {
         if(param1 in this.§_-ZH§)
         {
            return;
         }
         if(param2 is §_-si§)
         {
            this.§_-di§.push(param2);
         }
         this.§_-ZH§[param1] = param2;
      }
      
      private function show(param1:*) : void
      {
         if(param1 is String)
         {
            if(!(param1 in this.§_-ZH§))
            {
               return;
            }
            param1 = this.§_-ZH§[param1];
         }
         if(this.active == param1)
         {
            return;
         }
         if(this.active != null)
         {
            if(param1 == §_-t2c§.§_-di§)
            {
               this.§_-di§.shift();
            }
            else
            {
               if(this.§_-di§.indexOf(this.active) != -1)
               {
                  this.§_-di§.splice(this.§_-di§.indexOf(this.active),1);
               }
               this.§_-di§.unshift(this.active);
            }
         }
         this.hide();
         addChild(param1);
         dispatchEvent(new ScreenEvent(ScreenEvent.SHOW,param1));
         this.active = param1;
         this.active.show();
         if(this.active is §_-u24§ || this.active is §_-S2E§ || this.active is §_-fx§)
         {
            §_-53p§(§_-1x§);
         }
         else
         {
            setStatus(§_-1x§);
         }
         §_-33Q§.§_-T14§();
      }
      
      private function §_-U2Y§(param1:*) : void
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
         this.§_-T2P§();
         this.active.hide();
         removeChild(this.active);
         dispatchEvent(new ScreenEvent(ScreenEvent.HIDE,this.active));
         this.active = null;
      }
      
      private function §_-T2P§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§_-bN§)
         {
            if(!(!(_loc1_ as Dialog).visible || (_loc1_ as Dialog).captured))
            {
               (_loc1_ as Dialog).hide();
            }
         }
      }
      
      private function §_-51H§(param1:Boolean) : void
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

