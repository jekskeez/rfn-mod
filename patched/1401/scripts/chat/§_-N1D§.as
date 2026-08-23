package chat
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-cG§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import utils.StringUtil;
   import utils.§_-ex§;
   
   public class §_-N1D§ extends Sprite
   {
      
      private static const §_-J2o§:int = 15;
      
      private static const §_-J1§:int = 4;
      
      private static const §_-i1O§:int = 4000;
      
      private static const §_-y1S§:int = 200;
      
      private static const §_-HW§:int = 4000;
      
      protected static const §_-v1u§:Array = [new ColorMatrixFilter([4,0,0,0,0,0.5,0.5,0,0,0,0.5,0,0.5,0,0,0,0,0,1,0])];
      
      protected var §_-N2t§:int = 127;
      
      protected var §_-L12§:TextField = null;
      
      protected var §_-S1y§:DisplayObject = null;
      
      protected var §_-M20§:TextFormat;
      
      protected var §_-B2t§:TextFormat;
      
      protected var §_-x2X§:Array = [];
      
      protected var §_-c1S§:Timer = new Timer(1000,1);
      
      protected var §_-4F§:Boolean = false;
      
      public function §_-N1D§()
      {
         super();
         this.init();
      }
      
      public function §_-r17§() : void
      {
         if(Game.§_-K3§ == 0)
         {
            return;
         }
         this.§_-c1S§.repeatCount = Game.§_-K3§ - getTimer() / 1000;
         this.§_-c1S§.delay = 1000;
         this.§_-c1S§.reset();
         this.§_-c1S§.start();
         this.blockChat = true;
         this.§_-i2V§();
      }
      
      protected function set blockChat(param1:Boolean) : void
      {
         this.§_-4F§ = param1;
      }
      
      protected function get blockChat() : Boolean
      {
         return this.§_-4F§;
      }
      
      protected function init() : void
      {
         this.§_-c1S§.addEventListener(TimerEvent.TIMER,this.§_-i2V§);
         this.§_-c1S§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-AE§);
         this.§_-L12§.maxChars = this.§_-N2t§;
         this.§_-L12§.defaultTextFormat = this.§_-M20§;
         this.§_-L12§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         this.§_-L12§.addEventListener(Event.CHANGE,this.§_-L2z§);
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
      }
      
      protected function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER || this.blockChat)
         {
            return;
         }
         this.§_-34§();
      }
      
      protected function §_-34§() : void
      {
         if(!this.§_-O2k§())
         {
            return;
         }
         var _loc1_:String = StringUtil.§_-92k§(this.§_-L12§.text);
         this.§_-L12§.text = "";
         this.§_-V1O§();
         this.§_-s1a§(_loc1_);
      }
      
      protected function §_-O2k§() : Boolean
      {
         if(!Game.toggle)
         {
            this.§_-V1O§();
            return true;
         }
         var _loc1_:Boolean = §_-019§.§_-B2p§(this.§_-L12§.text);
         if(_loc1_)
         {
            this.§_-V1O§();
         }
         else
         {
            this.§_-di§();
         }
         return _loc1_;
      }
      
      protected function §_-di§() : void
      {
         this.§_-L12§.filters = §_-v1u§;
         if(this.§_-S1y§)
         {
            this.§_-S1y§.filters = §_-v1u§;
         }
      }
      
      protected function §_-V1O§() : void
      {
         this.§_-L12§.filters = [];
         if(this.§_-S1y§)
         {
            this.§_-S1y§.filters = [];
         }
      }
      
      protected function sendMessage(param1:String) : void
      {
      }
      
      protected function §_-s1a§(param1:String) : void
      {
         var _loc2_:String = StringUtil.stripHTML(param1);
         if(this.§_-43P§(_loc2_))
         {
            return;
         }
         if(_loc2_ == "")
         {
            return;
         }
         this.sendMessage(_loc2_);
      }
      
      protected function §_-i2V§(param1:TimerEvent = null) : void
      {
         if(!this.§_-B2t§)
         {
            this.§_-B2t§ = new TextFormat(this.§_-M20§.font,this.§_-M20§.size,16711680,this.§_-M20§.bold);
         }
         this.§_-L12§.defaultTextFormat = this.§_-B2t§;
         this.§_-L12§.type = TextFieldType.DYNAMIC;
         this.§_-L12§.text = gls("Чат заблокирован на {0}",§_-ex§.§_-M1D§(this.§_-c1S§.repeatCount - this.§_-c1S§.currentCount));
         this.§_-L12§.selectable = false;
         this.blockChat = true;
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-cG§)
         {
            this.visible = false;
         }
      }
      
      private function §_-43P§(param1:String) : Boolean
      {
         var _loc5_:Object = null;
         if(this.§_-c1S§.running)
         {
            return true;
         }
         var _loc2_:Number = new Date().getTime();
         while(this.§_-x2X§.length != 0)
         {
            if(_loc2_ - this.§_-x2X§[0]["time"] < §_-HW§)
            {
               break;
            }
            this.§_-x2X§.shift();
         }
         this.§_-x2X§.push({
            "length":param1.length,
            "time":_loc2_
         });
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc5_ in this.§_-x2X§)
         {
            if(_loc2_ - _loc5_["time"] < §_-HW§)
            {
               _loc3_ += _loc5_["length"];
            }
            if(_loc2_ - _loc5_["time"] < §_-i1O§ && _loc5_["length"] != 0)
            {
               _loc4_++;
            }
         }
         if(_loc4_ >= §_-J1§ || _loc3_ >= §_-y1S§)
         {
            this.§_-c1S§.repeatCount = §_-J2o§;
            this.§_-c1S§.reset();
            this.§_-c1S§.start();
            this.§_-i2V§();
            return true;
         }
         return false;
      }
      
      private function §_-AE§(param1:TimerEvent) : void
      {
         this.§_-L12§.text = "";
         this.§_-L12§.type = TextFieldType.INPUT;
         this.§_-L12§.defaultTextFormat = this.§_-M20§;
         this.§_-L12§.selectable = true;
         this.blockChat = false;
         if(!this.visible)
         {
            return;
         }
         Game.stage.focus = this.§_-L12§;
      }
      
      private function §_-L2z§(param1:Event) : void
      {
         this.§_-O2k§();
      }
   }
}

