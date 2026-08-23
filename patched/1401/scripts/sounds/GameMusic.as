package sounds
{
   import §_-T2y§.Screen;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-F2y§;
   import §_-T2y§.§_-ac§;
   import §_-T2y§.§_-cG§;
   import events.ScreenEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Timer;
   
   public class GameMusic extends §_-yd§
   {
      
      private static const §_-43e§:Number = 0.5;
      
      private static const §_-k1V§:Number = 1;
      
      private static const §_-61F§:Number = 0.01;
      
      private static var _instance:GameMusic;
      
      private static const §_-Wn§:Array = ["jingle_bells","spring","catwomen1"];
      
      private static const §_-51K§:Array = ["theme_ingame","theme_ingame_2","theme_ingame_3","theme_ingame_4","theme_ingame_5"];
      
      private var §_-s2U§:Screen;
      
      private var §_-b1o§:SoundChannel = null;
      
      private var §_-vF§:SoundChannel = null;
      
      private var §_-X2E§:SoundTransform = new SoundTransform();
      
      private var §_-M7§:Number = 0;
      
      private var §_-J2p§:Timer = new Timer(10);
      
      private var §_-n1g§:String = "";
      
      private var §_-G1L§:Object = {};
      
      private var §_-x1b§:Boolean = true;
      
      private var §_-j9§:SoundChannel = null;
      
      private var §_-91l§:String = null;
      
      public function GameMusic()
      {
         super();
         _instance = this;
      }
      
      public static function get on() : Boolean
      {
         return _instance.§_-62s§;
      }
      
      public static function set on(param1:Boolean) : void
      {
         if(_instance.§_-62s§ == param1)
         {
            return;
         }
         _instance.§_-62s§ = param1;
         if(param1)
         {
            _instance.§_-d2D§();
         }
         else
         {
            _instance.§_-UI§();
         }
      }
      
      public static function §_-h1R§() : void
      {
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,_instance.§_-C2D§);
      }
      
      public static function §_-f4§(param1:String, param2:Boolean = false) : SoundChannel
      {
         _instance.§_-13X§();
         var _loc3_:SoundChannel = _instance.play(param1,param2);
         if(_loc3_ == null)
         {
            return null;
         }
         _instance.§_-j9§ = _loc3_;
         _loc3_.removeEventListener(Event.SOUND_COMPLETE,_instance.§_-d2D§);
         _loc3_.addEventListener(Event.SOUND_COMPLETE,_instance.§_-01I§,false,0,true);
         return _loc3_;
      }
      
      public static function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         return _instance.play(param1,param2);
      }
      
      public static function §_-d2D§() : void
      {
         _instance.§_-d2D§();
      }
      
      public static function get §_-y1l§() : String
      {
         return _instance.§_-n1g§;
      }
      
      public static function §_-n1E§(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(_instance.§_-g2F§[param1] != null)
         {
            return;
         }
         _instance.§_-13X§();
         _instance.§_-91l§ = param1;
         §_-A3A§(param1,param2,param3);
      }
      
      public static function §_-A3A§(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(_instance.§_-g2F§[param1] != null)
         {
            return;
         }
         _instance.§_-G1L§[param1] = param3;
         _instance.playRepeatableMusic(param1,param3);
         _instance.§_-q2V§(param1,param2);
      }
      
      public static function §_-x1y§(param1:String) : void
      {
         §_-d2D§();
         _instance.§_-JE§(param1);
      }
      
      private static function §_-F1V§() : void
      {
         _instance.§_-K22§();
      }
      
      override protected function §_-JE§(param1:String) : void
      {
         super.§_-JE§(param1);
         delete this.§_-G1L§[param1];
         if(this.§_-91l§ == param1)
         {
            this.§_-91l§ = null;
            this.§_-C2e§();
         }
      }
      
      override public function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         var force:Boolean = param2;
         §_-TQ§.add("sounds.GameMusic.play");
         if(!this.§_-62s§ && !force)
         {
            return null;
         }
         if(!(name in this.§_-xQ§))
         {
            §_-fV§(name);
            return null;
         }
         try
         {
            if(this.§_-U2N§(name) && this.§_-n1g§ == name)
            {
               return this.§_-b1o§;
            }
            §_-F1V§();
            this.§_-n1g§ = name;
            channel = this.§_-xu§(name,force);
            if(channel == null)
            {
               return null;
            }
            this.§_-dO§(channel,force);
            this.§_-ne§(force);
            return this.§_-c1B§[channel];
         }
         catch(error:Error)
         {
            §_-TQ§.add("Failed to play sound: " + error);
         }
         return null;
      }
      
      override protected function §_-3E§(param1:String) : void
      {
         var _loc2_:Boolean = Boolean(this.§_-G1L§[param1]);
         this.playRepeatableMusic(param1,_loc2_);
      }
      
      private function §_-xu§(param1:String, param2:Boolean) : SoundChannel
      {
         var _loc3_:Number = param2 ? §_-k1V§ : §_-43e§;
         var _loc4_:SoundTransform = new SoundTransform(_loc3_);
         var _loc5_:SoundChannel = this.§_-xQ§[param1].play();
         _loc5_.soundTransform = _loc4_;
         _loc5_.addEventListener(Event.SOUND_COMPLETE,§_-91Z§,false,0,true);
         this.§_-c1B§[_loc5_] = _loc5_;
         return _loc5_;
      }
      
      private function §_-dO§(param1:SoundChannel, param2:Boolean) : void
      {
         if(param2)
         {
            this.§_-B3S§(this.§_-vF§);
            this.§_-vF§ = null;
            this.§_-M7§ = 0;
         }
         else
         {
            this.§_-M7§ = §_-43e§;
            this.§_-B3S§(this.§_-vF§);
            this.§_-vF§ = this.§_-b1o§;
         }
         this.§_-b1o§ = param1;
         this.§_-b1o§.addEventListener(Event.SOUND_COMPLETE,this.§_-d2D§,false,0,true);
      }
      
      private function §_-ne§(param1:Boolean) : void
      {
         if(!param1 && !this.§_-J2p§.running)
         {
            this.§_-J2p§.addEventListener(TimerEvent.TIMER,this.§_-i2X§,false,0,true);
            this.§_-J2p§.reset();
            this.§_-J2p§.start();
         }
      }
      
      private function §_-B3S§(param1:SoundChannel) : void
      {
         if(param1 != null)
         {
            stop(param1);
         }
      }
      
      private function §_-U2N§(param1:String) : Boolean
      {
         return §_-Wn§.indexOf(param1) != -1;
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(!this.§_-62s§)
         {
            return;
         }
         if(param1.screen is §_-cG§)
         {
            on = false;
            return;
         }
         if(param1.screen is §_-92z§ || param1.screen is §_-F29§)
         {
            this.§_-l2v§();
            this.§_-s2U§ = param1.screen;
            return;
         }
         if(param1.screen is §_-5B§ || param1.screen is §_-F2y§ || param1.screen is §_-ac§)
         {
            this.play("belki_room_amb_loop");
            this.§_-s2U§ = param1.screen;
            return;
         }
         if(this.§_-s2U§ != null && this.§_-b1o§ != null && !(this.§_-s2U§ is §_-92z§ || this.§_-s2U§ is §_-F29§ || this.§_-s2U§ is §_-5B§ || this.§_-s2U§ is §_-F2y§ || this.§_-s2U§ is §_-ac§))
         {
            return;
         }
         this.§_-s2U§ = param1.screen;
         this.play("belki_game_islands_ambient");
      }
      
      private function §_-l2v§() : void
      {
         var _loc1_:int = Math.random() * GameMusic.§_-51K§.length;
         §_-TQ§.add("play",GameMusic.§_-51K§[_loc1_]);
         this.play(GameMusic.§_-51K§[_loc1_]);
      }
      
      private function §_-d2D§(param1:Event = null) : void
      {
         §_-F1V§();
         if(§_-71o§.active is §_-92z§ || §_-71o§.active is §_-F29§)
         {
            this.§_-l2v§();
            return;
         }
         if(§_-71o§.active is §_-5B§ || §_-71o§.active is §_-F2y§ || §_-71o§.active is §_-ac§)
         {
            this.play("belki_room_amb_loop");
            return;
         }
         this.play("belki_game_islands_ambient");
      }
      
      private function playRepeatableMusic(param1:String, param2:Boolean = false) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         var force:Boolean = param2;
         §_-TQ§.add("sounds.GameMusic.playRepeatableMusic");
         if(!this.§_-62s§ && !force)
         {
            return null;
         }
         if(!(name in this.§_-xQ§))
         {
            §_-fV§(name);
            return null;
         }
         try
         {
            this.§_-C1y§(force);
            channel = this.§_-xu§(name,force);
            if(channel == null)
            {
               return null;
            }
            this.§_-b1o§ = channel;
            return this.§_-c1B§[channel];
         }
         catch(error:Error)
         {
            §_-TQ§.add("Failed to play repeatable sound: " + error);
         }
         return null;
      }
      
      private function §_-C1y§(param1:Boolean) : void
      {
         if(this.§_-b1o§ == null)
         {
            return;
         }
         this.§_-b1o§.removeEventListener(Event.SOUND_COMPLETE,this.§_-d2D§);
         if(param1)
         {
            stop(this.§_-b1o§);
         }
         else
         {
            this.§_-vF§ = this.§_-b1o§;
            this.§_-M7§ = §_-43e§;
            this.§_-ne§(false);
         }
      }
      
      private function §_-UI§() : void
      {
         var _loc1_:SoundChannel = null;
         for each(_loc1_ in this.§_-c1B§)
         {
            stop(_loc1_);
         }
         this.§_-n1g§ = "";
      }
      
      private function §_-i2X§(param1:TimerEvent) : void
      {
         if(this.§_-vF§ == null)
         {
            return;
         }
         this.§_-M7§ = Math.max(0,this.§_-M7§ - §_-61F§);
         this.§_-X2E§.volume = this.§_-M7§;
         this.§_-vF§.soundTransform = this.§_-X2E§;
         if(this.§_-M7§ != 0)
         {
            return;
         }
         this.§_-B3S§(this.§_-vF§);
         this.§_-vF§ = null;
         this.§_-J2p§.stop();
         this.§_-J2p§.removeEventListener(TimerEvent.TIMER,this.§_-i2X§);
      }
      
      private function §_-13X§() : void
      {
         if(this.§_-j9§ == null && this.§_-91l§ == null)
         {
            this.§_-x1b§ = this.§_-62s§;
         }
         this.§_-62s§ = true;
      }
      
      private function §_-C2e§() : void
      {
         if(this.§_-j9§ != null || this.§_-91l§ != null || this.§_-x1b§)
         {
            return;
         }
         this.§_-62s§ = false;
         this.§_-UI§();
      }
      
      private function §_-01I§(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         if(_loc2_ != this.§_-j9§)
         {
            return;
         }
         _loc2_.removeEventListener(Event.SOUND_COMPLETE,this.§_-01I§);
         this.§_-j9§ = null;
         this.§_-C2e§();
      }
   }
}

