package sounds
{
   import §_-c2C§.Screen;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-gc§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-c2C§.§_-x2y§;
   import events.ScreenEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Timer;
   
   public class GameMusic extends §_-A1z§
   {
      
      private static const §_-b2g§:Number = 0.5;
      
      private static const §_-N2x§:Number = 1;
      
      private static const §_-c1p§:Number = 0.01;
      
      private static var _instance:GameMusic;
      
      private static const §_-T6§:Array = ["jingle_bells","spring","catwomen1"];
      
      private static const §_-o12§:Array = ["theme_ingame","theme_ingame_2","theme_ingame_3","theme_ingame_4","theme_ingame_5"];
      
      private var §_-a2O§:Screen;
      
      private var §_-028§:SoundChannel = null;
      
      private var §_-kf§:SoundChannel = null;
      
      private var §_-cb§:SoundTransform = new SoundTransform();
      
      private var §_-U6§:Number = 0;
      
      private var §_-d2B§:Timer = new Timer(10);
      
      private var §_-JA§:String = "";
      
      private var §_-yo§:Object = {};
      
      private var §_-53i§:Boolean = true;
      
      private var §_-o2k§:SoundChannel = null;
      
      private var §_-IB§:String = null;
      
      public function GameMusic()
      {
         super();
         _instance = this;
      }
      
      public static function get on() : Boolean
      {
         return _instance.§_-tn§;
      }
      
      public static function set on(param1:Boolean) : void
      {
         if(_instance.§_-tn§ == param1)
         {
            return;
         }
         _instance.§_-tn§ = param1;
         if(param1)
         {
            _instance.§_-g15§();
         }
         else
         {
            _instance.§_-t2i§();
         }
      }
      
      public static function §_-A3z§() : void
      {
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,_instance.§_-43K§);
      }
      
      public static function §_-Q1b§(param1:String, param2:Boolean = false) : SoundChannel
      {
         _instance.§_-UF§();
         var _loc3_:SoundChannel = _instance.play(param1,param2);
         if(_loc3_ == null)
         {
            return null;
         }
         _instance.§_-o2k§ = _loc3_;
         _loc3_.removeEventListener(Event.SOUND_COMPLETE,_instance.§_-g15§);
         _loc3_.addEventListener(Event.SOUND_COMPLETE,_instance.§_-K1k§,false,0,true);
         return _loc3_;
      }
      
      public static function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         return _instance.play(param1,param2);
      }
      
      public static function §_-g15§() : void
      {
         _instance.§_-g15§();
      }
      
      public static function get §_-n1s§() : String
      {
         return _instance.§_-JA§;
      }
      
      public static function §_-r1K§(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(_instance.§_-k2e§[param1] != null)
         {
            return;
         }
         _instance.§_-UF§();
         _instance.§_-IB§ = param1;
         §_-411§(param1,param2,param3);
      }
      
      public static function §_-411§(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(_instance.§_-k2e§[param1] != null)
         {
            return;
         }
         _instance.§_-yo§[param1] = param3;
         _instance.playRepeatableMusic(param1,param3);
         _instance.§_-j1P§(param1,param2);
      }
      
      public static function §_-8B§(param1:String) : void
      {
         §_-g15§();
         _instance.§_-a1L§(param1);
      }
      
      private static function §_-23a§() : void
      {
         _instance.§_-95§();
      }
      
      override protected function §_-a1L§(param1:String) : void
      {
         super.§_-a1L§(param1);
         delete this.§_-yo§[param1];
         if(this.§_-IB§ == param1)
         {
            this.§_-IB§ = null;
            this.§_-Q2p§();
         }
      }
      
      override public function play(param1:String, param2:Boolean = false) : SoundChannel
      {
         var channel:SoundChannel = null;
         var name:String = param1;
         var force:Boolean = param2;
         §_-p2U§.add("sounds.GameMusic.play");
         if(!this.§_-tn§ && !force)
         {
            return null;
         }
         if(!(name in this.§_-m1S§))
         {
            §_-u8§(name);
            return null;
         }
         try
         {
            if(this.§_-J2L§(name) && this.§_-JA§ == name)
            {
               return this.§_-028§;
            }
            §_-23a§();
            this.§_-JA§ = name;
            channel = this.§_-G1h§(name,force);
            if(channel == null)
            {
               return null;
            }
            this.§_-pB§(channel,force);
            this.§_-6C§(force);
            return this.§_-t2R§[channel];
         }
         catch(error:Error)
         {
            §_-p2U§.add("Failed to play sound: " + error);
         }
         return null;
      }
      
      override protected function §_-e2A§(param1:String) : void
      {
         var _loc2_:Boolean = Boolean(this.§_-yo§[param1]);
         this.playRepeatableMusic(param1,_loc2_);
      }
      
      private function §_-G1h§(param1:String, param2:Boolean) : SoundChannel
      {
         var _loc3_:Number = param2 ? §_-N2x§ : §_-b2g§;
         var _loc4_:SoundTransform = new SoundTransform(_loc3_);
         var _loc5_:SoundChannel = this.§_-m1S§[param1].play();
         _loc5_.soundTransform = _loc4_;
         _loc5_.addEventListener(Event.SOUND_COMPLETE,§_-L1i§,false,0,true);
         this.§_-t2R§[_loc5_] = _loc5_;
         return _loc5_;
      }
      
      private function §_-pB§(param1:SoundChannel, param2:Boolean) : void
      {
         if(param2)
         {
            this.§_-eU§(this.§_-kf§);
            this.§_-kf§ = null;
            this.§_-U6§ = 0;
         }
         else
         {
            this.§_-U6§ = §_-b2g§;
            this.§_-eU§(this.§_-kf§);
            this.§_-kf§ = this.§_-028§;
         }
         this.§_-028§ = param1;
         this.§_-028§.addEventListener(Event.SOUND_COMPLETE,this.§_-g15§,false,0,true);
      }
      
      private function §_-6C§(param1:Boolean) : void
      {
         if(!param1 && !this.§_-d2B§.running)
         {
            this.§_-d2B§.addEventListener(TimerEvent.TIMER,this.§_-54§,false,0,true);
            this.§_-d2B§.reset();
            this.§_-d2B§.start();
         }
      }
      
      private function §_-eU§(param1:SoundChannel) : void
      {
         if(param1 != null)
         {
            stop(param1);
         }
      }
      
      private function §_-J2L§(param1:String) : Boolean
      {
         return §_-T6§.indexOf(param1) != -1;
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(!this.§_-tn§)
         {
            return;
         }
         if(param1.screen is §_-gc§)
         {
            on = false;
            return;
         }
         if(param1.screen is §_-u24§ || param1.screen is §_-S2E§)
         {
            this.§_-13i§();
            this.§_-a2O§ = param1.screen;
            return;
         }
         if(param1.screen is §_-51A§ || param1.screen is §_-P1w§ || param1.screen is §_-x2y§)
         {
            this.play("belki_room_amb_loop");
            this.§_-a2O§ = param1.screen;
            return;
         }
         if(this.§_-a2O§ != null && this.§_-028§ != null && !(this.§_-a2O§ is §_-u24§ || this.§_-a2O§ is §_-S2E§ || this.§_-a2O§ is §_-51A§ || this.§_-a2O§ is §_-P1w§ || this.§_-a2O§ is §_-x2y§))
         {
            return;
         }
         this.§_-a2O§ = param1.screen;
         this.play("belki_game_islands_ambient");
      }
      
      private function §_-13i§() : void
      {
         var _loc1_:int = Math.random() * GameMusic.§_-o12§.length;
         §_-p2U§.add("play",GameMusic.§_-o12§[_loc1_]);
         this.play(GameMusic.§_-o12§[_loc1_]);
      }
      
      private function §_-g15§(param1:Event = null) : void
      {
         §_-23a§();
         if(§_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-S2E§)
         {
            this.§_-13i§();
            return;
         }
         if(§_-t2c§.active is §_-51A§ || §_-t2c§.active is §_-P1w§ || §_-t2c§.active is §_-x2y§)
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
         §_-p2U§.add("sounds.GameMusic.playRepeatableMusic");
         if(!this.§_-tn§ && !force)
         {
            return null;
         }
         if(!(name in this.§_-m1S§))
         {
            §_-u8§(name);
            return null;
         }
         try
         {
            this.§_-S2p§(force);
            channel = this.§_-G1h§(name,force);
            if(channel == null)
            {
               return null;
            }
            this.§_-028§ = channel;
            return this.§_-t2R§[channel];
         }
         catch(error:Error)
         {
            §_-p2U§.add("Failed to play repeatable sound: " + error);
         }
         return null;
      }
      
      private function §_-S2p§(param1:Boolean) : void
      {
         if(this.§_-028§ == null)
         {
            return;
         }
         this.§_-028§.removeEventListener(Event.SOUND_COMPLETE,this.§_-g15§);
         if(param1)
         {
            stop(this.§_-028§);
         }
         else
         {
            this.§_-kf§ = this.§_-028§;
            this.§_-U6§ = §_-b2g§;
            this.§_-6C§(false);
         }
      }
      
      private function §_-t2i§() : void
      {
         var _loc1_:SoundChannel = null;
         for each(_loc1_ in this.§_-t2R§)
         {
            stop(_loc1_);
         }
         this.§_-JA§ = "";
      }
      
      private function §_-54§(param1:TimerEvent) : void
      {
         if(this.§_-kf§ == null)
         {
            return;
         }
         this.§_-U6§ = Math.max(0,this.§_-U6§ - §_-c1p§);
         this.§_-cb§.volume = this.§_-U6§;
         this.§_-kf§.soundTransform = this.§_-cb§;
         if(this.§_-U6§ != 0)
         {
            return;
         }
         this.§_-eU§(this.§_-kf§);
         this.§_-kf§ = null;
         this.§_-d2B§.stop();
         this.§_-d2B§.removeEventListener(TimerEvent.TIMER,this.§_-54§);
      }
      
      private function §_-UF§() : void
      {
         if(this.§_-o2k§ == null && this.§_-IB§ == null)
         {
            this.§_-53i§ = this.§_-tn§;
         }
         this.§_-tn§ = true;
      }
      
      private function §_-Q2p§() : void
      {
         if(this.§_-o2k§ != null || this.§_-IB§ != null || this.§_-53i§)
         {
            return;
         }
         this.§_-tn§ = false;
         this.§_-t2i§();
      }
      
      private function §_-K1k§(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         if(_loc2_ != this.§_-o2k§)
         {
            return;
         }
         _loc2_.removeEventListener(Event.SOUND_COMPLETE,this.§_-K1k§);
         this.§_-o2k§ = null;
         this.§_-Q2p§();
      }
   }
}

