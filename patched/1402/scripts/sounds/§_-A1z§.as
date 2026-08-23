package sounds
{
   import §_-I2Y§.§_-sQ§;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class §_-A1z§ implements §_-sQ§
   {
      
      public var §_-tn§:Boolean = true;
      
      protected var §_-m1S§:Object = {};
      
      protected var §_-t2R§:Dictionary = new Dictionary();
      
      protected var §_-I1c§:Dictionary = new Dictionary();
      
      protected var §_-52k§:Dictionary = new Dictionary();
      
      protected var §_-k2e§:Object = {};
      
      public function §_-A1z§()
      {
         super();
      }
      
      public function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         var block:Boolean = param2;
         if(!this.§_-tn§)
         {
            return null;
         }
         if(!(name in this.§_-m1S§))
         {
            this.§_-u8§(name);
            return null;
         }
         if(this.§_-m1S§[name] == null)
         {
            return null;
         }
         try
         {
            if(block)
            {
               for each(channel in this.§_-t2R§)
               {
                  this.stop(channel);
               }
            }
            if(SoundMixer.soundTransform.volume != 1)
            {
               SoundMixer.soundTransform = new SoundTransform(1,0);
            }
            channel = this.§_-m1S§[name].play();
            this.§_-52k§[channel] = name;
            this.§_-t2R§[channel] = channel;
            channel.addEventListener(Event.SOUND_COMPLETE,this.§_-L1i§,false,0,true);
            this.§_-t2R§[channel] = channel;
            return this.§_-t2R§[channel];
         }
         catch(error:Error)
         {
            §_-p2U§.add("Failed to play sound: " + error);
         }
         return null;
      }
      
      public function isPlaying(param1:String) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:* = this.§_-52k§;
         for each(_loc2_ in _loc4_)
         {
            return _loc2_ == param1;
         }
         return false;
      }
      
      protected function stop(param1:SoundChannel) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.stop();
         if(param1 in this.§_-t2R§)
         {
            delete this.§_-52k§[param1];
            delete this.§_-t2R§[param1];
         }
      }
      
      public function §_-zY§(param1:Array) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            if(!(_loc2_ in this.§_-m1S§))
            {
               this.§_-u8§(_loc2_,false);
            }
         }
      }
      
      private function §_-zN§(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:String = _loc2_.url.split("?")[0].replace(§_-Zy§.§_-70§,"").replace(".mp3","");
         §_-p2U§.add("Sound " + _loc3_ + " loaded");
         this.§_-m1S§[_loc3_] = _loc2_;
         if(this.§_-I1c§[_loc3_])
         {
            this.play(_loc3_);
         }
         delete this.§_-I1c§[_loc3_];
      }
      
      private function §_-O1v§(param1:Event) : void
      {
         §_-p2U§.add("Failed to load sound: " + param1);
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:String = Boolean(_loc2_) && Boolean(_loc2_.url) ? _loc2_.url.split("?")[0].replace(§_-Zy§.§_-70§,"").replace(".mp3","") : "";
         this.§_-m1S§[_loc3_] = null;
      }
      
      protected function stopAll() : void
      {
         var _loc1_:SoundChannel = null;
         for each(_loc1_ in this.§_-t2R§)
         {
            this.stop(_loc1_);
         }
      }
      
      protected function §_-L1i§(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         delete this.§_-t2R§[_loc2_];
         delete this.§_-52k§[_loc2_];
      }
      
      protected function §_-u8§(param1:String, param2:Boolean = true) : void
      {
         var sound:Sound;
         var url:String;
         var name:String = param1;
         var playAfterload:Boolean = param2;
         try
         {
            if(name == "")
            {
               throw new Error("Load empty .mp3");
            }
         }
         catch(e:Error)
         {
            §_-p2U§.add(e.getStackTrace());
         }
         if(name in this.§_-I1c§)
         {
            return;
         }
         this.§_-I1c§[name] = playAfterload;
         sound = new Sound();
         sound.addEventListener(Event.COMPLETE,this.§_-zN§);
         sound.addEventListener(IOErrorEvent.IO_ERROR,this.§_-O1v§);
         sound.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§_-O1v§);
         url = §_-Zy§.§_-70§ + name + ".mp3";
         §_-p2U§.add("Loading sound:" + url);
         sound.load(new URLRequest(url));
      }
      
      protected function §_-e2A§(param1:String) : void
      {
         this.play(param1);
      }
      
      protected function §_-H2z§(param1:TimerEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:Timer = param1.currentTarget as Timer;
         for(_loc3_ in this.§_-k2e§)
         {
            if(this.§_-k2e§[_loc3_] == _loc2_)
            {
               this.§_-e2A§(_loc3_);
               return;
            }
         }
      }
      
      protected function §_-j1P§(param1:String, param2:Number) : void
      {
         var _loc3_:Timer = new Timer(param2,0);
         _loc3_.addEventListener(TimerEvent.TIMER,this.§_-H2z§);
         _loc3_.start();
         this.§_-k2e§[param1] = _loc3_;
      }
      
      protected function §_-a1L§(param1:String) : void
      {
         if(this.§_-k2e§[param1] == null)
         {
            return;
         }
         var _loc2_:Timer = this.§_-k2e§[param1] as Timer;
         _loc2_.stop();
         _loc2_.removeEventListener(TimerEvent.TIMER,this.§_-H2z§);
         this.§_-k2e§[param1] = null;
         delete this.§_-k2e§[param1];
      }
      
      protected function §_-95§() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in this.§_-k2e§)
         {
            this.§_-a1L§(_loc1_);
         }
      }
   }
}

