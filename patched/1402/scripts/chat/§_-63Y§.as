package chat
{
   import §_-c2C§.§_-gc§;
   import §_-c2C§.§_-t2c§;
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
   import utils.§_-B1d§;
   
   public class §_-63Y§ extends Sprite
   {
      
      private static const §_-a2V§:int = 15;
      
      private static const §_-xX§:int = 4;
      
      private static const §_-k1E§:int = 4000;
      
      private static const §_-030§:int = 200;
      
      private static const §_-42t§:int = 4000;
      
      protected static const §_-42q§:Array = [new ColorMatrixFilter([4,0,0,0,0,0.5,0.5,0,0,0,0.5,0,0.5,0,0,0,0,0,1,0])];
      
      protected var §_-q2T§:int = 127;
      
      protected var §_-H2p§:TextField = null;
      
      protected var §_-G2g§:DisplayObject = null;
      
      protected var §_-P2T§:TextFormat;
      
      protected var §_-X1l§:TextFormat;
      
      protected var §_-S1z§:Array = [];
      
      protected var §_-11s§:Timer = new Timer(1000,1);
      
      protected var §_-3B§:Boolean = false;
      
      public function §_-63Y§()
      {
         super();
         this.init();
      }
      
      public function §_-C1s§() : void
      {
         if(Game.§_-53N§ == 0)
         {
            return;
         }
         this.§_-11s§.repeatCount = Game.§_-53N§ - getTimer() / 1000;
         this.§_-11s§.delay = 1000;
         this.§_-11s§.reset();
         this.§_-11s§.start();
         this.blockChat = true;
         this.§_-C2R§();
      }
      
      protected function set blockChat(param1:Boolean) : void
      {
         this.§_-3B§ = param1;
      }
      
      protected function get blockChat() : Boolean
      {
         return this.§_-3B§;
      }
      
      protected function init() : void
      {
         this.§_-11s§.addEventListener(TimerEvent.TIMER,this.§_-C2R§);
         this.§_-11s§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-W2g§);
         this.§_-H2p§.maxChars = this.§_-q2T§;
         this.§_-H2p§.defaultTextFormat = this.§_-P2T§;
         this.§_-H2p§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         this.§_-H2p§.addEventListener(Event.CHANGE,this.§_-t12§);
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
      }
      
      protected function §_-73S§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER || this.blockChat)
         {
            return;
         }
         this.§_-91r§();
      }
      
      protected function §_-91r§() : void
      {
         if(!this.§_-wR§())
         {
            return;
         }
         var _loc1_:String = StringUtil.§_-g7§(this.§_-H2p§.text);
         this.§_-H2p§.text = "";
         this.§_-Q20§();
         this.§_-D1Z§(_loc1_);
      }
      
      protected function §_-wR§() : Boolean
      {
         if(!Game.toggle)
         {
            this.§_-Q20§();
            return true;
         }
         var _loc1_:Boolean = §_-Qw§.§_-L16§(this.§_-H2p§.text);
         if(_loc1_)
         {
            this.§_-Q20§();
         }
         else
         {
            this.§_-k2F§();
         }
         return _loc1_;
      }
      
      protected function §_-k2F§() : void
      {
         this.§_-H2p§.filters = §_-42q§;
         if(this.§_-G2g§)
         {
            this.§_-G2g§.filters = §_-42q§;
         }
      }
      
      protected function §_-Q20§() : void
      {
         this.§_-H2p§.filters = [];
         if(this.§_-G2g§)
         {
            this.§_-G2g§.filters = [];
         }
      }
      
      protected function sendMessage(param1:String) : void
      {
      }
      
      protected function §_-D1Z§(param1:String) : void
      {
         var _loc2_:String = StringUtil.stripHTML(param1);
         if(this.§_-612§(_loc2_))
         {
            return;
         }
         if(_loc2_ == "")
         {
            return;
         }
         this.sendMessage(_loc2_);
      }
      
      protected function §_-C2R§(param1:TimerEvent = null) : void
      {
         if(!this.§_-X1l§)
         {
            this.§_-X1l§ = new TextFormat(this.§_-P2T§.font,this.§_-P2T§.size,16711680,this.§_-P2T§.bold);
         }
         this.§_-H2p§.defaultTextFormat = this.§_-X1l§;
         this.§_-H2p§.type = TextFieldType.DYNAMIC;
         this.§_-H2p§.text = gls("Чат заблокирован на {0}",§_-B1d§.§_-j1x§(this.§_-11s§.repeatCount - this.§_-11s§.currentCount));
         this.§_-H2p§.selectable = false;
         this.blockChat = true;
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-gc§)
         {
            this.visible = false;
         }
      }
      
      private function §_-612§(param1:String) : Boolean
      {
         var _loc5_:Object = null;
         if(this.§_-11s§.running)
         {
            return true;
         }
         var _loc2_:Number = new Date().getTime();
         while(this.§_-S1z§.length != 0)
         {
            if(_loc2_ - this.§_-S1z§[0]["time"] < §_-42t§)
            {
               break;
            }
            this.§_-S1z§.shift();
         }
         this.§_-S1z§.push({
            "length":param1.length,
            "time":_loc2_
         });
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc5_ in this.§_-S1z§)
         {
            if(_loc2_ - _loc5_["time"] < §_-42t§)
            {
               _loc3_ += _loc5_["length"];
            }
            if(_loc2_ - _loc5_["time"] < §_-k1E§ && _loc5_["length"] != 0)
            {
               _loc4_++;
            }
         }
         if(_loc4_ >= §_-xX§ || _loc3_ >= §_-030§)
         {
            this.§_-11s§.repeatCount = §_-a2V§;
            this.§_-11s§.reset();
            this.§_-11s§.start();
            this.§_-C2R§();
            return true;
         }
         return false;
      }
      
      private function §_-W2g§(param1:TimerEvent) : void
      {
         this.§_-H2p§.text = "";
         this.§_-H2p§.type = TextFieldType.INPUT;
         this.§_-H2p§.defaultTextFormat = this.§_-P2T§;
         this.§_-H2p§.selectable = true;
         this.blockChat = false;
         if(!this.visible)
         {
            return;
         }
         Game.stage.focus = this.§_-H2p§;
      }
      
      private function §_-t12§(param1:Event) : void
      {
         this.§_-wR§();
      }
   }
}

