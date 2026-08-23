package sounds
{
   import §_-Y22§.§_-Td§;
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
   
   public class §_-yd§ implements §_-Td§
   {
      
      public var §_-62s§:Boolean = true;
      
      protected var §_-xQ§:Object = {};
      
      protected var §_-c1B§:Dictionary = new Dictionary();
      
      protected var §_-s1e§:Dictionary = new Dictionary();
      
      protected var §_-eQ§:Dictionary = new Dictionary();
      
      protected var §_-g2F§:Object = {};
      
      public function §_-yd§()
      {
         super();
      }
      
      public function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         var block:Boolean = param2;
         if(!this.§_-62s§)
         {
            return null;
         }
         if(!(name in this.§_-xQ§))
         {
            this.§_-fV§(name);
            return null;
         }
         if(this.§_-xQ§[name] == null)
         {
            return null;
         }
         try
         {
            if(block)
            {
               for each(channel in this.§_-c1B§)
               {
                  this.stop(channel);
               }
            }
            if(SoundMixer.soundTransform.volume != 1)
            {
               SoundMixer.soundTransform = new SoundTransform(1,0);
            }
            channel = this.§_-xQ§[name].play();
            this.§_-eQ§[channel] = name;
            this.§_-c1B§[channel] = channel;
            channel.addEventListener(Event.SOUND_COMPLETE,this.§_-91Z§,false,0,true);
            this.§_-c1B§[channel] = channel;
            return this.§_-c1B§[channel];
         }
         catch(error:Error)
         {
            §_-TQ§.add("Failed to play sound: " + error);
         }
         return null;
      }
      
      public function isPlaying(param1:String) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:* = this.§_-eQ§;
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
         if(param1 in this.§_-c1B§)
         {
            delete this.§_-eQ§[param1];
            delete this.§_-c1B§[param1];
         }
      }
      
      public function §_-wL§(param1:Array) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            if(!(_loc2_ in this.§_-xQ§))
            {
               this.§_-fV§(_loc2_,false);
            }
         }
      }
      
      private function §_-R2q§(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:String = _loc2_.url.split("?")[0].replace(§_-a9§.§_-g13§,"").replace(".mp3","");
         §_-TQ§.add("Sound " + _loc3_ + " loaded");
         this.§_-xQ§[_loc3_] = _loc2_;
         if(this.§_-s1e§[_loc3_])
         {
            this.play(_loc3_);
         }
         delete this.§_-s1e§[_loc3_];
      }
      
      private function §_-Y2u§(param1:Event) : void
      {
         §_-TQ§.add("Failed to load sound: " + param1);
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:String = Boolean(_loc2_) && Boolean(_loc2_.url) ? _loc2_.url.split("?")[0].replace(§_-a9§.§_-g13§,"").replace(".mp3","") : "";
         this.§_-xQ§[_loc3_] = null;
      }
      
      protected function stopAll() : void
      {
         var _loc1_:SoundChannel = null;
         for each(_loc1_ in this.§_-c1B§)
         {
            this.stop(_loc1_);
         }
      }
      
      protected function §_-91Z§(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         delete this.§_-c1B§[_loc2_];
         delete this.§_-eQ§[_loc2_];
      }
      
      protected function §_-fV§(param1:String, param2:Boolean = true) : void
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
            §_-TQ§.add(e.getStackTrace());
         }
         if(name in this.§_-s1e§)
         {
            return;
         }
         this.§_-s1e§[name] = playAfterload;
         sound = new Sound();
         sound.addEventListener(Event.COMPLETE,this.§_-R2q§);
         sound.addEventListener(IOErrorEvent.IO_ERROR,this.§_-Y2u§);
         sound.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§_-Y2u§);
         url = §_-a9§.§_-g13§ + name + ".mp3";
         §_-TQ§.add("Loading sound:" + url);
         sound.load(new URLRequest(url));
      }
      
      protected function §_-3E§(param1:String) : void
      {
         this.play(param1);
      }
      
      protected function §_-uR§(param1:TimerEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:Timer = param1.currentTarget as Timer;
         for(_loc3_ in this.§_-g2F§)
         {
            if(this.§_-g2F§[_loc3_] == _loc2_)
            {
               this.§_-3E§(_loc3_);
               return;
            }
         }
      }
      
      protected function §_-q2V§(param1:String, param2:Number) : void
      {
         var _loc3_:Timer = new Timer(param2,0);
         _loc3_.addEventListener(TimerEvent.TIMER,this.§_-uR§);
         _loc3_.start();
         this.§_-g2F§[param1] = _loc3_;
      }
      
      protected function §_-JE§(param1:String) : void
      {
         if(this.§_-g2F§[param1] == null)
         {
            return;
         }
         var _loc2_:Timer = this.§_-g2F§[param1] as Timer;
         _loc2_.stop();
         _loc2_.removeEventListener(TimerEvent.TIMER,this.§_-uR§);
         this.§_-g2F§[param1] = null;
         delete this.§_-g2F§[param1];
      }
      
      protected function §_-K22§() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in this.§_-g2F§)
         {
            this.§_-JE§(_loc1_);
         }
      }
   }
}

